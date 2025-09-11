// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'generic_response_pagination_response_beautification_record_response.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$GenericResponsePaginationResponseBeautificationRecordResponse
    extends GenericResponsePaginationResponseBeautificationRecordResponse {
  @override
  final int? code;
  @override
  final String? msg;
  @override
  final PaginationResponseBeautificationRecordResponse? data;

  factory _$GenericResponsePaginationResponseBeautificationRecordResponse(
          [void Function(
                  GenericResponsePaginationResponseBeautificationRecordResponseBuilder)?
              updates]) =>
      (GenericResponsePaginationResponseBeautificationRecordResponseBuilder()
            ..update(updates))
          ._build();

  _$GenericResponsePaginationResponseBeautificationRecordResponse._(
      {this.code, this.msg, this.data})
      : super._();
  @override
  GenericResponsePaginationResponseBeautificationRecordResponse rebuild(
          void Function(
                  GenericResponsePaginationResponseBeautificationRecordResponseBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GenericResponsePaginationResponseBeautificationRecordResponseBuilder
      toBuilder() =>
          GenericResponsePaginationResponseBeautificationRecordResponseBuilder()
            ..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other
            is GenericResponsePaginationResponseBeautificationRecordResponse &&
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
            r'GenericResponsePaginationResponseBeautificationRecordResponse')
          ..add('code', code)
          ..add('msg', msg)
          ..add('data', data))
        .toString();
  }
}

class GenericResponsePaginationResponseBeautificationRecordResponseBuilder
    implements
        Builder<GenericResponsePaginationResponseBeautificationRecordResponse,
            GenericResponsePaginationResponseBeautificationRecordResponseBuilder> {
  _$GenericResponsePaginationResponseBeautificationRecordResponse? _$v;

  int? _code;
  int? get code => _$this._code;
  set code(int? code) => _$this._code = code;

  String? _msg;
  String? get msg => _$this._msg;
  set msg(String? msg) => _$this._msg = msg;

  PaginationResponseBeautificationRecordResponseBuilder? _data;
  PaginationResponseBeautificationRecordResponseBuilder get data =>
      _$this._data ??= PaginationResponseBeautificationRecordResponseBuilder();
  set data(PaginationResponseBeautificationRecordResponseBuilder? data) =>
      _$this._data = data;

  GenericResponsePaginationResponseBeautificationRecordResponseBuilder() {
    GenericResponsePaginationResponseBeautificationRecordResponse._defaults(
        this);
  }

  GenericResponsePaginationResponseBeautificationRecordResponseBuilder
      get _$this {
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
      GenericResponsePaginationResponseBeautificationRecordResponse other) {
    _$v = other
        as _$GenericResponsePaginationResponseBeautificationRecordResponse;
  }

  @override
  void update(
      void Function(
              GenericResponsePaginationResponseBeautificationRecordResponseBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  GenericResponsePaginationResponseBeautificationRecordResponse build() =>
      _build();

  _$GenericResponsePaginationResponseBeautificationRecordResponse _build() {
    _$GenericResponsePaginationResponseBeautificationRecordResponse _$result;
    try {
      _$result = _$v ??
          _$GenericResponsePaginationResponseBeautificationRecordResponse._(
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
            r'GenericResponsePaginationResponseBeautificationRecordResponse',
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
