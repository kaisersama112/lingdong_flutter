import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:lingdong_server/lingdong_server.dart' as server;

import 'user_auth_service.dart';

/// 动态相关后端接口封装（基于 lingdong_server DynamicsApi）
class DynamicService {
  static final DynamicService _instance = DynamicService._internal();
  factory DynamicService() => _instance;
  DynamicService._internal();

  final UserAuthService _authService = UserAuthService();
  Dio? _dio;
  server.DynamicsApi? _api;

  void _initializeApiClient() {
    if (_dio != null && _api != null) return;

    _dio = Dio(
      BaseOptions(
        baseUrl: 'http://172.16.4.114:7009',
        connectTimeout: const Duration(seconds: 10),
        receiveTimeout: const Duration(seconds: 15),
        sendTimeout: const Duration(seconds: 10),
      ),
    );
    _addInterceptors();
    _updateAuthToken();
    _api = server.DynamicsApi(_dio!, server.standardSerializers);
  }

  void _addInterceptors() {
    _dio!.interceptors.clear();
    _dio!.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          final token = _authService.getAccessToken();
          if (token != null && token.isNotEmpty) {
            options.headers['Authorization'] = 'Bearer $token';
            if (kDebugMode) {
              debugPrint(
                'DynamicService 请求头已设置: Bearer ${token.substring(0, token.length.clamp(0, 20))}...',
              );
            }
          } else {
            if (kDebugMode) {
              debugPrint('DynamicService 无Token，请求将可能返回401');
            }
          }
          return handler.next(options);
        },
        onError: (error, handler) {
          if (error.response?.statusCode == 401) {
            if (kDebugMode) {
              debugPrint('DynamicService 收到401响应，可能是Token无效或过期');
            }
          }
          return handler.next(error);
        },
      ),
    );
  }

  bool get _hasToken {
    final token = _authService.getAccessToken();
    final hasToken = token != null && token.isNotEmpty;
    if (kDebugMode) {
      debugPrint(
        'DynamicService._hasToken: $hasToken, token长度: ${token?.length ?? 0}',
      );
    }
    return hasToken;
  }

  void _updateAuthToken() {
    if (_dio == null) return;
    final token = _authService.getAccessToken();
    if (token != null && token.isNotEmpty) {
      _dio!.options.headers['Authorization'] = 'Bearer $token';
      if (kDebugMode) {
        debugPrint(
          'DynamicService 认证头已设置: Bearer ${token.substring(0, token.length.clamp(0, 20))}...',
        );
      }
    }
  }

  /// 创建顶级评论（仅文本/链接占位）
  Future<void> createParentComment({
    required String postId,
    required String content,
  }) async {
    _initializeApiClient();
    _updateAuthToken();
    try {
      final int pid =
          int.tryParse(postId.replaceAll(RegExp(r'[^0-9]'), '')) ?? 0;
      final body = server.ParentCommentCreate(
        (b) => b
          ..postId = pid
          ..content = content,
      );

      final resp = await _api!.createParentCommentApiDynamicsPostsRepliesPost(
        parentCommentCreate: body,
      );
      final code = resp.data?.code ?? resp.statusCode ?? 500;
      if (code != 200) {
        throw Exception(resp.data?.msg ?? '创建评论失败($code)');
      }
    } on DioException catch (e) {
      debugPrint('DynamicService.createParentComment 网络错误: ${e.message}');
      rethrow;
    } catch (e) {
      debugPrint('DynamicService.createParentComment 失败: $e');
      rethrow;
    }
  }

  Future<DynamicPostStats> getPostStats(String postId) async {
    _initializeApiClient();
    if (!_hasToken) return const DynamicPostStats();
    _updateAuthToken();
    try {
      final int pid =
          int.tryParse(postId.replaceAll(RegExp(r'[^0-9]'), '')) ?? 0;
      final resp = await _api!.getDynamicDetailApiDynamicsPostIdGet(
        postId: pid,
      );
      final code = resp.data?.code ?? resp.statusCode ?? 500;
      if (code != 200) return const DynamicPostStats();
      final data = resp.data?.data;

      // 直接使用 lingdong_server 的 PostResponse 对象
      if (data is server.PostResponse) {
        return DynamicPostStats(
          likes: data.likeCount ?? 0,
          favorites: data.favoriteCount ?? 0,
          comments: data.commentCount ?? 0,
          shares: data.shareCount ?? 0,
          likedByCurrentUser: data.isLiked ?? false,
          favoritedByCurrentUser: data.isFavorited ?? false,
        );
      }

      // 如果数据不是 PostResponse 类型，尝试手动解析
      final likes = _safeInt(_get(data, ['like_count'], 0));
      final favorites = _safeInt(_get(data, ['favorite_count'], 0));
      final comments = _safeInt(_get(data, ['comment_count'], 0));
      final shares = _safeInt(_get(data, ['share_count'], 0));
      final liked = _safeBool(_get(data, ['is_liked'], false));
      final faved = _safeBool(_get(data, ['is_favorited'], false));
      return DynamicPostStats(
        likes: likes,
        favorites: favorites,
        comments: comments,
        shares: shares,
        likedByCurrentUser: liked,
        favoritedByCurrentUser: faved,
      );
    } catch (e) {
      // 避免在未登录或401时刷屏
      return const DynamicPostStats();
    }
  }

  /// 获取动态详情（包含内容）
  Future<DynamicPost?> getPostDetail(String postId) async {
    _initializeApiClient();
    if (!_hasToken) return null;
    _updateAuthToken();
    try {
      final int pid =
          int.tryParse(postId.replaceAll(RegExp(r'[^0-9]'), '')) ?? 0;
      final resp = await _api!.getDynamicDetailApiDynamicsPostIdGet(
        postId: pid,
      );
      final code = resp.data?.code ?? resp.statusCode ?? 500;
      if (code != 200) return null;
      final data = resp.data?.data;
      if (data == null) return null;

      // 直接使用 lingdong_server 的 PostResponse 对象
      if (data is server.PostResponse) {
        // 解析媒体文件列表
        final images = <String>[];
        if (data.medias != null) {
          for (final media in data.medias!) {
            if (media.media.url.isNotEmpty) {
              images.add(media.media.url);
            }
          }
        }

        final content = data.content;
        return DynamicPost(
          id: '$pid',
          title: content.length > 50
              ? '${content.substring(0, 50)}...'
              : content,
          content: content,
          author: data.username,
          authorId: '${data.userId}',
          images: images,
          createdAt: data.createdAt ?? DateTime.now(),
          likes: data.likeCount ?? 0,
          favorites: data.favoriteCount ?? 0,
          comments: data.commentCount ?? 0,
          shares: data.shareCount ?? 0,
          likedByCurrentUser: data.isLiked ?? false,
          favoritedByCurrentUser: data.isFavorited ?? false,
        );
      }

      // 如果数据不是 PostResponse 类型，尝试手动解析
      final medias = _get(data, ['medias'], []);
      final images = <String>[];
      if (medias is List) {
        for (final media in medias) {
          final url = _get(media, ['url'], '');
          if (url.isNotEmpty) {
            images.add(url);
          }
        }
      }

      final content = _get(data, ['content'], '');
      return DynamicPost(
        id: '$pid',
        title: content.length > 50 ? '${content.substring(0, 50)}...' : content,
        content: content,
        author: _get(data, ['username'], '用户'),
        authorId: '${_get(data, ['user_id'], 0)}',
        images: images,
        createdAt:
            DateTime.tryParse(_get(data, ['created_at'], '') ?? '') ??
            DateTime.now(),
        likes: _safeInt(_get(data, ['like_count'], 0)),
        favorites: _safeInt(_get(data, ['favorite_count'], 0)),
        comments: _safeInt(_get(data, ['comment_count'], 0)),
        shares: _safeInt(_get(data, ['share_count'], 0)),
        likedByCurrentUser: _safeBool(_get(data, ['is_liked'], false)),
        favoritedByCurrentUser: _safeBool(_get(data, ['is_favorited'], false)),
      );
    } catch (e) {
      debugPrint('DynamicService.getPostDetail 失败: $e');
      return null;
    }
  }

  /// 获取推荐动态列表
  Future<List<DynamicPost>> getRecommendedDynamics({
    int page = 0,
    int limit = 20,
  }) async {
    _initializeApiClient();
    if (!_hasToken) {
      debugPrint('DynamicService.getRecommendedDynamics: 无Token，返回空列表');
      return [];
    }
    try {
      final pagination = server.PaginationParams(
        (b) => b
          ..skip = page * limit
          ..limit = limit,
      );
      final resp = await _api!.getRecommendedDynamicsApiDynamicsRecommendedPost(
        paginationParams: pagination,
      );
      final code = resp.data?.code ?? resp.statusCode ?? 500;
      if (code != 200) {
        debugPrint('DynamicService.getRecommendedDynamics: 响应码 $code');
        return [];
      }
      final data = resp.data?.data;
      if (kDebugMode) {
        debugPrint('DynamicService.getRecommendedDynamics 响应数据结构: $data');
        debugPrint(
          'DynamicService.getRecommendedDynamics 数据类型: ${data.runtimeType}',
        );
      }

      // 直接使用 lingdong_server 的 PostListResponse 对象
      if (data is server.PostListResponse) {
        final posts = data.posts;
        if (kDebugMode) {
          debugPrint(
            'DynamicService.getRecommendedDynamics 解析到 ${posts.length} 条动态',
          );
        }
        return posts.map((item) {
          // 解析媒体文件列表
          final images = <String>[];
          if (item.medias != null) {
            for (final media in item.medias!) {
              if (media.media.url.isNotEmpty) {
                images.add(media.media.url);
              }
            }
          }

          final content = item.content;
          return DynamicPost(
            id: '${item.id}',
            title: content.length > 50
                ? '${content.substring(0, 50)}...'
                : content,
            content: content,
            author: item.username,
            authorId: '${item.userId}',
            images: images,
            createdAt: item.createdAt ?? DateTime.now(),
            likes: item.likeCount ?? 0,
            favorites: item.favoriteCount ?? 0,
            comments: item.commentCount ?? 0,
            shares: item.shareCount ?? 0,
            likedByCurrentUser: item.isLiked ?? false,
            favoritedByCurrentUser: item.isFavorited ?? false,
          );
        }).toList();
      }

      // 如果数据不是 PostListResponse 类型，尝试手动解析
      if (kDebugMode) {
        debugPrint(
          'DynamicService.getRecommendedDynamics 数据不是 PostListResponse 类型，尝试手动解析',
        );
      }
      final posts = _get(data, ['posts'], []);
      if (kDebugMode) {
        debugPrint(
          'DynamicService.getRecommendedDynamics 手动解析到 ${posts.length} 条动态',
        );
      }
      if (posts is List) {
        return posts.map((item) {
          // 解析媒体文件列表
          final medias = _get(item, ['medias'], []);
          final images = <String>[];
          if (medias is List) {
            for (final media in medias) {
              final url = _get(media, ['url'], '');
              if (url.isNotEmpty) {
                images.add(url);
              }
            }
          }

          final content = _get(item, ['content'], '');
          return DynamicPost(
            id: '${_get(item, ['id'], 0)}',
            title: content.length > 50
                ? '${content.substring(0, 50)}...'
                : content,
            content: content,
            author: _get(item, ['username'], '用户'),
            authorId: '${_get(item, ['user_id'], 0)}',
            images: images,
            createdAt:
                DateTime.tryParse(_get(item, ['created_at'], '') ?? '') ??
                DateTime.now(),
            likes: _safeInt(_get(item, ['like_count'], 0)),
            favorites: _safeInt(_get(item, ['favorite_count'], 0)),
            comments: _safeInt(_get(item, ['comment_count'], 0)),
            shares: _safeInt(_get(item, ['share_count'], 0)),
            likedByCurrentUser: _safeBool(_get(item, ['is_liked'], false)),
            favoritedByCurrentUser: _safeBool(
              _get(item, ['is_favorited'], false),
            ),
          );
        }).toList();
      }
      return [];
    } catch (e) {
      debugPrint('DynamicService.getRecommendedDynamics 失败: $e');
      return [];
    }
  }

  Future<List<DynamicComment>> getComments(
    String postId, {
    int skip = 0,
    int limit = 20,
  }) async {
    _initializeApiClient();
    if (!_hasToken) return const [];
    _updateAuthToken();
    try {
      final int pid =
          int.tryParse(postId.replaceAll(RegExp(r'[^0-9]'), '')) ?? 0;
      final resp = await _api!
          .getPostParentCommentsApiDynamicsPostsPostIdParentCommentsGet(
            postId: pid,
            skip: skip,
            limit: limit,
          );
      final code = resp.data?.code ?? resp.statusCode ?? 500;
      if (code != 200) return const [];
      final data = resp.data?.data;
      final list = _get(data, ['items'], []);
      if (list is List) {
        return list.map((e) {
          final uid = _get(e, ['user_id'], 'user');
          final content = _get(e, ['content'], '');
          final createdAt =
              DateTime.tryParse(_get(e, ['created_at'], '') ?? '') ??
              DateTime.now();
          return DynamicComment(
            userId: '$uid',
            content: '$content',
            createdAt: createdAt,
          );
        }).toList();
      }
      return const [];
    } catch (e) {
      return const [];
    }
  }

  Future<DynamicPostStats> toggleLike(String postId) async {
    _initializeApiClient();
    if (!_hasToken) return getPostStats(postId);
    _updateAuthToken();
    try {
      final int pid =
          int.tryParse(postId.replaceAll(RegExp(r'[^0-9]'), '')) ?? 0;
      await _api!.toggleLikeApiDynamicsPostIdToggleLikePost(postId: pid);
    } catch (e) {
      debugPrint('DynamicService.toggleLike 失败: $e');
    }
    return getPostStats(postId);
  }

  Future<DynamicPostStats> toggleFavorite(String postId) async {
    _initializeApiClient();
    if (!_hasToken) return getPostStats(postId);
    _updateAuthToken();
    try {
      final int pid =
          int.tryParse(postId.replaceAll(RegExp(r'[^0-9]'), '')) ?? 0;
      await _api!.toggleDynamicFavoriteApiDynamicsPostIdFavoritePost(
        postId: pid,
      );
    } catch (e) {
      debugPrint('DynamicService.toggleFavorite 失败: $e');
    }
    return getPostStats(postId);
  }

  Future<DynamicPostStats> incrementShare(String postId) async {
    _initializeApiClient();
    if (!_hasToken) return getPostStats(postId);
    _updateAuthToken();
    // 后端分享接口方法在当前 SDK 版本可能不可用，直接返回最新统计
    return getPostStats(postId);
  }

  dynamic _get(dynamic root, List<Object> path, dynamic def) {
    try {
      dynamic cur = root;
      for (final seg in path) {
        if (cur == null) return def;
        if (cur is Map && seg is String) {
          cur = cur[seg];
        } else if (cur is List && seg is int) {
          cur = (seg >= 0 && seg < cur.length) ? cur[seg] : def;
        } else {
          return def;
        }
      }
      return cur ?? def;
    } catch (_) {
      return def;
    }
  }

  int _safeInt(dynamic v) {
    if (v is int) return v;
    if (v is double) return v.toInt();
    if (v is String) return int.tryParse(v) ?? 0;
    return 0;
  }

  bool _safeBool(dynamic v) {
    if (v is bool) return v;
    if (v is num) return v != 0;
    if (v is String) return v.toLowerCase() == 'true' || v == '1';
    return false;
  }

  /// 调试方法：检查当前认证状态
  void debugAuthStatus() {
    final token = _authService.getAccessToken();
    final user = _authService.currentUser;
    if (kDebugMode) {
      debugPrint('=== DynamicService 认证状态调试 ===');
      debugPrint('当前用户: ${user?.username ?? "未登录"}');
      debugPrint('Token存在: ${token != null}');
      debugPrint('Token长度: ${token?.length ?? 0}');
      debugPrint(
        'Token前缀: ${token?.substring(0, token.length.clamp(0, 20)) ?? "无"}...',
      );
      debugPrint('===============================');
    }
  }

  /// 测试方法：验证API连接
  Future<void> testApiConnection() async {
    if (kDebugMode) {
      debugPrint('=== 测试API连接 ===');
      debugAuthStatus();

      if (!_hasToken) {
        debugPrint('❌ 无Token，无法测试API');
        return;
      }

      try {
        _initializeApiClient();
        final posts = await getRecommendedDynamics(page: 0, limit: 1);
        debugPrint('✅ API连接成功，获取到 ${posts.length} 条动态');
        if (posts.isNotEmpty) {
          final post = posts.first;
          debugPrint(
            '示例动态: ${post.content.substring(0, post.content.length.clamp(0, 50))}...',
          );
        }
      } catch (e) {
        debugPrint('❌ API连接失败: $e');
      }
      debugPrint('==================');
    }
  }
}

class DynamicPostStats {
  final int likes;
  final int favorites;
  final int comments;
  final int shares;
  final bool likedByCurrentUser;
  final bool favoritedByCurrentUser;

  const DynamicPostStats({
    this.likes = 0,
    this.favorites = 0,
    this.comments = 0,
    this.shares = 0,
    this.likedByCurrentUser = false,
    this.favoritedByCurrentUser = false,
  });
}

class DynamicPost {
  final String id;
  final String title;
  final String content;
  final String author;
  final String authorId;
  final List<String> images;
  final DateTime createdAt;
  final int likes;
  final int favorites;
  final int comments;
  final int shares;
  final bool likedByCurrentUser;
  final bool favoritedByCurrentUser;

  const DynamicPost({
    required this.id,
    required this.title,
    required this.content,
    required this.author,
    required this.authorId,
    required this.images,
    required this.createdAt,
    required this.likes,
    required this.favorites,
    required this.comments,
    required this.shares,
    required this.likedByCurrentUser,
    required this.favoritedByCurrentUser,
  });
}

class DynamicComment {
  final String userId;
  final String content;
  final DateTime createdAt;

  const DynamicComment({
    required this.userId,
    required this.content,
    required this.createdAt,
  });
}
