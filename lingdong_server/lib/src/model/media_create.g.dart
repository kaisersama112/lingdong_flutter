// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'media_create.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$MediaCreate extends MediaCreate {
  @override
  final RelatedTypeEnum relatedType;
  @override
  final int relatedId;
  @override
  final MediaType mediaType;
  @override
  final String url;
  @override
  final String? thumbnailUrl;
  @override
  final String? description;
  @override
  final int? sortOrder;
  @override
  final int userId;

  factory _$MediaCreate([void Function(MediaCreateBuilder)? updates]) =>
      (MediaCreateBuilder()..update(updates))._build();

  _$MediaCreate._(
      {required this.relatedType,
      required this.relatedId,
      required this.mediaType,
      required this.url,
      this.thumbnailUrl,
      this.description,
      this.sortOrder,
      required this.userId})
      : super._();
  @override
  MediaCreate rebuild(void Function(MediaCreateBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  MediaCreateBuilder toBuilder() => MediaCreateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is MediaCreate &&
        relatedType == other.relatedType &&
        relatedId == other.relatedId &&
        mediaType == other.mediaType &&
        url == other.url &&
        thumbnailUrl == other.thumbnailUrl &&
        description == other.description &&
        sortOrder == other.sortOrder &&
        userId == other.userId;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, relatedType.hashCode);
    _$hash = $jc(_$hash, relatedId.hashCode);
    _$hash = $jc(_$hash, mediaType.hashCode);
    _$hash = $jc(_$hash, url.hashCode);
    _$hash = $jc(_$hash, thumbnailUrl.hashCode);
    _$hash = $jc(_$hash, description.hashCode);
    _$hash = $jc(_$hash, sortOrder.hashCode);
    _$hash = $jc(_$hash, userId.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'MediaCreate')
          ..add('relatedType', relatedType)
          ..add('relatedId', relatedId)
          ..add('mediaType', mediaType)
          ..add('url', url)
          ..add('thumbnailUrl', thumbnailUrl)
          ..add('description', description)
          ..add('sortOrder', sortOrder)
          ..add('userId', userId))
        .toString();
  }
}

class MediaCreateBuilder implements Builder<MediaCreate, MediaCreateBuilder> {
  _$MediaCreate? _$v;

  RelatedTypeEnum? _relatedType;
  RelatedTypeEnum? get relatedType => _$this._relatedType;
  set relatedType(RelatedTypeEnum? relatedType) =>
      _$this._relatedType = relatedType;

  int? _relatedId;
  int? get relatedId => _$this._relatedId;
  set relatedId(int? relatedId) => _$this._relatedId = relatedId;

  MediaType? _mediaType;
  MediaType? get mediaType => _$this._mediaType;
  set mediaType(MediaType? mediaType) => _$this._mediaType = mediaType;

  String? _url;
  String? get url => _$this._url;
  set url(String? url) => _$this._url = url;

  String? _thumbnailUrl;
  String? get thumbnailUrl => _$this._thumbnailUrl;
  set thumbnailUrl(String? thumbnailUrl) => _$this._thumbnailUrl = thumbnailUrl;

  String? _description;
  String? get description => _$this._description;
  set description(String? description) => _$this._description = description;

  int? _sortOrder;
  int? get sortOrder => _$this._sortOrder;
  set sortOrder(int? sortOrder) => _$this._sortOrder = sortOrder;

  int? _userId;
  int? get userId => _$this._userId;
  set userId(int? userId) => _$this._userId = userId;

  MediaCreateBuilder() {
    MediaCreate._defaults(this);
  }

  MediaCreateBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _relatedType = $v.relatedType;
      _relatedId = $v.relatedId;
      _mediaType = $v.mediaType;
      _url = $v.url;
      _thumbnailUrl = $v.thumbnailUrl;
      _description = $v.description;
      _sortOrder = $v.sortOrder;
      _userId = $v.userId;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(MediaCreate other) {
    _$v = other as _$MediaCreate;
  }

  @override
  void update(void Function(MediaCreateBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  MediaCreate build() => _build();

  _$MediaCreate _build() {
    final _$result = _$v ??
        _$MediaCreate._(
          relatedType: BuiltValueNullFieldError.checkNotNull(
              relatedType, r'MediaCreate', 'relatedType'),
          relatedId: BuiltValueNullFieldError.checkNotNull(
              relatedId, r'MediaCreate', 'relatedId'),
          mediaType: BuiltValueNullFieldError.checkNotNull(
              mediaType, r'MediaCreate', 'mediaType'),
          url:
              BuiltValueNullFieldError.checkNotNull(url, r'MediaCreate', 'url'),
          thumbnailUrl: thumbnailUrl,
          description: description,
          sortOrder: sortOrder,
          userId: BuiltValueNullFieldError.checkNotNull(
              userId, r'MediaCreate', 'userId'),
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
