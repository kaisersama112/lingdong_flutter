// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_create.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$PostCreate extends PostCreate {
  @override
  final String content;
  @override
  final int relatedType;
  @override
  final int? communityId;
  @override
  final BuiltList<MediaCreate>? medias;
  @override
  final String? tags;
  @override
  final int? visibility;
  @override
  final String? location;

  factory _$PostCreate([void Function(PostCreateBuilder)? updates]) =>
      (PostCreateBuilder()..update(updates))._build();

  _$PostCreate._(
      {required this.content,
      required this.relatedType,
      this.communityId,
      this.medias,
      this.tags,
      this.visibility,
      this.location})
      : super._();
  @override
  PostCreate rebuild(void Function(PostCreateBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  PostCreateBuilder toBuilder() => PostCreateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is PostCreate &&
        content == other.content &&
        relatedType == other.relatedType &&
        communityId == other.communityId &&
        medias == other.medias &&
        tags == other.tags &&
        visibility == other.visibility &&
        location == other.location;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, content.hashCode);
    _$hash = $jc(_$hash, relatedType.hashCode);
    _$hash = $jc(_$hash, communityId.hashCode);
    _$hash = $jc(_$hash, medias.hashCode);
    _$hash = $jc(_$hash, tags.hashCode);
    _$hash = $jc(_$hash, visibility.hashCode);
    _$hash = $jc(_$hash, location.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'PostCreate')
          ..add('content', content)
          ..add('relatedType', relatedType)
          ..add('communityId', communityId)
          ..add('medias', medias)
          ..add('tags', tags)
          ..add('visibility', visibility)
          ..add('location', location))
        .toString();
  }
}

class PostCreateBuilder implements Builder<PostCreate, PostCreateBuilder> {
  _$PostCreate? _$v;

  String? _content;
  String? get content => _$this._content;
  set content(String? content) => _$this._content = content;

  int? _relatedType;
  int? get relatedType => _$this._relatedType;
  set relatedType(int? relatedType) => _$this._relatedType = relatedType;

  int? _communityId;
  int? get communityId => _$this._communityId;
  set communityId(int? communityId) => _$this._communityId = communityId;

  ListBuilder<MediaCreate>? _medias;
  ListBuilder<MediaCreate> get medias =>
      _$this._medias ??= ListBuilder<MediaCreate>();
  set medias(ListBuilder<MediaCreate>? medias) => _$this._medias = medias;

  String? _tags;
  String? get tags => _$this._tags;
  set tags(String? tags) => _$this._tags = tags;

  int? _visibility;
  int? get visibility => _$this._visibility;
  set visibility(int? visibility) => _$this._visibility = visibility;

  String? _location;
  String? get location => _$this._location;
  set location(String? location) => _$this._location = location;

  PostCreateBuilder() {
    PostCreate._defaults(this);
  }

  PostCreateBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _content = $v.content;
      _relatedType = $v.relatedType;
      _communityId = $v.communityId;
      _medias = $v.medias?.toBuilder();
      _tags = $v.tags;
      _visibility = $v.visibility;
      _location = $v.location;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(PostCreate other) {
    _$v = other as _$PostCreate;
  }

  @override
  void update(void Function(PostCreateBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  PostCreate build() => _build();

  _$PostCreate _build() {
    _$PostCreate _$result;
    try {
      _$result = _$v ??
          _$PostCreate._(
            content: BuiltValueNullFieldError.checkNotNull(
                content, r'PostCreate', 'content'),
            relatedType: BuiltValueNullFieldError.checkNotNull(
                relatedType, r'PostCreate', 'relatedType'),
            communityId: communityId,
            medias: _medias?.build(),
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
            r'PostCreate', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
