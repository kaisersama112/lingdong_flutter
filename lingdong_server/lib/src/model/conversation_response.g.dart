// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'conversation_response.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$ConversationResponse extends ConversationResponse {
  @override
  final int id;
  @override
  final String sessionId;
  @override
  final int userId;
  @override
  final int targetUserId;
  @override
  final String targetUsername;
  @override
  final String? targetAvatar;
  @override
  final DateTime createdAt;
  @override
  final DateTime updatedAt;
  @override
  final ConversationMessageResponse? lastMessage;
  @override
  final int? unreadCount;

  factory _$ConversationResponse(
          [void Function(ConversationResponseBuilder)? updates]) =>
      (ConversationResponseBuilder()..update(updates))._build();

  _$ConversationResponse._(
      {required this.id,
      required this.sessionId,
      required this.userId,
      required this.targetUserId,
      required this.targetUsername,
      this.targetAvatar,
      required this.createdAt,
      required this.updatedAt,
      this.lastMessage,
      this.unreadCount})
      : super._();
  @override
  ConversationResponse rebuild(
          void Function(ConversationResponseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ConversationResponseBuilder toBuilder() =>
      ConversationResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ConversationResponse &&
        id == other.id &&
        sessionId == other.sessionId &&
        userId == other.userId &&
        targetUserId == other.targetUserId &&
        targetUsername == other.targetUsername &&
        targetAvatar == other.targetAvatar &&
        createdAt == other.createdAt &&
        updatedAt == other.updatedAt &&
        lastMessage == other.lastMessage &&
        unreadCount == other.unreadCount;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, sessionId.hashCode);
    _$hash = $jc(_$hash, userId.hashCode);
    _$hash = $jc(_$hash, targetUserId.hashCode);
    _$hash = $jc(_$hash, targetUsername.hashCode);
    _$hash = $jc(_$hash, targetAvatar.hashCode);
    _$hash = $jc(_$hash, createdAt.hashCode);
    _$hash = $jc(_$hash, updatedAt.hashCode);
    _$hash = $jc(_$hash, lastMessage.hashCode);
    _$hash = $jc(_$hash, unreadCount.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ConversationResponse')
          ..add('id', id)
          ..add('sessionId', sessionId)
          ..add('userId', userId)
          ..add('targetUserId', targetUserId)
          ..add('targetUsername', targetUsername)
          ..add('targetAvatar', targetAvatar)
          ..add('createdAt', createdAt)
          ..add('updatedAt', updatedAt)
          ..add('lastMessage', lastMessage)
          ..add('unreadCount', unreadCount))
        .toString();
  }
}

class ConversationResponseBuilder
    implements Builder<ConversationResponse, ConversationResponseBuilder> {
  _$ConversationResponse? _$v;

  int? _id;
  int? get id => _$this._id;
  set id(int? id) => _$this._id = id;

  String? _sessionId;
  String? get sessionId => _$this._sessionId;
  set sessionId(String? sessionId) => _$this._sessionId = sessionId;

  int? _userId;
  int? get userId => _$this._userId;
  set userId(int? userId) => _$this._userId = userId;

  int? _targetUserId;
  int? get targetUserId => _$this._targetUserId;
  set targetUserId(int? targetUserId) => _$this._targetUserId = targetUserId;

  String? _targetUsername;
  String? get targetUsername => _$this._targetUsername;
  set targetUsername(String? targetUsername) =>
      _$this._targetUsername = targetUsername;

  String? _targetAvatar;
  String? get targetAvatar => _$this._targetAvatar;
  set targetAvatar(String? targetAvatar) => _$this._targetAvatar = targetAvatar;

  DateTime? _createdAt;
  DateTime? get createdAt => _$this._createdAt;
  set createdAt(DateTime? createdAt) => _$this._createdAt = createdAt;

  DateTime? _updatedAt;
  DateTime? get updatedAt => _$this._updatedAt;
  set updatedAt(DateTime? updatedAt) => _$this._updatedAt = updatedAt;

  ConversationMessageResponseBuilder? _lastMessage;
  ConversationMessageResponseBuilder get lastMessage =>
      _$this._lastMessage ??= ConversationMessageResponseBuilder();
  set lastMessage(ConversationMessageResponseBuilder? lastMessage) =>
      _$this._lastMessage = lastMessage;

  int? _unreadCount;
  int? get unreadCount => _$this._unreadCount;
  set unreadCount(int? unreadCount) => _$this._unreadCount = unreadCount;

  ConversationResponseBuilder() {
    ConversationResponse._defaults(this);
  }

  ConversationResponseBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _sessionId = $v.sessionId;
      _userId = $v.userId;
      _targetUserId = $v.targetUserId;
      _targetUsername = $v.targetUsername;
      _targetAvatar = $v.targetAvatar;
      _createdAt = $v.createdAt;
      _updatedAt = $v.updatedAt;
      _lastMessage = $v.lastMessage?.toBuilder();
      _unreadCount = $v.unreadCount;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ConversationResponse other) {
    _$v = other as _$ConversationResponse;
  }

  @override
  void update(void Function(ConversationResponseBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ConversationResponse build() => _build();

  _$ConversationResponse _build() {
    _$ConversationResponse _$result;
    try {
      _$result = _$v ??
          _$ConversationResponse._(
            id: BuiltValueNullFieldError.checkNotNull(
                id, r'ConversationResponse', 'id'),
            sessionId: BuiltValueNullFieldError.checkNotNull(
                sessionId, r'ConversationResponse', 'sessionId'),
            userId: BuiltValueNullFieldError.checkNotNull(
                userId, r'ConversationResponse', 'userId'),
            targetUserId: BuiltValueNullFieldError.checkNotNull(
                targetUserId, r'ConversationResponse', 'targetUserId'),
            targetUsername: BuiltValueNullFieldError.checkNotNull(
                targetUsername, r'ConversationResponse', 'targetUsername'),
            targetAvatar: targetAvatar,
            createdAt: BuiltValueNullFieldError.checkNotNull(
                createdAt, r'ConversationResponse', 'createdAt'),
            updatedAt: BuiltValueNullFieldError.checkNotNull(
                updatedAt, r'ConversationResponse', 'updatedAt'),
            lastMessage: _lastMessage?.build(),
            unreadCount: unreadCount,
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'lastMessage';
        _lastMessage?.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'ConversationResponse', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
