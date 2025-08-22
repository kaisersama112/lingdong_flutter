// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'set_password_by_code_request.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$SetPasswordByCodeRequest extends SetPasswordByCodeRequest {
  @override
  final String phone;
  @override
  final String code;
  @override
  final String newPassword;

  factory _$SetPasswordByCodeRequest(
          [void Function(SetPasswordByCodeRequestBuilder)? updates]) =>
      (SetPasswordByCodeRequestBuilder()..update(updates))._build();

  _$SetPasswordByCodeRequest._(
      {required this.phone, required this.code, required this.newPassword})
      : super._();
  @override
  SetPasswordByCodeRequest rebuild(
          void Function(SetPasswordByCodeRequestBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  SetPasswordByCodeRequestBuilder toBuilder() =>
      SetPasswordByCodeRequestBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is SetPasswordByCodeRequest &&
        phone == other.phone &&
        code == other.code &&
        newPassword == other.newPassword;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, phone.hashCode);
    _$hash = $jc(_$hash, code.hashCode);
    _$hash = $jc(_$hash, newPassword.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'SetPasswordByCodeRequest')
          ..add('phone', phone)
          ..add('code', code)
          ..add('newPassword', newPassword))
        .toString();
  }
}

class SetPasswordByCodeRequestBuilder
    implements
        Builder<SetPasswordByCodeRequest, SetPasswordByCodeRequestBuilder> {
  _$SetPasswordByCodeRequest? _$v;

  String? _phone;
  String? get phone => _$this._phone;
  set phone(String? phone) => _$this._phone = phone;

  String? _code;
  String? get code => _$this._code;
  set code(String? code) => _$this._code = code;

  String? _newPassword;
  String? get newPassword => _$this._newPassword;
  set newPassword(String? newPassword) => _$this._newPassword = newPassword;

  SetPasswordByCodeRequestBuilder() {
    SetPasswordByCodeRequest._defaults(this);
  }

  SetPasswordByCodeRequestBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _phone = $v.phone;
      _code = $v.code;
      _newPassword = $v.newPassword;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(SetPasswordByCodeRequest other) {
    _$v = other as _$SetPasswordByCodeRequest;
  }

  @override
  void update(void Function(SetPasswordByCodeRequestBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  SetPasswordByCodeRequest build() => _build();

  _$SetPasswordByCodeRequest _build() {
    final _$result = _$v ??
        _$SetPasswordByCodeRequest._(
          phone: BuiltValueNullFieldError.checkNotNull(
              phone, r'SetPasswordByCodeRequest', 'phone'),
          code: BuiltValueNullFieldError.checkNotNull(
              code, r'SetPasswordByCodeRequest', 'code'),
          newPassword: BuiltValueNullFieldError.checkNotNull(
              newPassword, r'SetPasswordByCodeRequest', 'newPassword'),
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
