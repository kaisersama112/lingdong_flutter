import 'dart:convert';
import 'dart:math';
import 'package:flutter/material.dart';
import '../model/user.dart';
import 'database_service.dart';

/// 用户认证服务
class UserAuthService {
  static final UserAuthService _instance = UserAuthService._internal();
  factory UserAuthService() => _instance;
  UserAuthService._internal();

  final DatabaseService _dbService = DatabaseService();
  User? _currentUser;

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

      debugPrint('认证服务初始化完成，当前用户: ${_currentUser?.nickname ?? "未登录"}');
    } catch (e) {
      debugPrint('初始化认证服务失败: $e');
      // 静默处理错误，不影响应用正常使用
    }
  }

  /// 用户注册
  Future<User> register({
    required String phone,
    required String password,
    String? email,
    required String nickname,
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
      nickname: nickname,
      registerTime: now,
      lastLoginTime: now,
    );

    // 保存到数据库
    await _dbService.saveUser(user);
    await _dbService.savePassword(userId, password);
    await _dbService.setCurrentUser(userId);

    // 设置当前用户
    _currentUser = user;

    debugPrint('用户注册成功: ${user.nickname}');
    return user;
  }

  /// 用户登录
  Future<User> login({
    required String phone,
    required String password,
  }) async {
    // 模拟网络延迟
    await Future.delayed(const Duration(milliseconds: 600));

    // 查找用户
    final user = await _dbService.getUserByPhone(phone);
    if (user == null) {
      throw AuthException('用户不存在');
    }

    // 验证密码
    final storedPassword = await _dbService.getUserPassword(user.userId);
    if (storedPassword != password) {
      throw AuthException('密码错误');
    }

    // 检查用户状态
    if (user.status != UserStatus.active) {
      throw AuthException('账号已被${user.status == UserStatus.banned ? '封禁' : '禁用'}');
    }

    // 更新最后登录时间
    await _dbService.updateLastLoginTime(user.userId);
    await _dbService.setCurrentUser(user.userId);

    // 获取更新后的用户信息
    final updatedUser = await _dbService.getUser(user.userId);
    _currentUser = updatedUser;

    debugPrint('用户登录成功: ${user.nickname}');
    return updatedUser!;
  }

  /// 验证码登录
  Future<User> loginWithVerificationCode({
    required String phone,
    required String verificationCode,
  }) async {
    // 模拟网络延迟
    await Future.delayed(const Duration(milliseconds: 600));

    // 查找用户
    final user = await _dbService.getUserByPhone(phone);
    if (user == null) {
      throw AuthException('用户不存在');
    }

    // 验证验证码（这里简化处理，实际应该验证发送的验证码）
    if (verificationCode != '123456') {
      throw AuthException('验证码错误');
    }

    // 检查用户状态
    if (user.status != UserStatus.active) {
      throw AuthException('账号已被${user.status == UserStatus.banned ? '封禁' : '禁用'}');
    }

    // 更新最后登录时间
    await _dbService.updateLastLoginTime(user.userId);
    await _dbService.setCurrentUser(user.userId);

    // 获取更新后的用户信息
    final updatedUser = await _dbService.getUser(user.userId);
    _currentUser = updatedUser;

    debugPrint('验证码登录成功: ${user.nickname}');
    return updatedUser!;
  }

  /// 游客模式登录
  Future<User> guestLogin() async {
    // 模拟网络延迟
    await Future.delayed(const Duration(milliseconds: 300));

    // 检查是否已有游客账号
    final allUsers = await _dbService.getAllUsers();
    User? guestUser = allUsers.where((user) => user.userId.startsWith('guest_')).firstOrNull;

    if (guestUser == null) {
      // 创建新的游客账号
      final guestId = 'guest_${_generateUserId()}';
      final now = DateTime.now();
      
      guestUser = User(
        userId: guestId,
        phone: '', // 游客没有手机号
        nickname: '游客${guestId.substring(6, 10)}',
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

    debugPrint('游客模式登录成功: ${guestUser.nickname}');
    return guestUser;
  }

  /// 检查是否为游客用户
  bool get isGuestUser => _currentUser?.userId.startsWith('guest_') ?? false;

  /// 游客升级为正式用户
  Future<User> upgradeGuestToUser({
    required String phone,
    required String password,
    String? email,
    String? nickname,
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
      nickname: nickname ?? _currentUser!.nickname,
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

    debugPrint('游客升级成功: ${newUser.nickname}');
    return newUser;
  }

  /// 第三方登录
  Future<User> socialLogin({
    required String platform,
    required String token,
    String? nickname,
    String? avatar,
  }) async {
    // 模拟网络延迟
    await Future.delayed(const Duration(milliseconds: 1000));

    // 模拟第三方登录验证
    final socialUserId = '${platform}_${token.substring(0, 8)}';
    
    // 查找是否已有绑定账号
    final allUsers = await _dbService.getAllUsers();
    User? existingUser = allUsers.where((user) => user.userId.startsWith('${platform}_')).firstOrNull;

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
        nickname: nickname ?? '用户${userId.substring(0, 6)}',
        avatar: avatar,
        registerTime: now,
        lastLoginTime: now,
      );

      await _dbService.saveUser(user);
      await _dbService.setCurrentUser(userId);
      _currentUser = user;

      debugPrint('第三方登录成功: ${user.nickname}');
      return user;
    }
  }

  /// 密码重置
  Future<bool> resetPassword({
    required String phone,
    required String newPassword,
    required String verificationCode,
  }) async {
    // 模拟网络延迟
    await Future.delayed(const Duration(milliseconds: 500));

    // 查找用户
    final user = await _dbService.getUserByPhone(phone);
    if (user == null) {
      throw AuthException('用户不存在');
    }

    // 验证验证码（这里简化处理）
    if (verificationCode != '123456') {
      throw AuthException('验证码错误');
    }

    // 验证新密码强度
    if (newPassword.length < 6) {
      throw AuthException('密码长度不能少于6位');
    }

    // 更新密码
    await _dbService.savePassword(user.userId, newPassword);

    debugPrint('密码重置成功');
    return true;
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
    String? nickname,
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
      nickname: nickname,
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
    final storedPassword = await _dbService.getUserPassword(_currentUser!.userId);
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
    // 模拟网络延迟
    await Future.delayed(const Duration(milliseconds: 1000));

    // 验证手机号格式
    if (!_isValidPhone(phone)) {
      throw AuthException('手机号格式不正确');
    }

    // 根据类型进行验证
    switch (type) {
      case VerificationCodeType.register:
        if (await _dbService.isPhoneRegistered(phone)) {
          throw AuthException('手机号已被注册');
        }
        break;
      case VerificationCodeType.resetPassword:
        if (!await _dbService.isPhoneRegistered(phone)) {
          throw AuthException('用户不存在');
        }
        break;
      case VerificationCodeType.login:
        // 登录验证码不需要特殊验证
        break;
    }

    debugPrint('验证码发送成功: $phone');
    return true;
  }

  /// 生成用户ID
  String _generateUserId() {
    const chars = 'abcdefghijklmnopqrstuvwxyz0123456789';
    final random = Random();
    return String.fromCharCodes(
      Iterable.generate(12, (_) => chars.codeUnitAt(random.nextInt(chars.length))),
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
  register,      // 注册
  resetPassword, // 重置密码
  login,         // 登录
}
