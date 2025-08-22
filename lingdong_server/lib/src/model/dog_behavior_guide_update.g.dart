// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dog_behavior_guide_update.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$DogBehaviorGuideUpdate extends DogBehaviorGuideUpdate {
  @override
  final int behaviorGuideId;
  @override
  final int? breedId;
  @override
  final int? ageStageId;
  @override
  final String? title;
  @override
  final String? content;

  factory _$DogBehaviorGuideUpdate(
          [void Function(DogBehaviorGuideUpdateBuilder)? updates]) =>
      (DogBehaviorGuideUpdateBuilder()..update(updates))._build();

  _$DogBehaviorGuideUpdate._(
      {required this.behaviorGuideId,
      this.breedId,
      this.ageStageId,
      this.title,
      this.content})
      : super._();
  @override
  DogBehaviorGuideUpdate rebuild(
          void Function(DogBehaviorGuideUpdateBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  DogBehaviorGuideUpdateBuilder toBuilder() =>
      DogBehaviorGuideUpdateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is DogBehaviorGuideUpdate &&
        behaviorGuideId == other.behaviorGuideId &&
        breedId == other.breedId &&
        ageStageId == other.ageStageId &&
        title == other.title &&
        content == other.content;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, behaviorGuideId.hashCode);
    _$hash = $jc(_$hash, breedId.hashCode);
    _$hash = $jc(_$hash, ageStageId.hashCode);
    _$hash = $jc(_$hash, title.hashCode);
    _$hash = $jc(_$hash, content.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'DogBehaviorGuideUpdate')
          ..add('behaviorGuideId', behaviorGuideId)
          ..add('breedId', breedId)
          ..add('ageStageId', ageStageId)
          ..add('title', title)
          ..add('content', content))
        .toString();
  }
}

class DogBehaviorGuideUpdateBuilder
    implements Builder<DogBehaviorGuideUpdate, DogBehaviorGuideUpdateBuilder> {
  _$DogBehaviorGuideUpdate? _$v;

  int? _behaviorGuideId;
  int? get behaviorGuideId => _$this._behaviorGuideId;
  set behaviorGuideId(int? behaviorGuideId) =>
      _$this._behaviorGuideId = behaviorGuideId;

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

  DogBehaviorGuideUpdateBuilder() {
    DogBehaviorGuideUpdate._defaults(this);
  }

  DogBehaviorGuideUpdateBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _behaviorGuideId = $v.behaviorGuideId;
      _breedId = $v.breedId;
      _ageStageId = $v.ageStageId;
      _title = $v.title;
      _content = $v.content;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(DogBehaviorGuideUpdate other) {
    _$v = other as _$DogBehaviorGuideUpdate;
  }

  @override
  void update(void Function(DogBehaviorGuideUpdateBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  DogBehaviorGuideUpdate build() => _build();

  _$DogBehaviorGuideUpdate _build() {
    final _$result = _$v ??
        _$DogBehaviorGuideUpdate._(
          behaviorGuideId: BuiltValueNullFieldError.checkNotNull(
              behaviorGuideId, r'DogBehaviorGuideUpdate', 'behaviorGuideId'),
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
