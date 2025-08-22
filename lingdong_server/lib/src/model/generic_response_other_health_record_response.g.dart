// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'generic_response_other_health_record_response.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$GenericResponseOtherHealthRecordResponse
    extends GenericResponseOtherHealthRecordResponse {
  @override
  final int? code;
  @override
  final String? msg;
  @override
  final OtherHealthRecordResponse? data;

  factory _$GenericResponseOtherHealthRecordResponse(
          [void Function(GenericResponseOtherHealthRecordResponseBuilder)?
              updates]) =>
      (GenericResponseOtherHealthRecordResponseBuilder()..update(updates))
          ._build();

  _$GenericResponseOtherHealthRecordResponse._({this.code, this.msg, this.data})
      : super._();
  @override
  GenericResponseOtherHealthRecordResponse rebuild(
          void Function(GenericResponseOtherHealthRecordResponseBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GenericResponseOtherHealthRecordResponseBuilder toBuilder() =>
      GenericResponseOtherHealthRecordResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GenericResponseOtherHealthRecordResponse &&
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
            r'GenericResponseOtherHealthRecordResponse')
          ..add('code', code)
          ..add('msg', msg)
          ..add('data', data))
        .toString();
  }
}

class GenericResponseOtherHealthRecordResponseBuilder
    implements
        Builder<GenericResponseOtherHealthRecordResponse,
            GenericResponseOtherHealthRecordResponseBuilder> {
  _$GenericResponseOtherHealthRecordResponse? _$v;

  int? _code;
  int? get code => _$this._code;
  set code(int? code) => _$this._code = code;

  String? _msg;
  String? get msg => _$this._msg;
  set msg(String? msg) => _$this._msg = msg;

  OtherHealthRecordResponseBuilder? _data;
  OtherHealthRecordResponseBuilder get data =>
      _$this._data ??= OtherHealthRecordResponseBuilder();
  set data(OtherHealthRecordResponseBuilder? data) => _$this._data = data;

  GenericResponseOtherHealthRecordResponseBuilder() {
    GenericResponseOtherHealthRecordResponse._defaults(this);
  }

  GenericResponseOtherHealthRecordResponseBuilder get _$this {
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
  void replace(GenericResponseOtherHealthRecordResponse other) {
    _$v = other as _$GenericResponseOtherHealthRecordResponse;
  }

  @override
  void update(
      void Function(GenericResponseOtherHealthRecordResponseBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GenericResponseOtherHealthRecordResponse build() => _build();

  _$GenericResponseOtherHealthRecordResponse _build() {
    _$GenericResponseOtherHealthRecordResponse _$result;
    try {
      _$result = _$v ??
          _$GenericResponseOtherHealthRecordResponse._(
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
            r'GenericResponseOtherHealthRecordResponse',
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
