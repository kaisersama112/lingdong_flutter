// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_message_to_conversation.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$AddMessageToConversation extends AddMessageToConversation {
  @override
  final String sessionId;
  @override
  final String content;
  @override
  final int? messageType;
  @override
  final int? mediaId;

  factory _$AddMessageToConversation(
          [void Function(AddMessageToConversationBuilder)? updates]) =>
      (AddMessageToConversationBuilder()..update(updates))._build();

  _$AddMessageToConversation._(
      {required this.sessionId,
      required this.content,
      this.messageType,
      this.mediaId})
      : super._();
  @override
  AddMessageToConversation rebuild(
          void Function(AddMessageToConversationBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AddMessageToConversationBuilder toBuilder() =>
      AddMessageToConversationBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AddMessageToConversation &&
        sessionId == other.sessionId &&
        content == other.content &&
        messageType == other.messageType &&
        mediaId == other.mediaId;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, sessionId.hashCode);
    _$hash = $jc(_$hash, content.hashCode);
    _$hash = $jc(_$hash, messageType.hashCode);
    _$hash = $jc(_$hash, mediaId.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'AddMessageToConversation')
          ..add('sessionId', sessionId)
          ..add('content', content)
          ..add('messageType', messageType)
          ..add('mediaId', mediaId))
        .toString();
  }
}

class AddMessageToConversationBuilder
    implements
        Builder<AddMessageToConversation, AddMessageToConversationBuilder> {
  _$AddMessageToConversation? _$v;

  String? _sessionId;
  String? get sessionId => _$this._sessionId;
  set sessionId(String? sessionId) => _$this._sessionId = sessionId;

  String? _content;
  String? get content => _$this._content;
  set content(String? content) => _$this._content = content;

  int? _messageType;
  int? get messageType => _$this._messageType;
  set messageType(int? messageType) => _$this._messageType = messageType;

  int? _mediaId;
  int? get mediaId => _$this._mediaId;
  set mediaId(int? mediaId) => _$this._mediaId = mediaId;

  AddMessageToConversationBuilder() {
    AddMessageToConversation._defaults(this);
  }

  AddMessageToConversationBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _sessionId = $v.sessionId;
      _content = $v.content;
      _messageType = $v.messageType;
      _mediaId = $v.mediaId;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AddMessageToConversation other) {
    _$v = other as _$AddMessageToConversation;
  }

  @override
  void update(void Function(AddMessageToConversationBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  AddMessageToConversation build() => _build();

  _$AddMessageToConversation _build() {
    final _$result = _$v ??
        _$AddMessageToConversation._(
          sessionId: BuiltValueNullFieldError.checkNotNull(
              sessionId, r'AddMessageToConversation', 'sessionId'),
          content: BuiltValueNullFieldError.checkNotNull(
              content, r'AddMessageToConversation', 'content'),
          messageType: messageType,
          mediaId: mediaId,
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
