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
  final int userId;
  @override
  final DateTime createdAt;
  @override
  final DateTime? updatedAt;

  factory _$Reply([void Function(ReplyBuilder)? updates]) =>
      (ReplyBuilder()..update(updates))._build();

  _$Reply._(
      {required this.content,
      this.medias,
      required this.id,
      required this.parentCommentId,
      required this.userId,
      required this.createdAt,
      this.updatedAt})
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
        userId == other.userId &&
        createdAt == other.createdAt &&
        updatedAt == other.updatedAt;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, content.hashCode);
    _$hash = $jc(_$hash, medias.hashCode);
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, parentCommentId.hashCode);
    _$hash = $jc(_$hash, userId.hashCode);
    _$hash = $jc(_$hash, createdAt.hashCode);
    _$hash = $jc(_$hash, updatedAt.hashCode);
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
          ..add('userId', userId)
          ..add('createdAt', createdAt)
          ..add('updatedAt', updatedAt))
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

  int? _userId;
  int? get userId => _$this._userId;
  set userId(int? userId) => _$this._userId = userId;

  DateTime? _createdAt;
  DateTime? get createdAt => _$this._createdAt;
  set createdAt(DateTime? createdAt) => _$this._createdAt = createdAt;

  DateTime? _updatedAt;
  DateTime? get updatedAt => _$this._updatedAt;
  set updatedAt(DateTime? updatedAt) => _$this._updatedAt = updatedAt;

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
      _userId = $v.userId;
      _createdAt = $v.createdAt;
      _updatedAt = $v.updatedAt;
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
            userId: BuiltValueNullFieldError.checkNotNull(
                userId, r'Reply', 'userId'),
            createdAt: BuiltValueNullFieldError.checkNotNull(
                createdAt, r'Reply', 'createdAt'),
            updatedAt: updatedAt,
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'medias';
        _medias?.build();
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
