// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'medication.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$Medication extends Medication {
  @override
  final String name;
  @override
  final String dosage;
  @override
  final String frequency;

  factory _$Medication([void Function(MedicationBuilder)? updates]) =>
      (MedicationBuilder()..update(updates))._build();

  _$Medication._(
      {required this.name, required this.dosage, required this.frequency})
      : super._();
  @override
  Medication rebuild(void Function(MedicationBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  MedicationBuilder toBuilder() => MedicationBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Medication &&
        name == other.name &&
        dosage == other.dosage &&
        frequency == other.frequency;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, dosage.hashCode);
    _$hash = $jc(_$hash, frequency.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'Medication')
          ..add('name', name)
          ..add('dosage', dosage)
          ..add('frequency', frequency))
        .toString();
  }
}

class MedicationBuilder implements Builder<Medication, MedicationBuilder> {
  _$Medication? _$v;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  String? _dosage;
  String? get dosage => _$this._dosage;
  set dosage(String? dosage) => _$this._dosage = dosage;

  String? _frequency;
  String? get frequency => _$this._frequency;
  set frequency(String? frequency) => _$this._frequency = frequency;

  MedicationBuilder() {
    Medication._defaults(this);
  }

  MedicationBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _name = $v.name;
      _dosage = $v.dosage;
      _frequency = $v.frequency;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Medication other) {
    _$v = other as _$Medication;
  }

  @override
  void update(void Function(MedicationBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  Medication build() => _build();

  _$Medication _build() {
    final _$result = _$v ??
        _$Medication._(
          name: BuiltValueNullFieldError.checkNotNull(
              name, r'Medication', 'name'),
          dosage: BuiltValueNullFieldError.checkNotNull(
              dosage, r'Medication', 'dosage'),
          frequency: BuiltValueNullFieldError.checkNotNull(
              frequency, r'Medication', 'frequency'),
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
