// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'media_out.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$MediaOut extends MediaOut {
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
  final int id;
  @override
  final DateTime createdAt;

  factory _$MediaOut([void Function(MediaOutBuilder)? updates]) =>
      (MediaOutBuilder()..update(updates))._build();

  _$MediaOut._(
      {required this.relatedType,
      required this.relatedId,
      required this.mediaType,
      required this.url,
      this.thumbnailUrl,
      this.description,
      this.sortOrder,
      required this.id,
      required this.createdAt})
      : super._();
  @override
  MediaOut rebuild(void Function(MediaOutBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  MediaOutBuilder toBuilder() => MediaOutBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is MediaOut &&
        relatedType == other.relatedType &&
        relatedId == other.relatedId &&
        mediaType == other.mediaType &&
        url == other.url &&
        thumbnailUrl == other.thumbnailUrl &&
        description == other.description &&
        sortOrder == other.sortOrder &&
        id == other.id &&
        createdAt == other.createdAt;
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
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, createdAt.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'MediaOut')
          ..add('relatedType', relatedType)
          ..add('relatedId', relatedId)
          ..add('mediaType', mediaType)
          ..add('url', url)
          ..add('thumbnailUrl', thumbnailUrl)
          ..add('description', description)
          ..add('sortOrder', sortOrder)
          ..add('id', id)
          ..add('createdAt', createdAt))
        .toString();
  }
}

class MediaOutBuilder implements Builder<MediaOut, MediaOutBuilder> {
  _$MediaOut? _$v;

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

  int? _id;
  int? get id => _$this._id;
  set id(int? id) => _$this._id = id;

  DateTime? _createdAt;
  DateTime? get createdAt => _$this._createdAt;
  set createdAt(DateTime? createdAt) => _$this._createdAt = createdAt;

  MediaOutBuilder() {
    MediaOut._defaults(this);
  }

  MediaOutBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _relatedType = $v.relatedType;
      _relatedId = $v.relatedId;
      _mediaType = $v.mediaType;
      _url = $v.url;
      _thumbnailUrl = $v.thumbnailUrl;
      _description = $v.description;
      _sortOrder = $v.sortOrder;
      _id = $v.id;
      _createdAt = $v.createdAt;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(MediaOut other) {
    _$v = other as _$MediaOut;
  }

  @override
  void update(void Function(MediaOutBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  MediaOut build() => _build();

  _$MediaOut _build() {
    final _$result = _$v ??
        _$MediaOut._(
          relatedType: BuiltValueNullFieldError.checkNotNull(
              relatedType, r'MediaOut', 'relatedType'),
          relatedId: BuiltValueNullFieldError.checkNotNull(
              relatedId, r'MediaOut', 'relatedId'),
          mediaType: BuiltValueNullFieldError.checkNotNull(
              mediaType, r'MediaOut', 'mediaType'),
          url: BuiltValueNullFieldError.checkNotNull(url, r'MediaOut', 'url'),
          thumbnailUrl: thumbnailUrl,
          description: description,
          sortOrder: sortOrder,
          id: BuiltValueNullFieldError.checkNotNull(id, r'MediaOut', 'id'),
          createdAt: BuiltValueNullFieldError.checkNotNull(
              createdAt, r'MediaOut', 'createdAt'),
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
