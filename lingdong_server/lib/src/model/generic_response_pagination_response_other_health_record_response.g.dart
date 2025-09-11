// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'generic_response_pagination_response_other_health_record_response.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$GenericResponsePaginationResponseOtherHealthRecordResponse
    extends GenericResponsePaginationResponseOtherHealthRecordResponse {
  @override
  final int? code;
  @override
  final String? msg;
  @override
  final PaginationResponseOtherHealthRecordResponse? data;

  factory _$GenericResponsePaginationResponseOtherHealthRecordResponse(
          [void Function(
                  GenericResponsePaginationResponseOtherHealthRecordResponseBuilder)?
              updates]) =>
      (GenericResponsePaginationResponseOtherHealthRecordResponseBuilder()
            ..update(updates))
          ._build();

  _$GenericResponsePaginationResponseOtherHealthRecordResponse._(
      {this.code, this.msg, this.data})
      : super._();
  @override
  GenericResponsePaginationResponseOtherHealthRecordResponse rebuild(
          void Function(
                  GenericResponsePaginationResponseOtherHealthRecordResponseBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GenericResponsePaginationResponseOtherHealthRecordResponseBuilder
      toBuilder() =>
          GenericResponsePaginationResponseOtherHealthRecordResponseBuilder()
            ..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other
            is GenericResponsePaginationResponseOtherHealthRecordResponse &&
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
            r'GenericResponsePaginationResponseOtherHealthRecordResponse')
          ..add('code', code)
          ..add('msg', msg)
          ..add('data', data))
        .toString();
  }
}

class GenericResponsePaginationResponseOtherHealthRecordResponseBuilder
    implements
        Builder<GenericResponsePaginationResponseOtherHealthRecordResponse,
            GenericResponsePaginationResponseOtherHealthRecordResponseBuilder> {
  _$GenericResponsePaginationResponseOtherHealthRecordResponse? _$v;

  int? _code;
  int? get code => _$this._code;
  set code(int? code) => _$this._code = code;

  String? _msg;
  String? get msg => _$this._msg;
  set msg(String? msg) => _$this._msg = msg;

  PaginationResponseOtherHealthRecordResponseBuilder? _data;
  PaginationResponseOtherHealthRecordResponseBuilder get data =>
      _$this._data ??= PaginationResponseOtherHealthRecordResponseBuilder();
  set data(PaginationResponseOtherHealthRecordResponseBuilder? data) =>
      _$this._data = data;

  GenericResponsePaginationResponseOtherHealthRecordResponseBuilder() {
    GenericResponsePaginationResponseOtherHealthRecordResponse._defaults(this);
  }

  GenericResponsePaginationResponseOtherHealthRecordResponseBuilder get _$this {
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
      GenericResponsePaginationResponseOtherHealthRecordResponse other) {
    _$v = other as _$GenericResponsePaginationResponseOtherHealthRecordResponse;
  }

  @override
  void update(
      void Function(
              GenericResponsePaginationResponseOtherHealthRecordResponseBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  GenericResponsePaginationResponseOtherHealthRecordResponse build() =>
      _build();

  _$GenericResponsePaginationResponseOtherHealthRecordResponse _build() {
    _$GenericResponsePaginationResponseOtherHealthRecordResponse _$result;
    try {
      _$result = _$v ??
          _$GenericResponsePaginationResponseOtherHealthRecordResponse._(
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
            r'GenericResponsePaginationResponseOtherHealthRecordResponse',
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
