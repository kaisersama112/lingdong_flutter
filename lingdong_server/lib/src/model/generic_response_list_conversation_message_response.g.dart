// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'generic_response_list_conversation_message_response.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$GenericResponseListConversationMessageResponse
    extends GenericResponseListConversationMessageResponse {
  @override
  final int? code;
  @override
  final String? msg;
  @override
  final BuiltList<ConversationMessageResponse>? data;

  factory _$GenericResponseListConversationMessageResponse(
          [void Function(GenericResponseListConversationMessageResponseBuilder)?
              updates]) =>
      (GenericResponseListConversationMessageResponseBuilder()..update(updates))
          ._build();

  _$GenericResponseListConversationMessageResponse._(
      {this.code, this.msg, this.data})
      : super._();
  @override
  GenericResponseListConversationMessageResponse rebuild(
          void Function(GenericResponseListConversationMessageResponseBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GenericResponseListConversationMessageResponseBuilder toBuilder() =>
      GenericResponseListConversationMessageResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GenericResponseListConversationMessageResponse &&
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
            r'GenericResponseListConversationMessageResponse')
          ..add('code', code)
          ..add('msg', msg)
          ..add('data', data))
        .toString();
  }
}

class GenericResponseListConversationMessageResponseBuilder
    implements
        Builder<GenericResponseListConversationMessageResponse,
            GenericResponseListConversationMessageResponseBuilder> {
  _$GenericResponseListConversationMessageResponse? _$v;

  int? _code;
  int? get code => _$this._code;
  set code(int? code) => _$this._code = code;

  String? _msg;
  String? get msg => _$this._msg;
  set msg(String? msg) => _$this._msg = msg;

  ListBuilder<ConversationMessageResponse>? _data;
  ListBuilder<ConversationMessageResponse> get data =>
      _$this._data ??= ListBuilder<ConversationMessageResponse>();
  set data(ListBuilder<ConversationMessageResponse>? data) =>
      _$this._data = data;

  GenericResponseListConversationMessageResponseBuilder() {
    GenericResponseListConversationMessageResponse._defaults(this);
  }

  GenericResponseListConversationMessageResponseBuilder get _$this {
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
  void replace(GenericResponseListConversationMessageResponse other) {
    _$v = other as _$GenericResponseListConversationMessageResponse;
  }

  @override
  void update(
      void Function(GenericResponseListConversationMessageResponseBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  GenericResponseListConversationMessageResponse build() => _build();

  _$GenericResponseListConversationMessageResponse _build() {
    _$GenericResponseListConversationMessageResponse _$result;
    try {
      _$result = _$v ??
          _$GenericResponseListConversationMessageResponse._(
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
            r'GenericResponseListConversationMessageResponse',
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
