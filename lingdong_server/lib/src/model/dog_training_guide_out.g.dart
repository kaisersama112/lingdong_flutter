// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dog_training_guide_out.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$DogTrainingGuideOut extends DogTrainingGuideOut {
  @override
  final int breedId;
  @override
  final int ageStageId;
  @override
  final String title;
  @override
  final String? content;
  @override
  final int id;
  @override
  final DateTime createdAt;
  @override
  final DateTime updatedAt;
  @override
  final String? ageStageName;

  factory _$DogTrainingGuideOut(
          [void Function(DogTrainingGuideOutBuilder)? updates]) =>
      (DogTrainingGuideOutBuilder()..update(updates))._build();

  _$DogTrainingGuideOut._(
      {required this.breedId,
      required this.ageStageId,
      required this.title,
      this.content,
      required this.id,
      required this.createdAt,
      required this.updatedAt,
      this.ageStageName})
      : super._();
  @override
  DogTrainingGuideOut rebuild(
          void Function(DogTrainingGuideOutBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  DogTrainingGuideOutBuilder toBuilder() =>
      DogTrainingGuideOutBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is DogTrainingGuideOut &&
        breedId == other.breedId &&
        ageStageId == other.ageStageId &&
        title == other.title &&
        content == other.content &&
        id == other.id &&
        createdAt == other.createdAt &&
        updatedAt == other.updatedAt &&
        ageStageName == other.ageStageName;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, breedId.hashCode);
    _$hash = $jc(_$hash, ageStageId.hashCode);
    _$hash = $jc(_$hash, title.hashCode);
    _$hash = $jc(_$hash, content.hashCode);
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, createdAt.hashCode);
    _$hash = $jc(_$hash, updatedAt.hashCode);
    _$hash = $jc(_$hash, ageStageName.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'DogTrainingGuideOut')
          ..add('breedId', breedId)
          ..add('ageStageId', ageStageId)
          ..add('title', title)
          ..add('content', content)
          ..add('id', id)
          ..add('createdAt', createdAt)
          ..add('updatedAt', updatedAt)
          ..add('ageStageName', ageStageName))
        .toString();
  }
}

class DogTrainingGuideOutBuilder
    implements Builder<DogTrainingGuideOut, DogTrainingGuideOutBuilder> {
  _$DogTrainingGuideOut? _$v;

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

  int? _id;
  int? get id => _$this._id;
  set id(int? id) => _$this._id = id;

  DateTime? _createdAt;
  DateTime? get createdAt => _$this._createdAt;
  set createdAt(DateTime? createdAt) => _$this._createdAt = createdAt;

  DateTime? _updatedAt;
  DateTime? get updatedAt => _$this._updatedAt;
  set updatedAt(DateTime? updatedAt) => _$this._updatedAt = updatedAt;

  String? _ageStageName;
  String? get ageStageName => _$this._ageStageName;
  set ageStageName(String? ageStageName) => _$this._ageStageName = ageStageName;

  DogTrainingGuideOutBuilder() {
    DogTrainingGuideOut._defaults(this);
  }

  DogTrainingGuideOutBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _breedId = $v.breedId;
      _ageStageId = $v.ageStageId;
      _title = $v.title;
      _content = $v.content;
      _id = $v.id;
      _createdAt = $v.createdAt;
      _updatedAt = $v.updatedAt;
      _ageStageName = $v.ageStageName;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(DogTrainingGuideOut other) {
    _$v = other as _$DogTrainingGuideOut;
  }

  @override
  void update(void Function(DogTrainingGuideOutBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  DogTrainingGuideOut build() => _build();

  _$DogTrainingGuideOut _build() {
    final _$result = _$v ??
        _$DogTrainingGuideOut._(
          breedId: BuiltValueNullFieldError.checkNotNull(
              breedId, r'DogTrainingGuideOut', 'breedId'),
          ageStageId: BuiltValueNullFieldError.checkNotNull(
              ageStageId, r'DogTrainingGuideOut', 'ageStageId'),
          title: BuiltValueNullFieldError.checkNotNull(
              title, r'DogTrainingGuideOut', 'title'),
          content: content,
          id: BuiltValueNullFieldError.checkNotNull(
              id, r'DogTrainingGuideOut', 'id'),
          createdAt: BuiltValueNullFieldError.checkNotNull(
              createdAt, r'DogTrainingGuideOut', 'createdAt'),
          updatedAt: BuiltValueNullFieldError.checkNotNull(
              updatedAt, r'DogTrainingGuideOut', 'updatedAt'),
          ageStageName: ageStageName,
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
