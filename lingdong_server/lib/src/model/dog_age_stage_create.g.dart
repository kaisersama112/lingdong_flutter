// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dog_age_stage_create.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$DogAgeStageCreate extends DogAgeStageCreate {
  @override
  final String name;
  @override
  final String? description;
  @override
  final num? minAgeYears;
  @override
  final num? maxAgeYears;

  factory _$DogAgeStageCreate(
          [void Function(DogAgeStageCreateBuilder)? updates]) =>
      (DogAgeStageCreateBuilder()..update(updates))._build();

  _$DogAgeStageCreate._(
      {required this.name,
      this.description,
      this.minAgeYears,
      this.maxAgeYears})
      : super._();
  @override
  DogAgeStageCreate rebuild(void Function(DogAgeStageCreateBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  DogAgeStageCreateBuilder toBuilder() =>
      DogAgeStageCreateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is DogAgeStageCreate &&
        name == other.name &&
        description == other.description &&
        minAgeYears == other.minAgeYears &&
        maxAgeYears == other.maxAgeYears;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, description.hashCode);
    _$hash = $jc(_$hash, minAgeYears.hashCode);
    _$hash = $jc(_$hash, maxAgeYears.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'DogAgeStageCreate')
          ..add('name', name)
          ..add('description', description)
          ..add('minAgeYears', minAgeYears)
          ..add('maxAgeYears', maxAgeYears))
        .toString();
  }
}

class DogAgeStageCreateBuilder
    implements Builder<DogAgeStageCreate, DogAgeStageCreateBuilder> {
  _$DogAgeStageCreate? _$v;

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

  DogAgeStageCreateBuilder() {
    DogAgeStageCreate._defaults(this);
  }

  DogAgeStageCreateBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _name = $v.name;
      _description = $v.description;
      _minAgeYears = $v.minAgeYears;
      _maxAgeYears = $v.maxAgeYears;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(DogAgeStageCreate other) {
    _$v = other as _$DogAgeStageCreate;
  }

  @override
  void update(void Function(DogAgeStageCreateBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  DogAgeStageCreate build() => _build();

  _$DogAgeStageCreate _build() {
    final _$result = _$v ??
        _$DogAgeStageCreate._(
          name: BuiltValueNullFieldError.checkNotNull(
              name, r'DogAgeStageCreate', 'name'),
          description: description,
          minAgeYears: minAgeYears,
          maxAgeYears: maxAgeYears,
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
