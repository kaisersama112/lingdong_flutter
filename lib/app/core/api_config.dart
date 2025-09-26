import 'package:flutter/foundation.dart';

/// API配置管理类
class ApiConfig {
  static const String _baseUrl = 'http://172.16.4.114:7009';
  static const Duration _connectTimeout = Duration(seconds: 15);
  static const Duration _receiveTimeout = Duration(seconds: 30);
  static const Duration _sendTimeout = Duration(seconds: 15);

  /// 获取API基础URL
  static String get baseUrl => _baseUrl;

  /// 获取连接超时时间
  static Duration get connectTimeout => _connectTimeout;

  /// 获取接收超时时间
  static Duration get receiveTimeout => _receiveTimeout;

  /// 获取发送超时时间
  static Duration get sendTimeout => _sendTimeout;

  /// 获取完整的API配置
  static Map<String, dynamic> get config => {
    'baseUrl': _baseUrl,
    'connectTimeout': _connectTimeout,
    'receiveTimeout': _receiveTimeout,
    'sendTimeout': _sendTimeout,
  };

  /// 打印API配置信息（仅调试模式）
  static void printConfig() {
    if (kDebugMode) {
      debugPrint('=== API配置信息 ===');
      debugPrint('基础URL: $_baseUrl');
      debugPrint('连接超时: ${_connectTimeout.inSeconds}秒');
      debugPrint('接收超时: ${_receiveTimeout.inSeconds}秒');
      debugPrint('发送超时: ${_sendTimeout.inSeconds}秒');
      debugPrint('==================');
    }
  }

  /// 验证URL格式是否正确
  static bool isValidUrl() {
    try {
      final uri = Uri.parse(_baseUrl);
      return uri.hasScheme && uri.hasAuthority;
    } catch (e) {
      return false;
    }
  }

  /// 获取API版本信息
  static String get apiVersion => 'v1';

  /// 获取完整的API端点URL
  static String getFullApiUrl(String endpoint) {
    final cleanEndpoint = endpoint.startsWith('/') ? endpoint : '/$endpoint';
    return '$_baseUrl$cleanEndpoint';
  }
}
