// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dog_care_guide_update.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$DogCareGuideUpdate extends DogCareGuideUpdate {
  @override
  final int guideId;
  @override
  final int? breedId;
  @override
  final int? ageStageId;
  @override
  final String? title;
  @override
  final String? content;

  factory _$DogCareGuideUpdate(
          [void Function(DogCareGuideUpdateBuilder)? updates]) =>
      (DogCareGuideUpdateBuilder()..update(updates))._build();

  _$DogCareGuideUpdate._(
      {required this.guideId,
      this.breedId,
      this.ageStageId,
      this.title,
      this.content})
      : super._();
  @override
  DogCareGuideUpdate rebuild(
          void Function(DogCareGuideUpdateBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  DogCareGuideUpdateBuilder toBuilder() =>
      DogCareGuideUpdateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is DogCareGuideUpdate &&
        guideId == other.guideId &&
        breedId == other.breedId &&
        ageStageId == other.ageStageId &&
        title == other.title &&
        content == other.content;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, guideId.hashCode);
    _$hash = $jc(_$hash, breedId.hashCode);
    _$hash = $jc(_$hash, ageStageId.hashCode);
    _$hash = $jc(_$hash, title.hashCode);
    _$hash = $jc(_$hash, content.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'DogCareGuideUpdate')
          ..add('guideId', guideId)
          ..add('breedId', breedId)
          ..add('ageStageId', ageStageId)
          ..add('title', title)
          ..add('content', content))
        .toString();
  }
}

class DogCareGuideUpdateBuilder
    implements Builder<DogCareGuideUpdate, DogCareGuideUpdateBuilder> {
  _$DogCareGuideUpdate? _$v;

  int? _guideId;
  int? get guideId => _$this._guideId;
  set guideId(int? guideId) => _$this._guideId = guideId;

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

  DogCareGuideUpdateBuilder() {
    DogCareGuideUpdate._defaults(this);
  }

  DogCareGuideUpdateBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _guideId = $v.guideId;
      _breedId = $v.breedId;
      _ageStageId = $v.ageStageId;
      _title = $v.title;
      _content = $v.content;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(DogCareGuideUpdate other) {
    _$v = other as _$DogCareGuideUpdate;
  }

  @override
  void update(void Function(DogCareGuideUpdateBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  DogCareGuideUpdate build() => _build();

  _$DogCareGuideUpdate _build() {
    final _$result = _$v ??
        _$DogCareGuideUpdate._(
          guideId: BuiltValueNullFieldError.checkNotNull(
              guideId, r'DogCareGuideUpdate', 'guideId'),
          breedId: breedId,
          ageStageId: ageStageId,
          title: title,
          content: content,
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
