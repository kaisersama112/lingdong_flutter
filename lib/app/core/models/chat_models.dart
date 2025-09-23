/// 聊天会话类型
enum ConversationType {
  single, // 单聊
  group, // 群聊
}

/// 消息类型
enum ChatMessageType {
  text, // 文本消息
  image, // 图片消息
  file, // 文件消息
  system, // 系统消息
}

/// 消息状态
enum MessageStatus {
  sending, // 发送中
  sent, // 已发送
  delivered, // 已送达
  read, // 已读
  failed, // 发送失败
}

/// 聊天会话模型
class ChatConversation {
  final String sessionId;
  final String title;
  final String? avatar;
  final ConversationType type;
  final String? lastMessage;
  final DateTime? lastMessageTime;
  final int unreadCount;
  final List<String> participants; // 参与者ID列表
  final Map<String, dynamic>? metadata;

  const ChatConversation({
    required this.sessionId,
    required this.title,
    this.avatar,
    required this.type,
    this.lastMessage,
    this.lastMessageTime,
    this.unreadCount = 0,
    this.participants = const [],
    this.metadata,
  });

  ChatConversation copyWith({
    String? sessionId,
    String? title,
    String? avatar,
    ConversationType? type,
    String? lastMessage,
    DateTime? lastMessageTime,
    int? unreadCount,
    List<String>? participants,
    Map<String, dynamic>? metadata,
  }) {
    return ChatConversation(
      sessionId: sessionId ?? this.sessionId,
      title: title ?? this.title,
      avatar: avatar ?? this.avatar,
      type: type ?? this.type,
      lastMessage: lastMessage ?? this.lastMessage,
      lastMessageTime: lastMessageTime ?? this.lastMessageTime,
      unreadCount: unreadCount ?? this.unreadCount,
      participants: participants ?? this.participants,
      metadata: metadata ?? this.metadata,
    );
  }
}

/// 聊天消息模型
class ChatMessage {
  final String id;
  final String conversationId;
  final String senderId;
  final String senderName;
  final String? senderAvatar;
  final String content;
  final ChatMessageType type;
  final MessageStatus status;
  final DateTime createdAt;
  final DateTime? updatedAt;
  final Map<String, dynamic>? metadata;
  final String? replyToMessageId; // 回复的消息ID
  final List<String>? attachments; // 附件URL列表

  const ChatMessage({
    required this.id,
    required this.conversationId,
    required this.senderId,
    required this.senderName,
    this.senderAvatar,
    required this.content,
    required this.type,
    required this.status,
    required this.createdAt,
    this.updatedAt,
    this.metadata,
    this.replyToMessageId,
    this.attachments,
  });

  ChatMessage copyWith({
    String? id,
    String? conversationId,
    String? senderId,
    String? senderName,
    String? senderAvatar,
    String? content,
    ChatMessageType? type,
    MessageStatus? status,
    DateTime? createdAt,
    DateTime? updatedAt,
    Map<String, dynamic>? metadata,
    String? replyToMessageId,
    List<String>? attachments,
  }) {
    return ChatMessage(
      id: id ?? this.id,
      conversationId: conversationId ?? this.conversationId,
      senderId: senderId ?? this.senderId,
      senderName: senderName ?? this.senderName,
      senderAvatar: senderAvatar ?? this.senderAvatar,
      content: content ?? this.content,
      type: type ?? this.type,
      status: status ?? this.status,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      metadata: metadata ?? this.metadata,
      replyToMessageId: replyToMessageId ?? this.replyToMessageId,
      attachments: attachments ?? this.attachments,
    );
  }
}

/// 群聊成员模型
class GroupMember {
  final String userId;
  final String username;
  final String? avatar;
  final String role; // admin, member
  final DateTime joinedAt;
  final bool isOnline;

  const GroupMember({
    required this.userId,
    required this.username,
    this.avatar,
    required this.role,
    required this.joinedAt,
    this.isOnline = false,
  });
}

/// 创建会话请求模型
class CreateConversationRequest {
  final String title;
  final ConversationType type;
  final List<String> participantIds;
  final String? avatar;
  final Map<String, dynamic>? metadata;

  const CreateConversationRequest({
    required this.title,
    required this.type,
    required this.participantIds,
    this.avatar,
    this.metadata,
  });
}

/// 发送消息请求模型
class SendMessageRequest {
  final String conversationId;
  final String content;
  final ChatMessageType type;
  final String? replyToMessageId;
  final List<String>? attachments;
  final Map<String, dynamic>? metadata;

  const SendMessageRequest({
    required this.conversationId,
    required this.content,
    required this.type,
    this.replyToMessageId,
    this.attachments,
    this.metadata,
  });
}

/// 创建群聊请求模型
class CreateGroupRequest {
  final String title;
  final String? avatar;
  final List<String> memberIds;
  final Map<String, dynamic>? metadata;

  const CreateGroupRequest({
    required this.title,
    this.avatar,
    required this.memberIds,
    this.metadata,
  });
}

/// 聊天统计信息
class ChatStats {
  final int totalConversations;
  final int unreadMessages;
  final int onlineFriends;
  final DateTime lastActiveTime;

  const ChatStats({
    required this.totalConversations,
    required this.unreadMessages,
    required this.onlineFriends,
    required this.lastActiveTime,
  });
}

/// 消息搜索过滤器
class MessageSearchFilter {
  final String? keyword;
  final String? conversationId;
  final ChatMessageType? messageType;
  final DateTime? startDate;
  final DateTime? endDate;
  final String? senderId;

  const MessageSearchFilter({
    this.keyword,
    this.conversationId,
    this.messageType,
    this.startDate,
    this.endDate,
    this.senderId,
  });
}

/// 分页参数
class PaginationParams {
  final int skip;
  final int limit;
  final String? sortBy;
  final bool ascending;

  const PaginationParams({
    required this.skip,
    required this.limit,
    this.sortBy,
    this.ascending = true,
  });
}

/// 聊天错误类型
enum ChatErrorType {
  network,
  authentication,
  permission,
  notFound,
  validation,
  server,
  unknown,
}

/// 聊天异常
class ChatException implements Exception {
  final String message;
  final ChatErrorType type;
  final int? statusCode;
  final dynamic originalError;

  const ChatException(
    this.message, {
    this.type = ChatErrorType.unknown,
    this.statusCode,
    this.originalError,
  });

  @override
  String toString() => 'ChatException: $message';
}
