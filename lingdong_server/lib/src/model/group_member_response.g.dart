// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'group_member_response.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$GroupMemberResponse extends GroupMemberResponse {
  @override
  final int id;
  @override
  final int userId;
  @override
  final String? nickname;
  @override
  final String username;
  @override
  final String? avatar;
  @override
  final DateTime joinedAt;
  @override
  final bool? isAdmin;
  @override
  final bool? isOwner;
  @override
  final bool? muted;

  factory _$GroupMemberResponse(
          [void Function(GroupMemberResponseBuilder)? updates]) =>
      (GroupMemberResponseBuilder()..update(updates))._build();

  _$GroupMemberResponse._(
      {required this.id,
      required this.userId,
      this.nickname,
      required this.username,
      this.avatar,
      required this.joinedAt,
      this.isAdmin,
      this.isOwner,
      this.muted})
      : super._();
  @override
  GroupMemberResponse rebuild(
          void Function(GroupMemberResponseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GroupMemberResponseBuilder toBuilder() =>
      GroupMemberResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GroupMemberResponse &&
        id == other.id &&
        userId == other.userId &&
        nickname == other.nickname &&
        username == other.username &&
        avatar == other.avatar &&
        joinedAt == other.joinedAt &&
        isAdmin == other.isAdmin &&
        isOwner == other.isOwner &&
        muted == other.muted;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, userId.hashCode);
    _$hash = $jc(_$hash, nickname.hashCode);
    _$hash = $jc(_$hash, username.hashCode);
    _$hash = $jc(_$hash, avatar.hashCode);
    _$hash = $jc(_$hash, joinedAt.hashCode);
    _$hash = $jc(_$hash, isAdmin.hashCode);
    _$hash = $jc(_$hash, isOwner.hashCode);
    _$hash = $jc(_$hash, muted.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GroupMemberResponse')
          ..add('id', id)
          ..add('userId', userId)
          ..add('nickname', nickname)
          ..add('username', username)
          ..add('avatar', avatar)
          ..add('joinedAt', joinedAt)
          ..add('isAdmin', isAdmin)
          ..add('isOwner', isOwner)
          ..add('muted', muted))
        .toString();
  }
}

class GroupMemberResponseBuilder
    implements Builder<GroupMemberResponse, GroupMemberResponseBuilder> {
  _$GroupMemberResponse? _$v;

  int? _id;
  int? get id => _$this._id;
  set id(int? id) => _$this._id = id;

  int? _userId;
  int? get userId => _$this._userId;
  set userId(int? userId) => _$this._userId = userId;

  String? _nickname;
  String? get nickname => _$this._nickname;
  set nickname(String? nickname) => _$this._nickname = nickname;

  String? _username;
  String? get username => _$this._username;
  set username(String? username) => _$this._username = username;

  String? _avatar;
  String? get avatar => _$this._avatar;
  set avatar(String? avatar) => _$this._avatar = avatar;

  DateTime? _joinedAt;
  DateTime? get joinedAt => _$this._joinedAt;
  set joinedAt(DateTime? joinedAt) => _$this._joinedAt = joinedAt;

  bool? _isAdmin;
  bool? get isAdmin => _$this._isAdmin;
  set isAdmin(bool? isAdmin) => _$this._isAdmin = isAdmin;

  bool? _isOwner;
  bool? get isOwner => _$this._isOwner;
  set isOwner(bool? isOwner) => _$this._isOwner = isOwner;

  bool? _muted;
  bool? get muted => _$this._muted;
  set muted(bool? muted) => _$this._muted = muted;

  GroupMemberResponseBuilder() {
    GroupMemberResponse._defaults(this);
  }

  GroupMemberResponseBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _userId = $v.userId;
      _nickname = $v.nickname;
      _username = $v.username;
      _avatar = $v.avatar;
      _joinedAt = $v.joinedAt;
      _isAdmin = $v.isAdmin;
      _isOwner = $v.isOwner;
      _muted = $v.muted;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GroupMemberResponse other) {
    _$v = other as _$GroupMemberResponse;
  }

  @override
  void update(void Function(GroupMemberResponseBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GroupMemberResponse build() => _build();

  _$GroupMemberResponse _build() {
    final _$result = _$v ??
        _$GroupMemberResponse._(
          id: BuiltValueNullFieldError.checkNotNull(
              id, r'GroupMemberResponse', 'id'),
          userId: BuiltValueNullFieldError.checkNotNull(
              userId, r'GroupMemberResponse', 'userId'),
          nickname: nickname,
          username: BuiltValueNullFieldError.checkNotNull(
              username, r'GroupMemberResponse', 'username'),
          avatar: avatar,
          joinedAt: BuiltValueNullFieldError.checkNotNull(
              joinedAt, r'GroupMemberResponse', 'joinedAt'),
          isAdmin: isAdmin,
          isOwner: isOwner,
          muted: muted,
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
