// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vaccination_record_response.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$VaccinationRecordResponse extends VaccinationRecordResponse {
  @override
  final int petId;
  @override
  final String vaccinationType;
  @override
  final String? vaccineName;
  @override
  final String? vaccineManufacturer;
  @override
  final String? vaccineBatchNumber;
  @override
  final String? location;
  @override
  final String? validityPeriod;
  @override
  final Date? nextDueDate;
  @override
  final int id;

  factory _$VaccinationRecordResponse(
          [void Function(VaccinationRecordResponseBuilder)? updates]) =>
      (VaccinationRecordResponseBuilder()..update(updates))._build();

  _$VaccinationRecordResponse._(
      {required this.petId,
      required this.vaccinationType,
      this.vaccineName,
      this.vaccineManufacturer,
      this.vaccineBatchNumber,
      this.location,
      this.validityPeriod,
      this.nextDueDate,
      required this.id})
      : super._();
  @override
  VaccinationRecordResponse rebuild(
          void Function(VaccinationRecordResponseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  VaccinationRecordResponseBuilder toBuilder() =>
      VaccinationRecordResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is VaccinationRecordResponse &&
        petId == other.petId &&
        vaccinationType == other.vaccinationType &&
        vaccineName == other.vaccineName &&
        vaccineManufacturer == other.vaccineManufacturer &&
        vaccineBatchNumber == other.vaccineBatchNumber &&
        location == other.location &&
        validityPeriod == other.validityPeriod &&
        nextDueDate == other.nextDueDate &&
        id == other.id;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, petId.hashCode);
    _$hash = $jc(_$hash, vaccinationType.hashCode);
    _$hash = $jc(_$hash, vaccineName.hashCode);
    _$hash = $jc(_$hash, vaccineManufacturer.hashCode);
    _$hash = $jc(_$hash, vaccineBatchNumber.hashCode);
    _$hash = $jc(_$hash, location.hashCode);
    _$hash = $jc(_$hash, validityPeriod.hashCode);
    _$hash = $jc(_$hash, nextDueDate.hashCode);
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'VaccinationRecordResponse')
          ..add('petId', petId)
          ..add('vaccinationType', vaccinationType)
          ..add('vaccineName', vaccineName)
          ..add('vaccineManufacturer', vaccineManufacturer)
          ..add('vaccineBatchNumber', vaccineBatchNumber)
          ..add('location', location)
          ..add('validityPeriod', validityPeriod)
          ..add('nextDueDate', nextDueDate)
          ..add('id', id))
        .toString();
  }
}

class VaccinationRecordResponseBuilder
    implements
        Builder<VaccinationRecordResponse, VaccinationRecordResponseBuilder> {
  _$VaccinationRecordResponse? _$v;

  int? _petId;
  int? get petId => _$this._petId;
  set petId(int? petId) => _$this._petId = petId;

  String? _vaccinationType;
  String? get vaccinationType => _$this._vaccinationType;
  set vaccinationType(String? vaccinationType) =>
      _$this._vaccinationType = vaccinationType;

  String? _vaccineName;
  String? get vaccineName => _$this._vaccineName;
  set vaccineName(String? vaccineName) => _$this._vaccineName = vaccineName;

  String? _vaccineManufacturer;
  String? get vaccineManufacturer => _$this._vaccineManufacturer;
  set vaccineManufacturer(String? vaccineManufacturer) =>
      _$this._vaccineManufacturer = vaccineManufacturer;

  String? _vaccineBatchNumber;
  String? get vaccineBatchNumber => _$this._vaccineBatchNumber;
  set vaccineBatchNumber(String? vaccineBatchNumber) =>
      _$this._vaccineBatchNumber = vaccineBatchNumber;

  String? _location;
  String? get location => _$this._location;
  set location(String? location) => _$this._location = location;

  String? _validityPeriod;
  String? get validityPeriod => _$this._validityPeriod;
  set validityPeriod(String? validityPeriod) =>
      _$this._validityPeriod = validityPeriod;

  Date? _nextDueDate;
  Date? get nextDueDate => _$this._nextDueDate;
  set nextDueDate(Date? nextDueDate) => _$this._nextDueDate = nextDueDate;

  int? _id;
  int? get id => _$this._id;
  set id(int? id) => _$this._id = id;

  VaccinationRecordResponseBuilder() {
    VaccinationRecordResponse._defaults(this);
  }

  VaccinationRecordResponseBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _petId = $v.petId;
      _vaccinationType = $v.vaccinationType;
      _vaccineName = $v.vaccineName;
      _vaccineManufacturer = $v.vaccineManufacturer;
      _vaccineBatchNumber = $v.vaccineBatchNumber;
      _location = $v.location;
      _validityPeriod = $v.validityPeriod;
      _nextDueDate = $v.nextDueDate;
      _id = $v.id;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(VaccinationRecordResponse other) {
    _$v = other as _$VaccinationRecordResponse;
  }

  @override
  void update(void Function(VaccinationRecordResponseBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  VaccinationRecordResponse build() => _build();

  _$VaccinationRecordResponse _build() {
    final _$result = _$v ??
        _$VaccinationRecordResponse._(
          petId: BuiltValueNullFieldError.checkNotNull(
              petId, r'VaccinationRecordResponse', 'petId'),
          vaccinationType: BuiltValueNullFieldError.checkNotNull(
              vaccinationType, r'VaccinationRecordResponse', 'vaccinationType'),
          vaccineName: vaccineName,
          vaccineManufacturer: vaccineManufacturer,
          vaccineBatchNumber: vaccineBatchNumber,
          location: location,
          validityPeriod: validityPeriod,
          nextDueDate: nextDueDate,
          id: BuiltValueNullFieldError.checkNotNull(
              id, r'VaccinationRecordResponse', 'id'),
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
