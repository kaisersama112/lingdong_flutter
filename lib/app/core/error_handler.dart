import 'package:flutter/material.dart';

// 应用错误类型
enum AppErrorType {
  network,      // 网络错误
  auth,         // 认证错误
  database,     // 数据库错误
  validation,   // 验证错误
  unknown,      // 未知错误
}

// 应用错误类
class AppError {
  final AppErrorType type;
  final String message;
  final String? code;
  final dynamic originalError;

  const AppError({
    required this.type,
    required this.message,
    this.code,
    this.originalError,
  });

  factory AppError.network(String message, {String? code, dynamic originalError}) {
    return AppError(
      type: AppErrorType.network,
      message: message,
      code: code,
      originalError: originalError,
    );
  }

  factory AppError.auth(String message, {String? code, dynamic originalError}) {
    return AppError(
      type: AppErrorType.auth,
      message: message,
      code: code,
      originalError: originalError,
    );
  }

  factory AppError.database(String message, {String? code, dynamic originalError}) {
    return AppError(
      type: AppErrorType.database,
      message: message,
      code: code,
      originalError: originalError,
    );
  }

  factory AppError.validation(String message, {String? code, dynamic originalError}) {
    return AppError(
      type: AppErrorType.validation,
      message: message,
      code: code,
      originalError: originalError,
    );
  }

  factory AppError.unknown(String message, {String? code, dynamic originalError}) {
    return AppError(
      type: AppErrorType.unknown,
      message: message,
      code: code,
      originalError: originalError,
    );
  }

  factory AppError.fromException(dynamic exception) {
    if (exception is AppError) {
      return exception;
    }

    // 根据异常类型创建相应的错误
    if (exception.toString().contains('network') || 
        exception.toString().contains('connection')) {
      return AppError.network('网络连接失败，请检查网络设置');
    }

    if (exception.toString().contains('auth') || 
        exception.toString().contains('login')) {
      return AppError.auth('认证失败，请重新登录');
    }

    if (exception.toString().contains('database') || 
        exception.toString().contains('sql')) {
      return AppError.database('数据操作失败，请重试');
    }

    return AppError.unknown('操作失败，请重试');
  }
}

// 错误处理器
class AppErrorHandler {
  static void handleError(BuildContext context, dynamic error) {
    final appError = AppError.fromException(error);
    
    // 记录错误日志
    _logError(appError);
    
    // 显示错误提示
    _showErrorSnackBar(context, appError);
  }

  static void handleErrorSilently(dynamic error) {
    final appError = AppError.fromException(error);
    _logError(appError);
  }

  static void _logError(AppError error) {
    debugPrint('AppError: ${error.type.name} - ${error.message}');
    if (error.originalError != null) {
      debugPrint('Original error: ${error.originalError}');
    }
  }

  static void _showErrorSnackBar(BuildContext context, AppError error) {
    // 根据错误类型显示不同的提示
    String message;
    Color backgroundColor;
    Duration duration;

    switch (error.type) {
      case AppErrorType.network:
        message = '网络连接失败，请检查网络设置';
        backgroundColor = Colors.orange;
        duration = const Duration(seconds: 3);
        break;
      case AppErrorType.auth:
        message = '认证失败，请重新登录';
        backgroundColor = Colors.red;
        duration = const Duration(seconds: 2);
        break;
      case AppErrorType.database:
        message = '数据操作失败，请重试';
        backgroundColor = Colors.red;
        duration = const Duration(seconds: 2);
        break;
      case AppErrorType.validation:
        message = error.message;
        backgroundColor = Colors.orange;
        duration = const Duration(seconds: 2);
        break;
      case AppErrorType.unknown:
        message = '操作失败，请重试';
        backgroundColor = Colors.red;
        duration = const Duration(seconds: 2);
        break;
    }

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          message,
          style: const TextStyle(color: Colors.white),
        ),
        backgroundColor: backgroundColor,
        duration: duration,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }

  // 显示确认对话框
  static Future<bool> showConfirmDialog(
    BuildContext context, {
    required String title,
    required String content,
    String confirmText = '确认',
    String cancelText = '取消',
  }) async {
    final result = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(title),
        content: Text(content),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: Text(cancelText),
          ),
          ElevatedButton(
            onPressed: () => Navigator.of(context).pop(true),
            child: Text(confirmText),
          ),
        ],
      ),
    );
    return result ?? false;
  }

  // 显示加载对话框
  static void showLoadingDialog(BuildContext context, {String message = '加载中...'}) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        content: Row(
          children: [
            const CircularProgressIndicator(),
            const SizedBox(width: 16),
            Text(message),
          ],
        ),
      ),
    );
  }

  // 隐藏加载对话框
  static void hideLoadingDialog(BuildContext context) {
    if (Navigator.of(context).canPop()) {
      Navigator.of(context).pop();
    }
  }
}
