// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weight_record_response.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$WeightRecordResponse extends WeightRecordResponse {
  @override
  final int petId;
  @override
  final num? weightValue;
  @override
  final int id;
  @override
  final Date? createdAt;
  @override
  final Date? recordDate;

  factory _$WeightRecordResponse(
          [void Function(WeightRecordResponseBuilder)? updates]) =>
      (WeightRecordResponseBuilder()..update(updates))._build();

  _$WeightRecordResponse._(
      {required this.petId,
      this.weightValue,
      required this.id,
      this.createdAt,
      this.recordDate})
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
        petId == other.petId &&
        weightValue == other.weightValue &&
        id == other.id &&
        createdAt == other.createdAt &&
        recordDate == other.recordDate;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, petId.hashCode);
    _$hash = $jc(_$hash, weightValue.hashCode);
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, createdAt.hashCode);
    _$hash = $jc(_$hash, recordDate.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'WeightRecordResponse')
          ..add('petId', petId)
          ..add('weightValue', weightValue)
          ..add('id', id)
          ..add('createdAt', createdAt)
          ..add('recordDate', recordDate))
        .toString();
  }
}

class WeightRecordResponseBuilder
    implements Builder<WeightRecordResponse, WeightRecordResponseBuilder> {
  _$WeightRecordResponse? _$v;

  int? _petId;
  int? get petId => _$this._petId;
  set petId(int? petId) => _$this._petId = petId;

  num? _weightValue;
  num? get weightValue => _$this._weightValue;
  set weightValue(num? weightValue) => _$this._weightValue = weightValue;

  int? _id;
  int? get id => _$this._id;
  set id(int? id) => _$this._id = id;

  Date? _createdAt;
  Date? get createdAt => _$this._createdAt;
  set createdAt(Date? createdAt) => _$this._createdAt = createdAt;

  Date? _recordDate;
  Date? get recordDate => _$this._recordDate;
  set recordDate(Date? recordDate) => _$this._recordDate = recordDate;

  WeightRecordResponseBuilder() {
    WeightRecordResponse._defaults(this);
  }

  WeightRecordResponseBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _petId = $v.petId;
      _weightValue = $v.weightValue;
      _id = $v.id;
      _createdAt = $v.createdAt;
      _recordDate = $v.recordDate;
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
          petId: BuiltValueNullFieldError.checkNotNull(
              petId, r'WeightRecordResponse', 'petId'),
          weightValue: weightValue,
          id: BuiltValueNullFieldError.checkNotNull(
              id, r'WeightRecordResponse', 'id'),
          createdAt: createdAt,
          recordDate: recordDate,
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
