// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dog_age_stage_out.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$DogAgeStageOut extends DogAgeStageOut {
  @override
  final int id;
  @override
  final String name;
  @override
  final String? description;
  @override
  final num? minAgeYears;
  @override
  final num? maxAgeYears;
  @override
  final DateTime createdAt;
  @override
  final DateTime updatedAt;

  factory _$DogAgeStageOut([void Function(DogAgeStageOutBuilder)? updates]) =>
      (DogAgeStageOutBuilder()..update(updates))._build();

  _$DogAgeStageOut._(
      {required this.id,
      required this.name,
      this.description,
      this.minAgeYears,
      this.maxAgeYears,
      required this.createdAt,
      required this.updatedAt})
      : super._();
  @override
  DogAgeStageOut rebuild(void Function(DogAgeStageOutBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  DogAgeStageOutBuilder toBuilder() => DogAgeStageOutBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is DogAgeStageOut &&
        id == other.id &&
        name == other.name &&
        description == other.description &&
        minAgeYears == other.minAgeYears &&
        maxAgeYears == other.maxAgeYears &&
        createdAt == other.createdAt &&
        updatedAt == other.updatedAt;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, description.hashCode);
    _$hash = $jc(_$hash, minAgeYears.hashCode);
    _$hash = $jc(_$hash, maxAgeYears.hashCode);
    _$hash = $jc(_$hash, createdAt.hashCode);
    _$hash = $jc(_$hash, updatedAt.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'DogAgeStageOut')
          ..add('id', id)
          ..add('name', name)
          ..add('description', description)
          ..add('minAgeYears', minAgeYears)
          ..add('maxAgeYears', maxAgeYears)
          ..add('createdAt', createdAt)
          ..add('updatedAt', updatedAt))
        .toString();
  }
}

class DogAgeStageOutBuilder
    implements Builder<DogAgeStageOut, DogAgeStageOutBuilder> {
  _$DogAgeStageOut? _$v;

  int? _id;
  int? get id => _$this._id;
  set id(int? id) => _$this._id = id;

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

  DateTime? _createdAt;
  DateTime? get createdAt => _$this._createdAt;
  set createdAt(DateTime? createdAt) => _$this._createdAt = createdAt;

  DateTime? _updatedAt;
  DateTime? get updatedAt => _$this._updatedAt;
  set updatedAt(DateTime? updatedAt) => _$this._updatedAt = updatedAt;

  DogAgeStageOutBuilder() {
    DogAgeStageOut._defaults(this);
  }

  DogAgeStageOutBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _name = $v.name;
      _description = $v.description;
      _minAgeYears = $v.minAgeYears;
      _maxAgeYears = $v.maxAgeYears;
      _createdAt = $v.createdAt;
      _updatedAt = $v.updatedAt;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(DogAgeStageOut other) {
    _$v = other as _$DogAgeStageOut;
  }

  @override
  void update(void Function(DogAgeStageOutBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  DogAgeStageOut build() => _build();

  _$DogAgeStageOut _build() {
    final _$result = _$v ??
        _$DogAgeStageOut._(
          id: BuiltValueNullFieldError.checkNotNull(
              id, r'DogAgeStageOut', 'id'),
          name: BuiltValueNullFieldError.checkNotNull(
              name, r'DogAgeStageOut', 'name'),
          description: description,
          minAgeYears: minAgeYears,
          maxAgeYears: maxAgeYears,
          createdAt: BuiltValueNullFieldError.checkNotNull(
              createdAt, r'DogAgeStageOut', 'createdAt'),
          updatedAt: BuiltValueNullFieldError.checkNotNull(
              updatedAt, r'DogAgeStageOut', 'updatedAt'),
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
