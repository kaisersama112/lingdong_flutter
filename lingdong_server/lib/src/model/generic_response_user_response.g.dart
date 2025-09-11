// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'generic_response_user_response.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$GenericResponseUserResponse extends GenericResponseUserResponse {
  @override
  final int? code;
  @override
  final String? msg;
  @override
  final UserResponse? data;

  factory _$GenericResponseUserResponse(
          [void Function(GenericResponseUserResponseBuilder)? updates]) =>
      (GenericResponseUserResponseBuilder()..update(updates))._build();

  _$GenericResponseUserResponse._({this.code, this.msg, this.data}) : super._();
  @override
  GenericResponseUserResponse rebuild(
          void Function(GenericResponseUserResponseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GenericResponseUserResponseBuilder toBuilder() =>
      GenericResponseUserResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GenericResponseUserResponse &&
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
    return (newBuiltValueToStringHelper(r'GenericResponseUserResponse')
          ..add('code', code)
          ..add('msg', msg)
          ..add('data', data))
        .toString();
  }
}

class GenericResponseUserResponseBuilder
    implements
        Builder<GenericResponseUserResponse,
            GenericResponseUserResponseBuilder> {
  _$GenericResponseUserResponse? _$v;

  int? _code;
  int? get code => _$this._code;
  set code(int? code) => _$this._code = code;

  String? _msg;
  String? get msg => _$this._msg;
  set msg(String? msg) => _$this._msg = msg;

  UserResponseBuilder? _data;
  UserResponseBuilder get data => _$this._data ??= UserResponseBuilder();
  set data(UserResponseBuilder? data) => _$this._data = data;

  GenericResponseUserResponseBuilder() {
    GenericResponseUserResponse._defaults(this);
  }

  GenericResponseUserResponseBuilder get _$this {
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
  void replace(GenericResponseUserResponse other) {
    _$v = other as _$GenericResponseUserResponse;
  }

  @override
  void update(void Function(GenericResponseUserResponseBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GenericResponseUserResponse build() => _build();

  _$GenericResponseUserResponse _build() {
    _$GenericResponseUserResponse _$result;
    try {
      _$result = _$v ??
          _$GenericResponseUserResponse._(
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
            r'GenericResponseUserResponse', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
