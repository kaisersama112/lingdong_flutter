// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'community_create.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$CommunityCreate extends CommunityCreate {
  @override
  final String name;
  @override
  final String? description;
  @override
  final String? avatar;
  @override
  final bool? isPublic;
  @override
  final String? contactPhone;
  @override
  final String? website;
  @override
  final String? category;
  @override
  final String? rules;
  @override
  final String? coverImage;
  @override
  final int? maxMembers;
  @override
  final bool? requiresApproval;

  factory _$CommunityCreate([void Function(CommunityCreateBuilder)? updates]) =>
      (CommunityCreateBuilder()..update(updates))._build();

  _$CommunityCreate._(
      {required this.name,
      this.description,
      this.avatar,
      this.isPublic,
      this.contactPhone,
      this.website,
      this.category,
      this.rules,
      this.coverImage,
      this.maxMembers,
      this.requiresApproval})
      : super._();
  @override
  CommunityCreate rebuild(void Function(CommunityCreateBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  CommunityCreateBuilder toBuilder() => CommunityCreateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is CommunityCreate &&
        name == other.name &&
        description == other.description &&
        avatar == other.avatar &&
        isPublic == other.isPublic &&
        contactPhone == other.contactPhone &&
        website == other.website &&
        category == other.category &&
        rules == other.rules &&
        coverImage == other.coverImage &&
        maxMembers == other.maxMembers &&
        requiresApproval == other.requiresApproval;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, description.hashCode);
    _$hash = $jc(_$hash, avatar.hashCode);
    _$hash = $jc(_$hash, isPublic.hashCode);
    _$hash = $jc(_$hash, contactPhone.hashCode);
    _$hash = $jc(_$hash, website.hashCode);
    _$hash = $jc(_$hash, category.hashCode);
    _$hash = $jc(_$hash, rules.hashCode);
    _$hash = $jc(_$hash, coverImage.hashCode);
    _$hash = $jc(_$hash, maxMembers.hashCode);
    _$hash = $jc(_$hash, requiresApproval.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'CommunityCreate')
          ..add('name', name)
          ..add('description', description)
          ..add('avatar', avatar)
          ..add('isPublic', isPublic)
          ..add('contactPhone', contactPhone)
          ..add('website', website)
          ..add('category', category)
          ..add('rules', rules)
          ..add('coverImage', coverImage)
          ..add('maxMembers', maxMembers)
          ..add('requiresApproval', requiresApproval))
        .toString();
  }
}

class CommunityCreateBuilder
    implements Builder<CommunityCreate, CommunityCreateBuilder> {
  _$CommunityCreate? _$v;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  String? _description;
  String? get description => _$this._description;
  set description(String? description) => _$this._description = description;

  String? _avatar;
  String? get avatar => _$this._avatar;
  set avatar(String? avatar) => _$this._avatar = avatar;

  bool? _isPublic;
  bool? get isPublic => _$this._isPublic;
  set isPublic(bool? isPublic) => _$this._isPublic = isPublic;

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

  String? _coverImage;
  String? get coverImage => _$this._coverImage;
  set coverImage(String? coverImage) => _$this._coverImage = coverImage;

  int? _maxMembers;
  int? get maxMembers => _$this._maxMembers;
  set maxMembers(int? maxMembers) => _$this._maxMembers = maxMembers;

  bool? _requiresApproval;
  bool? get requiresApproval => _$this._requiresApproval;
  set requiresApproval(bool? requiresApproval) =>
      _$this._requiresApproval = requiresApproval;

  CommunityCreateBuilder() {
    CommunityCreate._defaults(this);
  }

  CommunityCreateBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _name = $v.name;
      _description = $v.description;
      _avatar = $v.avatar;
      _isPublic = $v.isPublic;
      _contactPhone = $v.contactPhone;
      _website = $v.website;
      _category = $v.category;
      _rules = $v.rules;
      _coverImage = $v.coverImage;
      _maxMembers = $v.maxMembers;
      _requiresApproval = $v.requiresApproval;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(CommunityCreate other) {
    _$v = other as _$CommunityCreate;
  }

  @override
  void update(void Function(CommunityCreateBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  CommunityCreate build() => _build();

  _$CommunityCreate _build() {
    final _$result = _$v ??
        _$CommunityCreate._(
          name: BuiltValueNullFieldError.checkNotNull(
              name, r'CommunityCreate', 'name'),
          description: description,
          avatar: avatar,
          isPublic: isPublic,
          contactPhone: contactPhone,
          website: website,
          category: category,
          rules: rules,
          coverImage: coverImage,
          maxMembers: maxMembers,
          requiresApproval: requiresApproval,
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
