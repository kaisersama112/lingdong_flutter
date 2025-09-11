// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'generic_response_pagination_response_vaccination_record_response.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$GenericResponsePaginationResponseVaccinationRecordResponse
    extends GenericResponsePaginationResponseVaccinationRecordResponse {
  @override
  final int? code;
  @override
  final String? msg;
  @override
  final PaginationResponseVaccinationRecordResponse? data;

  factory _$GenericResponsePaginationResponseVaccinationRecordResponse(
          [void Function(
                  GenericResponsePaginationResponseVaccinationRecordResponseBuilder)?
              updates]) =>
      (GenericResponsePaginationResponseVaccinationRecordResponseBuilder()
            ..update(updates))
          ._build();

  _$GenericResponsePaginationResponseVaccinationRecordResponse._(
      {this.code, this.msg, this.data})
      : super._();
  @override
  GenericResponsePaginationResponseVaccinationRecordResponse rebuild(
          void Function(
                  GenericResponsePaginationResponseVaccinationRecordResponseBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GenericResponsePaginationResponseVaccinationRecordResponseBuilder
      toBuilder() =>
          GenericResponsePaginationResponseVaccinationRecordResponseBuilder()
            ..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other
            is GenericResponsePaginationResponseVaccinationRecordResponse &&
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
            r'GenericResponsePaginationResponseVaccinationRecordResponse')
          ..add('code', code)
          ..add('msg', msg)
          ..add('data', data))
        .toString();
  }
}

class GenericResponsePaginationResponseVaccinationRecordResponseBuilder
    implements
        Builder<GenericResponsePaginationResponseVaccinationRecordResponse,
            GenericResponsePaginationResponseVaccinationRecordResponseBuilder> {
  _$GenericResponsePaginationResponseVaccinationRecordResponse? _$v;

  int? _code;
  int? get code => _$this._code;
  set code(int? code) => _$this._code = code;

  String? _msg;
  String? get msg => _$this._msg;
  set msg(String? msg) => _$this._msg = msg;

  PaginationResponseVaccinationRecordResponseBuilder? _data;
  PaginationResponseVaccinationRecordResponseBuilder get data =>
      _$this._data ??= PaginationResponseVaccinationRecordResponseBuilder();
  set data(PaginationResponseVaccinationRecordResponseBuilder? data) =>
      _$this._data = data;

  GenericResponsePaginationResponseVaccinationRecordResponseBuilder() {
    GenericResponsePaginationResponseVaccinationRecordResponse._defaults(this);
  }

  GenericResponsePaginationResponseVaccinationRecordResponseBuilder get _$this {
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
  void replace(
      GenericResponsePaginationResponseVaccinationRecordResponse other) {
    _$v = other as _$GenericResponsePaginationResponseVaccinationRecordResponse;
  }

  @override
  void update(
      void Function(
              GenericResponsePaginationResponseVaccinationRecordResponseBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  GenericResponsePaginationResponseVaccinationRecordResponse build() =>
      _build();

  _$GenericResponsePaginationResponseVaccinationRecordResponse _build() {
    _$GenericResponsePaginationResponseVaccinationRecordResponse _$result;
    try {
      _$result = _$v ??
          _$GenericResponsePaginationResponseVaccinationRecordResponse._(
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
            r'GenericResponsePaginationResponseVaccinationRecordResponse',
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
