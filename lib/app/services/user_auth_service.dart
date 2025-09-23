import 'dart:math';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:lingdong_server/lingdong_server.dart' as server;
import '../model/user.dart';
import 'database_service.dart';
import '../core/api_config.dart';

/// 用户认证服务
class UserAuthService {
  static final UserAuthService _instance = UserAuthService._internal();
  factory UserAuthService() => _instance;
  UserAuthService._internal();

  final DatabaseService _dbService = DatabaseService();
  User? _currentUser;
  Dio? _dio;
  server.AuthApi? _authApi;
  String? _cachedToken; // 新增：用于缓存Token

  /// 获取当前登录用户
  User? get currentUser => _currentUser;

  /// 检查用户是否已登录
  bool get isLoggedIn => _currentUser != null;

  /// 初始化服务 - 从数据库恢复数据
  Future<void> initialize() async {
    try {
      // 检查是否在测试环境中或插件未初始化
      if (!WidgetsBinding.instance.isRootWidgetAttached ||
          !WidgetsBinding.instance.platformDispatcher.views.isNotEmpty) {
        debugPrint('在测试环境或插件未初始化时跳过数据库初始化');
        return;
      }

      // 从数据库恢复当前用户
      _currentUser = await _dbService.getCurrentUser();

      // 如果有当前用户，尝试从数据库恢复Token到内存缓存
      if (_currentUser != null) {
        final tokenFromDb = await _dbService.getAuthToken(_currentUser!.userId);
        if (tokenFromDb != null && tokenFromDb.isNotEmpty) {
          _cachedToken = tokenFromDb;
          debugPrint('已从数据库恢复Token缓存');
        }
      }

      debugPrint('认证服务初始化完成，当前用户: ${_currentUser?.username ?? "未登录"}');
      _initializeApiClient();
    } catch (e) {
      debugPrint('初始化认证服务失败: $e');
      // 静默处理错误，不影响应用正常使用
    }
  }

  void _initializeApiClient() {
    if (_dio != null && _authApi != null) return;

    _dio = Dio(
      BaseOptions(
        baseUrl: ApiConfig.baseUrl,
        connectTimeout: ApiConfig.connectTimeout,
        receiveTimeout: ApiConfig.receiveTimeout,
        sendTimeout: ApiConfig.sendTimeout,
      ),
    );

    // 从本地存储加载Token并设置认证头
    _loadAndSetCachedToken();

    _authApi = server.AuthApi(_dio!, server.standardSerializers);
  }

  /// 从本地存储加载Token并设置认证头
  void _loadAndSetCachedToken() {
    final cachedToken = _loadTokenFromStorage();
    if (cachedToken != null && cachedToken.isNotEmpty) {
      _dio!.options.headers['Authorization'] = 'Bearer $cachedToken';
      debugPrint('从本地存储恢复Token: Bearer ${cachedToken.substring(0, 20)}...');
    } else {
      debugPrint('本地存储中没有Token');
    }
  }

  void _setAuthToken(String token) {
    if (_dio != null) {
      _dio!.options.headers['Authorization'] = 'Bearer $token';
      debugPrint('认证头已设置: Bearer ${token.substring(0, 20)}...');

      // 保存Token到本地存储
      _saveTokenToStorage(token);
      // 同步保存到数据库（若已登录）
      if (_currentUser != null) {
        _dbService.saveAuthToken(_currentUser!.userId, token);
      }
    } else {
      debugPrint('Dio实例未初始化，无法设置认证头');
    }
  }

  /// 保存Token到本地存储
  void _saveTokenToStorage(String token) {
    try {
      // 使用SharedPreferences保存Token
      // 这里暂时使用一个简单的内存缓存，实际应该使用SharedPreferences
      _cachedToken = token;
      debugPrint('Token已保存到本地存储');
    } catch (e) {
      debugPrint('保存Token到本地存储失败: $e');
    }
  }

  /// 从本地存储加载Token
  String? _loadTokenFromStorage() {
    try {
      // 从本地存储加载Token
      // 这里暂时使用内存缓存，实际应该使用SharedPreferences
      return _cachedToken;
    } catch (e) {
      debugPrint('从本地存储加载Token失败: $e');
      return null;
    }
  }

  /// 清除Token缓存
  void _clearTokenFromStorage() {
    try {
      _cachedToken = null;
      if (_dio != null) {
        _dio!.options.headers.remove('Authorization');
      }
      debugPrint('Token缓存已清除');
    } catch (e) {
      debugPrint('清除Token缓存失败: $e');
    }
  }

  /// 用户注册
  Future<User> register({
    required String phone,
    required String password,
    String? email,
    required String username,
  }) async {
    // 模拟网络延迟
    await Future.delayed(const Duration(milliseconds: 800));

    // 检查手机号是否已注册
    if (await _dbService.isPhoneRegistered(phone)) {
      throw AuthException('手机号已被注册');
    }

    // 检查邮箱是否已注册
    if (email != null && await _dbService.isEmailRegistered(email)) {
      throw AuthException('邮箱已被注册');
    }

    // 验证密码强度
    if (password.length < 6) {
      throw AuthException('密码长度不能少于6位');
    }

    // 生成用户ID
    final userId = _generateUserId();
    final now = DateTime.now();

    // 创建用户
    final user = User(
      userId: userId,
      phone: phone,
      email: email,
      username: username,
      registerTime: now,
      lastLoginTime: now,
    );

    // 保存到数据库
    await _dbService.saveUser(user);
    await _dbService.savePassword(userId, password);
    await _dbService.setCurrentUser(userId);

    // 设置当前用户
    _currentUser = user;

    debugPrint('用户注册成功: ${user.username}');
    return user;
  }

  /// 用户登录
  Future<User> login({required String phone, required String password}) async {
    _initializeApiClient();
    try {
      final req = server.PhoneLoginRequest(
        (b) => b
          ..phone = phone
          ..password = password,
      );
      final resp = await _authApi!.phonePasswordLoginApiAuthPhoneLoginPost(
        phoneLoginRequest: req,
      );
      final code = resp.data?.code ?? resp.statusCode ?? 500;
      if (code != 200) {
        throw AuthException(resp.data?.msg ?? '登录失败($code)');
      }

      // 设置认证头
      final accessToken = resp.data?.data?.accessToken;
      if (accessToken != null) {
        _setAuthToken(accessToken);
        debugPrint('设置认证Token: ${accessToken.substring(0, 20)}...');
      }

      // 获取用户信息
      final userInfoResp = await _authApi!.readUsersMeApiAuthUsersMeGet();
      final userInfoCode =
          userInfoResp.data?.code ?? userInfoResp.statusCode ?? 500;
      if (userInfoCode != 200) {
        throw AuthException(
          '获取用户信息失败($userInfoCode): ${userInfoResp.data?.msg}',
        );
      }

      final userInfo = userInfoResp.data?.data;
      if (userInfo == null) {
        throw AuthException('用户信息为空');
      }

      debugPrint('获取到用户信息: ${userInfo.username}, ID: ${userInfo.id}');

      // 使用后端返回的用户信息更新本地用户
      final local = await _ensureLocalUserWithInfo(
        phone: phone,
        username: userInfo.username,
        email: userInfo.email,
        avatar: userInfo.avatar,
        backendId: userInfo.id,
        createdAt: userInfo.createdAt,
        updatedAt: userInfo.updatedAt,
        level: userInfo.level,
        isPasswordSet: userInfo.isPasswordSet,
      );

      await _dbService.updateLastLoginTime(local.userId);
      await _dbService.setCurrentUser(local.userId);
      // 绑定保存token
      if (accessToken != null) {
        await _dbService.saveAuthToken(local.userId, accessToken);
      }
      final updatedUser = await _dbService.getUser(local.userId);
      _currentUser = updatedUser;
      return updatedUser!;
    } on DioException catch (e) {
      debugPrint('登录网络错误: ${e.message}');
      if (e.response != null) {
        debugPrint('响应状态码: ${e.response!.statusCode}');
        debugPrint('响应数据: ${e.response!.data}');
      }
      throw AuthException(e.message ?? '网络错误');
    } catch (e) {
      debugPrint('登录其他错误: $e');
      throw AuthException(e.toString());
    }
  }

  /// 验证码登录
  Future<User> loginWithVerificationCode({
    required String phone,
    required String verificationCode,
  }) async {
    return await loginOrRegisterWithVerificationCode(
      phone: phone,
      verificationCode: verificationCode,
    );
  }

  /// 一键登录/注册（手机号 + 验证码）
  /// - 若手机号已注册：校验验证码后直接登录
  /// - 若手机号未注册：自动注册一个账号并登录
  Future<User> loginOrRegisterWithVerificationCode({
    required String phone,
    required String verificationCode,
  }) async {
    _initializeApiClient();
    try {
      final req = server.PhoneCodeLoginRequest(
        (b) => b
          ..phone = phone
          ..code = verificationCode,
      );
      final resp = await _authApi!.phoneCodeLoginApiAuthPhoneCodeLoginPost(
        phoneCodeLoginRequest: req,
      );
      final code = resp.data?.code ?? resp.statusCode ?? 500;
      if (code != 200) {
        throw AuthException(resp.data?.msg ?? '登录失败($code)');
      }

      // 设置认证头
      final accessToken = resp.data?.data?.accessToken;
      if (accessToken != null) {
        _setAuthToken(accessToken);
        debugPrint('设置认证Token: ${accessToken.substring(0, 20)}...');
      }

      // 获取用户信息
      final userInfoResp = await _authApi!.readUsersMeApiAuthUsersMeGet();
      final userInfoCode =
          userInfoResp.data?.code ?? userInfoResp.statusCode ?? 500;
      if (userInfoCode != 200) {
        throw AuthException(
          '获取用户信息失败($userInfoCode): ${userInfoResp.data?.msg}',
        );
      }

      final userInfo = userInfoResp.data?.data;
      if (userInfo == null) {
        throw AuthException('用户信息为空');
      }

      debugPrint('获取到用户信息: ${userInfo.username}, ID: ${userInfo.id}');

      // 使用后端返回的用户信息更新本地用户
      final local = await _ensureLocalUserWithInfo(
        phone: phone,
        username: userInfo.username,
        email: userInfo.email,
        avatar: userInfo.avatar,
        backendId: userInfo.id,
        createdAt: userInfo.createdAt,
        updatedAt: userInfo.updatedAt,
        level: userInfo.level,
        isPasswordSet: userInfo.isPasswordSet,
      );

      await _dbService.updateLastLoginTime(local.userId);
      await _dbService.setCurrentUser(local.userId);
      if (accessToken != null) {
        await _dbService.saveAuthToken(local.userId, accessToken);
      }
      final updatedUser = await _dbService.getUser(local.userId);
      _currentUser = updatedUser;
      return updatedUser!;
    } on DioException catch (e) {
      debugPrint('验证码登录网络错误: ${e.message}');
      if (e.response != null) {
        debugPrint('响应状态码: ${e.response!.statusCode}');
        debugPrint('响应数据: ${e.response!.data}');
      }
      throw AuthException(e.message ?? '网络错误');
    } catch (e) {
      debugPrint('验证码登录其他错误: $e');
      throw AuthException(e.toString());
    }
  }

  /// 游客模式登录
  Future<User> guestLogin() async {
    // 模拟网络延迟
    await Future.delayed(const Duration(milliseconds: 300));

    // 检查是否已有游客账号
    final allUsers = await _dbService.getAllUsers();
    User? guestUser = allUsers
        .where((user) => user.userId.startsWith('guest_'))
        .firstOrNull;

    if (guestUser == null) {
      // 创建新的游客账号
      final guestId = 'guest_${_generateUserId()}';
      final now = DateTime.now();

      guestUser = User(
        userId: guestId,
        phone: '', // 游客没有手机号
        username: '游客${guestId.substring(6, 10)}',
        registerTime: now,
        lastLoginTime: now,
        status: UserStatus.active,
        role: UserRole.user,
      );

      await _dbService.saveUser(guestUser);
    } else {
      // 更新游客最后登录时间
      await _dbService.updateLastLoginTime(guestUser.userId);
      guestUser = await _dbService.getUser(guestUser.userId);
    }

    await _dbService.setCurrentUser(guestUser!.userId);
    _currentUser = guestUser;

    debugPrint('游客模式登录成功: ${guestUser.username}');
    return guestUser;
  }

  /// 检查是否为游客用户
  bool get isGuestUser => _currentUser?.userId.startsWith('guest_') ?? false;

  /// 游客升级为正式用户
  Future<User> upgradeGuestToUser({
    required String phone,
    required String password,
    String? email,
    String? username,
  }) async {
    if (_currentUser == null || !isGuestUser) {
      throw AuthException('只有游客用户才能升级');
    }

    // 模拟网络延迟
    await Future.delayed(const Duration(milliseconds: 800));

    // 检查手机号是否已被使用
    if (await _dbService.isPhoneRegistered(phone)) {
      throw AuthException('手机号已被注册');
    }

    // 检查邮箱是否已被使用
    if (email != null && await _dbService.isEmailRegistered(email)) {
      throw AuthException('邮箱已被注册');
    }

    // 生成新的用户ID
    final newUserId = _generateUserId();
    final now = DateTime.now();

    // 创建正式用户账号
    final newUser = User(
      userId: newUserId,
      phone: phone,
      email: email,
      username: username ?? _currentUser!.username,
      avatar: _currentUser!.avatar,
      registerTime: now,
      lastLoginTime: now,
      status: UserStatus.active,
      role: UserRole.user,
      petIds: _currentUser!.petIds,
      privacySettings: _currentUser!.privacySettings,
      preferences: _currentUser!.preferences,
    );

    // 保存新用户信息
    await _dbService.saveUser(newUser);
    await _dbService.savePassword(newUserId, password);

    // 删除旧的游客账号
    await _dbService.deleteUser(_currentUser!.userId);

    // 切换到新用户
    await _dbService.setCurrentUser(newUserId);
    _currentUser = newUser;

    debugPrint('游客升级成功: ${newUser.username}');
    return newUser;
  }

  /// 第三方登录
  Future<User> socialLogin({
    required String platform,
    required String token,
    String? username,
    String? avatar,
  }) async {
    // 模拟网络延迟
    await Future.delayed(const Duration(milliseconds: 1000));

    // 模拟第三方登录验证

    // 查找是否已有绑定账号
    final allUsers = await _dbService.getAllUsers();
    User? existingUser = allUsers
        .where((user) => user.userId.startsWith('${platform}_'))
        .firstOrNull;

    if (existingUser != null) {
      // 已有绑定账号，直接登录
      await _dbService.updateLastLoginTime(existingUser.userId);
      await _dbService.setCurrentUser(existingUser.userId);

      final updatedUser = await _dbService.getUser(existingUser.userId);
      _currentUser = updatedUser;
      return updatedUser!;
    } else {
      // 新用户，自动注册
      final userId = _generateUserId();
      final now = DateTime.now();

      final user = User(
        userId: userId,
        phone: '', // 第三方登录可能没有手机号
        username: username ?? '用户${userId.substring(0, 6)}',
        avatar: avatar,
        registerTime: now,
        lastLoginTime: now,
      );

      await _dbService.saveUser(user);
      await _dbService.setCurrentUser(userId);
      _currentUser = user;

      debugPrint('第三方登录成功: ${user.username}');
      return user;
    }
  }

  /// 密码重置
  Future<bool> resetPassword({
    required String phone,
    required String newPassword,
    required String verificationCode,
  }) async {
    _initializeApiClient();
    if (newPassword.length < 6) {
      throw AuthException('密码长度不能少于6位');
    }
    try {
      final req = server.SetPasswordByCodeRequest(
        (b) => b
          ..phone = phone
          ..code = verificationCode
          ..newPassword = newPassword,
      );
      final resp = await _authApi!
          .setPasswordByCodeApiAuthSetPasswordByCodePost(
            setPasswordByCodeRequest: req,
          );
      final code = resp.data?.code ?? resp.statusCode ?? 500;
      if (code != 200) {
        throw AuthException(resp.data?.msg ?? '重置密码失败($code)');
      }
      return true;
    } on DioException catch (e) {
      throw AuthException(e.message ?? '网络错误');
    }
  }

  /// 用户验证
  Future<bool> verifyUser({
    required String userId,
    required String code,
  }) async {
    // 模拟网络延迟
    await Future.delayed(const Duration(milliseconds: 300));

    // 查找用户
    final user = await _dbService.getUser(userId);
    if (user == null) {
      throw AuthException('用户不存在');
    }

    // 验证验证码（这里简化处理）
    if (code != '123456') {
      throw AuthException('验证码错误');
    }

    // 激活用户
    final updatedUser = user.copyWith(status: UserStatus.active);
    await _dbService.saveUser(updatedUser);

    debugPrint('用户验证成功');
    return true;
  }

  /// 用户登出
  Future<void> logout() async {
    try {
      // 清除Token缓存
      _clearTokenFromStorage();

      // 清除当前用户
      _currentUser = null;

      // 清除数据库中的当前用户记录
      await _dbService.clearCurrentUser();

      debugPrint('用户已登出');
    } catch (e) {
      debugPrint('登出失败: $e');
    }
  }

  /// 清除所有数据（仅用于测试）
  Future<void> clearAllData() async {
    await _dbService.clearAllData();
    _currentUser = null;

    debugPrint('所有数据已清除');
  }

  /// 更新用户信息
  Future<User> updateUserProfile({
    String? username,
    String? avatar,
    String? email,
    PrivacySettings? privacySettings,
    UserPreferences? preferences,
  }) async {
    if (_currentUser == null) {
      throw AuthException('用户未登录');
    }

    // 模拟网络延迟
    await Future.delayed(const Duration(milliseconds: 400));

    final updatedUser = _currentUser!.copyWith(
      username: username,
      avatar: avatar,
      email: email,
      privacySettings: privacySettings,
      preferences: preferences,
    );

    await _dbService.saveUser(updatedUser);
    _currentUser = updatedUser;

    debugPrint('用户信息更新成功');
    return updatedUser;
  }

  /// 修改密码
  Future<bool> changePassword({
    required String oldPassword,
    required String newPassword,
  }) async {
    if (_currentUser == null) {
      throw AuthException('用户未登录');
    }

    // 模拟网络延迟
    await Future.delayed(const Duration(milliseconds: 300));

    // 验证旧密码
    final storedPassword = await _dbService.getUserPassword(
      _currentUser!.userId,
    );
    if (storedPassword != oldPassword) {
      throw AuthException('原密码错误');
    }

    // 验证新密码强度
    if (newPassword.length < 6) {
      throw AuthException('密码长度不能少于6位');
    }

    // 更新密码
    await _dbService.savePassword(_currentUser!.userId, newPassword);

    debugPrint('密码修改成功');
    return true;
  }

  /// 发送验证码
  Future<bool> sendVerificationCode({
    required String phone,
    required VerificationCodeType type,
  }) async {
    _initializeApiClient();
    if (!_isValidPhone(phone)) {
      throw AuthException('手机号格式不正确');
    }
    try {
      final req = server.SendCodeRequest((b) => b..phone = phone);
      final resp = await _authApi!.sendLoginCodeApiAuthSendCodePost(
        sendCodeRequest: req,
      );
      final code = resp.data?.code ?? resp.statusCode ?? 500;
      if (code != 200) {
        throw AuthException(resp.data?.msg ?? '发送验证码失败($code)');
      }
      return true;
    } on DioException catch (e) {
      throw AuthException(e.message ?? '网络错误');
    }
  }

  Future<User> _ensureLocalUserWithInfo({
    required String phone,
    required String username,
    String? email,
    String? avatar,
    int? backendId,
    String? createdAt,
    String? updatedAt,
    int? level,
    bool? isPasswordSet,
  }) async {
    final existing = await _dbService.getUserByPhone(phone);
    if (existing != null) {
      // 更新现有用户的信息
      final updatedUser = existing.copyWith(
        username: username,
        email: email,
        avatar: avatar,
      );
      await _dbService.saveUser(updatedUser);
      return updatedUser;
    }

    // 创建新用户
    final userId = _generateUserId();
    final now = DateTime.now();

    // 解析时间字符串
    DateTime? parsedCreatedAt;
    DateTime? parsedUpdatedAt;

    if (createdAt != null) {
      try {
        parsedCreatedAt = DateTime.parse(createdAt);
      } catch (e) {
        debugPrint('解析createdAt失败: $createdAt, 使用当前时间');
        parsedCreatedAt = now;
      }
    }

    if (updatedAt != null) {
      try {
        parsedUpdatedAt = DateTime.parse(updatedAt);
      } catch (e) {
        debugPrint('解析updatedAt失败: $updatedAt, 使用当前时间');
        parsedUpdatedAt = now;
      }
    }

    final user = User(
      userId: userId,
      phone: phone,
      username: username,
      email: email,
      avatar: avatar,
      registerTime: parsedCreatedAt ?? now,
      lastLoginTime: parsedUpdatedAt ?? now,
      status: UserStatus.active,
      role: UserRole.user,
    );
    await _dbService.saveUser(user);
    return user;
  }

  /// 生成用户ID
  String _generateUserId() {
    const chars = 'abcdefghijklmnopqrstuvwxyz0123456789';
    final random = Random();
    return String.fromCharCodes(
      Iterable.generate(
        12,
        (_) => chars.codeUnitAt(random.nextInt(chars.length)),
      ),
    );
  }

  /// 验证手机号格式
  bool _isValidPhone(String phone) {
    return RegExp(r'^1[3-9]\d{9}$').hasMatch(phone);
  }

  /// 获取用户信息
  Future<User?> getUserById(String userId) async {
    return await _dbService.getUser(userId);
  }

  /// 根据手机号获取用户
  Future<User?> getUserByPhone(String phone) async {
    return await _dbService.getUserByPhone(phone);
  }

  /// 获取当前用户的访问令牌
  String? getAccessToken() {
    // 优先从本地存储加载Token
    final cachedToken = _loadTokenFromStorage();
    if (cachedToken != null && cachedToken.isNotEmpty) {
      debugPrint('从本地存储获取Token: ${cachedToken.substring(0, 20)}...');
      return cachedToken;
    }

    // 如果本地存储没有，尝试从Dio headers获取
    if (_dio != null && _dio!.options.headers.containsKey('Authorization')) {
      final authHeader = _dio!.options.headers['Authorization'] as String;
      if (authHeader.startsWith('Bearer ')) {
        final token = authHeader.substring(7); // 移除 'Bearer ' 前缀
        debugPrint('从Dio headers获取Token: ${token.substring(0, 20)}...');
        // 保存到本地存储
        _saveTokenToStorage(token);
        return token;
      }
    }

    debugPrint('无法获取访问令牌');
    return null;
  }

  /// 获取当前用户信息
  Future<User?> getCurrentUserInfo() async {
    if (_currentUser == null) {
      debugPrint('当前用户未登录，无法获取用户信息');
      return null;
    }

    _initializeApiClient();
    try {
      final userInfoResp = await _authApi!.readUsersMeApiAuthUsersMeGet();
      final userInfoCode =
          userInfoResp.data?.code ?? userInfoResp.statusCode ?? 500;
      if (userInfoCode != 200) {
        debugPrint('获取用户信息失败($userInfoCode): ${userInfoResp.data?.msg}');
        return _currentUser; // 返回本地缓存的用户信息
      }

      final userInfo = userInfoResp.data?.data;
      if (userInfo == null) {
        debugPrint('用户信息为空');
        return _currentUser; // 返回本地缓存的用户信息
      }

      debugPrint('获取到最新用户信息: ${userInfo.username}, ID: ${userInfo.id}');

      // 更新本地用户信息
      final updatedUser = _currentUser!.copyWith(
        username: userInfo.username,
        email: userInfo.email,
        avatar: userInfo.avatar,
      );

      await _dbService.saveUser(updatedUser);
      _currentUser = updatedUser;
      return updatedUser;
    } on DioException catch (e) {
      debugPrint('获取用户信息网络错误: ${e.message}');
      return _currentUser; // 返回本地缓存的用户信息
    } catch (e) {
      debugPrint('获取用户信息其他错误: $e');
      return _currentUser; // 返回本地缓存的用户信息
    }
  }

  /// 刷新用户信息
  Future<User?> refreshUserInfo() async {
    return await getCurrentUserInfo();
  }

  /// 测试Token缓存功能
  Future<void> testTokenCache() async {
    try {
      debugPrint('开始测试Token缓存功能...');

      // 检查当前Token
      final currentToken = getAccessToken();
      if (currentToken != null && currentToken.isNotEmpty) {
        debugPrint('当前Token: ${currentToken.substring(0, 20)}...');

        // 模拟清除内存中的Token（模拟应用刷新）
        if (_dio != null) {
          _dio!.options.headers.remove('Authorization');
        }
        debugPrint('已清除内存中的Token');

        // 重新获取Token（应该从缓存恢复）
        final restoredToken = getAccessToken();
        if (restoredToken != null && restoredToken.isNotEmpty) {
          debugPrint('Token恢复成功: ${restoredToken.substring(0, 20)}...');
        } else {
          debugPrint('Token恢复失败');
        }
      } else {
        debugPrint('当前没有Token');
      }

      debugPrint('Token缓存测试完成');
    } catch (e) {
      debugPrint('Token缓存测试失败: $e');
    }
  }

  /// 测试登录和获取用户信息功能
  Future<void> testLoginAndGetUserInfo({
    required String phone,
    required String password,
  }) async {
    try {
      debugPrint('开始测试登录功能...');

      // 1. 执行登录
      final user = await login(phone: phone, password: password);
      debugPrint('登录成功: ${user.username}');

      // 2. 获取用户信息
      final userInfo = await getCurrentUserInfo();
      if (userInfo != null) {
        debugPrint('获取用户信息成功: ${userInfo.username}');
        debugPrint('用户详细信息:');
        debugPrint('  - 用户ID: ${userInfo.userId}');
        debugPrint('  - 手机号: ${userInfo.phone}');
        debugPrint('  - 邮箱: ${userInfo.email}');
        debugPrint('  - 头像: ${userInfo.avatar}');
        debugPrint('  - 注册时间: ${userInfo.registerTime}');
        debugPrint('  - 最后登录: ${userInfo.lastLoginTime}');
      } else {
        debugPrint('获取用户信息失败');
      }
    } catch (e) {
      debugPrint('测试失败: $e');
      rethrow;
    }
  }
}

/*
使用示例：

1. 在登录页面中使用：

```dart
class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final UserAuthService _authService = UserAuthService();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isLoading = false;

  Future<void> _login() async {
    if (_phoneController.text.isEmpty || _passwordController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('请输入手机号和密码')),
      );
      return;
    }

    setState(() {
      _isLoading = true;
    });

    try {
      final user = await _authService.login(
        phone: _phoneController.text,
        password: _passwordController.text,
      );
      
      // 登录成功后，用户信息已经自动获取并保存
      print('登录成功: ${user.username}');
      
      // 可以跳转到主页
      Navigator.of(context).pushReplacementNamed('/home');
      
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('登录失败: $e')),
      );
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('登录')),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _phoneController,
              decoration: InputDecoration(labelText: '手机号'),
              keyboardType: TextInputType.phone,
            ),
            SizedBox(height: 16),
            TextField(
              controller: _passwordController,
              decoration: InputDecoration(labelText: '密码'),
              obscureText: true,
            ),
            SizedBox(height: 24),
            ElevatedButton(
              onPressed: _isLoading ? null : _login,
              child: _isLoading 
                ? CircularProgressIndicator() 
                : Text('登录'),
            ),
          ],
        ),
      ),
    );
  }
}
```

2. 在其他页面获取用户信息：

```dart
class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final UserAuthService _authService = UserAuthService();
  User? _currentUser;

  @override
  void initState() {
    super.initState();
    _loadUserInfo();
  }

  Future<void> _loadUserInfo() async {
    // 获取当前用户信息（如果已登录）
    final user = _authService.currentUser;
    if (user != null) {
      setState(() {
        _currentUser = user;
      });
      
      // 可选：从服务器刷新最新信息
      final refreshedUser = await _authService.refreshUserInfo();
      if (refreshedUser != null) {
        setState(() {
          _currentUser = refreshedUser;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_currentUser == null) {
      return Scaffold(
        appBar: AppBar(title: Text('个人资料')),
        body: Center(child: Text('请先登录')),
      );
    }

    return Scaffold(
      appBar: AppBar(title: Text('个人资料')),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('用户名: ${_currentUser!.username}'),
            Text('手机号: ${_currentUser!.phone}'),
            if (_currentUser!.email != null)
              Text('邮箱: ${_currentUser!.email}'),
            Text('注册时间: ${_currentUser!.registerTime}'),
            Text('最后登录: ${_currentUser!.lastLoginTime}'),
          ],
        ),
      ),
    );
  }
}
```

3. 验证码登录：

```dart
Future<void> _loginWithCode() async {
  try {
    final user = await _authService.loginOrRegisterWithVerificationCode(
      phone: _phoneController.text,
      verificationCode: _codeController.text,
    );
    
    print('验证码登录成功: ${user.username}');
    Navigator.of(context).pushReplacementNamed('/home');
    
  } catch (e) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('登录失败: $e')),
    );
  }
}
```
*/

/// 认证异常
class AuthException implements Exception {
  final String message;
  AuthException(this.message);

  @override
  String toString() => message;
}

/// 验证码类型
enum VerificationCodeType {
  register, // 注册
  resetPassword, // 重置密码
  login, // 登录
}
