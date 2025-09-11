// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'deworming_record_response.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$DewormingRecordResponse extends DewormingRecordResponse {
  @override
  final int id;
  @override
  final int petId;
  @override
  final String dewormingType;
  @override
  final String? dewormingMedicineName;
  @override
  final String? dewormingDosage;
  @override
  final String? dewormingLocation;
  @override
  final String? dewormingValidity;
  @override
  final Date? dewormingNextDate;
  @override
  final String createdAt;
  @override
  final String recordDate;

  factory _$DewormingRecordResponse(
          [void Function(DewormingRecordResponseBuilder)? updates]) =>
      (DewormingRecordResponseBuilder()..update(updates))._build();

  _$DewormingRecordResponse._(
      {required this.id,
      required this.petId,
      required this.dewormingType,
      this.dewormingMedicineName,
      this.dewormingDosage,
      this.dewormingLocation,
      this.dewormingValidity,
      this.dewormingNextDate,
      required this.createdAt,
      required this.recordDate})
      : super._();
  @override
  DewormingRecordResponse rebuild(
          void Function(DewormingRecordResponseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  DewormingRecordResponseBuilder toBuilder() =>
      DewormingRecordResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is DewormingRecordResponse &&
        id == other.id &&
        petId == other.petId &&
        dewormingType == other.dewormingType &&
        dewormingMedicineName == other.dewormingMedicineName &&
        dewormingDosage == other.dewormingDosage &&
        dewormingLocation == other.dewormingLocation &&
        dewormingValidity == other.dewormingValidity &&
        dewormingNextDate == other.dewormingNextDate &&
        createdAt == other.createdAt &&
        recordDate == other.recordDate;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, petId.hashCode);
    _$hash = $jc(_$hash, dewormingType.hashCode);
    _$hash = $jc(_$hash, dewormingMedicineName.hashCode);
    _$hash = $jc(_$hash, dewormingDosage.hashCode);
    _$hash = $jc(_$hash, dewormingLocation.hashCode);
    _$hash = $jc(_$hash, dewormingValidity.hashCode);
    _$hash = $jc(_$hash, dewormingNextDate.hashCode);
    _$hash = $jc(_$hash, createdAt.hashCode);
    _$hash = $jc(_$hash, recordDate.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'DewormingRecordResponse')
          ..add('id', id)
          ..add('petId', petId)
          ..add('dewormingType', dewormingType)
          ..add('dewormingMedicineName', dewormingMedicineName)
          ..add('dewormingDosage', dewormingDosage)
          ..add('dewormingLocation', dewormingLocation)
          ..add('dewormingValidity', dewormingValidity)
          ..add('dewormingNextDate', dewormingNextDate)
          ..add('createdAt', createdAt)
          ..add('recordDate', recordDate))
        .toString();
  }
}

class DewormingRecordResponseBuilder
    implements
        Builder<DewormingRecordResponse, DewormingRecordResponseBuilder> {
  _$DewormingRecordResponse? _$v;

  int? _id;
  int? get id => _$this._id;
  set id(int? id) => _$this._id = id;

  int? _petId;
  int? get petId => _$this._petId;
  set petId(int? petId) => _$this._petId = petId;

  String? _dewormingType;
  String? get dewormingType => _$this._dewormingType;
  set dewormingType(String? dewormingType) =>
      _$this._dewormingType = dewormingType;

  String? _dewormingMedicineName;
  String? get dewormingMedicineName => _$this._dewormingMedicineName;
  set dewormingMedicineName(String? dewormingMedicineName) =>
      _$this._dewormingMedicineName = dewormingMedicineName;

  String? _dewormingDosage;
  String? get dewormingDosage => _$this._dewormingDosage;
  set dewormingDosage(String? dewormingDosage) =>
      _$this._dewormingDosage = dewormingDosage;

  String? _dewormingLocation;
  String? get dewormingLocation => _$this._dewormingLocation;
  set dewormingLocation(String? dewormingLocation) =>
      _$this._dewormingLocation = dewormingLocation;

  String? _dewormingValidity;
  String? get dewormingValidity => _$this._dewormingValidity;
  set dewormingValidity(String? dewormingValidity) =>
      _$this._dewormingValidity = dewormingValidity;

  Date? _dewormingNextDate;
  Date? get dewormingNextDate => _$this._dewormingNextDate;
  set dewormingNextDate(Date? dewormingNextDate) =>
      _$this._dewormingNextDate = dewormingNextDate;

  String? _createdAt;
  String? get createdAt => _$this._createdAt;
  set createdAt(String? createdAt) => _$this._createdAt = createdAt;

  String? _recordDate;
  String? get recordDate => _$this._recordDate;
  set recordDate(String? recordDate) => _$this._recordDate = recordDate;

  DewormingRecordResponseBuilder() {
    DewormingRecordResponse._defaults(this);
  }

  DewormingRecordResponseBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _petId = $v.petId;
      _dewormingType = $v.dewormingType;
      _dewormingMedicineName = $v.dewormingMedicineName;
      _dewormingDosage = $v.dewormingDosage;
      _dewormingLocation = $v.dewormingLocation;
      _dewormingValidity = $v.dewormingValidity;
      _dewormingNextDate = $v.dewormingNextDate;
      _createdAt = $v.createdAt;
      _recordDate = $v.recordDate;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(DewormingRecordResponse other) {
    _$v = other as _$DewormingRecordResponse;
  }

  @override
  void update(void Function(DewormingRecordResponseBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  DewormingRecordResponse build() => _build();

  _$DewormingRecordResponse _build() {
    final _$result = _$v ??
        _$DewormingRecordResponse._(
          id: BuiltValueNullFieldError.checkNotNull(
              id, r'DewormingRecordResponse', 'id'),
          petId: BuiltValueNullFieldError.checkNotNull(
              petId, r'DewormingRecordResponse', 'petId'),
          dewormingType: BuiltValueNullFieldError.checkNotNull(
              dewormingType, r'DewormingRecordResponse', 'dewormingType'),
          dewormingMedicineName: dewormingMedicineName,
          dewormingDosage: dewormingDosage,
          dewormingLocation: dewormingLocation,
          dewormingValidity: dewormingValidity,
          dewormingNextDate: dewormingNextDate,
          createdAt: BuiltValueNullFieldError.checkNotNull(
              createdAt, r'DewormingRecordResponse', 'createdAt'),
          recordDate: BuiltValueNullFieldError.checkNotNull(
              recordDate, r'DewormingRecordResponse', 'recordDate'),
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
