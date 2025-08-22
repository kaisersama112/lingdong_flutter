// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'generic_response_refresh_token_response.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$GenericResponseRefreshTokenResponse
    extends GenericResponseRefreshTokenResponse {
  @override
  final int? code;
  @override
  final String? msg;
  @override
  final RefreshTokenResponse? data;

  factory _$GenericResponseRefreshTokenResponse(
          [void Function(GenericResponseRefreshTokenResponseBuilder)?
              updates]) =>
      (GenericResponseRefreshTokenResponseBuilder()..update(updates))._build();

  _$GenericResponseRefreshTokenResponse._({this.code, this.msg, this.data})
      : super._();
  @override
  GenericResponseRefreshTokenResponse rebuild(
          void Function(GenericResponseRefreshTokenResponseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GenericResponseRefreshTokenResponseBuilder toBuilder() =>
      GenericResponseRefreshTokenResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GenericResponseRefreshTokenResponse &&
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
    return (newBuiltValueToStringHelper(r'GenericResponseRefreshTokenResponse')
          ..add('code', code)
          ..add('msg', msg)
          ..add('data', data))
        .toString();
  }
}

class GenericResponseRefreshTokenResponseBuilder
    implements
        Builder<GenericResponseRefreshTokenResponse,
            GenericResponseRefreshTokenResponseBuilder> {
  _$GenericResponseRefreshTokenResponse? _$v;

  int? _code;
  int? get code => _$this._code;
  set code(int? code) => _$this._code = code;

  String? _msg;
  String? get msg => _$this._msg;
  set msg(String? msg) => _$this._msg = msg;

  RefreshTokenResponseBuilder? _data;
  RefreshTokenResponseBuilder get data =>
      _$this._data ??= RefreshTokenResponseBuilder();
  set data(RefreshTokenResponseBuilder? data) => _$this._data = data;

  GenericResponseRefreshTokenResponseBuilder() {
    GenericResponseRefreshTokenResponse._defaults(this);
  }

  GenericResponseRefreshTokenResponseBuilder get _$this {
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
  void replace(GenericResponseRefreshTokenResponse other) {
    _$v = other as _$GenericResponseRefreshTokenResponse;
  }

  @override
  void update(
      void Function(GenericResponseRefreshTokenResponseBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GenericResponseRefreshTokenResponse build() => _build();

  _$GenericResponseRefreshTokenResponse _build() {
    _$GenericResponseRefreshTokenResponse _$result;
    try {
      _$result = _$v ??
          _$GenericResponseRefreshTokenResponse._(
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
        throw BuiltValueNestedFieldError(r'GenericResponseRefreshTokenResponse',
            _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
