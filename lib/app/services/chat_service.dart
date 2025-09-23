import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:lingdong_server/lingdong_server.dart' as server;
import 'package:built_collection/built_collection.dart' as collection;

import '../core/api_config.dart';
import '../core/models/chat_models.dart';
import 'user_auth_service.dart';

/// 聊天服务 - 统一管理所有聊天相关API
class ChatService {
  static final ChatService _instance = ChatService._internal();
  factory ChatService() => _instance;
  ChatService._internal();

  final UserAuthService _authService = UserAuthService();
  Dio? _dio;
  server.ChatApi? _chatApi;

  /// 初始化API客户端
  void _initializeApiClient() {
    if (_dio != null && _chatApi != null) return;

    _dio = Dio(
      BaseOptions(
        baseUrl: ApiConfig.baseUrl,
        connectTimeout: ApiConfig.connectTimeout,
        receiveTimeout: ApiConfig.receiveTimeout,
        sendTimeout: ApiConfig.sendTimeout,
      ),
    );

    _addInterceptors();
    _updateAuthToken();
    _chatApi = server.ChatApi(_dio!, server.standardSerializers);
  }

  /// 添加拦截器
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
                'ChatService 请求头已设置: Bearer ${token.substring(0, token.length.clamp(0, 20))}...',
              );
            }
          } else {
            if (kDebugMode) {
              debugPrint('ChatService 无Token，请求将可能返回401');
            }
          }
          return handler.next(options);
        },
        onError: (error, handler) {
          if (error.response?.statusCode == 401) {
            if (kDebugMode) {
              debugPrint('ChatService 收到401响应，可能是Token无效或过期');
            }
          }
          return handler.next(error);
        },
      ),
    );
  }

  /// 更新认证Token
  void _updateAuthToken() {
    if (_dio == null) return;
    final token = _authService.getAccessToken();
    if (token != null && token.isNotEmpty) {
      _dio!.options.headers['Authorization'] = 'Bearer $token';
      if (kDebugMode) {
        debugPrint(
          'ChatService 认证头已设置: Bearer ${token.substring(0, token.length.clamp(0, 20))}...',
        );
      }
    }
  }

  /// 检查是否有Token
  bool get _hasToken {
    final token = _authService.getAccessToken();
    return token != null && token.isNotEmpty;
  }

  // ==================== 会话管理 ====================

  /// 获取用户的所有会话列表
  Future<List<ChatConversation>> getUserConversations() async {
    _initializeApiClient();
    if (!_hasToken) {
      throw const ChatException(
        '未登录，无法获取会话列表',
        type: ChatErrorType.authentication,
      );
    }
    _updateAuthToken();

    try {
      final resp = await _chatApi!
          .getUserConversationsApiChatConversationsGet();
      final code = resp.data?.code ?? resp.statusCode ?? 500;

      if (code != 200) {
        throw ChatException(
          resp.data?.msg ?? '获取会话列表失败($code)',
          type: ChatErrorType.server,
          statusCode: code,
        );
      }

      final data = resp.data?.data;
      if (data == null) return [];

      // 解析会话列表
      return _parseConversationList(data);
    } on DioException catch (e) {
      debugPrint('ChatService.getUserConversations 网络错误: ${e.message}');
      throw ChatException(
        '网络错误: ${e.message}',
        type: ChatErrorType.network,
        statusCode: e.response?.statusCode,
        originalError: e,
      );
    } catch (e) {
      debugPrint('ChatService.getUserConversations 失败: $e');
      throw ChatException(
        '获取会话列表失败: $e',
        type: ChatErrorType.unknown,
        originalError: e,
      );
    }
  }

  /// 根据会话ID获取会话信息
  Future<ChatConversation?> getConversationById(String sessionId) async {
    _initializeApiClient();
    if (!_hasToken) {
      throw const ChatException(
        '未登录，无法获取会话信息',
        type: ChatErrorType.authentication,
      );
    }
    _updateAuthToken();

    try {
      final resp = await _chatApi!
          .getConversationBySessionIdApiChatConversationSessionIdGet(
            sessionId: sessionId,
          );
      final code = resp.data?.code ?? resp.statusCode ?? 500;

      if (code != 200) {
        if (code == 404) {
          return null; // 会话不存在
        }
        throw ChatException(
          resp.data?.msg ?? '获取会话信息失败($code)',
          type: ChatErrorType.server,
          statusCode: code,
        );
      }

      final data = resp.data?.data;
      if (data == null) return null;

      return _parseConversation(data);
    } on DioException catch (e) {
      debugPrint('ChatService.getConversationById 网络错误: ${e.message}');
      throw ChatException(
        '网络错误: ${e.message}',
        type: ChatErrorType.network,
        statusCode: e.response?.statusCode,
        originalError: e,
      );
    } catch (e) {
      debugPrint('ChatService.getConversationById 失败: $e');
      throw ChatException(
        '获取会话信息失败: $e',
        type: ChatErrorType.unknown,
        originalError: e,
      );
    }
  }

  /// 创建新会话
  Future<ChatConversation> createConversation(
    CreateConversationRequest request,
  ) async {
    _initializeApiClient();
    if (!_hasToken) {
      throw const ChatException(
        '未登录，无法创建会话',
        type: ChatErrorType.authentication,
      );
    }
    _updateAuthToken();

    try {
      // 注意：ConversationCreate只支持targetUserId字段，需要调整API调用
      if (request.participantIds.isEmpty) {
        throw const ChatException(
          '创建会话需要至少一个参与者',
          type: ChatErrorType.validation,
        );
      }

      final conversationCreate = server.ConversationCreate(
        (b) =>
            b..targetUserId = int.tryParse(request.participantIds.first) ?? 0,
      );

      final resp = await _chatApi!
          .createConversationApiChatConversationCreatePost(
            conversationCreate: conversationCreate,
          );
      final code = resp.data?.code ?? resp.statusCode ?? 500;

      if (code != 200) {
        throw ChatException(
          resp.data?.msg ?? '创建会话失败($code)',
          type: ChatErrorType.server,
          statusCode: code,
        );
      }

      final data = resp.data?.data;
      if (data == null) {
        throw const ChatException('创建会话成功但未返回数据', type: ChatErrorType.server);
      }

      return _parseConversation(data);
    } on DioException catch (e) {
      debugPrint('ChatService.createConversation 网络错误: ${e.message}');
      throw ChatException(
        '网络错误: ${e.message}',
        type: ChatErrorType.network,
        statusCode: e.response?.statusCode,
        originalError: e,
      );
    } catch (e) {
      debugPrint('ChatService.createConversation 失败: $e');
      throw ChatException(
        '创建会话失败: $e',
        type: ChatErrorType.unknown,
        originalError: e,
      );
    }
  }

  /// 创建群聊
  Future<ChatConversation> createGroupConversation(
    CreateGroupRequest request,
  ) async {
    _initializeApiClient();
    if (!_hasToken) {
      throw const ChatException(
        '未登录，无法创建群聊',
        type: ChatErrorType.authentication,
      );
    }
    _updateAuthToken();

    try {
      final groupConversationCreate = server.GroupConversationCreate(
        (b) => b
          ..name = request.title
          ..avatar = request.avatar
          ..memberIds = collection.ListBuilder<int>(
            request.memberIds.map((id) => int.tryParse(id) ?? 0).toList(),
          ),
      );

      final resp = await _chatApi!
          .createGroupConversationApiChatGroupCreatePost(
            groupConversationCreate: groupConversationCreate,
          );
      final code = resp.data?.code ?? resp.statusCode ?? 500;

      if (code != 200) {
        throw ChatException(
          resp.data?.msg ?? '创建群聊失败($code)',
          type: ChatErrorType.server,
          statusCode: code,
        );
      }

      final data = resp.data?.data;
      if (data == null) {
        throw const ChatException('创建群聊成功但未返回数据', type: ChatErrorType.server);
      }

      return _parseConversation(data);
    } on DioException catch (e) {
      debugPrint('ChatService.createGroupConversation 网络错误: ${e.message}');
      throw ChatException(
        '网络错误: ${e.message}',
        type: ChatErrorType.network,
        statusCode: e.response?.statusCode,
        originalError: e,
      );
    } catch (e) {
      debugPrint('ChatService.createGroupConversation 失败: $e');
      throw ChatException(
        '创建群聊失败: $e',
        type: ChatErrorType.unknown,
        originalError: e,
      );
    }
  }

  // ==================== 消息管理 ====================

  /// 获取会话中的所有消息
  Future<List<ChatMessage>> getConversationMessages(
    String sessionId, {
    int skip = 0,
    int limit = 50,
  }) async {
    _initializeApiClient();
    if (!_hasToken) {
      throw const ChatException(
        '未登录，无法获取消息',
        type: ChatErrorType.authentication,
      );
    }
    _updateAuthToken();

    try {
      final resp = await _chatApi!
          .getConversationMessagesApiChatConversationMessagesSessionIdGet(
            sessionId: sessionId,
          );
      final code = resp.data?.code ?? resp.statusCode ?? 500;

      if (code != 200) {
        throw ChatException(
          resp.data?.msg ?? '获取消息失败($code)',
          type: ChatErrorType.server,
          statusCode: code,
        );
      }

      final data = resp.data?.data;
      if (data == null) return [];

      return _parseMessageList(data);
    } on DioException catch (e) {
      debugPrint('ChatService.getConversationMessages 网络错误: ${e.message}');
      throw ChatException(
        '网络错误: ${e.message}',
        type: ChatErrorType.network,
        statusCode: e.response?.statusCode,
        originalError: e,
      );
    } catch (e) {
      debugPrint('ChatService.getConversationMessages 失败: $e');
      throw ChatException(
        '获取消息失败: $e',
        type: ChatErrorType.unknown,
        originalError: e,
      );
    }
  }

  /// 发送消息到会话
  Future<ChatMessage> sendMessage(SendMessageRequest request) async {
    _initializeApiClient();
    if (!_hasToken) {
      throw const ChatException(
        '未登录，无法发送消息',
        type: ChatErrorType.authentication,
      );
    }
    _updateAuthToken();

    try {
      final addMessageToConversation = server.AddMessageToConversation(
        (b) => b
          ..sessionId = request.conversationId
          ..content = request.content
          ..messageType = _convertMessageType(request.type)
          ..mediaId = request.attachments?.isNotEmpty == true
              ? int.tryParse(request.attachments!.first)
              : null,
      );

      final resp = await _chatApi!
          .addConversationMessageApiChatConversationMessageAddPost(
            addMessageToConversation: addMessageToConversation,
          );
      final code = resp.data?.code ?? resp.statusCode ?? 500;

      if (code != 200) {
        throw ChatException(
          resp.data?.msg ?? '发送消息失败($code)',
          type: ChatErrorType.server,
          statusCode: code,
        );
      }

      final data = resp.data?.data;
      if (data == null) {
        throw const ChatException('发送消息成功但未返回数据', type: ChatErrorType.server);
      }

      return _parseMessage(data);
    } on DioException catch (e) {
      debugPrint('ChatService.sendMessage 网络错误: ${e.message}');
      throw ChatException(
        '网络错误: ${e.message}',
        type: ChatErrorType.network,
        statusCode: e.response?.statusCode,
        originalError: e,
      );
    } catch (e) {
      debugPrint('ChatService.sendMessage 失败: $e');
      throw ChatException(
        '发送消息失败: $e',
        type: ChatErrorType.unknown,
        originalError: e,
      );
    }
  }

  /// 发送群消息
  Future<ChatMessage> sendGroupMessage(SendMessageRequest request) async {
    _initializeApiClient();
    if (!_hasToken) {
      throw const ChatException(
        '未登录，无法发送群消息',
        type: ChatErrorType.authentication,
      );
    }
    _updateAuthToken();

    try {
      final groupMessageCreate = server.GroupMessageCreate(
        (b) => b
          ..groupId = int.tryParse(request.conversationId) ?? 0
          ..content = request.content
          ..messageType = _convertMessageType(request.type)
          ..mediaId = request.attachments?.isNotEmpty == true
              ? int.tryParse(request.attachments!.first)
              : null,
      );

      final resp = await _chatApi!.sendGroupMessageApiChatGroupSendPost(
        groupMessageCreate: groupMessageCreate,
      );
      final code = resp.data?.code ?? resp.statusCode ?? 500;

      if (code != 200) {
        throw ChatException(
          resp.data?.msg ?? '发送群消息失败($code)',
          type: ChatErrorType.server,
          statusCode: code,
        );
      }

      final data = resp.data?.data;
      if (data == null) {
        throw const ChatException('发送群消息成功但未返回数据', type: ChatErrorType.server);
      }

      return _parseMessage(data);
    } on DioException catch (e) {
      debugPrint('ChatService.sendGroupMessage 网络错误: ${e.message}');
      throw ChatException(
        '网络错误: ${e.message}',
        type: ChatErrorType.network,
        statusCode: e.response?.statusCode,
        originalError: e,
      );
    } catch (e) {
      debugPrint('ChatService.sendGroupMessage 失败: $e');
      throw ChatException(
        '发送群消息失败: $e',
        type: ChatErrorType.unknown,
        originalError: e,
      );
    }
  }

  // ==================== 群聊管理 ====================

  /// 获取群成员列表
  Future<List<GroupMember>> getGroupMembers(int groupId) async {
    _initializeApiClient();
    if (!_hasToken) {
      throw const ChatException(
        '未登录，无法获取群成员',
        type: ChatErrorType.authentication,
      );
    }
    _updateAuthToken();

    try {
      final resp = await _chatApi!.getGroupMembersApiChatGroupMembersGroupIdGet(
        groupId: groupId,
      );
      final code = resp.data?.code ?? resp.statusCode ?? 500;

      if (code != 200) {
        throw ChatException(
          resp.data?.msg ?? '获取群成员失败($code)',
          type: ChatErrorType.server,
          statusCode: code,
        );
      }

      final data = resp.data?.data;
      if (data == null) return [];

      return _parseGroupMemberList(data);
    } on DioException catch (e) {
      debugPrint('ChatService.getGroupMembers 网络错误: ${e.message}');
      throw ChatException(
        '网络错误: ${e.message}',
        type: ChatErrorType.network,
        statusCode: e.response?.statusCode,
        originalError: e,
      );
    } catch (e) {
      debugPrint('ChatService.getGroupMembers 失败: $e');
      throw ChatException(
        '获取群成员失败: $e',
        type: ChatErrorType.unknown,
        originalError: e,
      );
    }
  }

  /// 获取群消息记录
  Future<List<ChatMessage>> getGroupMessages(
    int groupId, {
    int skip = 0,
    int limit = 50,
  }) async {
    _initializeApiClient();
    if (!_hasToken) {
      throw const ChatException(
        '未登录，无法获取群消息',
        type: ChatErrorType.authentication,
      );
    }
    _updateAuthToken();

    try {
      final resp = await _chatApi!
          .getGroupMessagesApiChatGroupMessagesGroupIdGet(
            groupId: groupId,
            skip: skip,
            limit: limit,
          );
      final code = resp.data?.code ?? resp.statusCode ?? 500;

      if (code != 200) {
        throw ChatException(
          resp.data?.msg ?? '获取群消息失败($code)',
          type: ChatErrorType.server,
          statusCode: code,
        );
      }

      final data = resp.data?.data;
      if (data == null) return [];

      return _parseMessageList(data);
    } on DioException catch (e) {
      debugPrint('ChatService.getGroupMessages 网络错误: ${e.message}');
      throw ChatException(
        '网络错误: ${e.message}',
        type: ChatErrorType.network,
        statusCode: e.response?.statusCode,
        originalError: e,
      );
    } catch (e) {
      debugPrint('ChatService.getGroupMessages 失败: $e');
      throw ChatException(
        '获取群消息失败: $e',
        type: ChatErrorType.unknown,
        originalError: e,
      );
    }
  }

  // ==================== 数据解析方法 ====================

  /// 解析会话列表
  List<ChatConversation> _parseConversationList(dynamic data) {
    try {
      // 优先认为 data 直接是数组
      if (data is List) {
        return data.map((item) => _parseConversation(item)).toList();
      }
      // 兼容 data.conversations 结构
      final List<dynamic> conversations = _get(data, ['conversations'], []);
      if (conversations.isNotEmpty) {
        return conversations.map((item) => _parseConversation(item)).toList();
      }
      return [];
    } catch (e) {
      debugPrint('解析会话列表失败: $e');
      return [];
    }
  }

  /// 解析单个会话
  ChatConversation _parseConversation(dynamic data) {
    return ChatConversation(
      sessionId: _get(data, ['session_id'], ''),
      title: _get(data, ['title'], ''),
      avatar: _get(data, ['avatar'], null),
      type: _get(data, ['type'], 0) == 0
          ? ConversationType.single
          : ConversationType.group,
      lastMessage: _get(data, ['last_message'], null),
      lastMessageTime: _parseDateTime(_get(data, ['last_message_time'], null)),
      unreadCount: _safeInt(_get(data, ['unread_count'], 0)),
      participants: _get(data, ['participants'], []).cast<String>(),
      metadata: _get(data, ['metadata'], null),
    );
  }

  /// 解析消息列表
  List<ChatMessage> _parseMessageList(dynamic data) {
    try {
      // 优先认为 data 直接是数组
      if (data is List) {
        return data.map((item) => _parseMessage(item)).toList();
      }
      // 兼容 data.messages 结构
      final List<dynamic> messages = _get(data, ['messages'], []);
      if (messages.isNotEmpty) {
        return messages.map((item) => _parseMessage(item)).toList();
      }
      return [];
    } catch (e) {
      debugPrint('解析消息列表失败: $e');
      return [];
    }
  }

  /// 解析单个消息
  ChatMessage _parseMessage(dynamic data) {
    return ChatMessage(
      id: _get(data, ['id'], ''),
      conversationId: _get(data, ['conversation_id'], ''),
      senderId: _get(data, ['sender_id'], ''),
      senderName: _get(data, ['sender_name'], ''),
      senderAvatar: _get(data, ['sender_avatar'], null),
      content: _get(data, ['content'], ''),
      type: _parseMessageType(_get(data, ['type'], 0)),
      status: _parseMessageStatus(_get(data, ['status'], 0)),
      createdAt:
          _parseDateTime(_get(data, ['created_at'], null)) ?? DateTime.now(),
      updatedAt: _parseDateTime(_get(data, ['updated_at'], null)),
      metadata: _get(data, ['metadata'], null),
      replyToMessageId: _get(data, ['reply_to_message_id'], null),
      attachments: _get(data, ['attachments'], null)?.cast<String>(),
    );
  }

  /// 解析群成员列表
  List<GroupMember> _parseGroupMemberList(dynamic data) {
    try {
      // 优先认为 data 直接是数组
      if (data is List) {
        return data.map((item) => _parseGroupMember(item)).toList();
      }
      // 兼容 data.members 结构
      final List<dynamic> members = _get(data, ['members'], []);
      if (members.isNotEmpty) {
        return members.map((item) => _parseGroupMember(item)).toList();
      }
      return [];
    } catch (e) {
      debugPrint('解析群成员列表失败: $e');
      return [];
    }
  }

  /// 解析单个群成员
  GroupMember _parseGroupMember(dynamic data) {
    return GroupMember(
      userId: _get(data, ['user_id'], ''),
      username: _get(data, ['username'], ''),
      avatar: _get(data, ['avatar'], null),
      role: _get(data, ['role'], 'member'),
      joinedAt:
          _parseDateTime(_get(data, ['joined_at'], null)) ?? DateTime.now(),
      isOnline: _safeBool(_get(data, ['is_online'], false)),
    );
  }

  /// 转换消息类型
  int _convertMessageType(ChatMessageType type) {
    switch (type) {
      case ChatMessageType.text:
        return 0;
      case ChatMessageType.image:
        return 1;
      case ChatMessageType.file:
        return 2;
      case ChatMessageType.system:
        return 3;
    }
  }

  /// 解析消息类型
  ChatMessageType _parseMessageType(int type) {
    switch (type) {
      case 0:
        return ChatMessageType.text;
      case 1:
        return ChatMessageType.image;
      case 2:
        return ChatMessageType.file;
      case 3:
        return ChatMessageType.system;
      default:
        return ChatMessageType.text;
    }
  }

  /// 解析消息状态
  MessageStatus _parseMessageStatus(int status) {
    switch (status) {
      case 0:
        return MessageStatus.sending;
      case 1:
        return MessageStatus.sent;
      case 2:
        return MessageStatus.delivered;
      case 3:
        return MessageStatus.read;
      case 4:
        return MessageStatus.failed;
      default:
        return MessageStatus.sent;
    }
  }

  /// 解析日期时间
  DateTime? _parseDateTime(dynamic value) {
    if (value == null) return null;
    if (value is String) {
      return DateTime.tryParse(value);
    }
    return null;
  }

  /// 安全获取数据
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

  /// 安全转换整数
  int _safeInt(dynamic v) {
    if (v is int) return v;
    if (v is double) return v.toInt();
    if (v is String) return int.tryParse(v) ?? 0;
    return 0;
  }

  /// 安全转换布尔值
  bool _safeBool(dynamic v) {
    if (v is bool) return v;
    if (v is num) return v != 0;
    if (v is String) return v.toLowerCase() == 'true' || v == '1';
    return false;
  }
}
