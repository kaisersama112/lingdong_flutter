// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'generic_response_reply.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$GenericResponseReply extends GenericResponseReply {
  @override
  final int? code;
  @override
  final String? msg;
  @override
  final Reply? data;

  factory _$GenericResponseReply(
          [void Function(GenericResponseReplyBuilder)? updates]) =>
      (GenericResponseReplyBuilder()..update(updates))._build();

  _$GenericResponseReply._({this.code, this.msg, this.data}) : super._();
  @override
  GenericResponseReply rebuild(
          void Function(GenericResponseReplyBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GenericResponseReplyBuilder toBuilder() =>
      GenericResponseReplyBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GenericResponseReply &&
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
    return (newBuiltValueToStringHelper(r'GenericResponseReply')
          ..add('code', code)
          ..add('msg', msg)
          ..add('data', data))
        .toString();
  }
}

class GenericResponseReplyBuilder
    implements Builder<GenericResponseReply, GenericResponseReplyBuilder> {
  _$GenericResponseReply? _$v;

  int? _code;
  int? get code => _$this._code;
  set code(int? code) => _$this._code = code;

  String? _msg;
  String? get msg => _$this._msg;
  set msg(String? msg) => _$this._msg = msg;

  ReplyBuilder? _data;
  ReplyBuilder get data => _$this._data ??= ReplyBuilder();
  set data(ReplyBuilder? data) => _$this._data = data;

  GenericResponseReplyBuilder() {
    GenericResponseReply._defaults(this);
  }

  GenericResponseReplyBuilder get _$this {
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
  void replace(GenericResponseReply other) {
    _$v = other as _$GenericResponseReply;
  }

  @override
  void update(void Function(GenericResponseReplyBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GenericResponseReply build() => _build();

  _$GenericResponseReply _build() {
    _$GenericResponseReply _$result;
    try {
      _$result = _$v ??
          _$GenericResponseReply._(
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
            r'GenericResponseReply', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
