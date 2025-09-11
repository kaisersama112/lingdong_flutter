// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'generic_response_pagination_response_weight_record_response.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$GenericResponsePaginationResponseWeightRecordResponse
    extends GenericResponsePaginationResponseWeightRecordResponse {
  @override
  final int? code;
  @override
  final String? msg;
  @override
  final PaginationResponseWeightRecordResponse? data;

  factory _$GenericResponsePaginationResponseWeightRecordResponse(
          [void Function(
                  GenericResponsePaginationResponseWeightRecordResponseBuilder)?
              updates]) =>
      (GenericResponsePaginationResponseWeightRecordResponseBuilder()
            ..update(updates))
          ._build();

  _$GenericResponsePaginationResponseWeightRecordResponse._(
      {this.code, this.msg, this.data})
      : super._();
  @override
  GenericResponsePaginationResponseWeightRecordResponse rebuild(
          void Function(
                  GenericResponsePaginationResponseWeightRecordResponseBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GenericResponsePaginationResponseWeightRecordResponseBuilder toBuilder() =>
      GenericResponsePaginationResponseWeightRecordResponseBuilder()
        ..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GenericResponsePaginationResponseWeightRecordResponse &&
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
            r'GenericResponsePaginationResponseWeightRecordResponse')
          ..add('code', code)
          ..add('msg', msg)
          ..add('data', data))
        .toString();
  }
}

class GenericResponsePaginationResponseWeightRecordResponseBuilder
    implements
        Builder<GenericResponsePaginationResponseWeightRecordResponse,
            GenericResponsePaginationResponseWeightRecordResponseBuilder> {
  _$GenericResponsePaginationResponseWeightRecordResponse? _$v;

  int? _code;
  int? get code => _$this._code;
  set code(int? code) => _$this._code = code;

  String? _msg;
  String? get msg => _$this._msg;
  set msg(String? msg) => _$this._msg = msg;

  PaginationResponseWeightRecordResponseBuilder? _data;
  PaginationResponseWeightRecordResponseBuilder get data =>
      _$this._data ??= PaginationResponseWeightRecordResponseBuilder();
  set data(PaginationResponseWeightRecordResponseBuilder? data) =>
      _$this._data = data;

  GenericResponsePaginationResponseWeightRecordResponseBuilder() {
    GenericResponsePaginationResponseWeightRecordResponse._defaults(this);
  }

  GenericResponsePaginationResponseWeightRecordResponseBuilder get _$this {
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
  void replace(GenericResponsePaginationResponseWeightRecordResponse other) {
    _$v = other as _$GenericResponsePaginationResponseWeightRecordResponse;
  }

  @override
  void update(
      void Function(
              GenericResponsePaginationResponseWeightRecordResponseBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  GenericResponsePaginationResponseWeightRecordResponse build() => _build();

  _$GenericResponsePaginationResponseWeightRecordResponse _build() {
    _$GenericResponsePaginationResponseWeightRecordResponse _$result;
    try {
      _$result = _$v ??
          _$GenericResponsePaginationResponseWeightRecordResponse._(
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
            r'GenericResponsePaginationResponseWeightRecordResponse',
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
