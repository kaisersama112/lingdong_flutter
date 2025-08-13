import 'package:flutter/material.dart';
import 'app/routes/navigation_controller.dart';
import 'app/theme/app_theme.dart';
import 'app/services/user_auth_service.dart';
import 'app/modules/auth/login_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '灵宠',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: AppTheme.primaryColor,
          brightness: Brightness.light,
        ),
        useMaterial3: true,
        fontFamily: 'PingFang SC',
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
          titleTextStyle: TextStyle(
            color: AppTheme.textPrimaryColor,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
          iconTheme: IconThemeData(
            color: AppTheme.textPrimaryColor,
          ),
        ),
        cardTheme: CardThemeData(
          color: AppTheme.surfaceColor,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppTheme.borderRadiusLarge),
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: AppTheme.primaryColor,
            foregroundColor: Colors.white,
            elevation: 0,
            padding: const EdgeInsets.symmetric(
              horizontal: AppTheme.spacingL,
              vertical: AppTheme.spacingM,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(AppTheme.borderRadiusMedium),
            ),
          ),
        ),
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: AppTheme.surfaceColor,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(AppTheme.borderRadiusMedium),
            borderSide: BorderSide.none,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(AppTheme.borderRadiusMedium),
            borderSide: BorderSide(color: AppTheme.dividerColor),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(AppTheme.borderRadiusMedium),
            borderSide: const BorderSide(color: AppTheme.primaryColor, width: 2),
          ),
          contentPadding: const EdgeInsets.symmetric(
            horizontal: AppTheme.spacingM,
            vertical: AppTheme.spacingM,
          ),
        ),
      ),
      home: const AuthWrapper(),
      debugShowCheckedModeBanner: false,
    );
  }
}

/// 认证包装器，用于检查用户登录状态
class AuthWrapper extends StatefulWidget {
  const AuthWrapper({super.key});

  @override
  State<AuthWrapper> createState() => _AuthWrapperState();
}

class _AuthWrapperState extends State<AuthWrapper> {
  final _authService = UserAuthService();
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _checkAuthStatus();
  }

  Future<void> _checkAuthStatus() async {
    // 模拟检查登录状态
    await Future.delayed(const Duration(milliseconds: 500));
    
    if (mounted) {
      setState(() => _isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: AppTheme.sunsetGradient,
          ),
          child: const Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.pets,
                  size: 80,
                  color: Colors.white,
                ),
                SizedBox(height: AppTheme.spacingL),
                Text(
                  '灵宠',
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: AppTheme.spacingL),
                CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                ),
              ],
            ),
          ),
        ),
      );
    }

    // 检查用户是否已登录
    if (_authService.isLoggedIn) {
      return const NavigationController();
    } else {
      return const LoginPage();
    }
  }
}
