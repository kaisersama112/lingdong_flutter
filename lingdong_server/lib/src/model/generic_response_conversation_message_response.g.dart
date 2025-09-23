// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'generic_response_conversation_message_response.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$GenericResponseConversationMessageResponse
    extends GenericResponseConversationMessageResponse {
  @override
  final int? code;
  @override
  final String? msg;
  @override
  final ConversationMessageResponse? data;

  factory _$GenericResponseConversationMessageResponse(
          [void Function(GenericResponseConversationMessageResponseBuilder)?
              updates]) =>
      (GenericResponseConversationMessageResponseBuilder()..update(updates))
          ._build();

  _$GenericResponseConversationMessageResponse._(
      {this.code, this.msg, this.data})
      : super._();
  @override
  GenericResponseConversationMessageResponse rebuild(
          void Function(GenericResponseConversationMessageResponseBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GenericResponseConversationMessageResponseBuilder toBuilder() =>
      GenericResponseConversationMessageResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GenericResponseConversationMessageResponse &&
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
            r'GenericResponseConversationMessageResponse')
          ..add('code', code)
          ..add('msg', msg)
          ..add('data', data))
        .toString();
  }
}

class GenericResponseConversationMessageResponseBuilder
    implements
        Builder<GenericResponseConversationMessageResponse,
            GenericResponseConversationMessageResponseBuilder> {
  _$GenericResponseConversationMessageResponse? _$v;

  int? _code;
  int? get code => _$this._code;
  set code(int? code) => _$this._code = code;

  String? _msg;
  String? get msg => _$this._msg;
  set msg(String? msg) => _$this._msg = msg;

  ConversationMessageResponseBuilder? _data;
  ConversationMessageResponseBuilder get data =>
      _$this._data ??= ConversationMessageResponseBuilder();
  set data(ConversationMessageResponseBuilder? data) => _$this._data = data;

  GenericResponseConversationMessageResponseBuilder() {
    GenericResponseConversationMessageResponse._defaults(this);
  }

  GenericResponseConversationMessageResponseBuilder get _$this {
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
  void replace(GenericResponseConversationMessageResponse other) {
    _$v = other as _$GenericResponseConversationMessageResponse;
  }

  @override
  void update(
      void Function(GenericResponseConversationMessageResponseBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  GenericResponseConversationMessageResponse build() => _build();

  _$GenericResponseConversationMessageResponse _build() {
    _$GenericResponseConversationMessageResponse _$result;
    try {
      _$result = _$v ??
          _$GenericResponseConversationMessageResponse._(
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
            r'GenericResponseConversationMessageResponse',
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
