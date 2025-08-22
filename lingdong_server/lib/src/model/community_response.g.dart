// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'community_response.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$CommunityResponse extends CommunityResponse {
  @override
  final int? id;
  @override
  final String? name;
  @override
  final String? description;
  @override
  final String? avatar;
  @override
  final int? creatorId;
  @override
  final DateTime? createdAt;
  @override
  final int? status;
  @override
  final String? coverImage;
  @override
  final int? memberCount;
  @override
  final bool? isMember;

  factory _$CommunityResponse(
          [void Function(CommunityResponseBuilder)? updates]) =>
      (CommunityResponseBuilder()..update(updates))._build();

  _$CommunityResponse._(
      {this.id,
      this.name,
      this.description,
      this.avatar,
      this.creatorId,
      this.createdAt,
      this.status,
      this.coverImage,
      this.memberCount,
      this.isMember})
      : super._();
  @override
  CommunityResponse rebuild(void Function(CommunityResponseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  CommunityResponseBuilder toBuilder() =>
      CommunityResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is CommunityResponse &&
        id == other.id &&
        name == other.name &&
        description == other.description &&
        avatar == other.avatar &&
        creatorId == other.creatorId &&
        createdAt == other.createdAt &&
        status == other.status &&
        coverImage == other.coverImage &&
        memberCount == other.memberCount &&
        isMember == other.isMember;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, description.hashCode);
    _$hash = $jc(_$hash, avatar.hashCode);
    _$hash = $jc(_$hash, creatorId.hashCode);
    _$hash = $jc(_$hash, createdAt.hashCode);
    _$hash = $jc(_$hash, status.hashCode);
    _$hash = $jc(_$hash, coverImage.hashCode);
    _$hash = $jc(_$hash, memberCount.hashCode);
    _$hash = $jc(_$hash, isMember.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'CommunityResponse')
          ..add('id', id)
          ..add('name', name)
          ..add('description', description)
          ..add('avatar', avatar)
          ..add('creatorId', creatorId)
          ..add('createdAt', createdAt)
          ..add('status', status)
          ..add('coverImage', coverImage)
          ..add('memberCount', memberCount)
          ..add('isMember', isMember))
        .toString();
  }
}

class CommunityResponseBuilder
    implements Builder<CommunityResponse, CommunityResponseBuilder> {
  _$CommunityResponse? _$v;

  int? _id;
  int? get id => _$this._id;
  set id(int? id) => _$this._id = id;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  String? _description;
  String? get description => _$this._description;
  set description(String? description) => _$this._description = description;

  String? _avatar;
  String? get avatar => _$this._avatar;
  set avatar(String? avatar) => _$this._avatar = avatar;

  int? _creatorId;
  int? get creatorId => _$this._creatorId;
  set creatorId(int? creatorId) => _$this._creatorId = creatorId;

  DateTime? _createdAt;
  DateTime? get createdAt => _$this._createdAt;
  set createdAt(DateTime? createdAt) => _$this._createdAt = createdAt;

  int? _status;
  int? get status => _$this._status;
  set status(int? status) => _$this._status = status;

  String? _coverImage;
  String? get coverImage => _$this._coverImage;
  set coverImage(String? coverImage) => _$this._coverImage = coverImage;

  int? _memberCount;
  int? get memberCount => _$this._memberCount;
  set memberCount(int? memberCount) => _$this._memberCount = memberCount;

  bool? _isMember;
  bool? get isMember => _$this._isMember;
  set isMember(bool? isMember) => _$this._isMember = isMember;

  CommunityResponseBuilder() {
    CommunityResponse._defaults(this);
  }

  CommunityResponseBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _name = $v.name;
      _description = $v.description;
      _avatar = $v.avatar;
      _creatorId = $v.creatorId;
      _createdAt = $v.createdAt;
      _status = $v.status;
      _coverImage = $v.coverImage;
      _memberCount = $v.memberCount;
      _isMember = $v.isMember;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(CommunityResponse other) {
    _$v = other as _$CommunityResponse;
  }

  @override
  void update(void Function(CommunityResponseBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  CommunityResponse build() => _build();

  _$CommunityResponse _build() {
    final _$result = _$v ??
        _$CommunityResponse._(
          id: id,
          name: name,
          description: description,
          avatar: avatar,
          creatorId: creatorId,
          createdAt: createdAt,
          status: status,
          coverImage: coverImage,
          memberCount: memberCount,
          isMember: isMember,
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
