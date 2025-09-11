// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'other_health_record_response.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$OtherHealthRecordResponse extends OtherHealthRecordResponse {
  @override
  final int petId;
  @override
  final String otherType;
  @override
  final BuiltMap<String, JsonObject?> details;
  @override
  final int id;
  @override
  final String createdAt;
  @override
  final String recordDate;

  factory _$OtherHealthRecordResponse(
          [void Function(OtherHealthRecordResponseBuilder)? updates]) =>
      (OtherHealthRecordResponseBuilder()..update(updates))._build();

  _$OtherHealthRecordResponse._(
      {required this.petId,
      required this.otherType,
      required this.details,
      required this.id,
      required this.createdAt,
      required this.recordDate})
      : super._();
  @override
  OtherHealthRecordResponse rebuild(
          void Function(OtherHealthRecordResponseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  OtherHealthRecordResponseBuilder toBuilder() =>
      OtherHealthRecordResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is OtherHealthRecordResponse &&
        petId == other.petId &&
        otherType == other.otherType &&
        details == other.details &&
        id == other.id &&
        createdAt == other.createdAt &&
        recordDate == other.recordDate;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, petId.hashCode);
    _$hash = $jc(_$hash, otherType.hashCode);
    _$hash = $jc(_$hash, details.hashCode);
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, createdAt.hashCode);
    _$hash = $jc(_$hash, recordDate.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'OtherHealthRecordResponse')
          ..add('petId', petId)
          ..add('otherType', otherType)
          ..add('details', details)
          ..add('id', id)
          ..add('createdAt', createdAt)
          ..add('recordDate', recordDate))
        .toString();
  }
}

class OtherHealthRecordResponseBuilder
    implements
        Builder<OtherHealthRecordResponse, OtherHealthRecordResponseBuilder> {
  _$OtherHealthRecordResponse? _$v;

  int? _petId;
  int? get petId => _$this._petId;
  set petId(int? petId) => _$this._petId = petId;

  String? _otherType;
  String? get otherType => _$this._otherType;
  set otherType(String? otherType) => _$this._otherType = otherType;

  MapBuilder<String, JsonObject?>? _details;
  MapBuilder<String, JsonObject?> get details =>
      _$this._details ??= MapBuilder<String, JsonObject?>();
  set details(MapBuilder<String, JsonObject?>? details) =>
      _$this._details = details;

  int? _id;
  int? get id => _$this._id;
  set id(int? id) => _$this._id = id;

  String? _createdAt;
  String? get createdAt => _$this._createdAt;
  set createdAt(String? createdAt) => _$this._createdAt = createdAt;

  String? _recordDate;
  String? get recordDate => _$this._recordDate;
  set recordDate(String? recordDate) => _$this._recordDate = recordDate;

  OtherHealthRecordResponseBuilder() {
    OtherHealthRecordResponse._defaults(this);
  }

  OtherHealthRecordResponseBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _petId = $v.petId;
      _otherType = $v.otherType;
      _details = $v.details.toBuilder();
      _id = $v.id;
      _createdAt = $v.createdAt;
      _recordDate = $v.recordDate;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(OtherHealthRecordResponse other) {
    _$v = other as _$OtherHealthRecordResponse;
  }

  @override
  void update(void Function(OtherHealthRecordResponseBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  OtherHealthRecordResponse build() => _build();

  _$OtherHealthRecordResponse _build() {
    _$OtherHealthRecordResponse _$result;
    try {
      _$result = _$v ??
          _$OtherHealthRecordResponse._(
            petId: BuiltValueNullFieldError.checkNotNull(
                petId, r'OtherHealthRecordResponse', 'petId'),
            otherType: BuiltValueNullFieldError.checkNotNull(
                otherType, r'OtherHealthRecordResponse', 'otherType'),
            details: details.build(),
            id: BuiltValueNullFieldError.checkNotNull(
                id, r'OtherHealthRecordResponse', 'id'),
            createdAt: BuiltValueNullFieldError.checkNotNull(
                createdAt, r'OtherHealthRecordResponse', 'createdAt'),
            recordDate: BuiltValueNullFieldError.checkNotNull(
                recordDate, r'OtherHealthRecordResponse', 'recordDate'),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'details';
        details.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'OtherHealthRecordResponse', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
