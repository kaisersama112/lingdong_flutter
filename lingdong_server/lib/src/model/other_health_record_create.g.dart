// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'other_health_record_create.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$OtherHealthRecordCreate extends OtherHealthRecordCreate {
  @override
  final int petId;
  @override
  final String otherType;
  @override
  final BuiltMap<String, JsonObject?> details;

  factory _$OtherHealthRecordCreate(
          [void Function(OtherHealthRecordCreateBuilder)? updates]) =>
      (OtherHealthRecordCreateBuilder()..update(updates))._build();

  _$OtherHealthRecordCreate._(
      {required this.petId, required this.otherType, required this.details})
      : super._();
  @override
  OtherHealthRecordCreate rebuild(
          void Function(OtherHealthRecordCreateBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  OtherHealthRecordCreateBuilder toBuilder() =>
      OtherHealthRecordCreateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is OtherHealthRecordCreate &&
        petId == other.petId &&
        otherType == other.otherType &&
        details == other.details;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, petId.hashCode);
    _$hash = $jc(_$hash, otherType.hashCode);
    _$hash = $jc(_$hash, details.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'OtherHealthRecordCreate')
          ..add('petId', petId)
          ..add('otherType', otherType)
          ..add('details', details))
        .toString();
  }
}

class OtherHealthRecordCreateBuilder
    implements
        Builder<OtherHealthRecordCreate, OtherHealthRecordCreateBuilder> {
  _$OtherHealthRecordCreate? _$v;

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

  OtherHealthRecordCreateBuilder() {
    OtherHealthRecordCreate._defaults(this);
  }

  OtherHealthRecordCreateBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _petId = $v.petId;
      _otherType = $v.otherType;
      _details = $v.details.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(OtherHealthRecordCreate other) {
    _$v = other as _$OtherHealthRecordCreate;
  }

  @override
  void update(void Function(OtherHealthRecordCreateBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  OtherHealthRecordCreate build() => _build();

  _$OtherHealthRecordCreate _build() {
    _$OtherHealthRecordCreate _$result;
    try {
      _$result = _$v ??
          _$OtherHealthRecordCreate._(
            petId: BuiltValueNullFieldError.checkNotNull(
                petId, r'OtherHealthRecordCreate', 'petId'),
            otherType: BuiltValueNullFieldError.checkNotNull(
                otherType, r'OtherHealthRecordCreate', 'otherType'),
            details: details.build(),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'details';
        details.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'OtherHealthRecordCreate', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
