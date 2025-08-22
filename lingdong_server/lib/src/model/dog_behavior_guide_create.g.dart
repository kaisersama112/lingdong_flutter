// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dog_behavior_guide_create.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$DogBehaviorGuideCreate extends DogBehaviorGuideCreate {
  @override
  final int breedId;
  @override
  final int? ageStageId;
  @override
  final String title;
  @override
  final String? content;

  factory _$DogBehaviorGuideCreate(
          [void Function(DogBehaviorGuideCreateBuilder)? updates]) =>
      (DogBehaviorGuideCreateBuilder()..update(updates))._build();

  _$DogBehaviorGuideCreate._(
      {required this.breedId,
      this.ageStageId,
      required this.title,
      this.content})
      : super._();
  @override
  DogBehaviorGuideCreate rebuild(
          void Function(DogBehaviorGuideCreateBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  DogBehaviorGuideCreateBuilder toBuilder() =>
      DogBehaviorGuideCreateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is DogBehaviorGuideCreate &&
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
    return (newBuiltValueToStringHelper(r'DogBehaviorGuideCreate')
          ..add('breedId', breedId)
          ..add('ageStageId', ageStageId)
          ..add('title', title)
          ..add('content', content))
        .toString();
  }
}

class DogBehaviorGuideCreateBuilder
    implements Builder<DogBehaviorGuideCreate, DogBehaviorGuideCreateBuilder> {
  _$DogBehaviorGuideCreate? _$v;

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

  DogBehaviorGuideCreateBuilder() {
    DogBehaviorGuideCreate._defaults(this);
  }

  DogBehaviorGuideCreateBuilder get _$this {
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
  void replace(DogBehaviorGuideCreate other) {
    _$v = other as _$DogBehaviorGuideCreate;
  }

  @override
  void update(void Function(DogBehaviorGuideCreateBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  DogBehaviorGuideCreate build() => _build();

  _$DogBehaviorGuideCreate _build() {
    final _$result = _$v ??
        _$DogBehaviorGuideCreate._(
          breedId: BuiltValueNullFieldError.checkNotNull(
              breedId, r'DogBehaviorGuideCreate', 'breedId'),
          ageStageId: ageStageId,
          title: BuiltValueNullFieldError.checkNotNull(
              title, r'DogBehaviorGuideCreate', 'title'),
          content: content,
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
