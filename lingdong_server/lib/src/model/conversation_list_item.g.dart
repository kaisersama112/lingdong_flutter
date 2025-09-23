// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'conversation_list_item.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$ConversationListItem extends ConversationListItem {
  @override
  final int id;
  @override
  final String sessionId;
  @override
  final int? targetUserId;
  @override
  final String? targetUsername;
  @override
  final String? targetAvatar;
  @override
  final int? groupId;
  @override
  final String? groupName;
  @override
  final String? groupAvatar;
  @override
  final String lastMessage;
  @override
  final DateTime lastMessageTime;
  @override
  final int? unreadCount;

  factory _$ConversationListItem(
          [void Function(ConversationListItemBuilder)? updates]) =>
      (ConversationListItemBuilder()..update(updates))._build();

  _$ConversationListItem._(
      {required this.id,
      required this.sessionId,
      this.targetUserId,
      this.targetUsername,
      this.targetAvatar,
      this.groupId,
      this.groupName,
      this.groupAvatar,
      required this.lastMessage,
      required this.lastMessageTime,
      this.unreadCount})
      : super._();
  @override
  ConversationListItem rebuild(
          void Function(ConversationListItemBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ConversationListItemBuilder toBuilder() =>
      ConversationListItemBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ConversationListItem &&
        id == other.id &&
        sessionId == other.sessionId &&
        targetUserId == other.targetUserId &&
        targetUsername == other.targetUsername &&
        targetAvatar == other.targetAvatar &&
        groupId == other.groupId &&
        groupName == other.groupName &&
        groupAvatar == other.groupAvatar &&
        lastMessage == other.lastMessage &&
        lastMessageTime == other.lastMessageTime &&
        unreadCount == other.unreadCount;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, sessionId.hashCode);
    _$hash = $jc(_$hash, targetUserId.hashCode);
    _$hash = $jc(_$hash, targetUsername.hashCode);
    _$hash = $jc(_$hash, targetAvatar.hashCode);
    _$hash = $jc(_$hash, groupId.hashCode);
    _$hash = $jc(_$hash, groupName.hashCode);
    _$hash = $jc(_$hash, groupAvatar.hashCode);
    _$hash = $jc(_$hash, lastMessage.hashCode);
    _$hash = $jc(_$hash, lastMessageTime.hashCode);
    _$hash = $jc(_$hash, unreadCount.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ConversationListItem')
          ..add('id', id)
          ..add('sessionId', sessionId)
          ..add('targetUserId', targetUserId)
          ..add('targetUsername', targetUsername)
          ..add('targetAvatar', targetAvatar)
          ..add('groupId', groupId)
          ..add('groupName', groupName)
          ..add('groupAvatar', groupAvatar)
          ..add('lastMessage', lastMessage)
          ..add('lastMessageTime', lastMessageTime)
          ..add('unreadCount', unreadCount))
        .toString();
  }
}

class ConversationListItemBuilder
    implements Builder<ConversationListItem, ConversationListItemBuilder> {
  _$ConversationListItem? _$v;

  int? _id;
  int? get id => _$this._id;
  set id(int? id) => _$this._id = id;

  String? _sessionId;
  String? get sessionId => _$this._sessionId;
  set sessionId(String? sessionId) => _$this._sessionId = sessionId;

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

  int? _groupId;
  int? get groupId => _$this._groupId;
  set groupId(int? groupId) => _$this._groupId = groupId;

  String? _groupName;
  String? get groupName => _$this._groupName;
  set groupName(String? groupName) => _$this._groupName = groupName;

  String? _groupAvatar;
  String? get groupAvatar => _$this._groupAvatar;
  set groupAvatar(String? groupAvatar) => _$this._groupAvatar = groupAvatar;

  String? _lastMessage;
  String? get lastMessage => _$this._lastMessage;
  set lastMessage(String? lastMessage) => _$this._lastMessage = lastMessage;

  DateTime? _lastMessageTime;
  DateTime? get lastMessageTime => _$this._lastMessageTime;
  set lastMessageTime(DateTime? lastMessageTime) =>
      _$this._lastMessageTime = lastMessageTime;

  int? _unreadCount;
  int? get unreadCount => _$this._unreadCount;
  set unreadCount(int? unreadCount) => _$this._unreadCount = unreadCount;

  ConversationListItemBuilder() {
    ConversationListItem._defaults(this);
  }

  ConversationListItemBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _sessionId = $v.sessionId;
      _targetUserId = $v.targetUserId;
      _targetUsername = $v.targetUsername;
      _targetAvatar = $v.targetAvatar;
      _groupId = $v.groupId;
      _groupName = $v.groupName;
      _groupAvatar = $v.groupAvatar;
      _lastMessage = $v.lastMessage;
      _lastMessageTime = $v.lastMessageTime;
      _unreadCount = $v.unreadCount;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ConversationListItem other) {
    _$v = other as _$ConversationListItem;
  }

  @override
  void update(void Function(ConversationListItemBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ConversationListItem build() => _build();

  _$ConversationListItem _build() {
    final _$result = _$v ??
        _$ConversationListItem._(
          id: BuiltValueNullFieldError.checkNotNull(
              id, r'ConversationListItem', 'id'),
          sessionId: BuiltValueNullFieldError.checkNotNull(
              sessionId, r'ConversationListItem', 'sessionId'),
          targetUserId: targetUserId,
          targetUsername: targetUsername,
          targetAvatar: targetAvatar,
          groupId: groupId,
          groupName: groupName,
          groupAvatar: groupAvatar,
          lastMessage: BuiltValueNullFieldError.checkNotNull(
              lastMessage, r'ConversationListItem', 'lastMessage'),
          lastMessageTime: BuiltValueNullFieldError.checkNotNull(
              lastMessageTime, r'ConversationListItem', 'lastMessageTime'),
          unreadCount: unreadCount,
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
