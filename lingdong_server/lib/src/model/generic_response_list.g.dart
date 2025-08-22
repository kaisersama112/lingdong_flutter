// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'generic_response_list.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$GenericResponseList extends GenericResponseList {
  @override
  final int? code;
  @override
  final String? msg;
  @override
  final BuiltList<String>? data;

  factory _$GenericResponseList(
          [void Function(GenericResponseListBuilder)? updates]) =>
      (GenericResponseListBuilder()..update(updates))._build();

  _$GenericResponseList._({this.code, this.msg, this.data}) : super._();
  @override
  GenericResponseList rebuild(
          void Function(GenericResponseListBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GenericResponseListBuilder toBuilder() =>
      GenericResponseListBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GenericResponseList &&
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
    return (newBuiltValueToStringHelper(r'GenericResponseList')
          ..add('code', code)
          ..add('msg', msg)
          ..add('data', data))
        .toString();
  }
}

class GenericResponseListBuilder
    implements Builder<GenericResponseList, GenericResponseListBuilder> {
  _$GenericResponseList? _$v;

  int? _code;
  int? get code => _$this._code;
  set code(int? code) => _$this._code = code;

  String? _msg;
  String? get msg => _$this._msg;
  set msg(String? msg) => _$this._msg = msg;

  ListBuilder<String>? _data;
  ListBuilder<String> get data => _$this._data ??= ListBuilder<String>();
  set data(ListBuilder<String>? data) => _$this._data = data;

  GenericResponseListBuilder() {
    GenericResponseList._defaults(this);
  }

  GenericResponseListBuilder get _$this {
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
  void replace(GenericResponseList other) {
    _$v = other as _$GenericResponseList;
  }

  @override
  void update(void Function(GenericResponseListBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GenericResponseList build() => _build();

  _$GenericResponseList _build() {
    _$GenericResponseList _$result;
    try {
      _$result = _$v ??
          _$GenericResponseList._(
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
            r'GenericResponseList', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
