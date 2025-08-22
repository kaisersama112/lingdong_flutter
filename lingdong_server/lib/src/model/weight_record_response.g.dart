// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weight_record_response.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$WeightRecordResponse extends WeightRecordResponse {
  @override
  final num weightValue;
  @override
  final int id;

  factory _$WeightRecordResponse(
          [void Function(WeightRecordResponseBuilder)? updates]) =>
      (WeightRecordResponseBuilder()..update(updates))._build();

  _$WeightRecordResponse._({required this.weightValue, required this.id})
      : super._();
  @override
  WeightRecordResponse rebuild(
          void Function(WeightRecordResponseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  WeightRecordResponseBuilder toBuilder() =>
      WeightRecordResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is WeightRecordResponse &&
        weightValue == other.weightValue &&
        id == other.id;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, weightValue.hashCode);
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'WeightRecordResponse')
          ..add('weightValue', weightValue)
          ..add('id', id))
        .toString();
  }
}

class WeightRecordResponseBuilder
    implements Builder<WeightRecordResponse, WeightRecordResponseBuilder> {
  _$WeightRecordResponse? _$v;

  num? _weightValue;
  num? get weightValue => _$this._weightValue;
  set weightValue(num? weightValue) => _$this._weightValue = weightValue;

  int? _id;
  int? get id => _$this._id;
  set id(int? id) => _$this._id = id;

  WeightRecordResponseBuilder() {
    WeightRecordResponse._defaults(this);
  }

  WeightRecordResponseBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _weightValue = $v.weightValue;
      _id = $v.id;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(WeightRecordResponse other) {
    _$v = other as _$WeightRecordResponse;
  }

  @override
  void update(void Function(WeightRecordResponseBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  WeightRecordResponse build() => _build();

  _$WeightRecordResponse _build() {
    final _$result = _$v ??
        _$WeightRecordResponse._(
          weightValue: BuiltValueNullFieldError.checkNotNull(
              weightValue, r'WeightRecordResponse', 'weightValue'),
          id: BuiltValueNullFieldError.checkNotNull(
              id, r'WeightRecordResponse', 'id'),
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
