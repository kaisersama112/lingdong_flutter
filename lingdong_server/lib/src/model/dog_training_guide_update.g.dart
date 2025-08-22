// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dog_training_guide_update.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$DogTrainingGuideUpdate extends DogTrainingGuideUpdate {
  @override
  final int? breedId;
  @override
  final int? ageStageId;
  @override
  final String? title;
  @override
  final String? content;

  factory _$DogTrainingGuideUpdate(
          [void Function(DogTrainingGuideUpdateBuilder)? updates]) =>
      (DogTrainingGuideUpdateBuilder()..update(updates))._build();

  _$DogTrainingGuideUpdate._(
      {this.breedId, this.ageStageId, this.title, this.content})
      : super._();
  @override
  DogTrainingGuideUpdate rebuild(
          void Function(DogTrainingGuideUpdateBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  DogTrainingGuideUpdateBuilder toBuilder() =>
      DogTrainingGuideUpdateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is DogTrainingGuideUpdate &&
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
    return (newBuiltValueToStringHelper(r'DogTrainingGuideUpdate')
          ..add('breedId', breedId)
          ..add('ageStageId', ageStageId)
          ..add('title', title)
          ..add('content', content))
        .toString();
  }
}

class DogTrainingGuideUpdateBuilder
    implements Builder<DogTrainingGuideUpdate, DogTrainingGuideUpdateBuilder> {
  _$DogTrainingGuideUpdate? _$v;

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

  DogTrainingGuideUpdateBuilder() {
    DogTrainingGuideUpdate._defaults(this);
  }

  DogTrainingGuideUpdateBuilder get _$this {
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
  void replace(DogTrainingGuideUpdate other) {
    _$v = other as _$DogTrainingGuideUpdate;
  }

  @override
  void update(void Function(DogTrainingGuideUpdateBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  DogTrainingGuideUpdate build() => _build();

  _$DogTrainingGuideUpdate _build() {
    final _$result = _$v ??
        _$DogTrainingGuideUpdate._(
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
