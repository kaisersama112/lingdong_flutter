// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'generic_response_pagination_response_examination_record_response.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$GenericResponsePaginationResponseExaminationRecordResponse
    extends GenericResponsePaginationResponseExaminationRecordResponse {
  @override
  final int? code;
  @override
  final String? msg;
  @override
  final PaginationResponseExaminationRecordResponse? data;

  factory _$GenericResponsePaginationResponseExaminationRecordResponse(
          [void Function(
                  GenericResponsePaginationResponseExaminationRecordResponseBuilder)?
              updates]) =>
      (GenericResponsePaginationResponseExaminationRecordResponseBuilder()
            ..update(updates))
          ._build();

  _$GenericResponsePaginationResponseExaminationRecordResponse._(
      {this.code, this.msg, this.data})
      : super._();
  @override
  GenericResponsePaginationResponseExaminationRecordResponse rebuild(
          void Function(
                  GenericResponsePaginationResponseExaminationRecordResponseBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GenericResponsePaginationResponseExaminationRecordResponseBuilder
      toBuilder() =>
          GenericResponsePaginationResponseExaminationRecordResponseBuilder()
            ..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other
            is GenericResponsePaginationResponseExaminationRecordResponse &&
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
            r'GenericResponsePaginationResponseExaminationRecordResponse')
          ..add('code', code)
          ..add('msg', msg)
          ..add('data', data))
        .toString();
  }
}

class GenericResponsePaginationResponseExaminationRecordResponseBuilder
    implements
        Builder<GenericResponsePaginationResponseExaminationRecordResponse,
            GenericResponsePaginationResponseExaminationRecordResponseBuilder> {
  _$GenericResponsePaginationResponseExaminationRecordResponse? _$v;

  int? _code;
  int? get code => _$this._code;
  set code(int? code) => _$this._code = code;

  String? _msg;
  String? get msg => _$this._msg;
  set msg(String? msg) => _$this._msg = msg;

  PaginationResponseExaminationRecordResponseBuilder? _data;
  PaginationResponseExaminationRecordResponseBuilder get data =>
      _$this._data ??= PaginationResponseExaminationRecordResponseBuilder();
  set data(PaginationResponseExaminationRecordResponseBuilder? data) =>
      _$this._data = data;

  GenericResponsePaginationResponseExaminationRecordResponseBuilder() {
    GenericResponsePaginationResponseExaminationRecordResponse._defaults(this);
  }

  GenericResponsePaginationResponseExaminationRecordResponseBuilder get _$this {
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
      GenericResponsePaginationResponseExaminationRecordResponse other) {
    _$v = other as _$GenericResponsePaginationResponseExaminationRecordResponse;
  }

  @override
  void update(
      void Function(
              GenericResponsePaginationResponseExaminationRecordResponseBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  GenericResponsePaginationResponseExaminationRecordResponse build() =>
      _build();

  _$GenericResponsePaginationResponseExaminationRecordResponse _build() {
    _$GenericResponsePaginationResponseExaminationRecordResponse _$result;
    try {
      _$result = _$v ??
          _$GenericResponsePaginationResponseExaminationRecordResponse._(
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
            r'GenericResponsePaginationResponseExaminationRecordResponse',
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
