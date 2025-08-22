// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'phone_login_response.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$PhoneLoginResponse extends PhoneLoginResponse {
  @override
  final String accessToken;
  @override
  final String tokenType;
  @override
  final String refreshToken;
  @override
  final bool isNewUser;

  factory _$PhoneLoginResponse(
          [void Function(PhoneLoginResponseBuilder)? updates]) =>
      (PhoneLoginResponseBuilder()..update(updates))._build();

  _$PhoneLoginResponse._(
      {required this.accessToken,
      required this.tokenType,
      required this.refreshToken,
      required this.isNewUser})
      : super._();
  @override
  PhoneLoginResponse rebuild(
          void Function(PhoneLoginResponseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  PhoneLoginResponseBuilder toBuilder() =>
      PhoneLoginResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is PhoneLoginResponse &&
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
    return (newBuiltValueToStringHelper(r'PhoneLoginResponse')
          ..add('accessToken', accessToken)
          ..add('tokenType', tokenType)
          ..add('refreshToken', refreshToken)
          ..add('isNewUser', isNewUser))
        .toString();
  }
}

class PhoneLoginResponseBuilder
    implements Builder<PhoneLoginResponse, PhoneLoginResponseBuilder> {
  _$PhoneLoginResponse? _$v;

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

  PhoneLoginResponseBuilder() {
    PhoneLoginResponse._defaults(this);
  }

  PhoneLoginResponseBuilder get _$this {
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
  void replace(PhoneLoginResponse other) {
    _$v = other as _$PhoneLoginResponse;
  }

  @override
  void update(void Function(PhoneLoginResponseBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  PhoneLoginResponse build() => _build();

  _$PhoneLoginResponse _build() {
    final _$result = _$v ??
        _$PhoneLoginResponse._(
          accessToken: BuiltValueNullFieldError.checkNotNull(
              accessToken, r'PhoneLoginResponse', 'accessToken'),
          tokenType: BuiltValueNullFieldError.checkNotNull(
              tokenType, r'PhoneLoginResponse', 'tokenType'),
          refreshToken: BuiltValueNullFieldError.checkNotNull(
              refreshToken, r'PhoneLoginResponse', 'refreshToken'),
          isNewUser: BuiltValueNullFieldError.checkNotNull(
              isNewUser, r'PhoneLoginResponse', 'isNewUser'),
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
