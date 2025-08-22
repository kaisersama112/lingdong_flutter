// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vaccination_record_create.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$VaccinationRecordCreate extends VaccinationRecordCreate {
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

  factory _$VaccinationRecordCreate(
          [void Function(VaccinationRecordCreateBuilder)? updates]) =>
      (VaccinationRecordCreateBuilder()..update(updates))._build();

  _$VaccinationRecordCreate._(
      {required this.petId,
      required this.vaccinationType,
      this.vaccineName,
      this.vaccineManufacturer,
      this.vaccineBatchNumber,
      this.location,
      this.validityPeriod,
      this.nextDueDate})
      : super._();
  @override
  VaccinationRecordCreate rebuild(
          void Function(VaccinationRecordCreateBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  VaccinationRecordCreateBuilder toBuilder() =>
      VaccinationRecordCreateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is VaccinationRecordCreate &&
        petId == other.petId &&
        vaccinationType == other.vaccinationType &&
        vaccineName == other.vaccineName &&
        vaccineManufacturer == other.vaccineManufacturer &&
        vaccineBatchNumber == other.vaccineBatchNumber &&
        location == other.location &&
        validityPeriod == other.validityPeriod &&
        nextDueDate == other.nextDueDate;
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
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'VaccinationRecordCreate')
          ..add('petId', petId)
          ..add('vaccinationType', vaccinationType)
          ..add('vaccineName', vaccineName)
          ..add('vaccineManufacturer', vaccineManufacturer)
          ..add('vaccineBatchNumber', vaccineBatchNumber)
          ..add('location', location)
          ..add('validityPeriod', validityPeriod)
          ..add('nextDueDate', nextDueDate))
        .toString();
  }
}

class VaccinationRecordCreateBuilder
    implements
        Builder<VaccinationRecordCreate, VaccinationRecordCreateBuilder> {
  _$VaccinationRecordCreate? _$v;

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

  VaccinationRecordCreateBuilder() {
    VaccinationRecordCreate._defaults(this);
  }

  VaccinationRecordCreateBuilder get _$this {
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
      _$v = null;
    }
    return this;
  }

  @override
  void replace(VaccinationRecordCreate other) {
    _$v = other as _$VaccinationRecordCreate;
  }

  @override
  void update(void Function(VaccinationRecordCreateBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  VaccinationRecordCreate build() => _build();

  _$VaccinationRecordCreate _build() {
    final _$result = _$v ??
        _$VaccinationRecordCreate._(
          petId: BuiltValueNullFieldError.checkNotNull(
              petId, r'VaccinationRecordCreate', 'petId'),
          vaccinationType: BuiltValueNullFieldError.checkNotNull(
              vaccinationType, r'VaccinationRecordCreate', 'vaccinationType'),
          vaccineName: vaccineName,
          vaccineManufacturer: vaccineManufacturer,
          vaccineBatchNumber: vaccineBatchNumber,
          location: location,
          validityPeriod: validityPeriod,
          nextDueDate: nextDueDate,
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
