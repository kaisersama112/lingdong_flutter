// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'generic_response_empty_response.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$GenericResponseEmptyResponse extends GenericResponseEmptyResponse {
  @override
  final int? code;
  @override
  final String? msg;
  @override
  final JsonObject? data;

  factory _$GenericResponseEmptyResponse(
          [void Function(GenericResponseEmptyResponseBuilder)? updates]) =>
      (GenericResponseEmptyResponseBuilder()..update(updates))._build();

  _$GenericResponseEmptyResponse._({this.code, this.msg, this.data})
      : super._();
  @override
  GenericResponseEmptyResponse rebuild(
          void Function(GenericResponseEmptyResponseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GenericResponseEmptyResponseBuilder toBuilder() =>
      GenericResponseEmptyResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GenericResponseEmptyResponse &&
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
    return (newBuiltValueToStringHelper(r'GenericResponseEmptyResponse')
          ..add('code', code)
          ..add('msg', msg)
          ..add('data', data))
        .toString();
  }
}

class GenericResponseEmptyResponseBuilder
    implements
        Builder<GenericResponseEmptyResponse,
            GenericResponseEmptyResponseBuilder> {
  _$GenericResponseEmptyResponse? _$v;

  int? _code;
  int? get code => _$this._code;
  set code(int? code) => _$this._code = code;

  String? _msg;
  String? get msg => _$this._msg;
  set msg(String? msg) => _$this._msg = msg;

  JsonObject? _data;
  JsonObject? get data => _$this._data;
  set data(JsonObject? data) => _$this._data = data;

  GenericResponseEmptyResponseBuilder() {
    GenericResponseEmptyResponse._defaults(this);
  }

  GenericResponseEmptyResponseBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _code = $v.code;
      _msg = $v.msg;
      _data = $v.data;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GenericResponseEmptyResponse other) {
    _$v = other as _$GenericResponseEmptyResponse;
  }

  @override
  void update(void Function(GenericResponseEmptyResponseBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GenericResponseEmptyResponse build() => _build();

  _$GenericResponseEmptyResponse _build() {
    final _$result = _$v ??
        _$GenericResponseEmptyResponse._(
          code: code,
          msg: msg,
          data: data,
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
