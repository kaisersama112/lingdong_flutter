// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'generic_response_dict.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$GenericResponseDict extends GenericResponseDict {
  @override
  final int? code;
  @override
  final String? msg;
  @override
  final BuiltMap<String, JsonObject?>? data;

  factory _$GenericResponseDict(
          [void Function(GenericResponseDictBuilder)? updates]) =>
      (GenericResponseDictBuilder()..update(updates))._build();

  _$GenericResponseDict._({this.code, this.msg, this.data}) : super._();
  @override
  GenericResponseDict rebuild(
          void Function(GenericResponseDictBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GenericResponseDictBuilder toBuilder() =>
      GenericResponseDictBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GenericResponseDict &&
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
    return (newBuiltValueToStringHelper(r'GenericResponseDict')
          ..add('code', code)
          ..add('msg', msg)
          ..add('data', data))
        .toString();
  }
}

class GenericResponseDictBuilder
    implements Builder<GenericResponseDict, GenericResponseDictBuilder> {
  _$GenericResponseDict? _$v;

  int? _code;
  int? get code => _$this._code;
  set code(int? code) => _$this._code = code;

  String? _msg;
  String? get msg => _$this._msg;
  set msg(String? msg) => _$this._msg = msg;

  MapBuilder<String, JsonObject?>? _data;
  MapBuilder<String, JsonObject?> get data =>
      _$this._data ??= MapBuilder<String, JsonObject?>();
  set data(MapBuilder<String, JsonObject?>? data) => _$this._data = data;

  GenericResponseDictBuilder() {
    GenericResponseDict._defaults(this);
  }

  GenericResponseDictBuilder get _$this {
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
  void replace(GenericResponseDict other) {
    _$v = other as _$GenericResponseDict;
  }

  @override
  void update(void Function(GenericResponseDictBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GenericResponseDict build() => _build();

  _$GenericResponseDict _build() {
    _$GenericResponseDict _$result;
    try {
      _$result = _$v ??
          _$GenericResponseDict._(
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
            r'GenericResponseDict', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
