// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'generic_response_group_message_response.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$GenericResponseGroupMessageResponse
    extends GenericResponseGroupMessageResponse {
  @override
  final int? code;
  @override
  final String? msg;
  @override
  final GroupMessageResponse? data;

  factory _$GenericResponseGroupMessageResponse(
          [void Function(GenericResponseGroupMessageResponseBuilder)?
              updates]) =>
      (GenericResponseGroupMessageResponseBuilder()..update(updates))._build();

  _$GenericResponseGroupMessageResponse._({this.code, this.msg, this.data})
      : super._();
  @override
  GenericResponseGroupMessageResponse rebuild(
          void Function(GenericResponseGroupMessageResponseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GenericResponseGroupMessageResponseBuilder toBuilder() =>
      GenericResponseGroupMessageResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GenericResponseGroupMessageResponse &&
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
    return (newBuiltValueToStringHelper(r'GenericResponseGroupMessageResponse')
          ..add('code', code)
          ..add('msg', msg)
          ..add('data', data))
        .toString();
  }
}

class GenericResponseGroupMessageResponseBuilder
    implements
        Builder<GenericResponseGroupMessageResponse,
            GenericResponseGroupMessageResponseBuilder> {
  _$GenericResponseGroupMessageResponse? _$v;

  int? _code;
  int? get code => _$this._code;
  set code(int? code) => _$this._code = code;

  String? _msg;
  String? get msg => _$this._msg;
  set msg(String? msg) => _$this._msg = msg;

  GroupMessageResponseBuilder? _data;
  GroupMessageResponseBuilder get data =>
      _$this._data ??= GroupMessageResponseBuilder();
  set data(GroupMessageResponseBuilder? data) => _$this._data = data;

  GenericResponseGroupMessageResponseBuilder() {
    GenericResponseGroupMessageResponse._defaults(this);
  }

  GenericResponseGroupMessageResponseBuilder get _$this {
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
  void replace(GenericResponseGroupMessageResponse other) {
    _$v = other as _$GenericResponseGroupMessageResponse;
  }

  @override
  void update(
      void Function(GenericResponseGroupMessageResponseBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GenericResponseGroupMessageResponse build() => _build();

  _$GenericResponseGroupMessageResponse _build() {
    _$GenericResponseGroupMessageResponse _$result;
    try {
      _$result = _$v ??
          _$GenericResponseGroupMessageResponse._(
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
        throw BuiltValueNestedFieldError(r'GenericResponseGroupMessageResponse',
            _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
