import 'dart:convert';
import 'dart:math';
import 'package:flutter/material.dart';
import '../model/user.dart';

/// 用户认证服务
class UserAuthService {
  static final UserAuthService _instance = UserAuthService._internal();
  factory UserAuthService() => _instance;
  UserAuthService._internal();

  // 模拟用户数据存储
  final Map<String, User> _users = {};
  final Map<String, String> _userPasswords = {};
  User? _currentUser;

  /// 获取当前登录用户
  User? get currentUser => _currentUser;

  /// 检查用户是否已登录
  bool get isLoggedIn => _currentUser != null;

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
    if (_users.values.any((user) => user.phone == phone)) {
      throw AuthException('手机号已被注册');
    }

    // 检查邮箱是否已注册
    if (email != null && _users.values.any((user) => user.email == email)) {
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

    // 保存用户信息
    _users[userId] = user;
    _userPasswords[userId] = password;

    // 自动登录
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
    final user = _users.values.firstWhere(
      (user) => user.phone == phone,
      orElse: () => throw AuthException('用户不存在'),
    );

    // 验证密码
    final storedPassword = _userPasswords[user.userId];
    if (storedPassword != password) {
      throw AuthException('密码错误');
    }

    // 检查用户状态
    if (user.status != UserStatus.active) {
      throw AuthException('账号已被${user.status == UserStatus.banned ? '封禁' : '禁用'}');
    }

    // 更新最后登录时间
    final updatedUser = user.copyWith(lastLoginTime: DateTime.now());
    _users[user.userId] = updatedUser;
    _currentUser = updatedUser;

    debugPrint('用户登录成功: ${user.nickname}');
    return updatedUser;
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
    User? existingUser;
    try {
      existingUser = _users.values.firstWhere(
        (user) => user.userId.startsWith('${platform}_'),
      );
    } catch (e) {
      existingUser = null;
    }

    if (existingUser != null) {
      // 已有绑定账号，直接登录
      final updatedUser = existingUser.copyWith(
        lastLoginTime: DateTime.now(),
        avatar: avatar ?? existingUser.avatar,
      );
      _users[existingUser.userId] = updatedUser;
      _currentUser = updatedUser;
      return updatedUser;
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

      _users[userId] = user;
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
    final user = _users.values.firstWhere(
      (user) => user.phone == phone,
      orElse: () => throw AuthException('用户不存在'),
    );

    // 验证验证码（这里简化处理）
    if (verificationCode != '123456') {
      throw AuthException('验证码错误');
    }

    // 验证新密码强度
    if (newPassword.length < 6) {
      throw AuthException('密码长度不能少于6位');
    }

    // 更新密码
    _userPasswords[user.userId] = newPassword;

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
    final user = _users[userId];
    if (user == null) {
      throw AuthException('用户不存在');
    }

    // 验证验证码（这里简化处理）
    if (code != '123456') {
      throw AuthException('验证码错误');
    }

    // 激活用户
    final updatedUser = user.copyWith(status: UserStatus.active);
    _users[userId] = updatedUser;

    debugPrint('用户验证成功');
    return true;
  }

  /// 用户登出
  Future<void> logout() async {
    // 模拟网络延迟
    await Future.delayed(const Duration(milliseconds: 200));

    _currentUser = null;
    debugPrint('用户登出成功');
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

    _users[_currentUser!.userId] = updatedUser;
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
    final storedPassword = _userPasswords[_currentUser!.userId];
    if (storedPassword != oldPassword) {
      throw AuthException('原密码错误');
    }

    // 验证新密码强度
    if (newPassword.length < 6) {
      throw AuthException('密码长度不能少于6位');
    }

    // 更新密码
    _userPasswords[_currentUser!.userId] = newPassword;

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
        if (_users.values.any((user) => user.phone == phone)) {
          throw AuthException('手机号已被注册');
        }
        break;
      case VerificationCodeType.resetPassword:
        if (!_users.values.any((user) => user.phone == phone)) {
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
  User? getUserById(String userId) {
    return _users[userId];
  }

  /// 根据手机号获取用户
  User? getUserByPhone(String phone) {
    try {
      return _users.values.firstWhere((user) => user.phone == phone);
    } catch (e) {
      return null;
    }
  }

  /// 清除所有数据（仅用于测试）
  void clearAllData() {
    _users.clear();
    _userPasswords.clear();
    _currentUser = null;
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
