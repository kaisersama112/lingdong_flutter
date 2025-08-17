import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeManager extends ChangeNotifier {
  static const String _themeKey = 'app_theme_mode';

  ThemeMode _themeMode = ThemeMode.system;

  ThemeMode get themeMode => _themeMode;

  bool get isDarkMode => _themeMode == ThemeMode.dark;
  bool get isLightMode => _themeMode == ThemeMode.light;
  bool get isSystemMode => _themeMode == ThemeMode.system;

  ThemeManager() {
    _loadThemeMode();
  }

  // 加载保存的主题模式
  Future<void> _loadThemeMode() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final themeIndex = prefs.getInt(_themeKey) ?? 0;
      _themeMode = ThemeMode.values[themeIndex];
      notifyListeners();
    } catch (e) {
      // 如果加载失败，使用系统默认
      _themeMode = ThemeMode.system;
    }
  }

  // 保存主题模式
  Future<void> _saveThemeMode() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setInt(_themeKey, _themeMode.index);
    } catch (e) {
      // 保存失败时的处理
      debugPrint('保存主题模式失败: $e');
    }
  }

  // 切换到浅色模式
  Future<void> setLightMode() async {
    if (_themeMode != ThemeMode.light) {
      _themeMode = ThemeMode.light;
      await _saveThemeMode();
      notifyListeners();
    }
  }

  // 切换到深色模式
  Future<void> setDarkMode() async {
    if (_themeMode != ThemeMode.dark) {
      _themeMode = ThemeMode.dark;
      await _saveThemeMode();
      notifyListeners();
    }
  }

  // 切换到系统模式
  Future<void> setSystemMode() async {
    if (_themeMode != ThemeMode.system) {
      _themeMode = ThemeMode.system;
      await _saveThemeMode();
      notifyListeners();
    }
  }

  // 切换主题模式
  Future<void> toggleTheme() async {
    if (_themeMode == ThemeMode.light) {
      await setDarkMode();
    } else if (_themeMode == ThemeMode.dark) {
      await setSystemMode();
    } else {
      await setLightMode();
    }
  }

  // 获取主题数据
  ThemeData getLightTheme() {
    return ThemeData(
      brightness: Brightness.light,
      primaryColor: const Color(0xFF5B9A8B),
      colorScheme: const ColorScheme.light(
        primary: Color(0xFF5B9A8B),
        secondary: Color(0xFFD4A574),
        surface: Color(0xFFFFFFFF),
        background: Color(0xFFF8F9FA),
        onPrimary: Colors.white,
        onSecondary: Colors.white,
        onSurface: Color(0xFF2D3748),
        onBackground: Color(0xFF2D3748),
      ),
      scaffoldBackgroundColor: const Color(0xFFF8F9FA),
      cardTheme: CardThemeData(
        color: Colors.white,
        elevation: 2,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: Color(0xFF5B9A8B),
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF5B9A8B),
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24),
          ),
        ),
      ),
    );
  }

  ThemeData getDarkTheme() {
    return ThemeData(
      brightness: Brightness.dark,
      primaryColor: const Color(0xFF5B9A8B),
      colorScheme: const ColorScheme.dark(
        primary: Color(0xFF5B9A8B),
        secondary: Color(0xFFD4A574),
        surface: Color(0xFF2D3748),
        background: Color(0xFF1A202C),
        onPrimary: Colors.white,
        onSecondary: Colors.white,
        onSurface: Color(0xFFF7FAFC),
        onBackground: Color(0xFFF7FAFC),
      ),
      scaffoldBackgroundColor: const Color(0xFF1A202C),
      cardTheme: CardThemeData(
        color: const Color(0xFF2D3748),
        elevation: 2,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: Color(0xFF2D3748),
        foregroundColor: Color(0xFFF7FAFC),
        elevation: 0,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF5B9A8B),
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24),
          ),
        ),
      ),
    );
  }
}
