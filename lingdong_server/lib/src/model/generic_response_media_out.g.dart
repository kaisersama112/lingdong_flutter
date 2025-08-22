// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'generic_response_media_out.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$GenericResponseMediaOut extends GenericResponseMediaOut {
  @override
  final int? code;
  @override
  final String? msg;
  @override
  final MediaOut? data;

  factory _$GenericResponseMediaOut(
          [void Function(GenericResponseMediaOutBuilder)? updates]) =>
      (GenericResponseMediaOutBuilder()..update(updates))._build();

  _$GenericResponseMediaOut._({this.code, this.msg, this.data}) : super._();
  @override
  GenericResponseMediaOut rebuild(
          void Function(GenericResponseMediaOutBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GenericResponseMediaOutBuilder toBuilder() =>
      GenericResponseMediaOutBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GenericResponseMediaOut &&
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
    return (newBuiltValueToStringHelper(r'GenericResponseMediaOut')
          ..add('code', code)
          ..add('msg', msg)
          ..add('data', data))
        .toString();
  }
}

class GenericResponseMediaOutBuilder
    implements
        Builder<GenericResponseMediaOut, GenericResponseMediaOutBuilder> {
  _$GenericResponseMediaOut? _$v;

  int? _code;
  int? get code => _$this._code;
  set code(int? code) => _$this._code = code;

  String? _msg;
  String? get msg => _$this._msg;
  set msg(String? msg) => _$this._msg = msg;

  MediaOutBuilder? _data;
  MediaOutBuilder get data => _$this._data ??= MediaOutBuilder();
  set data(MediaOutBuilder? data) => _$this._data = data;

  GenericResponseMediaOutBuilder() {
    GenericResponseMediaOut._defaults(this);
  }

  GenericResponseMediaOutBuilder get _$this {
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
  void replace(GenericResponseMediaOut other) {
    _$v = other as _$GenericResponseMediaOut;
  }

  @override
  void update(void Function(GenericResponseMediaOutBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GenericResponseMediaOut build() => _build();

  _$GenericResponseMediaOut _build() {
    _$GenericResponseMediaOut _$result;
    try {
      _$result = _$v ??
          _$GenericResponseMediaOut._(
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
            r'GenericResponseMediaOut', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
