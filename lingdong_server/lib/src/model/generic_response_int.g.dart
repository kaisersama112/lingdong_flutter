// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'generic_response_int.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$GenericResponseInt extends GenericResponseInt {
  @override
  final int? code;
  @override
  final String? msg;
  @override
  final int? data;

  factory _$GenericResponseInt(
          [void Function(GenericResponseIntBuilder)? updates]) =>
      (GenericResponseIntBuilder()..update(updates))._build();

  _$GenericResponseInt._({this.code, this.msg, this.data}) : super._();
  @override
  GenericResponseInt rebuild(
          void Function(GenericResponseIntBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GenericResponseIntBuilder toBuilder() =>
      GenericResponseIntBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GenericResponseInt &&
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
    return (newBuiltValueToStringHelper(r'GenericResponseInt')
          ..add('code', code)
          ..add('msg', msg)
          ..add('data', data))
        .toString();
  }
}

class GenericResponseIntBuilder
    implements Builder<GenericResponseInt, GenericResponseIntBuilder> {
  _$GenericResponseInt? _$v;

  int? _code;
  int? get code => _$this._code;
  set code(int? code) => _$this._code = code;

  String? _msg;
  String? get msg => _$this._msg;
  set msg(String? msg) => _$this._msg = msg;

  int? _data;
  int? get data => _$this._data;
  set data(int? data) => _$this._data = data;

  GenericResponseIntBuilder() {
    GenericResponseInt._defaults(this);
  }

  GenericResponseIntBuilder get _$this {
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
  void replace(GenericResponseInt other) {
    _$v = other as _$GenericResponseInt;
  }

  @override
  void update(void Function(GenericResponseIntBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GenericResponseInt build() => _build();

  _$GenericResponseInt _build() {
    final _$result = _$v ??
        _$GenericResponseInt._(
          code: code,
          msg: msg,
          data: data,
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
