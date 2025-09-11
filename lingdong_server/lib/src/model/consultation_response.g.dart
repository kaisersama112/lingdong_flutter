// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'consultation_response.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$ConsultationResponse extends ConsultationResponse {
  @override
  final int id;
  @override
  final int petId;
  @override
  final String consultationType;
  @override
  final String hospitalName;
  @override
  final Date visitDate;
  @override
  final String symptoms;
  @override
  final String diagnosis;
  @override
  final String treatmentPlan;
  @override
  final BuiltList<Medication> medications;
  @override
  final String? doctorName;
  @override
  final String? doctorPhone;
  @override
  final String? doctorEmail;
  @override
  final DateTime createdAt;
  @override
  final Date recordDate;

  factory _$ConsultationResponse(
          [void Function(ConsultationResponseBuilder)? updates]) =>
      (ConsultationResponseBuilder()..update(updates))._build();

  _$ConsultationResponse._(
      {required this.id,
      required this.petId,
      required this.consultationType,
      required this.hospitalName,
      required this.visitDate,
      required this.symptoms,
      required this.diagnosis,
      required this.treatmentPlan,
      required this.medications,
      this.doctorName,
      this.doctorPhone,
      this.doctorEmail,
      required this.createdAt,
      required this.recordDate})
      : super._();
  @override
  ConsultationResponse rebuild(
          void Function(ConsultationResponseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ConsultationResponseBuilder toBuilder() =>
      ConsultationResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ConsultationResponse &&
        id == other.id &&
        petId == other.petId &&
        consultationType == other.consultationType &&
        hospitalName == other.hospitalName &&
        visitDate == other.visitDate &&
        symptoms == other.symptoms &&
        diagnosis == other.diagnosis &&
        treatmentPlan == other.treatmentPlan &&
        medications == other.medications &&
        doctorName == other.doctorName &&
        doctorPhone == other.doctorPhone &&
        doctorEmail == other.doctorEmail &&
        createdAt == other.createdAt &&
        recordDate == other.recordDate;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, petId.hashCode);
    _$hash = $jc(_$hash, consultationType.hashCode);
    _$hash = $jc(_$hash, hospitalName.hashCode);
    _$hash = $jc(_$hash, visitDate.hashCode);
    _$hash = $jc(_$hash, symptoms.hashCode);
    _$hash = $jc(_$hash, diagnosis.hashCode);
    _$hash = $jc(_$hash, treatmentPlan.hashCode);
    _$hash = $jc(_$hash, medications.hashCode);
    _$hash = $jc(_$hash, doctorName.hashCode);
    _$hash = $jc(_$hash, doctorPhone.hashCode);
    _$hash = $jc(_$hash, doctorEmail.hashCode);
    _$hash = $jc(_$hash, createdAt.hashCode);
    _$hash = $jc(_$hash, recordDate.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ConsultationResponse')
          ..add('id', id)
          ..add('petId', petId)
          ..add('consultationType', consultationType)
          ..add('hospitalName', hospitalName)
          ..add('visitDate', visitDate)
          ..add('symptoms', symptoms)
          ..add('diagnosis', diagnosis)
          ..add('treatmentPlan', treatmentPlan)
          ..add('medications', medications)
          ..add('doctorName', doctorName)
          ..add('doctorPhone', doctorPhone)
          ..add('doctorEmail', doctorEmail)
          ..add('createdAt', createdAt)
          ..add('recordDate', recordDate))
        .toString();
  }
}

class ConsultationResponseBuilder
    implements Builder<ConsultationResponse, ConsultationResponseBuilder> {
  _$ConsultationResponse? _$v;

  int? _id;
  int? get id => _$this._id;
  set id(int? id) => _$this._id = id;

  int? _petId;
  int? get petId => _$this._petId;
  set petId(int? petId) => _$this._petId = petId;

  String? _consultationType;
  String? get consultationType => _$this._consultationType;
  set consultationType(String? consultationType) =>
      _$this._consultationType = consultationType;

  String? _hospitalName;
  String? get hospitalName => _$this._hospitalName;
  set hospitalName(String? hospitalName) => _$this._hospitalName = hospitalName;

  Date? _visitDate;
  Date? get visitDate => _$this._visitDate;
  set visitDate(Date? visitDate) => _$this._visitDate = visitDate;

  String? _symptoms;
  String? get symptoms => _$this._symptoms;
  set symptoms(String? symptoms) => _$this._symptoms = symptoms;

  String? _diagnosis;
  String? get diagnosis => _$this._diagnosis;
  set diagnosis(String? diagnosis) => _$this._diagnosis = diagnosis;

  String? _treatmentPlan;
  String? get treatmentPlan => _$this._treatmentPlan;
  set treatmentPlan(String? treatmentPlan) =>
      _$this._treatmentPlan = treatmentPlan;

  ListBuilder<Medication>? _medications;
  ListBuilder<Medication> get medications =>
      _$this._medications ??= ListBuilder<Medication>();
  set medications(ListBuilder<Medication>? medications) =>
      _$this._medications = medications;

  String? _doctorName;
  String? get doctorName => _$this._doctorName;
  set doctorName(String? doctorName) => _$this._doctorName = doctorName;

  String? _doctorPhone;
  String? get doctorPhone => _$this._doctorPhone;
  set doctorPhone(String? doctorPhone) => _$this._doctorPhone = doctorPhone;

  String? _doctorEmail;
  String? get doctorEmail => _$this._doctorEmail;
  set doctorEmail(String? doctorEmail) => _$this._doctorEmail = doctorEmail;

  DateTime? _createdAt;
  DateTime? get createdAt => _$this._createdAt;
  set createdAt(DateTime? createdAt) => _$this._createdAt = createdAt;

  Date? _recordDate;
  Date? get recordDate => _$this._recordDate;
  set recordDate(Date? recordDate) => _$this._recordDate = recordDate;

  ConsultationResponseBuilder() {
    ConsultationResponse._defaults(this);
  }

  ConsultationResponseBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _petId = $v.petId;
      _consultationType = $v.consultationType;
      _hospitalName = $v.hospitalName;
      _visitDate = $v.visitDate;
      _symptoms = $v.symptoms;
      _diagnosis = $v.diagnosis;
      _treatmentPlan = $v.treatmentPlan;
      _medications = $v.medications.toBuilder();
      _doctorName = $v.doctorName;
      _doctorPhone = $v.doctorPhone;
      _doctorEmail = $v.doctorEmail;
      _createdAt = $v.createdAt;
      _recordDate = $v.recordDate;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ConsultationResponse other) {
    _$v = other as _$ConsultationResponse;
  }

  @override
  void update(void Function(ConsultationResponseBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ConsultationResponse build() => _build();

  _$ConsultationResponse _build() {
    _$ConsultationResponse _$result;
    try {
      _$result = _$v ??
          _$ConsultationResponse._(
            id: BuiltValueNullFieldError.checkNotNull(
                id, r'ConsultationResponse', 'id'),
            petId: BuiltValueNullFieldError.checkNotNull(
                petId, r'ConsultationResponse', 'petId'),
            consultationType: BuiltValueNullFieldError.checkNotNull(
                consultationType, r'ConsultationResponse', 'consultationType'),
            hospitalName: BuiltValueNullFieldError.checkNotNull(
                hospitalName, r'ConsultationResponse', 'hospitalName'),
            visitDate: BuiltValueNullFieldError.checkNotNull(
                visitDate, r'ConsultationResponse', 'visitDate'),
            symptoms: BuiltValueNullFieldError.checkNotNull(
                symptoms, r'ConsultationResponse', 'symptoms'),
            diagnosis: BuiltValueNullFieldError.checkNotNull(
                diagnosis, r'ConsultationResponse', 'diagnosis'),
            treatmentPlan: BuiltValueNullFieldError.checkNotNull(
                treatmentPlan, r'ConsultationResponse', 'treatmentPlan'),
            medications: medications.build(),
            doctorName: doctorName,
            doctorPhone: doctorPhone,
            doctorEmail: doctorEmail,
            createdAt: BuiltValueNullFieldError.checkNotNull(
                createdAt, r'ConsultationResponse', 'createdAt'),
            recordDate: BuiltValueNullFieldError.checkNotNull(
                recordDate, r'ConsultationResponse', 'recordDate'),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'medications';
        medications.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'ConsultationResponse', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
