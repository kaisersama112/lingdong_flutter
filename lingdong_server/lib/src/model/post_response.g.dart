// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_response.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$PostResponse extends PostResponse {
  @override
  final int id;
  @override
  final int userId;
  @override
  final String username;
  @override
  final String? userAvatar;
  @override
  final int? communityId;
  @override
  final String? communityName;
  @override
  final String content;
  @override
  final DateTime? createdAt;
  @override
  final DateTime? updatedAt;
  @override
  final BuiltList<MediaResponse>? medias;
  @override
  final int? likeCount;
  @override
  final int? commentCount;
  @override
  final int? favoriteCount;
  @override
  final int? shareCount;
  @override
  final bool? isLiked;
  @override
  final bool? isFavorited;
  @override
  final String? tags;
  @override
  final int? visibility;
  @override
  final String? location;

  factory _$PostResponse([void Function(PostResponseBuilder)? updates]) =>
      (PostResponseBuilder()..update(updates))._build();

  _$PostResponse._(
      {required this.id,
      required this.userId,
      required this.username,
      this.userAvatar,
      this.communityId,
      this.communityName,
      required this.content,
      this.createdAt,
      this.updatedAt,
      this.medias,
      this.likeCount,
      this.commentCount,
      this.favoriteCount,
      this.shareCount,
      this.isLiked,
      this.isFavorited,
      this.tags,
      this.visibility,
      this.location})
      : super._();
  @override
  PostResponse rebuild(void Function(PostResponseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  PostResponseBuilder toBuilder() => PostResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is PostResponse &&
        id == other.id &&
        userId == other.userId &&
        username == other.username &&
        userAvatar == other.userAvatar &&
        communityId == other.communityId &&
        communityName == other.communityName &&
        content == other.content &&
        createdAt == other.createdAt &&
        updatedAt == other.updatedAt &&
        medias == other.medias &&
        likeCount == other.likeCount &&
        commentCount == other.commentCount &&
        favoriteCount == other.favoriteCount &&
        shareCount == other.shareCount &&
        isLiked == other.isLiked &&
        isFavorited == other.isFavorited &&
        tags == other.tags &&
        visibility == other.visibility &&
        location == other.location;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, userId.hashCode);
    _$hash = $jc(_$hash, username.hashCode);
    _$hash = $jc(_$hash, userAvatar.hashCode);
    _$hash = $jc(_$hash, communityId.hashCode);
    _$hash = $jc(_$hash, communityName.hashCode);
    _$hash = $jc(_$hash, content.hashCode);
    _$hash = $jc(_$hash, createdAt.hashCode);
    _$hash = $jc(_$hash, updatedAt.hashCode);
    _$hash = $jc(_$hash, medias.hashCode);
    _$hash = $jc(_$hash, likeCount.hashCode);
    _$hash = $jc(_$hash, commentCount.hashCode);
    _$hash = $jc(_$hash, favoriteCount.hashCode);
    _$hash = $jc(_$hash, shareCount.hashCode);
    _$hash = $jc(_$hash, isLiked.hashCode);
    _$hash = $jc(_$hash, isFavorited.hashCode);
    _$hash = $jc(_$hash, tags.hashCode);
    _$hash = $jc(_$hash, visibility.hashCode);
    _$hash = $jc(_$hash, location.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'PostResponse')
          ..add('id', id)
          ..add('userId', userId)
          ..add('username', username)
          ..add('userAvatar', userAvatar)
          ..add('communityId', communityId)
          ..add('communityName', communityName)
          ..add('content', content)
          ..add('createdAt', createdAt)
          ..add('updatedAt', updatedAt)
          ..add('medias', medias)
          ..add('likeCount', likeCount)
          ..add('commentCount', commentCount)
          ..add('favoriteCount', favoriteCount)
          ..add('shareCount', shareCount)
          ..add('isLiked', isLiked)
          ..add('isFavorited', isFavorited)
          ..add('tags', tags)
          ..add('visibility', visibility)
          ..add('location', location))
        .toString();
  }
}

class PostResponseBuilder
    implements Builder<PostResponse, PostResponseBuilder> {
  _$PostResponse? _$v;

  int? _id;
  int? get id => _$this._id;
  set id(int? id) => _$this._id = id;

  int? _userId;
  int? get userId => _$this._userId;
  set userId(int? userId) => _$this._userId = userId;

  String? _username;
  String? get username => _$this._username;
  set username(String? username) => _$this._username = username;

  String? _userAvatar;
  String? get userAvatar => _$this._userAvatar;
  set userAvatar(String? userAvatar) => _$this._userAvatar = userAvatar;

  int? _communityId;
  int? get communityId => _$this._communityId;
  set communityId(int? communityId) => _$this._communityId = communityId;

  String? _communityName;
  String? get communityName => _$this._communityName;
  set communityName(String? communityName) =>
      _$this._communityName = communityName;

  String? _content;
  String? get content => _$this._content;
  set content(String? content) => _$this._content = content;

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

  int? _commentCount;
  int? get commentCount => _$this._commentCount;
  set commentCount(int? commentCount) => _$this._commentCount = commentCount;

  int? _favoriteCount;
  int? get favoriteCount => _$this._favoriteCount;
  set favoriteCount(int? favoriteCount) =>
      _$this._favoriteCount = favoriteCount;

  int? _shareCount;
  int? get shareCount => _$this._shareCount;
  set shareCount(int? shareCount) => _$this._shareCount = shareCount;

  bool? _isLiked;
  bool? get isLiked => _$this._isLiked;
  set isLiked(bool? isLiked) => _$this._isLiked = isLiked;

  bool? _isFavorited;
  bool? get isFavorited => _$this._isFavorited;
  set isFavorited(bool? isFavorited) => _$this._isFavorited = isFavorited;

  String? _tags;
  String? get tags => _$this._tags;
  set tags(String? tags) => _$this._tags = tags;

  int? _visibility;
  int? get visibility => _$this._visibility;
  set visibility(int? visibility) => _$this._visibility = visibility;

  String? _location;
  String? get location => _$this._location;
  set location(String? location) => _$this._location = location;

  PostResponseBuilder() {
    PostResponse._defaults(this);
  }

  PostResponseBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _userId = $v.userId;
      _username = $v.username;
      _userAvatar = $v.userAvatar;
      _communityId = $v.communityId;
      _communityName = $v.communityName;
      _content = $v.content;
      _createdAt = $v.createdAt;
      _updatedAt = $v.updatedAt;
      _medias = $v.medias?.toBuilder();
      _likeCount = $v.likeCount;
      _commentCount = $v.commentCount;
      _favoriteCount = $v.favoriteCount;
      _shareCount = $v.shareCount;
      _isLiked = $v.isLiked;
      _isFavorited = $v.isFavorited;
      _tags = $v.tags;
      _visibility = $v.visibility;
      _location = $v.location;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(PostResponse other) {
    _$v = other as _$PostResponse;
  }

  @override
  void update(void Function(PostResponseBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  PostResponse build() => _build();

  _$PostResponse _build() {
    _$PostResponse _$result;
    try {
      _$result = _$v ??
          _$PostResponse._(
            id: BuiltValueNullFieldError.checkNotNull(
                id, r'PostResponse', 'id'),
            userId: BuiltValueNullFieldError.checkNotNull(
                userId, r'PostResponse', 'userId'),
            username: BuiltValueNullFieldError.checkNotNull(
                username, r'PostResponse', 'username'),
            userAvatar: userAvatar,
            communityId: communityId,
            communityName: communityName,
            content: BuiltValueNullFieldError.checkNotNull(
                content, r'PostResponse', 'content'),
            createdAt: createdAt,
            updatedAt: updatedAt,
            medias: _medias?.build(),
            likeCount: likeCount,
            commentCount: commentCount,
            favoriteCount: favoriteCount,
            shareCount: shareCount,
            isLiked: isLiked,
            isFavorited: isFavorited,
            tags: tags,
            visibility: visibility,
            location: location,
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'medias';
        _medias?.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'PostResponse', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
