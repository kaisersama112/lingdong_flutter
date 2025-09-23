// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_info_response.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$UserInfoResponse extends UserInfoResponse {
  @override
  final int id;
  @override
  final String? phone;
  @override
  final String username;
  @override
  final String? email;
  @override
  final String? avatar;
  @override
  final bool isPasswordSet;
  @override
  final int? level;
  @override
  final String? createdAt;
  @override
  final String? updatedAt;
  @override
  final int? followingCount;
  @override
  final int? followersCount;

  factory _$UserInfoResponse(
          [void Function(UserInfoResponseBuilder)? updates]) =>
      (UserInfoResponseBuilder()..update(updates))._build();

  _$UserInfoResponse._(
      {required this.id,
      this.phone,
      required this.username,
      this.email,
      this.avatar,
      required this.isPasswordSet,
      this.level,
      this.createdAt,
      this.updatedAt,
      this.followingCount,
      this.followersCount})
      : super._();
  @override
  UserInfoResponse rebuild(void Function(UserInfoResponseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  UserInfoResponseBuilder toBuilder() =>
      UserInfoResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UserInfoResponse &&
        id == other.id &&
        phone == other.phone &&
        username == other.username &&
        email == other.email &&
        avatar == other.avatar &&
        isPasswordSet == other.isPasswordSet &&
        level == other.level &&
        createdAt == other.createdAt &&
        updatedAt == other.updatedAt &&
        followingCount == other.followingCount &&
        followersCount == other.followersCount;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, phone.hashCode);
    _$hash = $jc(_$hash, username.hashCode);
    _$hash = $jc(_$hash, email.hashCode);
    _$hash = $jc(_$hash, avatar.hashCode);
    _$hash = $jc(_$hash, isPasswordSet.hashCode);
    _$hash = $jc(_$hash, level.hashCode);
    _$hash = $jc(_$hash, createdAt.hashCode);
    _$hash = $jc(_$hash, updatedAt.hashCode);
    _$hash = $jc(_$hash, followingCount.hashCode);
    _$hash = $jc(_$hash, followersCount.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'UserInfoResponse')
          ..add('id', id)
          ..add('phone', phone)
          ..add('username', username)
          ..add('email', email)
          ..add('avatar', avatar)
          ..add('isPasswordSet', isPasswordSet)
          ..add('level', level)
          ..add('createdAt', createdAt)
          ..add('updatedAt', updatedAt)
          ..add('followingCount', followingCount)
          ..add('followersCount', followersCount))
        .toString();
  }
}

class UserInfoResponseBuilder
    implements Builder<UserInfoResponse, UserInfoResponseBuilder> {
  _$UserInfoResponse? _$v;

  int? _id;
  int? get id => _$this._id;
  set id(int? id) => _$this._id = id;

  String? _phone;
  String? get phone => _$this._phone;
  set phone(String? phone) => _$this._phone = phone;

  String? _username;
  String? get username => _$this._username;
  set username(String? username) => _$this._username = username;

  String? _email;
  String? get email => _$this._email;
  set email(String? email) => _$this._email = email;

  String? _avatar;
  String? get avatar => _$this._avatar;
  set avatar(String? avatar) => _$this._avatar = avatar;

  bool? _isPasswordSet;
  bool? get isPasswordSet => _$this._isPasswordSet;
  set isPasswordSet(bool? isPasswordSet) =>
      _$this._isPasswordSet = isPasswordSet;

  int? _level;
  int? get level => _$this._level;
  set level(int? level) => _$this._level = level;

  String? _createdAt;
  String? get createdAt => _$this._createdAt;
  set createdAt(String? createdAt) => _$this._createdAt = createdAt;

  String? _updatedAt;
  String? get updatedAt => _$this._updatedAt;
  set updatedAt(String? updatedAt) => _$this._updatedAt = updatedAt;

  int? _followingCount;
  int? get followingCount => _$this._followingCount;
  set followingCount(int? followingCount) =>
      _$this._followingCount = followingCount;

  int? _followersCount;
  int? get followersCount => _$this._followersCount;
  set followersCount(int? followersCount) =>
      _$this._followersCount = followersCount;

  UserInfoResponseBuilder() {
    UserInfoResponse._defaults(this);
  }

  UserInfoResponseBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _phone = $v.phone;
      _username = $v.username;
      _email = $v.email;
      _avatar = $v.avatar;
      _isPasswordSet = $v.isPasswordSet;
      _level = $v.level;
      _createdAt = $v.createdAt;
      _updatedAt = $v.updatedAt;
      _followingCount = $v.followingCount;
      _followersCount = $v.followersCount;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(UserInfoResponse other) {
    _$v = other as _$UserInfoResponse;
  }

  @override
  void update(void Function(UserInfoResponseBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  UserInfoResponse build() => _build();

  _$UserInfoResponse _build() {
    final _$result = _$v ??
        _$UserInfoResponse._(
          id: BuiltValueNullFieldError.checkNotNull(
              id, r'UserInfoResponse', 'id'),
          phone: phone,
          username: BuiltValueNullFieldError.checkNotNull(
              username, r'UserInfoResponse', 'username'),
          email: email,
          avatar: avatar,
          isPasswordSet: BuiltValueNullFieldError.checkNotNull(
              isPasswordSet, r'UserInfoResponse', 'isPasswordSet'),
          level: level,
          createdAt: createdAt,
          updatedAt: updatedAt,
          followingCount: followingCount,
          followersCount: followersCount,
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
