// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dog_age_stage_base.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$DogAgeStageBase extends DogAgeStageBase {
  @override
  final int stageId;

  factory _$DogAgeStageBase([void Function(DogAgeStageBaseBuilder)? updates]) =>
      (DogAgeStageBaseBuilder()..update(updates))._build();

  _$DogAgeStageBase._({required this.stageId}) : super._();
  @override
  DogAgeStageBase rebuild(void Function(DogAgeStageBaseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  DogAgeStageBaseBuilder toBuilder() => DogAgeStageBaseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is DogAgeStageBase && stageId == other.stageId;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, stageId.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'DogAgeStageBase')
          ..add('stageId', stageId))
        .toString();
  }
}

class DogAgeStageBaseBuilder
    implements Builder<DogAgeStageBase, DogAgeStageBaseBuilder> {
  _$DogAgeStageBase? _$v;

  int? _stageId;
  int? get stageId => _$this._stageId;
  set stageId(int? stageId) => _$this._stageId = stageId;

  DogAgeStageBaseBuilder() {
    DogAgeStageBase._defaults(this);
  }

  DogAgeStageBaseBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _stageId = $v.stageId;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(DogAgeStageBase other) {
    _$v = other as _$DogAgeStageBase;
  }

  @override
  void update(void Function(DogAgeStageBaseBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  DogAgeStageBase build() => _build();

  _$DogAgeStageBase _build() {
    final _$result = _$v ??
        _$DogAgeStageBase._(
          stageId: BuiltValueNullFieldError.checkNotNull(
              stageId, r'DogAgeStageBase', 'stageId'),
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
