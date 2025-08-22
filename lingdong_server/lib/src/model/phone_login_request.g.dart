// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'phone_login_request.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$PhoneLoginRequest extends PhoneLoginRequest {
  @override
  final String phone;
  @override
  final String password;

  factory _$PhoneLoginRequest(
          [void Function(PhoneLoginRequestBuilder)? updates]) =>
      (PhoneLoginRequestBuilder()..update(updates))._build();

  _$PhoneLoginRequest._({required this.phone, required this.password})
      : super._();
  @override
  PhoneLoginRequest rebuild(void Function(PhoneLoginRequestBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  PhoneLoginRequestBuilder toBuilder() =>
      PhoneLoginRequestBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is PhoneLoginRequest &&
        phone == other.phone &&
        password == other.password;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, phone.hashCode);
    _$hash = $jc(_$hash, password.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'PhoneLoginRequest')
          ..add('phone', phone)
          ..add('password', password))
        .toString();
  }
}

class PhoneLoginRequestBuilder
    implements Builder<PhoneLoginRequest, PhoneLoginRequestBuilder> {
  _$PhoneLoginRequest? _$v;

  String? _phone;
  String? get phone => _$this._phone;
  set phone(String? phone) => _$this._phone = phone;

  String? _password;
  String? get password => _$this._password;
  set password(String? password) => _$this._password = password;

  PhoneLoginRequestBuilder() {
    PhoneLoginRequest._defaults(this);
  }

  PhoneLoginRequestBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _phone = $v.phone;
      _password = $v.password;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(PhoneLoginRequest other) {
    _$v = other as _$PhoneLoginRequest;
  }

  @override
  void update(void Function(PhoneLoginRequestBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  PhoneLoginRequest build() => _build();

  _$PhoneLoginRequest _build() {
    final _$result = _$v ??
        _$PhoneLoginRequest._(
          phone: BuiltValueNullFieldError.checkNotNull(
              phone, r'PhoneLoginRequest', 'phone'),
          password: BuiltValueNullFieldError.checkNotNull(
              password, r'PhoneLoginRequest', 'password'),
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
