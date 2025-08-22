import 'dart:math';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:lingdong_server/lingdong_server.dart' as server;
import '../model/user.dart';
import 'database_service.dart';

/// 用户认证服务
class UserAuthService {
  static final UserAuthService _instance = UserAuthService._internal();
  factory UserAuthService() => _instance;
  UserAuthService._internal();

  final DatabaseService _dbService = DatabaseService();
  User? _currentUser;
  Dio? _dio;
  server.AuthApi? _authApi;

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
        baseUrl: 'http://172.16.4.114:7009',
        connectTimeout: const Duration(seconds: 10),
        receiveTimeout: const Duration(seconds: 15),
        sendTimeout: const Duration(seconds: 10),
      ),
    );
    _authApi = server.AuthApi(_dio!, server.standardSerializers);
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
      final local = await _ensureLocalUser(phone: phone);
      await _dbService.updateLastLoginTime(local.userId);
      await _dbService.setCurrentUser(local.userId);
      final updatedUser = await _dbService.getUser(local.userId);
      _currentUser = updatedUser;
      return updatedUser!;
    } on DioException catch (e) {
      throw AuthException(e.message ?? '网络错误');
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
      final local = await _ensureLocalUser(phone: phone);
      await _dbService.updateLastLoginTime(local.userId);
      await _dbService.setCurrentUser(local.userId);
      final updatedUser = await _dbService.getUser(local.userId);
      _currentUser = updatedUser;
      return updatedUser!;
    } on DioException catch (e) {
      throw AuthException(e.message ?? '网络错误');
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
    // 模拟网络延迟
    await Future.delayed(const Duration(milliseconds: 200));

    _currentUser = null;

    // 清除当前用户
    await _dbService.clearCurrentUser();

    debugPrint('用户登出成功');
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

  Future<User> _ensureLocalUser({required String phone}) async {
    final existing = await _dbService.getUserByPhone(phone);
    if (existing != null) return existing;
    final userId = _generateUserId();
    final now = DateTime.now();
    final user = User(
      userId: userId,
      phone: phone,
      username: '用户${userId.substring(0, 6)}',
      registerTime: now,
      lastLoginTime: now,
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
}

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
