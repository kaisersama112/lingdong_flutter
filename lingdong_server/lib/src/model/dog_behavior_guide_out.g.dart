// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dog_behavior_guide_out.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$DogBehaviorGuideOut extends DogBehaviorGuideOut {
  @override
  final int id;
  @override
  final int breedId;
  @override
  final int? ageStageId;
  @override
  final String title;
  @override
  final String? content;
  @override
  final DateTime createdAt;
  @override
  final DateTime updatedAt;
  @override
  final String? ageStageName;

  factory _$DogBehaviorGuideOut(
          [void Function(DogBehaviorGuideOutBuilder)? updates]) =>
      (DogBehaviorGuideOutBuilder()..update(updates))._build();

  _$DogBehaviorGuideOut._(
      {required this.id,
      required this.breedId,
      this.ageStageId,
      required this.title,
      this.content,
      required this.createdAt,
      required this.updatedAt,
      this.ageStageName})
      : super._();
  @override
  DogBehaviorGuideOut rebuild(
          void Function(DogBehaviorGuideOutBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  DogBehaviorGuideOutBuilder toBuilder() =>
      DogBehaviorGuideOutBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is DogBehaviorGuideOut &&
        id == other.id &&
        breedId == other.breedId &&
        ageStageId == other.ageStageId &&
        title == other.title &&
        content == other.content &&
        createdAt == other.createdAt &&
        updatedAt == other.updatedAt &&
        ageStageName == other.ageStageName;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, breedId.hashCode);
    _$hash = $jc(_$hash, ageStageId.hashCode);
    _$hash = $jc(_$hash, title.hashCode);
    _$hash = $jc(_$hash, content.hashCode);
    _$hash = $jc(_$hash, createdAt.hashCode);
    _$hash = $jc(_$hash, updatedAt.hashCode);
    _$hash = $jc(_$hash, ageStageName.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'DogBehaviorGuideOut')
          ..add('id', id)
          ..add('breedId', breedId)
          ..add('ageStageId', ageStageId)
          ..add('title', title)
          ..add('content', content)
          ..add('createdAt', createdAt)
          ..add('updatedAt', updatedAt)
          ..add('ageStageName', ageStageName))
        .toString();
  }
}

class DogBehaviorGuideOutBuilder
    implements Builder<DogBehaviorGuideOut, DogBehaviorGuideOutBuilder> {
  _$DogBehaviorGuideOut? _$v;

  int? _id;
  int? get id => _$this._id;
  set id(int? id) => _$this._id = id;

  int? _breedId;
  int? get breedId => _$this._breedId;
  set breedId(int? breedId) => _$this._breedId = breedId;

  int? _ageStageId;
  int? get ageStageId => _$this._ageStageId;
  set ageStageId(int? ageStageId) => _$this._ageStageId = ageStageId;

  String? _title;
  String? get title => _$this._title;
  set title(String? title) => _$this._title = title;

  String? _content;
  String? get content => _$this._content;
  set content(String? content) => _$this._content = content;

  DateTime? _createdAt;
  DateTime? get createdAt => _$this._createdAt;
  set createdAt(DateTime? createdAt) => _$this._createdAt = createdAt;

  DateTime? _updatedAt;
  DateTime? get updatedAt => _$this._updatedAt;
  set updatedAt(DateTime? updatedAt) => _$this._updatedAt = updatedAt;

  String? _ageStageName;
  String? get ageStageName => _$this._ageStageName;
  set ageStageName(String? ageStageName) => _$this._ageStageName = ageStageName;

  DogBehaviorGuideOutBuilder() {
    DogBehaviorGuideOut._defaults(this);
  }

  DogBehaviorGuideOutBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _breedId = $v.breedId;
      _ageStageId = $v.ageStageId;
      _title = $v.title;
      _content = $v.content;
      _createdAt = $v.createdAt;
      _updatedAt = $v.updatedAt;
      _ageStageName = $v.ageStageName;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(DogBehaviorGuideOut other) {
    _$v = other as _$DogBehaviorGuideOut;
  }

  @override
  void update(void Function(DogBehaviorGuideOutBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  DogBehaviorGuideOut build() => _build();

  _$DogBehaviorGuideOut _build() {
    final _$result = _$v ??
        _$DogBehaviorGuideOut._(
          id: BuiltValueNullFieldError.checkNotNull(
              id, r'DogBehaviorGuideOut', 'id'),
          breedId: BuiltValueNullFieldError.checkNotNull(
              breedId, r'DogBehaviorGuideOut', 'breedId'),
          ageStageId: ageStageId,
          title: BuiltValueNullFieldError.checkNotNull(
              title, r'DogBehaviorGuideOut', 'title'),
          content: content,
          createdAt: BuiltValueNullFieldError.checkNotNull(
              createdAt, r'DogBehaviorGuideOut', 'createdAt'),
          updatedAt: BuiltValueNullFieldError.checkNotNull(
              updatedAt, r'DogBehaviorGuideOut', 'updatedAt'),
          ageStageName: ageStageName,
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
