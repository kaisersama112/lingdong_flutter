// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weight_record_create.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$WeightRecordCreate extends WeightRecordCreate {
  @override
  final int petId;
  @override
  final num weightValue;

  factory _$WeightRecordCreate(
          [void Function(WeightRecordCreateBuilder)? updates]) =>
      (WeightRecordCreateBuilder()..update(updates))._build();

  _$WeightRecordCreate._({required this.petId, required this.weightValue})
      : super._();
  @override
  WeightRecordCreate rebuild(
          void Function(WeightRecordCreateBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  WeightRecordCreateBuilder toBuilder() =>
      WeightRecordCreateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is WeightRecordCreate &&
        petId == other.petId &&
        weightValue == other.weightValue;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, petId.hashCode);
    _$hash = $jc(_$hash, weightValue.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'WeightRecordCreate')
          ..add('petId', petId)
          ..add('weightValue', weightValue))
        .toString();
  }
}

class WeightRecordCreateBuilder
    implements Builder<WeightRecordCreate, WeightRecordCreateBuilder> {
  _$WeightRecordCreate? _$v;

  int? _petId;
  int? get petId => _$this._petId;
  set petId(int? petId) => _$this._petId = petId;

  num? _weightValue;
  num? get weightValue => _$this._weightValue;
  set weightValue(num? weightValue) => _$this._weightValue = weightValue;

  WeightRecordCreateBuilder() {
    WeightRecordCreate._defaults(this);
  }

  WeightRecordCreateBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _petId = $v.petId;
      _weightValue = $v.weightValue;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(WeightRecordCreate other) {
    _$v = other as _$WeightRecordCreate;
  }

  @override
  void update(void Function(WeightRecordCreateBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  WeightRecordCreate build() => _build();

  _$WeightRecordCreate _build() {
    final _$result = _$v ??
        _$WeightRecordCreate._(
          petId: BuiltValueNullFieldError.checkNotNull(
              petId, r'WeightRecordCreate', 'petId'),
          weightValue: BuiltValueNullFieldError.checkNotNull(
              weightValue, r'WeightRecordCreate', 'weightValue'),
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
