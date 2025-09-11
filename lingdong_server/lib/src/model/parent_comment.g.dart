// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'parent_comment.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$ParentComment extends ParentComment {
  @override
  final int id;
  @override
  final String content;
  @override
  final int postId;
  @override
  final int userId;
  @override
  final String username;
  @override
  final String? userAvatar;
  @override
  final int? replyToUserId;
  @override
  final DateTime createdAt;
  @override
  final DateTime? updatedAt;
  @override
  final BuiltList<MediaResponse>? medias;
  @override
  final int? likeCount;
  @override
  final bool? isLiked;

  factory _$ParentComment([void Function(ParentCommentBuilder)? updates]) =>
      (ParentCommentBuilder()..update(updates))._build();

  _$ParentComment._(
      {required this.id,
      required this.content,
      required this.postId,
      required this.userId,
      required this.username,
      this.userAvatar,
      this.replyToUserId,
      required this.createdAt,
      this.updatedAt,
      this.medias,
      this.likeCount,
      this.isLiked})
      : super._();
  @override
  ParentComment rebuild(void Function(ParentCommentBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ParentCommentBuilder toBuilder() => ParentCommentBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ParentComment &&
        id == other.id &&
        content == other.content &&
        postId == other.postId &&
        userId == other.userId &&
        username == other.username &&
        userAvatar == other.userAvatar &&
        replyToUserId == other.replyToUserId &&
        createdAt == other.createdAt &&
        updatedAt == other.updatedAt &&
        medias == other.medias &&
        likeCount == other.likeCount &&
        isLiked == other.isLiked;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, content.hashCode);
    _$hash = $jc(_$hash, postId.hashCode);
    _$hash = $jc(_$hash, userId.hashCode);
    _$hash = $jc(_$hash, username.hashCode);
    _$hash = $jc(_$hash, userAvatar.hashCode);
    _$hash = $jc(_$hash, replyToUserId.hashCode);
    _$hash = $jc(_$hash, createdAt.hashCode);
    _$hash = $jc(_$hash, updatedAt.hashCode);
    _$hash = $jc(_$hash, medias.hashCode);
    _$hash = $jc(_$hash, likeCount.hashCode);
    _$hash = $jc(_$hash, isLiked.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ParentComment')
          ..add('id', id)
          ..add('content', content)
          ..add('postId', postId)
          ..add('userId', userId)
          ..add('username', username)
          ..add('userAvatar', userAvatar)
          ..add('replyToUserId', replyToUserId)
          ..add('createdAt', createdAt)
          ..add('updatedAt', updatedAt)
          ..add('medias', medias)
          ..add('likeCount', likeCount)
          ..add('isLiked', isLiked))
        .toString();
  }
}

class ParentCommentBuilder
    implements Builder<ParentComment, ParentCommentBuilder> {
  _$ParentComment? _$v;

  int? _id;
  int? get id => _$this._id;
  set id(int? id) => _$this._id = id;

  String? _content;
  String? get content => _$this._content;
  set content(String? content) => _$this._content = content;

  int? _postId;
  int? get postId => _$this._postId;
  set postId(int? postId) => _$this._postId = postId;

  int? _userId;
  int? get userId => _$this._userId;
  set userId(int? userId) => _$this._userId = userId;

  String? _username;
  String? get username => _$this._username;
  set username(String? username) => _$this._username = username;

  String? _userAvatar;
  String? get userAvatar => _$this._userAvatar;
  set userAvatar(String? userAvatar) => _$this._userAvatar = userAvatar;

  int? _replyToUserId;
  int? get replyToUserId => _$this._replyToUserId;
  set replyToUserId(int? replyToUserId) =>
      _$this._replyToUserId = replyToUserId;

  DateTime? _createdAt;
  DateTime? get createdAt => _$this._createdAt;
  set createdAt(DateTime? createdAt) => _$this._createdAt = createdAt;

  DateTime? _updatedAt;
  DateTime? get updatedAt => _$this._updatedAt;
  set updatedAt(DateTime? updatedAt) => _$this._updatedAt = updatedAt;

  ListBuilder<MediaResponse>? _medias;
  ListBuilder<MediaResponse> get medias =>
      _$this._medias ??= ListBuilder<MediaResponse>();
  set medias(ListBuilder<MediaResponse>? medias) => _$this._medias = medias;

  int? _likeCount;
  int? get likeCount => _$this._likeCount;
  set likeCount(int? likeCount) => _$this._likeCount = likeCount;

  bool? _isLiked;
  bool? get isLiked => _$this._isLiked;
  set isLiked(bool? isLiked) => _$this._isLiked = isLiked;

  ParentCommentBuilder() {
    ParentComment._defaults(this);
  }

  ParentCommentBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _content = $v.content;
      _postId = $v.postId;
      _userId = $v.userId;
      _username = $v.username;
      _userAvatar = $v.userAvatar;
      _replyToUserId = $v.replyToUserId;
      _createdAt = $v.createdAt;
      _updatedAt = $v.updatedAt;
      _medias = $v.medias?.toBuilder();
      _likeCount = $v.likeCount;
      _isLiked = $v.isLiked;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ParentComment other) {
    _$v = other as _$ParentComment;
  }

  @override
  void update(void Function(ParentCommentBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ParentComment build() => _build();

  _$ParentComment _build() {
    _$ParentComment _$result;
    try {
      _$result = _$v ??
          _$ParentComment._(
            id: BuiltValueNullFieldError.checkNotNull(
                id, r'ParentComment', 'id'),
            content: BuiltValueNullFieldError.checkNotNull(
                content, r'ParentComment', 'content'),
            postId: BuiltValueNullFieldError.checkNotNull(
                postId, r'ParentComment', 'postId'),
            userId: BuiltValueNullFieldError.checkNotNull(
                userId, r'ParentComment', 'userId'),
            username: BuiltValueNullFieldError.checkNotNull(
                username, r'ParentComment', 'username'),
            userAvatar: userAvatar,
            replyToUserId: replyToUserId,
            createdAt: BuiltValueNullFieldError.checkNotNull(
                createdAt, r'ParentComment', 'createdAt'),
            updatedAt: updatedAt,
            medias: _medias?.build(),
            likeCount: likeCount,
            isLiked: isLiked,
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'medias';
        _medias?.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'ParentComment', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
