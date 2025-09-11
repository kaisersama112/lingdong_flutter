// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'generic_response_pagination_response_deworming_record_response.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$GenericResponsePaginationResponseDewormingRecordResponse
    extends GenericResponsePaginationResponseDewormingRecordResponse {
  @override
  final int? code;
  @override
  final String? msg;
  @override
  final PaginationResponseDewormingRecordResponse? data;

  factory _$GenericResponsePaginationResponseDewormingRecordResponse(
          [void Function(
                  GenericResponsePaginationResponseDewormingRecordResponseBuilder)?
              updates]) =>
      (GenericResponsePaginationResponseDewormingRecordResponseBuilder()
            ..update(updates))
          ._build();

  _$GenericResponsePaginationResponseDewormingRecordResponse._(
      {this.code, this.msg, this.data})
      : super._();
  @override
  GenericResponsePaginationResponseDewormingRecordResponse rebuild(
          void Function(
                  GenericResponsePaginationResponseDewormingRecordResponseBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GenericResponsePaginationResponseDewormingRecordResponseBuilder toBuilder() =>
      GenericResponsePaginationResponseDewormingRecordResponseBuilder()
        ..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GenericResponsePaginationResponseDewormingRecordResponse &&
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
            r'GenericResponsePaginationResponseDewormingRecordResponse')
          ..add('code', code)
          ..add('msg', msg)
          ..add('data', data))
        .toString();
  }
}

class GenericResponsePaginationResponseDewormingRecordResponseBuilder
    implements
        Builder<GenericResponsePaginationResponseDewormingRecordResponse,
            GenericResponsePaginationResponseDewormingRecordResponseBuilder> {
  _$GenericResponsePaginationResponseDewormingRecordResponse? _$v;

  int? _code;
  int? get code => _$this._code;
  set code(int? code) => _$this._code = code;

  String? _msg;
  String? get msg => _$this._msg;
  set msg(String? msg) => _$this._msg = msg;

  PaginationResponseDewormingRecordResponseBuilder? _data;
  PaginationResponseDewormingRecordResponseBuilder get data =>
      _$this._data ??= PaginationResponseDewormingRecordResponseBuilder();
  set data(PaginationResponseDewormingRecordResponseBuilder? data) =>
      _$this._data = data;

  GenericResponsePaginationResponseDewormingRecordResponseBuilder() {
    GenericResponsePaginationResponseDewormingRecordResponse._defaults(this);
  }

  GenericResponsePaginationResponseDewormingRecordResponseBuilder get _$this {
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
  void replace(GenericResponsePaginationResponseDewormingRecordResponse other) {
    _$v = other as _$GenericResponsePaginationResponseDewormingRecordResponse;
  }

  @override
  void update(
      void Function(
              GenericResponsePaginationResponseDewormingRecordResponseBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  GenericResponsePaginationResponseDewormingRecordResponse build() => _build();

  _$GenericResponsePaginationResponseDewormingRecordResponse _build() {
    _$GenericResponsePaginationResponseDewormingRecordResponse _$result;
    try {
      _$result = _$v ??
          _$GenericResponsePaginationResponseDewormingRecordResponse._(
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
            r'GenericResponsePaginationResponseDewormingRecordResponse',
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
