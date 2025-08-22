// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'generic_response_deworming_record_response.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$GenericResponseDewormingRecordResponse
    extends GenericResponseDewormingRecordResponse {
  @override
  final int? code;
  @override
  final String? msg;
  @override
  final DewormingRecordResponse? data;

  factory _$GenericResponseDewormingRecordResponse(
          [void Function(GenericResponseDewormingRecordResponseBuilder)?
              updates]) =>
      (GenericResponseDewormingRecordResponseBuilder()..update(updates))
          ._build();

  _$GenericResponseDewormingRecordResponse._({this.code, this.msg, this.data})
      : super._();
  @override
  GenericResponseDewormingRecordResponse rebuild(
          void Function(GenericResponseDewormingRecordResponseBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GenericResponseDewormingRecordResponseBuilder toBuilder() =>
      GenericResponseDewormingRecordResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GenericResponseDewormingRecordResponse &&
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
            r'GenericResponseDewormingRecordResponse')
          ..add('code', code)
          ..add('msg', msg)
          ..add('data', data))
        .toString();
  }
}

class GenericResponseDewormingRecordResponseBuilder
    implements
        Builder<GenericResponseDewormingRecordResponse,
            GenericResponseDewormingRecordResponseBuilder> {
  _$GenericResponseDewormingRecordResponse? _$v;

  int? _code;
  int? get code => _$this._code;
  set code(int? code) => _$this._code = code;

  String? _msg;
  String? get msg => _$this._msg;
  set msg(String? msg) => _$this._msg = msg;

  DewormingRecordResponseBuilder? _data;
  DewormingRecordResponseBuilder get data =>
      _$this._data ??= DewormingRecordResponseBuilder();
  set data(DewormingRecordResponseBuilder? data) => _$this._data = data;

  GenericResponseDewormingRecordResponseBuilder() {
    GenericResponseDewormingRecordResponse._defaults(this);
  }

  GenericResponseDewormingRecordResponseBuilder get _$this {
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
  void replace(GenericResponseDewormingRecordResponse other) {
    _$v = other as _$GenericResponseDewormingRecordResponse;
  }

  @override
  void update(
      void Function(GenericResponseDewormingRecordResponseBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GenericResponseDewormingRecordResponse build() => _build();

  _$GenericResponseDewormingRecordResponse _build() {
    _$GenericResponseDewormingRecordResponse _$result;
    try {
      _$result = _$v ??
          _$GenericResponseDewormingRecordResponse._(
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
            r'GenericResponseDewormingRecordResponse',
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
