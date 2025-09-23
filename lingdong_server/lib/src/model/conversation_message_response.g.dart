// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'conversation_message_response.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$ConversationMessageResponse extends ConversationMessageResponse {
  @override
  final int id;
  @override
  final int conversationId;
  @override
  final int senderId;
  @override
  final int receiverId;
  @override
  final String content;
  @override
  final int messageType;
  @override
  final int status;
  @override
  final DateTime createdAt;
  @override
  final String? mediaUrl;
  @override
  final bool? isRead;

  factory _$ConversationMessageResponse(
          [void Function(ConversationMessageResponseBuilder)? updates]) =>
      (ConversationMessageResponseBuilder()..update(updates))._build();

  _$ConversationMessageResponse._(
      {required this.id,
      required this.conversationId,
      required this.senderId,
      required this.receiverId,
      required this.content,
      required this.messageType,
      required this.status,
      required this.createdAt,
      this.mediaUrl,
      this.isRead})
      : super._();
  @override
  ConversationMessageResponse rebuild(
          void Function(ConversationMessageResponseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ConversationMessageResponseBuilder toBuilder() =>
      ConversationMessageResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ConversationMessageResponse &&
        id == other.id &&
        conversationId == other.conversationId &&
        senderId == other.senderId &&
        receiverId == other.receiverId &&
        content == other.content &&
        messageType == other.messageType &&
        status == other.status &&
        createdAt == other.createdAt &&
        mediaUrl == other.mediaUrl &&
        isRead == other.isRead;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, conversationId.hashCode);
    _$hash = $jc(_$hash, senderId.hashCode);
    _$hash = $jc(_$hash, receiverId.hashCode);
    _$hash = $jc(_$hash, content.hashCode);
    _$hash = $jc(_$hash, messageType.hashCode);
    _$hash = $jc(_$hash, status.hashCode);
    _$hash = $jc(_$hash, createdAt.hashCode);
    _$hash = $jc(_$hash, mediaUrl.hashCode);
    _$hash = $jc(_$hash, isRead.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ConversationMessageResponse')
          ..add('id', id)
          ..add('conversationId', conversationId)
          ..add('senderId', senderId)
          ..add('receiverId', receiverId)
          ..add('content', content)
          ..add('messageType', messageType)
          ..add('status', status)
          ..add('createdAt', createdAt)
          ..add('mediaUrl', mediaUrl)
          ..add('isRead', isRead))
        .toString();
  }
}

class ConversationMessageResponseBuilder
    implements
        Builder<ConversationMessageResponse,
            ConversationMessageResponseBuilder> {
  _$ConversationMessageResponse? _$v;

  int? _id;
  int? get id => _$this._id;
  set id(int? id) => _$this._id = id;

  int? _conversationId;
  int? get conversationId => _$this._conversationId;
  set conversationId(int? conversationId) =>
      _$this._conversationId = conversationId;

  int? _senderId;
  int? get senderId => _$this._senderId;
  set senderId(int? senderId) => _$this._senderId = senderId;

  int? _receiverId;
  int? get receiverId => _$this._receiverId;
  set receiverId(int? receiverId) => _$this._receiverId = receiverId;

  String? _content;
  String? get content => _$this._content;
  set content(String? content) => _$this._content = content;

  int? _messageType;
  int? get messageType => _$this._messageType;
  set messageType(int? messageType) => _$this._messageType = messageType;

  int? _status;
  int? get status => _$this._status;
  set status(int? status) => _$this._status = status;

  DateTime? _createdAt;
  DateTime? get createdAt => _$this._createdAt;
  set createdAt(DateTime? createdAt) => _$this._createdAt = createdAt;

  String? _mediaUrl;
  String? get mediaUrl => _$this._mediaUrl;
  set mediaUrl(String? mediaUrl) => _$this._mediaUrl = mediaUrl;

  bool? _isRead;
  bool? get isRead => _$this._isRead;
  set isRead(bool? isRead) => _$this._isRead = isRead;

  ConversationMessageResponseBuilder() {
    ConversationMessageResponse._defaults(this);
  }

  ConversationMessageResponseBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _conversationId = $v.conversationId;
      _senderId = $v.senderId;
      _receiverId = $v.receiverId;
      _content = $v.content;
      _messageType = $v.messageType;
      _status = $v.status;
      _createdAt = $v.createdAt;
      _mediaUrl = $v.mediaUrl;
      _isRead = $v.isRead;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ConversationMessageResponse other) {
    _$v = other as _$ConversationMessageResponse;
  }

  @override
  void update(void Function(ConversationMessageResponseBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ConversationMessageResponse build() => _build();

  _$ConversationMessageResponse _build() {
    final _$result = _$v ??
        _$ConversationMessageResponse._(
          id: BuiltValueNullFieldError.checkNotNull(
              id, r'ConversationMessageResponse', 'id'),
          conversationId: BuiltValueNullFieldError.checkNotNull(
              conversationId, r'ConversationMessageResponse', 'conversationId'),
          senderId: BuiltValueNullFieldError.checkNotNull(
              senderId, r'ConversationMessageResponse', 'senderId'),
          receiverId: BuiltValueNullFieldError.checkNotNull(
              receiverId, r'ConversationMessageResponse', 'receiverId'),
          content: BuiltValueNullFieldError.checkNotNull(
              content, r'ConversationMessageResponse', 'content'),
          messageType: BuiltValueNullFieldError.checkNotNull(
              messageType, r'ConversationMessageResponse', 'messageType'),
          status: BuiltValueNullFieldError.checkNotNull(
              status, r'ConversationMessageResponse', 'status'),
          createdAt: BuiltValueNullFieldError.checkNotNull(
              createdAt, r'ConversationMessageResponse', 'createdAt'),
          mediaUrl: mediaUrl,
          isRead: isRead,
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
