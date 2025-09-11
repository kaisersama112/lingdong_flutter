import 'package:dio/dio.dart';
import 'package:built_collection/built_collection.dart' as collection;
import 'package:flutter/foundation.dart';
import 'package:lingdong_server/lingdong_server.dart' as server;
import 'package:built_value/json_object.dart';

import 'user_auth_service.dart';

/// 动态相关后端接口封装（基于 lingdong_server DynamicsApi）
class DynamicService {
  static final DynamicService _instance = DynamicService._internal();
  factory DynamicService() => _instance;
  DynamicService._internal();

  final UserAuthService _authService = UserAuthService();
  Dio? _dio;
  server.DynamicsApi? _api;
  server.UserApi? _userApi;
  server.MediaApi? _mediaApi;

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
    _userApi = server.UserApi(_dio!, server.standardSerializers);
    _mediaApi = server.MediaApi(_dio!, server.standardSerializers);
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

  /// 创建广场动态
  Future<String> createPost({
    required String content,
    server.RelatedTypeEnum? relatedType,
    int? communityId,
    List<server.MediaCreate>? medias,
    String? location,
  }) async {
    _initializeApiClient();
    if (!_hasToken) {
      throw Exception('未登录，无法发布动态');
    }
    _updateAuthToken();
    try {
      final body = server.PostCreate(
        (b) => b
          ..content = content
          ..relatedType = int.parse(
            (relatedType ?? server.RelatedTypeEnum.number2).name.replaceAll(
              RegExp(r'[^0-9]'),
              '',
            ),
          )
          ..communityId = communityId
          ..location = location
          ..medias = medias != null
              ? collection.ListBuilder<server.MediaCreate>(medias)
              : null,
      );

      final resp = await _api!.createDynamicApiDynamicsCreateDynamicPost(
        postCreate: body,
      );
      final code = resp.data?.code ?? resp.statusCode ?? 500;
      if (code != 200) {
        throw Exception(resp.data?.msg ?? '发布动态失败($code)');
      }
      final id = resp.data?.data?.id;
      if (id == null) throw Exception('发布成功但未返回ID');
      return '$id';
    } on DioException catch (e) {
      debugPrint('DynamicService.createPost 网络错误: ${e.message}');
      rethrow;
    } catch (e) {
      debugPrint('DynamicService.createPost 失败: $e');
      rethrow;
    }
  }

  /// 上传媒体并关联到帖子
  Future<String> uploadPostMedia({
    required int postId,
    required List<int> fileBytes,
    required String filename,
    server.MediaType mediaType = server.MediaType.number0,
    String? description,
  }) async {
    _initializeApiClient();
    if (!_hasToken) throw Exception('未登录，无法上传媒体');
    _updateAuthToken();
    try {
      final multipart = MultipartFile.fromBytes(fileBytes, filename: filename);
      final resp = await _mediaApi!.uploadMediaApiMediaUploadMediaPost(
        relatedType: server.RelatedTypeEnum.number2,
        relatedId: postId,
        file: multipart,
        mediaType: mediaType,
        description: description,
      );
      final code = resp.statusCode ?? 500;
      if (code < 200 || code >= 300) {
        throw Exception('上传失败($code)');
      }
      final url = resp.data?.data?.url;
      if (url == null || url.isEmpty) throw Exception('上传成功但未返回URL');
      return url;
    } on DioException catch (e) {
      debugPrint('DynamicService.uploadPostMedia 网络错误: ${e.message}');
      rethrow;
    } catch (e) {
      debugPrint('DynamicService.uploadPostMedia 失败: $e');
      rethrow;
    }
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
      if (!_hasToken) {
        throw Exception('未登录，无法发布评论');
      }
      if (content.trim().isEmpty) {
        throw Exception('评论内容不能为空');
      }
      final int pid =
          int.tryParse(postId.replaceAll(RegExp(r'[^0-9]'), '')) ?? 0;
      if (pid == 0) {
        throw Exception('无效的帖子ID: "$postId"');
      }
      final body = server.ParentCommentCreate(
        (b) => b
          ..postId = pid
          ..content = content,
      );

      final resp = await _api!
          .createParentCommentApiDynamicsPostsParentCommentsPost(
            parentCommentCreate: body,
          );
      final code = resp.data?.code ?? resp.statusCode ?? 500;
      if (code != 200) {
        final msg = resp.data?.msg ?? '创建评论失败($code)';
        throw Exception('$msg | url=${resp.requestOptions.uri}');
      }
    } on DioException catch (e) {
      debugPrint('DynamicService.createParentComment 网络错误: ${e.message}');
      if (e.response != null) {
        debugPrint('  - 状态码: ${e.response?.statusCode}');
        debugPrint('  - 响应数据: ${e.response?.data}');
        debugPrint('  - 请求URL: ${e.requestOptions.uri}');
      }
      rethrow;
    } catch (e) {
      debugPrint('DynamicService.createParentComment 失败: $e');
      rethrow;
    }
  }

  /// 切换评论/回复点赞状态（统一接口）
  ///
  /// [targetId] - 顶级评论或回复ID
  /// [targetType] - 可选：'parent_comment' 或 'reply'；如果后端不需要可为空
  Future<void> toggleCommentLike(String targetId, {String? targetType}) async {
    _initializeApiClient();
    _updateAuthToken();
    try {
      final int tid =
          int.tryParse(targetId.replaceAll(RegExp(r'[^0-9]'), '')) ?? 0;
      // 标准化 targetType，兼容 'parent_comment' → 'comment'
      final String? normalizedType = targetType == null
          ? null
          : (targetType == 'parent_comment' ? 'comment' : targetType);
      final resp = await _api!.toggleLikeApiDynamicsCommentsLikePost(
        targetId: tid,
        targetType: normalizedType,
      );
      final code = resp.data?.code ?? resp.statusCode ?? 500;
      if (code != 200) {
        throw Exception(resp.data?.msg ?? '切换点赞失败($code)');
      }
    } on DioException catch (e) {
      debugPrint('DynamicService.toggleCommentLike 网络错误: ${e.message}');
      rethrow;
    } catch (e) {
      debugPrint('DynamicService.toggleCommentLike 失败: $e');
      rethrow;
    }
  }

  /// 获取其他用户公开信息
  Future<server.UserResponse?> getOtherUserInfo(String userId) async {
    _initializeApiClient();
    if (!_hasToken) return null;
    _updateAuthToken();
    try {
      final int uid =
          int.tryParse(userId.replaceAll(RegExp(r'[^0-9]'), '')) ?? 0;
      if (uid == 0) return null;
      final resp = await _userApi!.getOtherUserInfoApiAuthUsersUserIdGet(
        userId: uid,
      );
      final code = resp.data?.code ?? resp.statusCode ?? 500;
      if (code != 200) return null;
      return resp.data?.data;
    } catch (e) {
      if (kDebugMode) {
        debugPrint('DynamicService.getOtherUserInfo 失败: $e');
      }
      return null;
    }
  }

  /// 创建回复（对评论的回复）
  ///
  /// [parentCommentId] - 顶级评论ID（必需）
  /// [content] - 回复内容（必需）
  /// [replyToReplyId] - 可选：如果是对回复的回复，传递被回复的回复ID
  Future<void> createReply({
    required String parentCommentId,
    required String content,
    String? replyToReplyId, // 可选：回复给特定回复
  }) async {
    _initializeApiClient();
    _updateAuthToken();
    try {
      final int commentId =
          int.tryParse(parentCommentId.replaceAll(RegExp(r'[^0-9]'), '')) ?? 0;
      final body = server.ReplyCreate(
        (b) => b
          ..parentCommentId = commentId
          ..content = content
          ..replyToReplyId = replyToReplyId != null
              ? int.tryParse(
                      replyToReplyId.replaceAll(RegExp(r'[^0-9]'), ''),
                    ) ??
                    0
              : null,
      );

      final resp = await _api!.createReplyApiDynamicsCommentsRepliesPost(
        replyCreate: body,
      );
      final code = resp.data?.code ?? resp.statusCode ?? 500;
      if (code != 200) {
        throw Exception(resp.data?.msg ?? '创建回复失败($code)');
      }
    } on DioException catch (e) {
      debugPrint('DynamicService.createReply 网络错误: ${e.message}');
      rethrow;
    } catch (e) {
      debugPrint('DynamicService.createReply 失败: $e');
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
      // 后端暂无独立动态详情接口，这里通过推荐列表或其他接口间接获取统计已处理
      final resp = await _api!
          .getPostCommentsCountApiDynamicsPostsPostIdCommentsCountGet(
            postId: pid,
          );
      final code = resp.data?.code ?? resp.statusCode ?? 500;
      if (code != 200) return const DynamicPostStats();
      final data = resp.data?.data;

      // 仅能获取评论数，其他字段后续可通过详情接口补齐
      int comments = 0;
      if (data != null) {
        try {
          if (data.runtimeType.toString().contains('BuiltMap')) {
            final map = data.toMap();
            comments = _safeInt(
              map['count'] ?? map['total'] ?? map['comment_count'] ?? 0,
            );
          } else if (data is Map) {
            comments = _safeInt(
              data['count'] ?? data['total'] ?? data['comment_count'] ?? 0,
            );
          }
        } catch (_) {}
      }
      return DynamicPostStats(comments: comments);
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
      final resp = await _api!
          .getPostCommentsCountApiDynamicsPostsPostIdCommentsCountGet(
            postId: pid,
          );
      final code = resp.data?.code ?? resp.statusCode ?? 500;
      if (code != 200) return null;
      final data = resp.data?.data;
      if (data == null) return null;

      // 暂无详情数据，返回空
      return null;
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
              if (media.url.isNotEmpty) {
                images.add(media.url);
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

  /// 获取指定用户的动态列表（与首页展示结构一致）
  Future<List<DynamicPost>> getUserPosts({
    required String userId,
    int page = 0,
    int limit = 20,
  }) async {
    _initializeApiClient();
    if (!_hasToken) return [];
    _updateAuthToken();
    try {
      final int uid =
          int.tryParse(userId.replaceAll(RegExp(r'[^0-9]'), '')) ?? 0;
      if (uid == 0) return [];
      final resp = await _api!.getUserPostsApiDynamicsUsersUserIdPostsGet(
        userId: uid,
        page: page,
        limit: limit,
      );
      final code = resp.data?.code ?? resp.statusCode ?? 500;
      if (code != 200) return [];
      final data = resp.data?.data;

      // 优先使用 SDK 的 PostListResponse
      if (data is server.PostListResponse) {
        final posts = data.posts;
        return posts.map((item) {
          final images = <String>[];
          if (item.medias != null) {
            for (final media in item.medias!) {
              if (media.url.isNotEmpty) images.add(media.url);
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

      // 兜底：手动解析
      final posts = _get(data, ['posts'], []) ?? _get(data, ['items'], []);
      if (posts is List) {
        return posts.map((item) {
          final medias = _get(item, ['medias'], []);
          final images = <String>[];
          if (medias is List) {
            for (final media in medias) {
              final url = _get(media, ['url'], '');
              if (url.isNotEmpty) images.add(url);
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
      if (kDebugMode) {
        debugPrint('DynamicService.getUserPosts 失败: $e');
      }
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
      if (code != 200) {
        if (kDebugMode) {
          debugPrint('DynamicService.getComments: 响应码 $code');
        }
        return const [];
      }

      final data = resp.data?.data;
      if (kDebugMode) {
        debugPrint('DynamicService.getComments 响应数据: $data');
      }

      // 解析 GenericResponseDict 的 data 字段
      if (data != null) {
        // 尝试从不同的路径获取评论列表
        List<dynamic>? list;

        // 处理 BuiltMap 类型的数据
        if (data.runtimeType.toString().contains('BuiltMap')) {
          final dataMap = data.toMap();
          if (kDebugMode) {
            debugPrint(
              'DynamicService.getComments BuiltMap keys: ${dataMap.keys.toList()}',
            );
          }

          // 尝试不同的字段名
          final items = dataMap['items'] as dynamic;
          final comments = dataMap['comments'] as dynamic;
          final dataList = dataMap['data'] as dynamic;

          if (items is List) {
            list = items;
          } else if (comments is List) {
            list = comments;
          } else if (dataList is List) {
            list = dataList;
          } else if (items is JsonObject && items.value is List) {
            list = items.value as List<dynamic>;
          } else if (comments is JsonObject && comments.value is List) {
            list = comments.value as List<dynamic>;
          } else if (dataList is JsonObject && dataList.value is List) {
            list = dataList.value as List<dynamic>;
          }
        } else {
          // 使用 _get 函数来安全地获取数据
          final items = _get(data, ['items'], null);
          final comments = _get(data, ['comments'], null);
          final dataList = _get(data, ['data'], null);

          if (items is List) {
            list = items;
          } else if (comments is List) {
            list = comments;
          } else if (dataList is List) {
            list = dataList;
          } else if (items != null &&
              items is JsonObject &&
              items.value is List) {
            list = items.value as List<dynamic>;
          } else if (comments != null &&
              comments is JsonObject &&
              comments.value is List) {
            list = comments.value as List<dynamic>;
          } else if (dataList != null &&
              dataList is JsonObject &&
              dataList.value is List) {
            list = dataList.value as List<dynamic>;
          } else {
            // 如果 _get 函数没有工作，尝试直接访问
            if (data is Map) {
              final directItems = data['items'] as dynamic;
              final directComments = data['comments'] as dynamic;
              final directData = data['data'] as dynamic;

              if (directItems is List) {
                list = directItems;
              } else if (directComments is List) {
                list = directComments;
              } else if (directData is List) {
                list = directData;
              } else if (directItems is JsonObject &&
                  directItems.value is List) {
                list = directItems.value as List<dynamic>;
              } else if (directComments is JsonObject &&
                  directComments.value is List) {
                list = directComments.value as List<dynamic>;
              } else if (directData is JsonObject && directData.value is List) {
                list = directData.value as List<dynamic>;
              }
            }
          }
        }

        if (kDebugMode) {
          debugPrint('DynamicService.getComments 解析到 ${list?.length ?? 0} 条评论');
        }

        if (list != null) {
          return list.map((e) {
            if (kDebugMode) {
              debugPrint('DynamicService.getComments 解析评论项: $e');
            }

            final id = _get(e, ['id'], 0);
            final uid = _get(e, ['user_id'], 'user');
            final username = _get(e, ['username'], '用户${uid}');
            final userAvatar = _get(e, ['user_avatar'], null);
            final content = _get(e, ['content'], '');
            final createdAt =
                DateTime.tryParse(_get(e, ['created_at'], '') ?? '') ??
                DateTime.now();
            final likeCount = _safeInt(_get(e, ['like_count'], 0));
            final isLiked = _safeBool(_get(e, ['is_liked'], false));

            // 解析媒体文件
            final medias = _get(e, ['medias'], []);
            final images = <String>[];
            if (medias is List) {
              for (final media in medias) {
                final url = _get(media, ['url'], '');
                if (url.isNotEmpty) {
                  images.add(url);
                }
              }
            }

            return DynamicComment(
              id: '$id',
              userId: '$uid',
              username: '$username',
              userAvatar: userAvatar != null ? '$userAvatar' : null,
              content: '$content',
              createdAt: createdAt,
              likeCount: likeCount,
              isLiked: isLiked,
              images: images,
            );
          }).toList();
        }
      }
      return const [];
    } catch (e) {
      if (kDebugMode) {
        debugPrint('DynamicService.getComments 失败: $e');
      }
      return const [];
    }
  }

  /// 获取指定评论下的回复列表
  Future<List<DynamicReply>> getCommentReplies(
    String parentCommentId, {
    int skip = 0,
    int limit = 20,
  }) async {
    _initializeApiClient();
    if (!_hasToken) return const [];
    _updateAuthToken();
    try {
      final int commentId =
          int.tryParse(parentCommentId.replaceAll(RegExp(r'[^0-9]'), '')) ?? 0;

      if (commentId == 0) {
        if (kDebugMode) {
          debugPrint('DynamicService.getCommentReplies 错误: 无法解析有效的评论ID');
          debugPrint('  - parentCommentId: $parentCommentId');
          debugPrint('  - 解析后的commentId: $commentId');
        }
        return const [];
      }

      if (kDebugMode) {
        debugPrint('DynamicService.getCommentReplies 调用参数:');
        debugPrint('  - parentCommentId: $parentCommentId');
        debugPrint('  - commentId: $commentId');
        debugPrint('  - skip: $skip');
        debugPrint('  - limit: $limit');
      }

      final resp = await _api!
          .getCommentRepliesApiDynamicsCommentsParentCommentIdRepliesGet(
            parentCommentId: commentId,
            skip: skip,
            limit: limit,
          );

      if (kDebugMode) {
        debugPrint('DynamicService.getCommentReplies 响应状态: ${resp.statusCode}');
        debugPrint('DynamicService.getCommentReplies 响应数据: ${resp.data}');
      }
      final code = resp.data?.code ?? resp.statusCode ?? 500;
      if (code != 200) {
        if (kDebugMode) {
          debugPrint('DynamicService.getCommentReplies: 响应码 $code');
          debugPrint('DynamicService.getCommentReplies: 响应数据 ${resp.data}');
          debugPrint(
            'DynamicService.getCommentReplies: 请求URL ${resp.requestOptions.uri}',
          );
        }
        return const [];
      }

      final data = resp.data?.data;
      if (kDebugMode) {
        debugPrint('DynamicService.getCommentReplies 响应数据: $data');
      }

      // 解析 GenericResponseDict 的 data 字段
      if (data != null) {
        List<dynamic>? list;

        // 处理 BuiltMap 类型的数据
        if (data.runtimeType.toString().contains('BuiltMap')) {
          final dataMap = data.toMap();
          if (kDebugMode) {
            debugPrint(
              'DynamicService.getCommentReplies BuiltMap keys: ${dataMap.keys.toList()}',
            );
          }

          // 尝试不同的字段名
          final items = dataMap['items'] as dynamic;
          final replies = dataMap['replies'] as dynamic;
          final dataList = dataMap['data'] as dynamic;

          if (items is List) {
            list = items;
          } else if (replies is List) {
            list = replies;
          } else if (dataList is List) {
            list = dataList;
          } else if (items is JsonObject && items.value is List) {
            list = items.value as List<dynamic>;
          } else if (replies is JsonObject && replies.value is List) {
            list = replies.value as List<dynamic>;
          } else if (dataList is JsonObject && dataList.value is List) {
            list = dataList.value as List<dynamic>;
          }
        } else {
          // 使用 _get 函数来安全地获取数据
          final items = _get(data, ['items'], null);
          final replies = _get(data, ['replies'], null);
          final dataList = _get(data, ['data'], null);

          if (items is List) {
            list = items;
          } else if (replies is List) {
            list = replies;
          } else if (dataList is List) {
            list = dataList;
          } else if (items != null &&
              items is JsonObject &&
              items.value is List) {
            list = items.value as List<dynamic>;
          } else if (replies != null &&
              replies is JsonObject &&
              replies.value is List) {
            list = replies.value as List<dynamic>;
          } else if (dataList != null &&
              dataList is JsonObject &&
              dataList.value is List) {
            list = dataList.value as List<dynamic>;
          } else {
            // 如果 _get 函数没有工作，尝试直接访问
            if (data is Map) {
              final directItems = data['items'] as dynamic;
              final directReplies = data['replies'] as dynamic;
              final directData = data['data'] as dynamic;

              if (directItems is List) {
                list = directItems;
              } else if (directReplies is List) {
                list = directReplies;
              } else if (directData is List) {
                list = directData;
              } else if (directItems is JsonObject &&
                  directItems.value is List) {
                list = directItems.value as List<dynamic>;
              } else if (directReplies is JsonObject &&
                  directReplies.value is List) {
                list = directReplies.value as List<dynamic>;
              } else if (directData is JsonObject && directData.value is List) {
                list = directData.value as List<dynamic>;
              }
            }
          }
        }

        if (kDebugMode) {
          debugPrint(
            'DynamicService.getCommentReplies 解析到 ${list?.length ?? 0} 条回复',
          );
        }

        if (list != null) {
          return list.map((e) {
            if (kDebugMode) {
              debugPrint('DynamicService.getCommentReplies 解析回复项: $e');
            }

            final id = _get(e, ['id'], 0);

            // 解析回复人信息
            final replier = _get(e, ['replier'], null);
            final uid = replier != null
                ? _get(replier, ['user_id'], 'user')
                : _get(e, ['user_id'], 'user');
            final username = replier != null
                ? _get(replier, ['username'], '用户${uid}')
                : _get(e, ['username'], '用户${uid}');
            final userAvatar = replier != null
                ? _get(replier, ['avatar'], null)
                : _get(e, ['user_avatar'], null);

            final content = _get(e, ['content'], '');
            final createdAt =
                DateTime.tryParse(_get(e, ['created_at'], '') ?? '') ??
                DateTime.now();
            final likeCount = _safeInt(_get(e, ['like_count'], 0));
            final isLiked = _safeBool(_get(e, ['is_liked'], false));

            // 解析回复目标用户信息
            final replyTo = _get(e, ['reply_to'], null);
            final replyToUserId = replyTo != null
                ? _get(replyTo, ['user_id'], null)
                : _get(e, ['reply_to_user_id'], null);
            final replyToUsername = replyTo != null
                ? _get(replyTo, ['username'], null)
                : _get(e, ['reply_to_username'], null);
            final parentCommentId = _get(e, ['parent_comment_id'], null);

            // 解析媒体文件
            final medias = _get(e, ['medias'], []);
            final images = <String>[];
            if (medias is List) {
              for (final media in medias) {
                final url = _get(media, ['url'], '');
                if (url.isNotEmpty) {
                  images.add(url);
                }
              }
            }

            final reply = DynamicReply(
              id: '$id',
              userId: '$uid',
              username: '$username',
              userAvatar: userAvatar != null ? '$userAvatar' : null,
              content: '$content',
              createdAt: createdAt,
              likeCount: likeCount,
              isLiked: isLiked,
              images: images,
              replyToUserId: replyToUserId != null ? '$replyToUserId' : null,
              replyToUsername: replyToUsername != null
                  ? '$replyToUsername'
                  : null,
              parentCommentId: parentCommentId != null
                  ? '$parentCommentId'
                  : null,
            );

            if (kDebugMode) {
              debugPrint('DynamicService.getCommentReplies 解析结果:');
              debugPrint('  - 回复人: $username (ID: $uid)');
              debugPrint(
                '  - 被回复人: ${replyToUsername ?? "无"} (ID: ${replyToUserId ?? "无"})',
              );
              debugPrint('  - 父评论ID: ${parentCommentId ?? "无"}');
              debugPrint('  - 内容: $content');
            }

            return reply;
          }).toList();
        }
      }
      return const [];
    } catch (e) {
      if (kDebugMode) {
        debugPrint('DynamicService.getCommentReplies 失败: $e');
        if (e is DioException) {
          debugPrint('  - 错误类型: ${e.type}');
          debugPrint('  - 状态码: ${e.response?.statusCode}');
          debugPrint('  - 响应数据: ${e.response?.data}');
          debugPrint('  - 请求URL: ${e.requestOptions.uri}');
          debugPrint('  - 请求方法: ${e.requestOptions.method}');
        }
      }
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
  final String id;
  final String userId;
  final String username;
  final String? userAvatar;
  final String content;
  final DateTime createdAt;
  final int likeCount;
  final bool isLiked;
  final List<String> images;

  const DynamicComment({
    required this.id,
    required this.userId,
    required this.username,
    this.userAvatar,
    required this.content,
    required this.createdAt,
    this.likeCount = 0,
    this.isLiked = false,
    this.images = const [],
  });
}

class DynamicReply {
  final String id;
  final String userId;
  final String username;
  final String? userAvatar;
  final String content;
  final DateTime createdAt;
  final int likeCount;
  final bool isLiked;
  final List<String> images;
  final String? replyToUserId;
  final String? replyToUsername;
  final String? parentCommentId; // 顶级评论ID

  const DynamicReply({
    required this.id,
    required this.userId,
    required this.username,
    this.userAvatar,
    required this.content,
    required this.createdAt,
    this.likeCount = 0,
    this.isLiked = false,
    this.images = const [],
    this.replyToUserId,
    this.replyToUsername,
    this.parentCommentId,
  });
}
