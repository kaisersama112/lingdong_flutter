// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_response.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$UserResponse extends UserResponse {
  @override
  final int id;
  @override
  final String username;
  @override
  final String? avatar;
  @override
  final int? followingCount;
  @override
  final int? followersCount;
  @override
  final bool? isFollowing;

  factory _$UserResponse([void Function(UserResponseBuilder)? updates]) =>
      (UserResponseBuilder()..update(updates))._build();

  _$UserResponse._(
      {required this.id,
      required this.username,
      this.avatar,
      this.followingCount,
      this.followersCount,
      this.isFollowing})
      : super._();
  @override
  UserResponse rebuild(void Function(UserResponseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  UserResponseBuilder toBuilder() => UserResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UserResponse &&
        id == other.id &&
        username == other.username &&
        avatar == other.avatar &&
        followingCount == other.followingCount &&
        followersCount == other.followersCount &&
        isFollowing == other.isFollowing;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, username.hashCode);
    _$hash = $jc(_$hash, avatar.hashCode);
    _$hash = $jc(_$hash, followingCount.hashCode);
    _$hash = $jc(_$hash, followersCount.hashCode);
    _$hash = $jc(_$hash, isFollowing.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'UserResponse')
          ..add('id', id)
          ..add('username', username)
          ..add('avatar', avatar)
          ..add('followingCount', followingCount)
          ..add('followersCount', followersCount)
          ..add('isFollowing', isFollowing))
        .toString();
  }
}

class UserResponseBuilder
    implements Builder<UserResponse, UserResponseBuilder> {
  _$UserResponse? _$v;

  int? _id;
  int? get id => _$this._id;
  set id(int? id) => _$this._id = id;

  String? _username;
  String? get username => _$this._username;
  set username(String? username) => _$this._username = username;

  String? _avatar;
  String? get avatar => _$this._avatar;
  set avatar(String? avatar) => _$this._avatar = avatar;

  int? _followingCount;
  int? get followingCount => _$this._followingCount;
  set followingCount(int? followingCount) =>
      _$this._followingCount = followingCount;

  int? _followersCount;
  int? get followersCount => _$this._followersCount;
  set followersCount(int? followersCount) =>
      _$this._followersCount = followersCount;

  bool? _isFollowing;
  bool? get isFollowing => _$this._isFollowing;
  set isFollowing(bool? isFollowing) => _$this._isFollowing = isFollowing;

  UserResponseBuilder() {
    UserResponse._defaults(this);
  }

  UserResponseBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _username = $v.username;
      _avatar = $v.avatar;
      _followingCount = $v.followingCount;
      _followersCount = $v.followersCount;
      _isFollowing = $v.isFollowing;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(UserResponse other) {
    _$v = other as _$UserResponse;
  }

  @override
  void update(void Function(UserResponseBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  UserResponse build() => _build();

  _$UserResponse _build() {
    final _$result = _$v ??
        _$UserResponse._(
          id: BuiltValueNullFieldError.checkNotNull(id, r'UserResponse', 'id'),
          username: BuiltValueNullFieldError.checkNotNull(
              username, r'UserResponse', 'username'),
          avatar: avatar,
          followingCount: followingCount,
          followersCount: followersCount,
          isFollowing: isFollowing,
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
