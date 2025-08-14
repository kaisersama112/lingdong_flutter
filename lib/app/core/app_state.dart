import 'package:flutter/foundation.dart';
import '../model/user.dart';

// 应用状态管理
class AppState extends ChangeNotifier {
  User? _currentUser;
  bool _isLoading = false;
  bool _isOnline = true;
  AppTheme _currentTheme = AppTheme.light;

  // Getters
  User? get currentUser => _currentUser;
  bool get isLoading => _isLoading;
  bool get isOnline => _isOnline;
  AppTheme get currentTheme => _currentTheme;
  bool get isLoggedIn => _currentUser != null;

  // 设置当前用户
  void setUser(User? user) {
    _currentUser = user;
    notifyListeners();
  }

  // 更新用户信息
  void updateUser(User user) {
    _currentUser = user;
    notifyListeners();
  }

  // 清除用户状态（登出）
  void clearUser() {
    _currentUser = null;
    notifyListeners();
  }

  // 设置加载状态
  void setLoading(bool loading) {
    _isLoading = loading;
    notifyListeners();
  }

  // 设置网络状态
  void setOnline(bool online) {
    _isOnline = online;
    notifyListeners();
  }

  // 切换主题
  void toggleTheme() {
    _currentTheme = _currentTheme == AppTheme.light 
        ? AppTheme.dark 
        : AppTheme.light;
    notifyListeners();
  }

  // 设置主题
  void setTheme(AppTheme theme) {
    _currentTheme = theme;
    notifyListeners();
  }
}

// 主题枚举
enum AppTheme { light, dark }

// 全局应用状态实例
final appState = AppState();
