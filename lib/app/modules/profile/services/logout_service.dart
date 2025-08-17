import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../core/error_handler.dart';
import '../../../core/app_state.dart';
import '../../../services/user_auth_service.dart';

class LogoutService {
  static const String _tokenKey = 'user_token';
  static const String _userIdKey = 'user_id';
  static const String _userNameKey = 'user_name';
  static const String _userEmailKey = 'user_email';

  /// 执行退出登录
  static Future<void> logout(BuildContext context) async {
    try {
      // 调用认证服务的退出登录方法
      await UserAuthService().logout();

      // 清除本地存储的用户信息
      await _clearUserData();

      // 清除应用状态
      appState.clearUser();

      // 显示退出成功提示
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('已成功退出登录'),
            backgroundColor: Colors.green,
            behavior: SnackBarBehavior.floating,
          ),
        );
      }

      // 跳转到登录页面
      if (context.mounted) {
        _navigateToLogin(context);
      }
    } catch (e) {
      if (context.mounted) {
        AppErrorHandler.handleError(context, '退出登录失败: $e');
      }
    }
  }

  /// 清除本地存储的用户数据
  static Future<void> _clearUserData() async {
    final prefs = await SharedPreferences.getInstance();

    // 清除所有用户相关的数据
    await prefs.remove(_tokenKey);
    await prefs.remove(_userIdKey);
    await prefs.remove(_userNameKey);
    await prefs.remove(_userEmailKey);

    // 清除其他可能存在的用户数据
    await prefs.remove('user_avatar');
    await prefs.remove('user_level');
    await prefs.remove('user_points');
    await prefs.remove('user_address');
    await prefs.remove('user_bio');
    await prefs.remove('user_join_date');

    // 清除设置相关数据
    await prefs.remove('notifications_enabled');
    await prefs.remove('sound_enabled');
    await prefs.remove('vibration_enabled');
    await prefs.remove('selected_language');
    await prefs.remove('selected_theme');
  }

  /// 跳转到登录页面
  static void _navigateToLogin(BuildContext context) {
    // 清除用户状态，让 AuthWrapper 自动处理导航
    appState.clearUser();

    // 返回到根页面，让 AuthWrapper 重新检查登录状态
    Navigator.of(context).popUntil((route) => route.isFirst);
  }

  /// 显示退出登录确认对话框
  static Future<void> showLogoutDialog(BuildContext context) async {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          title: Row(
            children: [
              const Icon(Icons.logout, color: Colors.red, size: 24),
              const SizedBox(width: 12),
              const Text('退出登录'),
            ],
          ),
          content: const Text('确定要退出登录吗？退出后需要重新登录才能使用应用。'),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('取消'),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                foregroundColor: Colors.white,
              ),
              onPressed: () {
                Navigator.of(context).pop();
                logout(context);
              },
              child: const Text('确定退出'),
            ),
          ],
        );
      },
    );
  }

  /// 检查用户是否已登录
  static Future<bool> isUserLoggedIn() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString(_tokenKey);
      return token != null && token.isNotEmpty;
    } catch (e) {
      return false;
    }
  }

  /// 获取用户令牌
  static Future<String?> getUserToken() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      return prefs.getString(_tokenKey);
    } catch (e) {
      return null;
    }
  }
}
