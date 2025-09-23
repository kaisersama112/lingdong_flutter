// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_follow_item.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$UserFollowItem extends UserFollowItem {
  @override
  final int userId;
  @override
  final String username;
  @override
  final String? avatar;

  factory _$UserFollowItem([void Function(UserFollowItemBuilder)? updates]) =>
      (UserFollowItemBuilder()..update(updates))._build();

  _$UserFollowItem._(
      {required this.userId, required this.username, this.avatar})
      : super._();
  @override
  UserFollowItem rebuild(void Function(UserFollowItemBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  UserFollowItemBuilder toBuilder() => UserFollowItemBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UserFollowItem &&
        userId == other.userId &&
        username == other.username &&
        avatar == other.avatar;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, userId.hashCode);
    _$hash = $jc(_$hash, username.hashCode);
    _$hash = $jc(_$hash, avatar.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'UserFollowItem')
          ..add('userId', userId)
          ..add('username', username)
          ..add('avatar', avatar))
        .toString();
  }
}

class UserFollowItemBuilder
    implements Builder<UserFollowItem, UserFollowItemBuilder> {
  _$UserFollowItem? _$v;

  int? _userId;
  int? get userId => _$this._userId;
  set userId(int? userId) => _$this._userId = userId;

  String? _username;
  String? get username => _$this._username;
  set username(String? username) => _$this._username = username;

  String? _avatar;
  String? get avatar => _$this._avatar;
  set avatar(String? avatar) => _$this._avatar = avatar;

  UserFollowItemBuilder() {
    UserFollowItem._defaults(this);
  }

  UserFollowItemBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _userId = $v.userId;
      _username = $v.username;
      _avatar = $v.avatar;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(UserFollowItem other) {
    _$v = other as _$UserFollowItem;
  }

  @override
  void update(void Function(UserFollowItemBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  UserFollowItem build() => _build();

  _$UserFollowItem _build() {
    final _$result = _$v ??
        _$UserFollowItem._(
          userId: BuiltValueNullFieldError.checkNotNull(
              userId, r'UserFollowItem', 'userId'),
          username: BuiltValueNullFieldError.checkNotNull(
              username, r'UserFollowItem', 'username'),
          avatar: avatar,
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
