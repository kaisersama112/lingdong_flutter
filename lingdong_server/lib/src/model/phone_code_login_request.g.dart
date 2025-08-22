// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'phone_code_login_request.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$PhoneCodeLoginRequest extends PhoneCodeLoginRequest {
  @override
  final String phone;
  @override
  final String code;

  factory _$PhoneCodeLoginRequest(
          [void Function(PhoneCodeLoginRequestBuilder)? updates]) =>
      (PhoneCodeLoginRequestBuilder()..update(updates))._build();

  _$PhoneCodeLoginRequest._({required this.phone, required this.code})
      : super._();
  @override
  PhoneCodeLoginRequest rebuild(
          void Function(PhoneCodeLoginRequestBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  PhoneCodeLoginRequestBuilder toBuilder() =>
      PhoneCodeLoginRequestBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is PhoneCodeLoginRequest &&
        phone == other.phone &&
        code == other.code;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, phone.hashCode);
    _$hash = $jc(_$hash, code.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'PhoneCodeLoginRequest')
          ..add('phone', phone)
          ..add('code', code))
        .toString();
  }
}

class PhoneCodeLoginRequestBuilder
    implements Builder<PhoneCodeLoginRequest, PhoneCodeLoginRequestBuilder> {
  _$PhoneCodeLoginRequest? _$v;

  String? _phone;
  String? get phone => _$this._phone;
  set phone(String? phone) => _$this._phone = phone;

  String? _code;
  String? get code => _$this._code;
  set code(String? code) => _$this._code = code;

  PhoneCodeLoginRequestBuilder() {
    PhoneCodeLoginRequest._defaults(this);
  }

  PhoneCodeLoginRequestBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _phone = $v.phone;
      _code = $v.code;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(PhoneCodeLoginRequest other) {
    _$v = other as _$PhoneCodeLoginRequest;
  }

  @override
  void update(void Function(PhoneCodeLoginRequestBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  PhoneCodeLoginRequest build() => _build();

  _$PhoneCodeLoginRequest _build() {
    final _$result = _$v ??
        _$PhoneCodeLoginRequest._(
          phone: BuiltValueNullFieldError.checkNotNull(
              phone, r'PhoneCodeLoginRequest', 'phone'),
          code: BuiltValueNullFieldError.checkNotNull(
              code, r'PhoneCodeLoginRequest', 'code'),
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
