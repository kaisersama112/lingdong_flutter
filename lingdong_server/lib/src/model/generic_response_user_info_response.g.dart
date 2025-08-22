// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'generic_response_user_info_response.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$GenericResponseUserInfoResponse
    extends GenericResponseUserInfoResponse {
  @override
  final int? code;
  @override
  final String? msg;
  @override
  final UserInfoResponse? data;

  factory _$GenericResponseUserInfoResponse(
          [void Function(GenericResponseUserInfoResponseBuilder)? updates]) =>
      (GenericResponseUserInfoResponseBuilder()..update(updates))._build();

  _$GenericResponseUserInfoResponse._({this.code, this.msg, this.data})
      : super._();
  @override
  GenericResponseUserInfoResponse rebuild(
          void Function(GenericResponseUserInfoResponseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GenericResponseUserInfoResponseBuilder toBuilder() =>
      GenericResponseUserInfoResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GenericResponseUserInfoResponse &&
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
    return (newBuiltValueToStringHelper(r'GenericResponseUserInfoResponse')
          ..add('code', code)
          ..add('msg', msg)
          ..add('data', data))
        .toString();
  }
}

class GenericResponseUserInfoResponseBuilder
    implements
        Builder<GenericResponseUserInfoResponse,
            GenericResponseUserInfoResponseBuilder> {
  _$GenericResponseUserInfoResponse? _$v;

  int? _code;
  int? get code => _$this._code;
  set code(int? code) => _$this._code = code;

  String? _msg;
  String? get msg => _$this._msg;
  set msg(String? msg) => _$this._msg = msg;

  UserInfoResponseBuilder? _data;
  UserInfoResponseBuilder get data =>
      _$this._data ??= UserInfoResponseBuilder();
  set data(UserInfoResponseBuilder? data) => _$this._data = data;

  GenericResponseUserInfoResponseBuilder() {
    GenericResponseUserInfoResponse._defaults(this);
  }

  GenericResponseUserInfoResponseBuilder get _$this {
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
  void replace(GenericResponseUserInfoResponse other) {
    _$v = other as _$GenericResponseUserInfoResponse;
  }

  @override
  void update(void Function(GenericResponseUserInfoResponseBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GenericResponseUserInfoResponse build() => _build();

  _$GenericResponseUserInfoResponse _build() {
    _$GenericResponseUserInfoResponse _$result;
    try {
      _$result = _$v ??
          _$GenericResponseUserInfoResponse._(
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
            r'GenericResponseUserInfoResponse', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
