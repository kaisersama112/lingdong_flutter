// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'consultation_create.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$ConsultationCreate extends ConsultationCreate {
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

  factory _$ConsultationCreate(
          [void Function(ConsultationCreateBuilder)? updates]) =>
      (ConsultationCreateBuilder()..update(updates))._build();

  _$ConsultationCreate._(
      {required this.petId,
      required this.consultationType,
      required this.hospitalName,
      required this.visitDate,
      required this.symptoms,
      required this.diagnosis,
      required this.treatmentPlan,
      required this.medications,
      this.doctorName,
      this.doctorPhone,
      this.doctorEmail})
      : super._();
  @override
  ConsultationCreate rebuild(
          void Function(ConsultationCreateBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ConsultationCreateBuilder toBuilder() =>
      ConsultationCreateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ConsultationCreate &&
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
        doctorEmail == other.doctorEmail;
  }

  @override
  int get hashCode {
    var _$hash = 0;
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
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ConsultationCreate')
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
          ..add('doctorEmail', doctorEmail))
        .toString();
  }
}

class ConsultationCreateBuilder
    implements Builder<ConsultationCreate, ConsultationCreateBuilder> {
  _$ConsultationCreate? _$v;

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

  ConsultationCreateBuilder() {
    ConsultationCreate._defaults(this);
  }

  ConsultationCreateBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
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
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ConsultationCreate other) {
    _$v = other as _$ConsultationCreate;
  }

  @override
  void update(void Function(ConsultationCreateBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ConsultationCreate build() => _build();

  _$ConsultationCreate _build() {
    _$ConsultationCreate _$result;
    try {
      _$result = _$v ??
          _$ConsultationCreate._(
            petId: BuiltValueNullFieldError.checkNotNull(
                petId, r'ConsultationCreate', 'petId'),
            consultationType: BuiltValueNullFieldError.checkNotNull(
                consultationType, r'ConsultationCreate', 'consultationType'),
            hospitalName: BuiltValueNullFieldError.checkNotNull(
                hospitalName, r'ConsultationCreate', 'hospitalName'),
            visitDate: BuiltValueNullFieldError.checkNotNull(
                visitDate, r'ConsultationCreate', 'visitDate'),
            symptoms: BuiltValueNullFieldError.checkNotNull(
                symptoms, r'ConsultationCreate', 'symptoms'),
            diagnosis: BuiltValueNullFieldError.checkNotNull(
                diagnosis, r'ConsultationCreate', 'diagnosis'),
            treatmentPlan: BuiltValueNullFieldError.checkNotNull(
                treatmentPlan, r'ConsultationCreate', 'treatmentPlan'),
            medications: medications.build(),
            doctorName: doctorName,
            doctorPhone: doctorPhone,
            doctorEmail: doctorEmail,
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'medications';
        medications.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'ConsultationCreate', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
