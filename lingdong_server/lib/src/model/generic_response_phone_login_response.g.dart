// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'generic_response_phone_login_response.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$GenericResponsePhoneLoginResponse
    extends GenericResponsePhoneLoginResponse {
  @override
  final int? code;
  @override
  final String? msg;
  @override
  final PhoneLoginResponse? data;

  factory _$GenericResponsePhoneLoginResponse(
          [void Function(GenericResponsePhoneLoginResponseBuilder)? updates]) =>
      (GenericResponsePhoneLoginResponseBuilder()..update(updates))._build();

  _$GenericResponsePhoneLoginResponse._({this.code, this.msg, this.data})
      : super._();
  @override
  GenericResponsePhoneLoginResponse rebuild(
          void Function(GenericResponsePhoneLoginResponseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GenericResponsePhoneLoginResponseBuilder toBuilder() =>
      GenericResponsePhoneLoginResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GenericResponsePhoneLoginResponse &&
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
    return (newBuiltValueToStringHelper(r'GenericResponsePhoneLoginResponse')
          ..add('code', code)
          ..add('msg', msg)
          ..add('data', data))
        .toString();
  }
}

class GenericResponsePhoneLoginResponseBuilder
    implements
        Builder<GenericResponsePhoneLoginResponse,
            GenericResponsePhoneLoginResponseBuilder> {
  _$GenericResponsePhoneLoginResponse? _$v;

  int? _code;
  int? get code => _$this._code;
  set code(int? code) => _$this._code = code;

  String? _msg;
  String? get msg => _$this._msg;
  set msg(String? msg) => _$this._msg = msg;

  PhoneLoginResponseBuilder? _data;
  PhoneLoginResponseBuilder get data =>
      _$this._data ??= PhoneLoginResponseBuilder();
  set data(PhoneLoginResponseBuilder? data) => _$this._data = data;

  GenericResponsePhoneLoginResponseBuilder() {
    GenericResponsePhoneLoginResponse._defaults(this);
  }

  GenericResponsePhoneLoginResponseBuilder get _$this {
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
  void replace(GenericResponsePhoneLoginResponse other) {
    _$v = other as _$GenericResponsePhoneLoginResponse;
  }

  @override
  void update(
      void Function(GenericResponsePhoneLoginResponseBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GenericResponsePhoneLoginResponse build() => _build();

  _$GenericResponsePhoneLoginResponse _build() {
    _$GenericResponsePhoneLoginResponse _$result;
    try {
      _$result = _$v ??
          _$GenericResponsePhoneLoginResponse._(
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
            r'GenericResponsePhoneLoginResponse', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
