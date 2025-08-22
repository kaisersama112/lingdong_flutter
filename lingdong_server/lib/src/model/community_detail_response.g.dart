// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'community_detail_response.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$CommunityDetailResponse extends CommunityDetailResponse {
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
  final DateTime? updatedAt;
  @override
  final bool? isPublic;
  @override
  final int? memberCount;
  @override
  final String? contactPhone;
  @override
  final String? website;
  @override
  final String? category;
  @override
  final String? rules;
  @override
  final int? status;
  @override
  final String? coverImage;
  @override
  final int? maxMembers;

  factory _$CommunityDetailResponse(
          [void Function(CommunityDetailResponseBuilder)? updates]) =>
      (CommunityDetailResponseBuilder()..update(updates))._build();

  _$CommunityDetailResponse._(
      {this.id,
      this.name,
      this.description,
      this.avatar,
      this.creatorId,
      this.createdAt,
      this.updatedAt,
      this.isPublic,
      this.memberCount,
      this.contactPhone,
      this.website,
      this.category,
      this.rules,
      this.status,
      this.coverImage,
      this.maxMembers})
      : super._();
  @override
  CommunityDetailResponse rebuild(
          void Function(CommunityDetailResponseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  CommunityDetailResponseBuilder toBuilder() =>
      CommunityDetailResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is CommunityDetailResponse &&
        id == other.id &&
        name == other.name &&
        description == other.description &&
        avatar == other.avatar &&
        creatorId == other.creatorId &&
        createdAt == other.createdAt &&
        updatedAt == other.updatedAt &&
        isPublic == other.isPublic &&
        memberCount == other.memberCount &&
        contactPhone == other.contactPhone &&
        website == other.website &&
        category == other.category &&
        rules == other.rules &&
        status == other.status &&
        coverImage == other.coverImage &&
        maxMembers == other.maxMembers;
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
    _$hash = $jc(_$hash, updatedAt.hashCode);
    _$hash = $jc(_$hash, isPublic.hashCode);
    _$hash = $jc(_$hash, memberCount.hashCode);
    _$hash = $jc(_$hash, contactPhone.hashCode);
    _$hash = $jc(_$hash, website.hashCode);
    _$hash = $jc(_$hash, category.hashCode);
    _$hash = $jc(_$hash, rules.hashCode);
    _$hash = $jc(_$hash, status.hashCode);
    _$hash = $jc(_$hash, coverImage.hashCode);
    _$hash = $jc(_$hash, maxMembers.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'CommunityDetailResponse')
          ..add('id', id)
          ..add('name', name)
          ..add('description', description)
          ..add('avatar', avatar)
          ..add('creatorId', creatorId)
          ..add('createdAt', createdAt)
          ..add('updatedAt', updatedAt)
          ..add('isPublic', isPublic)
          ..add('memberCount', memberCount)
          ..add('contactPhone', contactPhone)
          ..add('website', website)
          ..add('category', category)
          ..add('rules', rules)
          ..add('status', status)
          ..add('coverImage', coverImage)
          ..add('maxMembers', maxMembers))
        .toString();
  }
}

class CommunityDetailResponseBuilder
    implements
        Builder<CommunityDetailResponse, CommunityDetailResponseBuilder> {
  _$CommunityDetailResponse? _$v;

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

  DateTime? _updatedAt;
  DateTime? get updatedAt => _$this._updatedAt;
  set updatedAt(DateTime? updatedAt) => _$this._updatedAt = updatedAt;

  bool? _isPublic;
  bool? get isPublic => _$this._isPublic;
  set isPublic(bool? isPublic) => _$this._isPublic = isPublic;

  int? _memberCount;
  int? get memberCount => _$this._memberCount;
  set memberCount(int? memberCount) => _$this._memberCount = memberCount;

  String? _contactPhone;
  String? get contactPhone => _$this._contactPhone;
  set contactPhone(String? contactPhone) => _$this._contactPhone = contactPhone;

  String? _website;
  String? get website => _$this._website;
  set website(String? website) => _$this._website = website;

  String? _category;
  String? get category => _$this._category;
  set category(String? category) => _$this._category = category;

  String? _rules;
  String? get rules => _$this._rules;
  set rules(String? rules) => _$this._rules = rules;

  int? _status;
  int? get status => _$this._status;
  set status(int? status) => _$this._status = status;

  String? _coverImage;
  String? get coverImage => _$this._coverImage;
  set coverImage(String? coverImage) => _$this._coverImage = coverImage;

  int? _maxMembers;
  int? get maxMembers => _$this._maxMembers;
  set maxMembers(int? maxMembers) => _$this._maxMembers = maxMembers;

  CommunityDetailResponseBuilder() {
    CommunityDetailResponse._defaults(this);
  }

  CommunityDetailResponseBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _name = $v.name;
      _description = $v.description;
      _avatar = $v.avatar;
      _creatorId = $v.creatorId;
      _createdAt = $v.createdAt;
      _updatedAt = $v.updatedAt;
      _isPublic = $v.isPublic;
      _memberCount = $v.memberCount;
      _contactPhone = $v.contactPhone;
      _website = $v.website;
      _category = $v.category;
      _rules = $v.rules;
      _status = $v.status;
      _coverImage = $v.coverImage;
      _maxMembers = $v.maxMembers;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(CommunityDetailResponse other) {
    _$v = other as _$CommunityDetailResponse;
  }

  @override
  void update(void Function(CommunityDetailResponseBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  CommunityDetailResponse build() => _build();

  _$CommunityDetailResponse _build() {
    final _$result = _$v ??
        _$CommunityDetailResponse._(
          id: id,
          name: name,
          description: description,
          avatar: avatar,
          creatorId: creatorId,
          createdAt: createdAt,
          updatedAt: updatedAt,
          isPublic: isPublic,
          memberCount: memberCount,
          contactPhone: contactPhone,
          website: website,
          category: category,
          rules: rules,
          status: status,
          coverImage: coverImage,
          maxMembers: maxMembers,
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
