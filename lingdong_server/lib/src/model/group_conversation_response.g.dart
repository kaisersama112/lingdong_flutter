// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'group_conversation_response.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$GroupConversationResponse extends GroupConversationResponse {
  @override
  final int id;
  @override
  final String name;
  @override
  final String? avatar;
  @override
  final int creatorId;
  @override
  final DateTime createdAt;
  @override
  final int memberCount;
  @override
  final GroupMessageResponse? lastMessage;
  @override
  final int? unreadCount;

  factory _$GroupConversationResponse(
          [void Function(GroupConversationResponseBuilder)? updates]) =>
      (GroupConversationResponseBuilder()..update(updates))._build();

  _$GroupConversationResponse._(
      {required this.id,
      required this.name,
      this.avatar,
      required this.creatorId,
      required this.createdAt,
      required this.memberCount,
      this.lastMessage,
      this.unreadCount})
      : super._();
  @override
  GroupConversationResponse rebuild(
          void Function(GroupConversationResponseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GroupConversationResponseBuilder toBuilder() =>
      GroupConversationResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GroupConversationResponse &&
        id == other.id &&
        name == other.name &&
        avatar == other.avatar &&
        creatorId == other.creatorId &&
        createdAt == other.createdAt &&
        memberCount == other.memberCount &&
        lastMessage == other.lastMessage &&
        unreadCount == other.unreadCount;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, avatar.hashCode);
    _$hash = $jc(_$hash, creatorId.hashCode);
    _$hash = $jc(_$hash, createdAt.hashCode);
    _$hash = $jc(_$hash, memberCount.hashCode);
    _$hash = $jc(_$hash, lastMessage.hashCode);
    _$hash = $jc(_$hash, unreadCount.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GroupConversationResponse')
          ..add('id', id)
          ..add('name', name)
          ..add('avatar', avatar)
          ..add('creatorId', creatorId)
          ..add('createdAt', createdAt)
          ..add('memberCount', memberCount)
          ..add('lastMessage', lastMessage)
          ..add('unreadCount', unreadCount))
        .toString();
  }
}

class GroupConversationResponseBuilder
    implements
        Builder<GroupConversationResponse, GroupConversationResponseBuilder> {
  _$GroupConversationResponse? _$v;

  int? _id;
  int? get id => _$this._id;
  set id(int? id) => _$this._id = id;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  String? _avatar;
  String? get avatar => _$this._avatar;
  set avatar(String? avatar) => _$this._avatar = avatar;

  int? _creatorId;
  int? get creatorId => _$this._creatorId;
  set creatorId(int? creatorId) => _$this._creatorId = creatorId;

  DateTime? _createdAt;
  DateTime? get createdAt => _$this._createdAt;
  set createdAt(DateTime? createdAt) => _$this._createdAt = createdAt;

  int? _memberCount;
  int? get memberCount => _$this._memberCount;
  set memberCount(int? memberCount) => _$this._memberCount = memberCount;

  GroupMessageResponseBuilder? _lastMessage;
  GroupMessageResponseBuilder get lastMessage =>
      _$this._lastMessage ??= GroupMessageResponseBuilder();
  set lastMessage(GroupMessageResponseBuilder? lastMessage) =>
      _$this._lastMessage = lastMessage;

  int? _unreadCount;
  int? get unreadCount => _$this._unreadCount;
  set unreadCount(int? unreadCount) => _$this._unreadCount = unreadCount;

  GroupConversationResponseBuilder() {
    GroupConversationResponse._defaults(this);
  }

  GroupConversationResponseBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _name = $v.name;
      _avatar = $v.avatar;
      _creatorId = $v.creatorId;
      _createdAt = $v.createdAt;
      _memberCount = $v.memberCount;
      _lastMessage = $v.lastMessage?.toBuilder();
      _unreadCount = $v.unreadCount;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GroupConversationResponse other) {
    _$v = other as _$GroupConversationResponse;
  }

  @override
  void update(void Function(GroupConversationResponseBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GroupConversationResponse build() => _build();

  _$GroupConversationResponse _build() {
    _$GroupConversationResponse _$result;
    try {
      _$result = _$v ??
          _$GroupConversationResponse._(
            id: BuiltValueNullFieldError.checkNotNull(
                id, r'GroupConversationResponse', 'id'),
            name: BuiltValueNullFieldError.checkNotNull(
                name, r'GroupConversationResponse', 'name'),
            avatar: avatar,
            creatorId: BuiltValueNullFieldError.checkNotNull(
                creatorId, r'GroupConversationResponse', 'creatorId'),
            createdAt: BuiltValueNullFieldError.checkNotNull(
                createdAt, r'GroupConversationResponse', 'createdAt'),
            memberCount: BuiltValueNullFieldError.checkNotNull(
                memberCount, r'GroupConversationResponse', 'memberCount'),
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
            r'GroupConversationResponse', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
