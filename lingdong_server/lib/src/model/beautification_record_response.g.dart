// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'beautification_record_response.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$BeautificationRecordResponse extends BeautificationRecordResponse {
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
  @override
  final int id;
  @override
  final String createdAt;
  @override
  final String recordDate;

  factory _$BeautificationRecordResponse(
          [void Function(BeautificationRecordResponseBuilder)? updates]) =>
      (BeautificationRecordResponseBuilder()..update(updates))._build();

  _$BeautificationRecordResponse._(
      {required this.petId,
      required this.groomingType,
      required this.groomingDate,
      required this.groomingEstablishment,
      this.groomerName,
      required this.services,
      this.productsUsed,
      this.notes,
      this.nextGroomingDate,
      required this.id,
      required this.createdAt,
      required this.recordDate})
      : super._();
  @override
  BeautificationRecordResponse rebuild(
          void Function(BeautificationRecordResponseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  BeautificationRecordResponseBuilder toBuilder() =>
      BeautificationRecordResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is BeautificationRecordResponse &&
        petId == other.petId &&
        groomingType == other.groomingType &&
        groomingDate == other.groomingDate &&
        groomingEstablishment == other.groomingEstablishment &&
        groomerName == other.groomerName &&
        services == other.services &&
        productsUsed == other.productsUsed &&
        notes == other.notes &&
        nextGroomingDate == other.nextGroomingDate &&
        id == other.id &&
        createdAt == other.createdAt &&
        recordDate == other.recordDate;
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
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, createdAt.hashCode);
    _$hash = $jc(_$hash, recordDate.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'BeautificationRecordResponse')
          ..add('petId', petId)
          ..add('groomingType', groomingType)
          ..add('groomingDate', groomingDate)
          ..add('groomingEstablishment', groomingEstablishment)
          ..add('groomerName', groomerName)
          ..add('services', services)
          ..add('productsUsed', productsUsed)
          ..add('notes', notes)
          ..add('nextGroomingDate', nextGroomingDate)
          ..add('id', id)
          ..add('createdAt', createdAt)
          ..add('recordDate', recordDate))
        .toString();
  }
}

class BeautificationRecordResponseBuilder
    implements
        Builder<BeautificationRecordResponse,
            BeautificationRecordResponseBuilder> {
  _$BeautificationRecordResponse? _$v;

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

  int? _id;
  int? get id => _$this._id;
  set id(int? id) => _$this._id = id;

  String? _createdAt;
  String? get createdAt => _$this._createdAt;
  set createdAt(String? createdAt) => _$this._createdAt = createdAt;

  String? _recordDate;
  String? get recordDate => _$this._recordDate;
  set recordDate(String? recordDate) => _$this._recordDate = recordDate;

  BeautificationRecordResponseBuilder() {
    BeautificationRecordResponse._defaults(this);
  }

  BeautificationRecordResponseBuilder get _$this {
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
      _id = $v.id;
      _createdAt = $v.createdAt;
      _recordDate = $v.recordDate;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(BeautificationRecordResponse other) {
    _$v = other as _$BeautificationRecordResponse;
  }

  @override
  void update(void Function(BeautificationRecordResponseBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  BeautificationRecordResponse build() => _build();

  _$BeautificationRecordResponse _build() {
    _$BeautificationRecordResponse _$result;
    try {
      _$result = _$v ??
          _$BeautificationRecordResponse._(
            petId: BuiltValueNullFieldError.checkNotNull(
                petId, r'BeautificationRecordResponse', 'petId'),
            groomingType: BuiltValueNullFieldError.checkNotNull(
                groomingType, r'BeautificationRecordResponse', 'groomingType'),
            groomingDate: BuiltValueNullFieldError.checkNotNull(
                groomingDate, r'BeautificationRecordResponse', 'groomingDate'),
            groomingEstablishment: BuiltValueNullFieldError.checkNotNull(
                groomingEstablishment,
                r'BeautificationRecordResponse',
                'groomingEstablishment'),
            groomerName: groomerName,
            services: services.build(),
            productsUsed: _productsUsed?.build(),
            notes: notes,
            nextGroomingDate: nextGroomingDate,
            id: BuiltValueNullFieldError.checkNotNull(
                id, r'BeautificationRecordResponse', 'id'),
            createdAt: BuiltValueNullFieldError.checkNotNull(
                createdAt, r'BeautificationRecordResponse', 'createdAt'),
            recordDate: BuiltValueNullFieldError.checkNotNull(
                recordDate, r'BeautificationRecordResponse', 'recordDate'),
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
            r'BeautificationRecordResponse', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
