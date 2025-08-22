// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'beautification_record_create.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$BeautificationRecordCreate extends BeautificationRecordCreate {
  @override
  final int petId;
  @override
  final String groomingType;
  @override
  final Date groomingDate;
  @override
  final String groomingEstablishment;
  @override
  final String? groomerName;
  @override
  final BuiltList<String> services;
  @override
  final BuiltList<String>? productsUsed;
  @override
  final String? notes;
  @override
  final Date? nextGroomingDate;

  factory _$BeautificationRecordCreate(
          [void Function(BeautificationRecordCreateBuilder)? updates]) =>
      (BeautificationRecordCreateBuilder()..update(updates))._build();

  _$BeautificationRecordCreate._(
      {required this.petId,
      required this.groomingType,
      required this.groomingDate,
      required this.groomingEstablishment,
      this.groomerName,
      required this.services,
      this.productsUsed,
      this.notes,
      this.nextGroomingDate})
      : super._();
  @override
  BeautificationRecordCreate rebuild(
          void Function(BeautificationRecordCreateBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  BeautificationRecordCreateBuilder toBuilder() =>
      BeautificationRecordCreateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is BeautificationRecordCreate &&
        petId == other.petId &&
        groomingType == other.groomingType &&
        groomingDate == other.groomingDate &&
        groomingEstablishment == other.groomingEstablishment &&
        groomerName == other.groomerName &&
        services == other.services &&
        productsUsed == other.productsUsed &&
        notes == other.notes &&
        nextGroomingDate == other.nextGroomingDate;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, petId.hashCode);
    _$hash = $jc(_$hash, groomingType.hashCode);
    _$hash = $jc(_$hash, groomingDate.hashCode);
    _$hash = $jc(_$hash, groomingEstablishment.hashCode);
    _$hash = $jc(_$hash, groomerName.hashCode);
    _$hash = $jc(_$hash, services.hashCode);
    _$hash = $jc(_$hash, productsUsed.hashCode);
    _$hash = $jc(_$hash, notes.hashCode);
    _$hash = $jc(_$hash, nextGroomingDate.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'BeautificationRecordCreate')
          ..add('petId', petId)
          ..add('groomingType', groomingType)
          ..add('groomingDate', groomingDate)
          ..add('groomingEstablishment', groomingEstablishment)
          ..add('groomerName', groomerName)
          ..add('services', services)
          ..add('productsUsed', productsUsed)
          ..add('notes', notes)
          ..add('nextGroomingDate', nextGroomingDate))
        .toString();
  }
}

class BeautificationRecordCreateBuilder
    implements
        Builder<BeautificationRecordCreate, BeautificationRecordCreateBuilder> {
  _$BeautificationRecordCreate? _$v;

  int? _petId;
  int? get petId => _$this._petId;
  set petId(int? petId) => _$this._petId = petId;

  String? _groomingType;
  String? get groomingType => _$this._groomingType;
  set groomingType(String? groomingType) => _$this._groomingType = groomingType;

  Date? _groomingDate;
  Date? get groomingDate => _$this._groomingDate;
  set groomingDate(Date? groomingDate) => _$this._groomingDate = groomingDate;

  String? _groomingEstablishment;
  String? get groomingEstablishment => _$this._groomingEstablishment;
  set groomingEstablishment(String? groomingEstablishment) =>
      _$this._groomingEstablishment = groomingEstablishment;

  String? _groomerName;
  String? get groomerName => _$this._groomerName;
  set groomerName(String? groomerName) => _$this._groomerName = groomerName;

  ListBuilder<String>? _services;
  ListBuilder<String> get services =>
      _$this._services ??= ListBuilder<String>();
  set services(ListBuilder<String>? services) => _$this._services = services;

  ListBuilder<String>? _productsUsed;
  ListBuilder<String> get productsUsed =>
      _$this._productsUsed ??= ListBuilder<String>();
  set productsUsed(ListBuilder<String>? productsUsed) =>
      _$this._productsUsed = productsUsed;

  String? _notes;
  String? get notes => _$this._notes;
  set notes(String? notes) => _$this._notes = notes;

  Date? _nextGroomingDate;
  Date? get nextGroomingDate => _$this._nextGroomingDate;
  set nextGroomingDate(Date? nextGroomingDate) =>
      _$this._nextGroomingDate = nextGroomingDate;

  BeautificationRecordCreateBuilder() {
    BeautificationRecordCreate._defaults(this);
  }

  BeautificationRecordCreateBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _petId = $v.petId;
      _groomingType = $v.groomingType;
      _groomingDate = $v.groomingDate;
      _groomingEstablishment = $v.groomingEstablishment;
      _groomerName = $v.groomerName;
      _services = $v.services.toBuilder();
      _productsUsed = $v.productsUsed?.toBuilder();
      _notes = $v.notes;
      _nextGroomingDate = $v.nextGroomingDate;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(BeautificationRecordCreate other) {
    _$v = other as _$BeautificationRecordCreate;
  }

  @override
  void update(void Function(BeautificationRecordCreateBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  BeautificationRecordCreate build() => _build();

  _$BeautificationRecordCreate _build() {
    _$BeautificationRecordCreate _$result;
    try {
      _$result = _$v ??
          _$BeautificationRecordCreate._(
            petId: BuiltValueNullFieldError.checkNotNull(
                petId, r'BeautificationRecordCreate', 'petId'),
            groomingType: BuiltValueNullFieldError.checkNotNull(
                groomingType, r'BeautificationRecordCreate', 'groomingType'),
            groomingDate: BuiltValueNullFieldError.checkNotNull(
                groomingDate, r'BeautificationRecordCreate', 'groomingDate'),
            groomingEstablishment: BuiltValueNullFieldError.checkNotNull(
                groomingEstablishment,
                r'BeautificationRecordCreate',
                'groomingEstablishment'),
            groomerName: groomerName,
            services: services.build(),
            productsUsed: _productsUsed?.build(),
            notes: notes,
            nextGroomingDate: nextGroomingDate,
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'services';
        services.build();
        _$failedField = 'productsUsed';
        _productsUsed?.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'BeautificationRecordCreate', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
