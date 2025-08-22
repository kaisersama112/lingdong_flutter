// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dog_age_stage_update.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$DogAgeStageUpdate extends DogAgeStageUpdate {
  @override
  final int stageId;
  @override
  final String? name;
  @override
  final String? description;
  @override
  final num? minAgeYears;
  @override
  final num? maxAgeYears;

  factory _$DogAgeStageUpdate(
          [void Function(DogAgeStageUpdateBuilder)? updates]) =>
      (DogAgeStageUpdateBuilder()..update(updates))._build();

  _$DogAgeStageUpdate._(
      {required this.stageId,
      this.name,
      this.description,
      this.minAgeYears,
      this.maxAgeYears})
      : super._();
  @override
  DogAgeStageUpdate rebuild(void Function(DogAgeStageUpdateBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  DogAgeStageUpdateBuilder toBuilder() =>
      DogAgeStageUpdateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is DogAgeStageUpdate &&
        stageId == other.stageId &&
        name == other.name &&
        description == other.description &&
        minAgeYears == other.minAgeYears &&
        maxAgeYears == other.maxAgeYears;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, stageId.hashCode);
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, description.hashCode);
    _$hash = $jc(_$hash, minAgeYears.hashCode);
    _$hash = $jc(_$hash, maxAgeYears.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'DogAgeStageUpdate')
          ..add('stageId', stageId)
          ..add('name', name)
          ..add('description', description)
          ..add('minAgeYears', minAgeYears)
          ..add('maxAgeYears', maxAgeYears))
        .toString();
  }
}

class DogAgeStageUpdateBuilder
    implements Builder<DogAgeStageUpdate, DogAgeStageUpdateBuilder> {
  _$DogAgeStageUpdate? _$v;

  int? _stageId;
  int? get stageId => _$this._stageId;
  set stageId(int? stageId) => _$this._stageId = stageId;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  String? _description;
  String? get description => _$this._description;
  set description(String? description) => _$this._description = description;

  num? _minAgeYears;
  num? get minAgeYears => _$this._minAgeYears;
  set minAgeYears(num? minAgeYears) => _$this._minAgeYears = minAgeYears;

  num? _maxAgeYears;
  num? get maxAgeYears => _$this._maxAgeYears;
  set maxAgeYears(num? maxAgeYears) => _$this._maxAgeYears = maxAgeYears;

  DogAgeStageUpdateBuilder() {
    DogAgeStageUpdate._defaults(this);
  }

  DogAgeStageUpdateBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _stageId = $v.stageId;
      _name = $v.name;
      _description = $v.description;
      _minAgeYears = $v.minAgeYears;
      _maxAgeYears = $v.maxAgeYears;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(DogAgeStageUpdate other) {
    _$v = other as _$DogAgeStageUpdate;
  }

  @override
  void update(void Function(DogAgeStageUpdateBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  DogAgeStageUpdate build() => _build();

  _$DogAgeStageUpdate _build() {
    final _$result = _$v ??
        _$DogAgeStageUpdate._(
          stageId: BuiltValueNullFieldError.checkNotNull(
              stageId, r'DogAgeStageUpdate', 'stageId'),
          name: name,
          description: description,
          minAgeYears: minAgeYears,
          maxAgeYears: maxAgeYears,
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
