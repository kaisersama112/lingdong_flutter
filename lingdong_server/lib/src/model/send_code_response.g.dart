// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'send_code_response.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$SendCodeResponse extends SendCodeResponse {
  @override
  final int expireIn;
  @override
  final String code;

  factory _$SendCodeResponse(
          [void Function(SendCodeResponseBuilder)? updates]) =>
      (SendCodeResponseBuilder()..update(updates))._build();

  _$SendCodeResponse._({required this.expireIn, required this.code})
      : super._();
  @override
  SendCodeResponse rebuild(void Function(SendCodeResponseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  SendCodeResponseBuilder toBuilder() =>
      SendCodeResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is SendCodeResponse &&
        expireIn == other.expireIn &&
        code == other.code;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, expireIn.hashCode);
    _$hash = $jc(_$hash, code.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'SendCodeResponse')
          ..add('expireIn', expireIn)
          ..add('code', code))
        .toString();
  }
}

class SendCodeResponseBuilder
    implements Builder<SendCodeResponse, SendCodeResponseBuilder> {
  _$SendCodeResponse? _$v;

  int? _expireIn;
  int? get expireIn => _$this._expireIn;
  set expireIn(int? expireIn) => _$this._expireIn = expireIn;

  String? _code;
  String? get code => _$this._code;
  set code(String? code) => _$this._code = code;

  SendCodeResponseBuilder() {
    SendCodeResponse._defaults(this);
  }

  SendCodeResponseBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _expireIn = $v.expireIn;
      _code = $v.code;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(SendCodeResponse other) {
    _$v = other as _$SendCodeResponse;
  }

  @override
  void update(void Function(SendCodeResponseBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  SendCodeResponse build() => _build();

  _$SendCodeResponse _build() {
    final _$result = _$v ??
        _$SendCodeResponse._(
          expireIn: BuiltValueNullFieldError.checkNotNull(
              expireIn, r'SendCodeResponse', 'expireIn'),
          code: BuiltValueNullFieldError.checkNotNull(
              code, r'SendCodeResponse', 'code'),
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
