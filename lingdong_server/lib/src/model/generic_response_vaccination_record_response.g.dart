// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'generic_response_vaccination_record_response.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$GenericResponseVaccinationRecordResponse
    extends GenericResponseVaccinationRecordResponse {
  @override
  final int? code;
  @override
  final String? msg;
  @override
  final VaccinationRecordResponse? data;

  factory _$GenericResponseVaccinationRecordResponse(
          [void Function(GenericResponseVaccinationRecordResponseBuilder)?
              updates]) =>
      (GenericResponseVaccinationRecordResponseBuilder()..update(updates))
          ._build();

  _$GenericResponseVaccinationRecordResponse._({this.code, this.msg, this.data})
      : super._();
  @override
  GenericResponseVaccinationRecordResponse rebuild(
          void Function(GenericResponseVaccinationRecordResponseBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GenericResponseVaccinationRecordResponseBuilder toBuilder() =>
      GenericResponseVaccinationRecordResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GenericResponseVaccinationRecordResponse &&
        code == other.code &&
        msg == other.msg &&
        data == other.data;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, code.hashCode);
    _$hash = $jc(_$hash, msg.hashCode);
    _$hash = $jc(_$hash, data.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(
            r'GenericResponseVaccinationRecordResponse')
          ..add('code', code)
          ..add('msg', msg)
          ..add('data', data))
        .toString();
  }
}

class GenericResponseVaccinationRecordResponseBuilder
    implements
        Builder<GenericResponseVaccinationRecordResponse,
            GenericResponseVaccinationRecordResponseBuilder> {
  _$GenericResponseVaccinationRecordResponse? _$v;

  int? _code;
  int? get code => _$this._code;
  set code(int? code) => _$this._code = code;

  String? _msg;
  String? get msg => _$this._msg;
  set msg(String? msg) => _$this._msg = msg;

  VaccinationRecordResponseBuilder? _data;
  VaccinationRecordResponseBuilder get data =>
      _$this._data ??= VaccinationRecordResponseBuilder();
  set data(VaccinationRecordResponseBuilder? data) => _$this._data = data;

  GenericResponseVaccinationRecordResponseBuilder() {
    GenericResponseVaccinationRecordResponse._defaults(this);
  }

  GenericResponseVaccinationRecordResponseBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _code = $v.code;
      _msg = $v.msg;
      _data = $v.data?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GenericResponseVaccinationRecordResponse other) {
    _$v = other as _$GenericResponseVaccinationRecordResponse;
  }

  @override
  void update(
      void Function(GenericResponseVaccinationRecordResponseBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GenericResponseVaccinationRecordResponse build() => _build();

  _$GenericResponseVaccinationRecordResponse _build() {
    _$GenericResponseVaccinationRecordResponse _$result;
    try {
      _$result = _$v ??
          _$GenericResponseVaccinationRecordResponse._(
            code: code,
            msg: msg,
            data: _data?.build(),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'data';
        _data?.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'GenericResponseVaccinationRecordResponse',
            _$failedField,
            e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
