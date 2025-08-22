// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dog_care_guide_create.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$DogCareGuideCreate extends DogCareGuideCreate {
  @override
  final int breedId;
  @override
  final int ageStageId;
  @override
  final String title;
  @override
  final String? content;

  factory _$DogCareGuideCreate(
          [void Function(DogCareGuideCreateBuilder)? updates]) =>
      (DogCareGuideCreateBuilder()..update(updates))._build();

  _$DogCareGuideCreate._(
      {required this.breedId,
      required this.ageStageId,
      required this.title,
      this.content})
      : super._();
  @override
  DogCareGuideCreate rebuild(
          void Function(DogCareGuideCreateBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  DogCareGuideCreateBuilder toBuilder() =>
      DogCareGuideCreateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is DogCareGuideCreate &&
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
    return (newBuiltValueToStringHelper(r'DogCareGuideCreate')
          ..add('breedId', breedId)
          ..add('ageStageId', ageStageId)
          ..add('title', title)
          ..add('content', content))
        .toString();
  }
}

class DogCareGuideCreateBuilder
    implements Builder<DogCareGuideCreate, DogCareGuideCreateBuilder> {
  _$DogCareGuideCreate? _$v;

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

  DogCareGuideCreateBuilder() {
    DogCareGuideCreate._defaults(this);
  }

  DogCareGuideCreateBuilder get _$this {
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
  void replace(DogCareGuideCreate other) {
    _$v = other as _$DogCareGuideCreate;
  }

  @override
  void update(void Function(DogCareGuideCreateBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  DogCareGuideCreate build() => _build();

  _$DogCareGuideCreate _build() {
    final _$result = _$v ??
        _$DogCareGuideCreate._(
          breedId: BuiltValueNullFieldError.checkNotNull(
              breedId, r'DogCareGuideCreate', 'breedId'),
          ageStageId: BuiltValueNullFieldError.checkNotNull(
              ageStageId, r'DogCareGuideCreate', 'ageStageId'),
          title: BuiltValueNullFieldError.checkNotNull(
              title, r'DogCareGuideCreate', 'title'),
          content: content,
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
