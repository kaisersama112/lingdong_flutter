// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'generic_response_phone_code_login_response.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$GenericResponsePhoneCodeLoginResponse
    extends GenericResponsePhoneCodeLoginResponse {
  @override
  final int? code;
  @override
  final String? msg;
  @override
  final PhoneCodeLoginResponse? data;

  factory _$GenericResponsePhoneCodeLoginResponse(
          [void Function(GenericResponsePhoneCodeLoginResponseBuilder)?
              updates]) =>
      (GenericResponsePhoneCodeLoginResponseBuilder()..update(updates))
          ._build();

  _$GenericResponsePhoneCodeLoginResponse._({this.code, this.msg, this.data})
      : super._();
  @override
  GenericResponsePhoneCodeLoginResponse rebuild(
          void Function(GenericResponsePhoneCodeLoginResponseBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GenericResponsePhoneCodeLoginResponseBuilder toBuilder() =>
      GenericResponsePhoneCodeLoginResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GenericResponsePhoneCodeLoginResponse &&
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
            r'GenericResponsePhoneCodeLoginResponse')
          ..add('code', code)
          ..add('msg', msg)
          ..add('data', data))
        .toString();
  }
}

class GenericResponsePhoneCodeLoginResponseBuilder
    implements
        Builder<GenericResponsePhoneCodeLoginResponse,
            GenericResponsePhoneCodeLoginResponseBuilder> {
  _$GenericResponsePhoneCodeLoginResponse? _$v;

  int? _code;
  int? get code => _$this._code;
  set code(int? code) => _$this._code = code;

  String? _msg;
  String? get msg => _$this._msg;
  set msg(String? msg) => _$this._msg = msg;

  PhoneCodeLoginResponseBuilder? _data;
  PhoneCodeLoginResponseBuilder get data =>
      _$this._data ??= PhoneCodeLoginResponseBuilder();
  set data(PhoneCodeLoginResponseBuilder? data) => _$this._data = data;

  GenericResponsePhoneCodeLoginResponseBuilder() {
    GenericResponsePhoneCodeLoginResponse._defaults(this);
  }

  GenericResponsePhoneCodeLoginResponseBuilder get _$this {
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
  void replace(GenericResponsePhoneCodeLoginResponse other) {
    _$v = other as _$GenericResponsePhoneCodeLoginResponse;
  }

  @override
  void update(
      void Function(GenericResponsePhoneCodeLoginResponseBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GenericResponsePhoneCodeLoginResponse build() => _build();

  _$GenericResponsePhoneCodeLoginResponse _build() {
    _$GenericResponsePhoneCodeLoginResponse _$result;
    try {
      _$result = _$v ??
          _$GenericResponsePhoneCodeLoginResponse._(
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
            r'GenericResponsePhoneCodeLoginResponse',
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
