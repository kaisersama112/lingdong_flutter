// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'generic_response_conversation_response.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$GenericResponseConversationResponse
    extends GenericResponseConversationResponse {
  @override
  final int? code;
  @override
  final String? msg;
  @override
  final ConversationResponse? data;

  factory _$GenericResponseConversationResponse(
          [void Function(GenericResponseConversationResponseBuilder)?
              updates]) =>
      (GenericResponseConversationResponseBuilder()..update(updates))._build();

  _$GenericResponseConversationResponse._({this.code, this.msg, this.data})
      : super._();
  @override
  GenericResponseConversationResponse rebuild(
          void Function(GenericResponseConversationResponseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GenericResponseConversationResponseBuilder toBuilder() =>
      GenericResponseConversationResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GenericResponseConversationResponse &&
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
    return (newBuiltValueToStringHelper(r'GenericResponseConversationResponse')
          ..add('code', code)
          ..add('msg', msg)
          ..add('data', data))
        .toString();
  }
}

class GenericResponseConversationResponseBuilder
    implements
        Builder<GenericResponseConversationResponse,
            GenericResponseConversationResponseBuilder> {
  _$GenericResponseConversationResponse? _$v;

  int? _code;
  int? get code => _$this._code;
  set code(int? code) => _$this._code = code;

  String? _msg;
  String? get msg => _$this._msg;
  set msg(String? msg) => _$this._msg = msg;

  ConversationResponseBuilder? _data;
  ConversationResponseBuilder get data =>
      _$this._data ??= ConversationResponseBuilder();
  set data(ConversationResponseBuilder? data) => _$this._data = data;

  GenericResponseConversationResponseBuilder() {
    GenericResponseConversationResponse._defaults(this);
  }

  GenericResponseConversationResponseBuilder get _$this {
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
  void replace(GenericResponseConversationResponse other) {
    _$v = other as _$GenericResponseConversationResponse;
  }

  @override
  void update(
      void Function(GenericResponseConversationResponseBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GenericResponseConversationResponse build() => _build();

  _$GenericResponseConversationResponse _build() {
    _$GenericResponseConversationResponse _$result;
    try {
      _$result = _$v ??
          _$GenericResponseConversationResponse._(
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
        throw BuiltValueNestedFieldError(r'GenericResponseConversationResponse',
            _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
