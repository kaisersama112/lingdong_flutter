// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'generic_response_post_response.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$GenericResponsePostResponse extends GenericResponsePostResponse {
  @override
  final int? code;
  @override
  final String? msg;
  @override
  final PostResponse? data;

  factory _$GenericResponsePostResponse(
          [void Function(GenericResponsePostResponseBuilder)? updates]) =>
      (GenericResponsePostResponseBuilder()..update(updates))._build();

  _$GenericResponsePostResponse._({this.code, this.msg, this.data}) : super._();
  @override
  GenericResponsePostResponse rebuild(
          void Function(GenericResponsePostResponseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GenericResponsePostResponseBuilder toBuilder() =>
      GenericResponsePostResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GenericResponsePostResponse &&
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
    return (newBuiltValueToStringHelper(r'GenericResponsePostResponse')
          ..add('code', code)
          ..add('msg', msg)
          ..add('data', data))
        .toString();
  }
}

class GenericResponsePostResponseBuilder
    implements
        Builder<GenericResponsePostResponse,
            GenericResponsePostResponseBuilder> {
  _$GenericResponsePostResponse? _$v;

  int? _code;
  int? get code => _$this._code;
  set code(int? code) => _$this._code = code;

  String? _msg;
  String? get msg => _$this._msg;
  set msg(String? msg) => _$this._msg = msg;

  PostResponseBuilder? _data;
  PostResponseBuilder get data => _$this._data ??= PostResponseBuilder();
  set data(PostResponseBuilder? data) => _$this._data = data;

  GenericResponsePostResponseBuilder() {
    GenericResponsePostResponse._defaults(this);
  }

  GenericResponsePostResponseBuilder get _$this {
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
  void replace(GenericResponsePostResponse other) {
    _$v = other as _$GenericResponsePostResponse;
  }

  @override
  void update(void Function(GenericResponsePostResponseBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GenericResponsePostResponse build() => _build();

  _$GenericResponsePostResponse _build() {
    _$GenericResponsePostResponse _$result;
    try {
      _$result = _$v ??
          _$GenericResponsePostResponse._(
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
            r'GenericResponsePostResponse', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
