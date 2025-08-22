// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'generic_response_login_response.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$GenericResponseLoginResponse extends GenericResponseLoginResponse {
  @override
  final int? code;
  @override
  final String? msg;
  @override
  final LoginResponse? data;

  factory _$GenericResponseLoginResponse(
          [void Function(GenericResponseLoginResponseBuilder)? updates]) =>
      (GenericResponseLoginResponseBuilder()..update(updates))._build();

  _$GenericResponseLoginResponse._({this.code, this.msg, this.data})
      : super._();
  @override
  GenericResponseLoginResponse rebuild(
          void Function(GenericResponseLoginResponseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GenericResponseLoginResponseBuilder toBuilder() =>
      GenericResponseLoginResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GenericResponseLoginResponse &&
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
    return (newBuiltValueToStringHelper(r'GenericResponseLoginResponse')
          ..add('code', code)
          ..add('msg', msg)
          ..add('data', data))
        .toString();
  }
}

class GenericResponseLoginResponseBuilder
    implements
        Builder<GenericResponseLoginResponse,
            GenericResponseLoginResponseBuilder> {
  _$GenericResponseLoginResponse? _$v;

  int? _code;
  int? get code => _$this._code;
  set code(int? code) => _$this._code = code;

  String? _msg;
  String? get msg => _$this._msg;
  set msg(String? msg) => _$this._msg = msg;

  LoginResponseBuilder? _data;
  LoginResponseBuilder get data => _$this._data ??= LoginResponseBuilder();
  set data(LoginResponseBuilder? data) => _$this._data = data;

  GenericResponseLoginResponseBuilder() {
    GenericResponseLoginResponse._defaults(this);
  }

  GenericResponseLoginResponseBuilder get _$this {
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
  void replace(GenericResponseLoginResponse other) {
    _$v = other as _$GenericResponseLoginResponse;
  }

  @override
  void update(void Function(GenericResponseLoginResponseBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GenericResponseLoginResponse build() => _build();

  _$GenericResponseLoginResponse _build() {
    _$GenericResponseLoginResponse _$result;
    try {
      _$result = _$v ??
          _$GenericResponseLoginResponse._(
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
            r'GenericResponseLoginResponse', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
