// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'phone_code_login_response.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$PhoneCodeLoginResponse extends PhoneCodeLoginResponse {
  @override
  final String accessToken;
  @override
  final String tokenType;
  @override
  final String refreshToken;
  @override
  final bool isNewUser;

  factory _$PhoneCodeLoginResponse(
          [void Function(PhoneCodeLoginResponseBuilder)? updates]) =>
      (PhoneCodeLoginResponseBuilder()..update(updates))._build();

  _$PhoneCodeLoginResponse._(
      {required this.accessToken,
      required this.tokenType,
      required this.refreshToken,
      required this.isNewUser})
      : super._();
  @override
  PhoneCodeLoginResponse rebuild(
          void Function(PhoneCodeLoginResponseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  PhoneCodeLoginResponseBuilder toBuilder() =>
      PhoneCodeLoginResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is PhoneCodeLoginResponse &&
        accessToken == other.accessToken &&
        tokenType == other.tokenType &&
        refreshToken == other.refreshToken &&
        isNewUser == other.isNewUser;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, accessToken.hashCode);
    _$hash = $jc(_$hash, tokenType.hashCode);
    _$hash = $jc(_$hash, refreshToken.hashCode);
    _$hash = $jc(_$hash, isNewUser.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'PhoneCodeLoginResponse')
          ..add('accessToken', accessToken)
          ..add('tokenType', tokenType)
          ..add('refreshToken', refreshToken)
          ..add('isNewUser', isNewUser))
        .toString();
  }
}

class PhoneCodeLoginResponseBuilder
    implements Builder<PhoneCodeLoginResponse, PhoneCodeLoginResponseBuilder> {
  _$PhoneCodeLoginResponse? _$v;

  String? _accessToken;
  String? get accessToken => _$this._accessToken;
  set accessToken(String? accessToken) => _$this._accessToken = accessToken;

  String? _tokenType;
  String? get tokenType => _$this._tokenType;
  set tokenType(String? tokenType) => _$this._tokenType = tokenType;

  String? _refreshToken;
  String? get refreshToken => _$this._refreshToken;
  set refreshToken(String? refreshToken) => _$this._refreshToken = refreshToken;

  bool? _isNewUser;
  bool? get isNewUser => _$this._isNewUser;
  set isNewUser(bool? isNewUser) => _$this._isNewUser = isNewUser;

  PhoneCodeLoginResponseBuilder() {
    PhoneCodeLoginResponse._defaults(this);
  }

  PhoneCodeLoginResponseBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _accessToken = $v.accessToken;
      _tokenType = $v.tokenType;
      _refreshToken = $v.refreshToken;
      _isNewUser = $v.isNewUser;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(PhoneCodeLoginResponse other) {
    _$v = other as _$PhoneCodeLoginResponse;
  }

  @override
  void update(void Function(PhoneCodeLoginResponseBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  PhoneCodeLoginResponse build() => _build();

  _$PhoneCodeLoginResponse _build() {
    final _$result = _$v ??
        _$PhoneCodeLoginResponse._(
          accessToken: BuiltValueNullFieldError.checkNotNull(
              accessToken, r'PhoneCodeLoginResponse', 'accessToken'),
          tokenType: BuiltValueNullFieldError.checkNotNull(
              tokenType, r'PhoneCodeLoginResponse', 'tokenType'),
          refreshToken: BuiltValueNullFieldError.checkNotNull(
              refreshToken, r'PhoneCodeLoginResponse', 'refreshToken'),
          isNewUser: BuiltValueNullFieldError.checkNotNull(
              isNewUser, r'PhoneCodeLoginResponse', 'isNewUser'),
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
