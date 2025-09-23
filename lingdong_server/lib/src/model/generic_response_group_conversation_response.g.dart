// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'generic_response_group_conversation_response.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$GenericResponseGroupConversationResponse
    extends GenericResponseGroupConversationResponse {
  @override
  final int? code;
  @override
  final String? msg;
  @override
  final GroupConversationResponse? data;

  factory _$GenericResponseGroupConversationResponse(
          [void Function(GenericResponseGroupConversationResponseBuilder)?
              updates]) =>
      (GenericResponseGroupConversationResponseBuilder()..update(updates))
          ._build();

  _$GenericResponseGroupConversationResponse._({this.code, this.msg, this.data})
      : super._();
  @override
  GenericResponseGroupConversationResponse rebuild(
          void Function(GenericResponseGroupConversationResponseBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GenericResponseGroupConversationResponseBuilder toBuilder() =>
      GenericResponseGroupConversationResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GenericResponseGroupConversationResponse &&
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
    return (newBuiltValueToStringHelper(
            r'GenericResponseGroupConversationResponse')
          ..add('code', code)
          ..add('msg', msg)
          ..add('data', data))
        .toString();
  }
}

class GenericResponseGroupConversationResponseBuilder
    implements
        Builder<GenericResponseGroupConversationResponse,
            GenericResponseGroupConversationResponseBuilder> {
  _$GenericResponseGroupConversationResponse? _$v;

  int? _code;
  int? get code => _$this._code;
  set code(int? code) => _$this._code = code;

  String? _msg;
  String? get msg => _$this._msg;
  set msg(String? msg) => _$this._msg = msg;

  GroupConversationResponseBuilder? _data;
  GroupConversationResponseBuilder get data =>
      _$this._data ??= GroupConversationResponseBuilder();
  set data(GroupConversationResponseBuilder? data) => _$this._data = data;

  GenericResponseGroupConversationResponseBuilder() {
    GenericResponseGroupConversationResponse._defaults(this);
  }

  GenericResponseGroupConversationResponseBuilder get _$this {
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
  void replace(GenericResponseGroupConversationResponse other) {
    _$v = other as _$GenericResponseGroupConversationResponse;
  }

  @override
  void update(
      void Function(GenericResponseGroupConversationResponseBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GenericResponseGroupConversationResponse build() => _build();

  _$GenericResponseGroupConversationResponse _build() {
    _$GenericResponseGroupConversationResponse _$result;
    try {
      _$result = _$v ??
          _$GenericResponseGroupConversationResponse._(
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
            r'GenericResponseGroupConversationResponse',
            _$failedField,
            e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
