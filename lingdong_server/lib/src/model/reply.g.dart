// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reply.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$Reply extends Reply {
  @override
  final String content;
  @override
  final BuiltList<MediaResponse>? medias;
  @override
  final int id;
  @override
  final int parentCommentId;
  @override
  final int? replyToReplyId;
  @override
  final BuiltMap<String, JsonObject?> replier;
  @override
  final BuiltMap<String, JsonObject?>? replyTo;
  @override
  final DateTime createdAt;
  @override
  final DateTime? updatedAt;
  @override
  final BuiltList<Reply>? replies;

  factory _$Reply([void Function(ReplyBuilder)? updates]) =>
      (ReplyBuilder()..update(updates))._build();

  _$Reply._(
      {required this.content,
      this.medias,
      required this.id,
      required this.parentCommentId,
      this.replyToReplyId,
      required this.replier,
      this.replyTo,
      required this.createdAt,
      this.updatedAt,
      this.replies})
      : super._();
  @override
  Reply rebuild(void Function(ReplyBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ReplyBuilder toBuilder() => ReplyBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Reply &&
        content == other.content &&
        medias == other.medias &&
        id == other.id &&
        parentCommentId == other.parentCommentId &&
        replyToReplyId == other.replyToReplyId &&
        replier == other.replier &&
        replyTo == other.replyTo &&
        createdAt == other.createdAt &&
        updatedAt == other.updatedAt &&
        replies == other.replies;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, content.hashCode);
    _$hash = $jc(_$hash, medias.hashCode);
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, parentCommentId.hashCode);
    _$hash = $jc(_$hash, replyToReplyId.hashCode);
    _$hash = $jc(_$hash, replier.hashCode);
    _$hash = $jc(_$hash, replyTo.hashCode);
    _$hash = $jc(_$hash, createdAt.hashCode);
    _$hash = $jc(_$hash, updatedAt.hashCode);
    _$hash = $jc(_$hash, replies.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'Reply')
          ..add('content', content)
          ..add('medias', medias)
          ..add('id', id)
          ..add('parentCommentId', parentCommentId)
          ..add('replyToReplyId', replyToReplyId)
          ..add('replier', replier)
          ..add('replyTo', replyTo)
          ..add('createdAt', createdAt)
          ..add('updatedAt', updatedAt)
          ..add('replies', replies))
        .toString();
  }
}

class ReplyBuilder implements Builder<Reply, ReplyBuilder> {
  _$Reply? _$v;

  String? _content;
  String? get content => _$this._content;
  set content(String? content) => _$this._content = content;

  ListBuilder<MediaResponse>? _medias;
  ListBuilder<MediaResponse> get medias =>
      _$this._medias ??= ListBuilder<MediaResponse>();
  set medias(ListBuilder<MediaResponse>? medias) => _$this._medias = medias;

  int? _id;
  int? get id => _$this._id;
  set id(int? id) => _$this._id = id;

  int? _parentCommentId;
  int? get parentCommentId => _$this._parentCommentId;
  set parentCommentId(int? parentCommentId) =>
      _$this._parentCommentId = parentCommentId;

  int? _replyToReplyId;
  int? get replyToReplyId => _$this._replyToReplyId;
  set replyToReplyId(int? replyToReplyId) =>
      _$this._replyToReplyId = replyToReplyId;

  MapBuilder<String, JsonObject?>? _replier;
  MapBuilder<String, JsonObject?> get replier =>
      _$this._replier ??= MapBuilder<String, JsonObject?>();
  set replier(MapBuilder<String, JsonObject?>? replier) =>
      _$this._replier = replier;

  MapBuilder<String, JsonObject?>? _replyTo;
  MapBuilder<String, JsonObject?> get replyTo =>
      _$this._replyTo ??= MapBuilder<String, JsonObject?>();
  set replyTo(MapBuilder<String, JsonObject?>? replyTo) =>
      _$this._replyTo = replyTo;

  DateTime? _createdAt;
  DateTime? get createdAt => _$this._createdAt;
  set createdAt(DateTime? createdAt) => _$this._createdAt = createdAt;

  DateTime? _updatedAt;
  DateTime? get updatedAt => _$this._updatedAt;
  set updatedAt(DateTime? updatedAt) => _$this._updatedAt = updatedAt;

  ListBuilder<Reply>? _replies;
  ListBuilder<Reply> get replies => _$this._replies ??= ListBuilder<Reply>();
  set replies(ListBuilder<Reply>? replies) => _$this._replies = replies;

  ReplyBuilder() {
    Reply._defaults(this);
  }

  ReplyBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _content = $v.content;
      _medias = $v.medias?.toBuilder();
      _id = $v.id;
      _parentCommentId = $v.parentCommentId;
      _replyToReplyId = $v.replyToReplyId;
      _replier = $v.replier.toBuilder();
      _replyTo = $v.replyTo?.toBuilder();
      _createdAt = $v.createdAt;
      _updatedAt = $v.updatedAt;
      _replies = $v.replies?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Reply other) {
    _$v = other as _$Reply;
  }

  @override
  void update(void Function(ReplyBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  Reply build() => _build();

  _$Reply _build() {
    _$Reply _$result;
    try {
      _$result = _$v ??
          _$Reply._(
            content: BuiltValueNullFieldError.checkNotNull(
                content, r'Reply', 'content'),
            medias: _medias?.build(),
            id: BuiltValueNullFieldError.checkNotNull(id, r'Reply', 'id'),
            parentCommentId: BuiltValueNullFieldError.checkNotNull(
                parentCommentId, r'Reply', 'parentCommentId'),
            replyToReplyId: replyToReplyId,
            replier: replier.build(),
            replyTo: _replyTo?.build(),
            createdAt: BuiltValueNullFieldError.checkNotNull(
                createdAt, r'Reply', 'createdAt'),
            updatedAt: updatedAt,
            replies: _replies?.build(),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'medias';
        _medias?.build();

        _$failedField = 'replier';
        replier.build();
        _$failedField = 'replyTo';
        _replyTo?.build();

        _$failedField = 'replies';
        _replies?.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(r'Reply', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
