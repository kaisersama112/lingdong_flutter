// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reply_create.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$ReplyCreate extends ReplyCreate {
  @override
  final String content;
  @override
  final BuiltList<MediaCreate>? medias;
  @override
  final int parentCommentId;
  @override
  final int? replyToReplyId;

  factory _$ReplyCreate([void Function(ReplyCreateBuilder)? updates]) =>
      (ReplyCreateBuilder()..update(updates))._build();

  _$ReplyCreate._(
      {required this.content,
      this.medias,
      required this.parentCommentId,
      this.replyToReplyId})
      : super._();
  @override
  ReplyCreate rebuild(void Function(ReplyCreateBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ReplyCreateBuilder toBuilder() => ReplyCreateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ReplyCreate &&
        content == other.content &&
        medias == other.medias &&
        parentCommentId == other.parentCommentId &&
        replyToReplyId == other.replyToReplyId;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, content.hashCode);
    _$hash = $jc(_$hash, medias.hashCode);
    _$hash = $jc(_$hash, parentCommentId.hashCode);
    _$hash = $jc(_$hash, replyToReplyId.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ReplyCreate')
          ..add('content', content)
          ..add('medias', medias)
          ..add('parentCommentId', parentCommentId)
          ..add('replyToReplyId', replyToReplyId))
        .toString();
  }
}

class ReplyCreateBuilder implements Builder<ReplyCreate, ReplyCreateBuilder> {
  _$ReplyCreate? _$v;

  String? _content;
  String? get content => _$this._content;
  set content(String? content) => _$this._content = content;

  ListBuilder<MediaCreate>? _medias;
  ListBuilder<MediaCreate> get medias =>
      _$this._medias ??= ListBuilder<MediaCreate>();
  set medias(ListBuilder<MediaCreate>? medias) => _$this._medias = medias;

  int? _parentCommentId;
  int? get parentCommentId => _$this._parentCommentId;
  set parentCommentId(int? parentCommentId) =>
      _$this._parentCommentId = parentCommentId;

  int? _replyToReplyId;
  int? get replyToReplyId => _$this._replyToReplyId;
  set replyToReplyId(int? replyToReplyId) =>
      _$this._replyToReplyId = replyToReplyId;

  ReplyCreateBuilder() {
    ReplyCreate._defaults(this);
  }

  ReplyCreateBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _content = $v.content;
      _medias = $v.medias?.toBuilder();
      _parentCommentId = $v.parentCommentId;
      _replyToReplyId = $v.replyToReplyId;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ReplyCreate other) {
    _$v = other as _$ReplyCreate;
  }

  @override
  void update(void Function(ReplyCreateBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ReplyCreate build() => _build();

  _$ReplyCreate _build() {
    _$ReplyCreate _$result;
    try {
      _$result = _$v ??
          _$ReplyCreate._(
            content: BuiltValueNullFieldError.checkNotNull(
                content, r'ReplyCreate', 'content'),
            medias: _medias?.build(),
            parentCommentId: BuiltValueNullFieldError.checkNotNull(
                parentCommentId, r'ReplyCreate', 'parentCommentId'),
            replyToReplyId: replyToReplyId,
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'medias';
        _medias?.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'ReplyCreate', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
