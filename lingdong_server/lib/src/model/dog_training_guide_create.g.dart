// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dog_training_guide_create.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$DogTrainingGuideCreate extends DogTrainingGuideCreate {
  @override
  final int breedId;
  @override
  final int ageStageId;
  @override
  final String title;
  @override
  final String? content;

  factory _$DogTrainingGuideCreate(
          [void Function(DogTrainingGuideCreateBuilder)? updates]) =>
      (DogTrainingGuideCreateBuilder()..update(updates))._build();

  _$DogTrainingGuideCreate._(
      {required this.breedId,
      required this.ageStageId,
      required this.title,
      this.content})
      : super._();
  @override
  DogTrainingGuideCreate rebuild(
          void Function(DogTrainingGuideCreateBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  DogTrainingGuideCreateBuilder toBuilder() =>
      DogTrainingGuideCreateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is DogTrainingGuideCreate &&
        breedId == other.breedId &&
        ageStageId == other.ageStageId &&
        title == other.title &&
        content == other.content;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, breedId.hashCode);
    _$hash = $jc(_$hash, ageStageId.hashCode);
    _$hash = $jc(_$hash, title.hashCode);
    _$hash = $jc(_$hash, content.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'DogTrainingGuideCreate')
          ..add('breedId', breedId)
          ..add('ageStageId', ageStageId)
          ..add('title', title)
          ..add('content', content))
        .toString();
  }
}

class DogTrainingGuideCreateBuilder
    implements Builder<DogTrainingGuideCreate, DogTrainingGuideCreateBuilder> {
  _$DogTrainingGuideCreate? _$v;

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

  DogTrainingGuideCreateBuilder() {
    DogTrainingGuideCreate._defaults(this);
  }

  DogTrainingGuideCreateBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _breedId = $v.breedId;
      _ageStageId = $v.ageStageId;
      _title = $v.title;
      _content = $v.content;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(DogTrainingGuideCreate other) {
    _$v = other as _$DogTrainingGuideCreate;
  }

  @override
  void update(void Function(DogTrainingGuideCreateBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  DogTrainingGuideCreate build() => _build();

  _$DogTrainingGuideCreate _build() {
    final _$result = _$v ??
        _$DogTrainingGuideCreate._(
          breedId: BuiltValueNullFieldError.checkNotNull(
              breedId, r'DogTrainingGuideCreate', 'breedId'),
          ageStageId: BuiltValueNullFieldError.checkNotNull(
              ageStageId, r'DogTrainingGuideCreate', 'ageStageId'),
          title: BuiltValueNullFieldError.checkNotNull(
              title, r'DogTrainingGuideCreate', 'title'),
          content: content,
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
