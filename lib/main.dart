import 'dart:io';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'package:flutter/material.dart';
import 'app/routes/navigation_controller.dart';
import 'app/routes/app_router.dart';
import 'app/modules/auth/login_page.dart';
import 'app/services/user_auth_service.dart';
import 'app/theme/app_theme.dart' as theme;
import 'app/core/app_state.dart';
import 'app/core/error_handler.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // 桌面和测试环境初始化数据库工厂
  if (Platform.isWindows || Platform.isLinux || Platform.isMacOS) {
    sqfliteFfiInit();
    databaseFactory = databaseFactoryFfi;
  }

  // 初始化认证服务，恢复登录状态
  final authService = UserAuthService();
  
  // 延迟初始化，确保Flutter引擎完全启动
  Future.delayed(const Duration(milliseconds: 100), () async {
    try {
      await authService.initialize();
      // 恢复用户状态
      if (authService.isLoggedIn && authService.currentUser != null) {
        appState.setUser(authService.currentUser);
      }
    } catch (e) {
      debugPrint('认证服务初始化延迟执行失败: $e');
      AppErrorHandler.handleErrorSilently(e);
    }
  });
  
  runApp(MyApp(authService: authService));
}

class MyApp extends StatelessWidget {
  final UserAuthService authService;
  
  const MyApp({super.key, required this.authService});

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: appState,
      builder: (context, child) {
        return MaterialApp(
          title: '灵东宠物',
          theme: _buildTheme(appState.currentTheme),
          home: AuthWrapper(authService: authService),
          debugShowCheckedModeBanner: false,
          onGenerateRoute: AppRouter.onGenerateRoute,
          builder: (context, child) {
            // 全局错误处理
            return MediaQuery(
              data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
              child: child!,
            );
          },
        );
      },
    );
  }

  ThemeData _buildTheme(AppTheme themeType) {
    switch (themeType) {
      case AppTheme.light:
        return theme.AppTheme.lightTheme;
      case AppTheme.dark:
        return theme.AppTheme.lightTheme; // 暂时使用lightTheme，后续可以添加darkTheme
      default:
        return theme.AppTheme.lightTheme;
    }
  }
}

class AuthWrapper extends StatefulWidget {
  final UserAuthService authService;
  
  const AuthWrapper({super.key, required this.authService});

  @override
  State<AuthWrapper> createState() => _AuthWrapperState();
}

class _AuthWrapperState extends State<AuthWrapper> {
  bool _isInitialized = false;

  @override
  void initState() {
    super.initState();
    _checkAuthState();
  }

  Future<void> _checkAuthState() async {
    // 等待认证服务初始化完成
    await Future.delayed(const Duration(milliseconds: 200));
    
    // 尝试初始化认证服务（如果还没有初始化的话）
    try {
      await widget.authService.initialize();
      
      // 恢复用户状态
      if (widget.authService.isLoggedIn && widget.authService.currentUser != null) {
        appState.setUser(widget.authService.currentUser);
      }
    } catch (e) {
      debugPrint('AuthWrapper中初始化认证服务失败: $e');
      AppErrorHandler.handleErrorSilently(e);
    }
    
    if (mounted) {
      setState(() {
        _isInitialized = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (!_isInitialized) {
      // 显示加载页面
      return Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: theme.AppTheme.sunsetGradient,
          ),
          child: const Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                  strokeWidth: 3,
                ),
                SizedBox(height: 24),
                Text(
                  '正在加载...',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    }

    // 使用状态管理检查登录状态
    return ListenableBuilder(
      listenable: appState,
      builder: (context, child) {
        if (appState.isLoggedIn) {
          return const NavigationController();
        } else {
          return const LoginPage();
        }
      },
    );
  }
}
