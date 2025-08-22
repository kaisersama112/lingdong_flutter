// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'body_upload_media_api_media_upload_media_post.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$BodyUploadMediaApiMediaUploadMediaPost
    extends BodyUploadMediaApiMediaUploadMediaPost {
  @override
  final RelatedTypeEnum relatedType;
  @override
  final int relatedId;
  @override
  final int? sortOrder;
  @override
  final Uint8List file;
  @override
  final MediaType? mediaType;
  @override
  final String? description;

  factory _$BodyUploadMediaApiMediaUploadMediaPost(
          [void Function(BodyUploadMediaApiMediaUploadMediaPostBuilder)?
              updates]) =>
      (BodyUploadMediaApiMediaUploadMediaPostBuilder()..update(updates))
          ._build();

  _$BodyUploadMediaApiMediaUploadMediaPost._(
      {required this.relatedType,
      required this.relatedId,
      this.sortOrder,
      required this.file,
      this.mediaType,
      this.description})
      : super._();
  @override
  BodyUploadMediaApiMediaUploadMediaPost rebuild(
          void Function(BodyUploadMediaApiMediaUploadMediaPostBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  BodyUploadMediaApiMediaUploadMediaPostBuilder toBuilder() =>
      BodyUploadMediaApiMediaUploadMediaPostBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is BodyUploadMediaApiMediaUploadMediaPost &&
        relatedType == other.relatedType &&
        relatedId == other.relatedId &&
        sortOrder == other.sortOrder &&
        file == other.file &&
        mediaType == other.mediaType &&
        description == other.description;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, relatedType.hashCode);
    _$hash = $jc(_$hash, relatedId.hashCode);
    _$hash = $jc(_$hash, sortOrder.hashCode);
    _$hash = $jc(_$hash, file.hashCode);
    _$hash = $jc(_$hash, mediaType.hashCode);
    _$hash = $jc(_$hash, description.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(
            r'BodyUploadMediaApiMediaUploadMediaPost')
          ..add('relatedType', relatedType)
          ..add('relatedId', relatedId)
          ..add('sortOrder', sortOrder)
          ..add('file', file)
          ..add('mediaType', mediaType)
          ..add('description', description))
        .toString();
  }
}

class BodyUploadMediaApiMediaUploadMediaPostBuilder
    implements
        Builder<BodyUploadMediaApiMediaUploadMediaPost,
            BodyUploadMediaApiMediaUploadMediaPostBuilder> {
  _$BodyUploadMediaApiMediaUploadMediaPost? _$v;

  RelatedTypeEnum? _relatedType;
  RelatedTypeEnum? get relatedType => _$this._relatedType;
  set relatedType(RelatedTypeEnum? relatedType) =>
      _$this._relatedType = relatedType;

  int? _relatedId;
  int? get relatedId => _$this._relatedId;
  set relatedId(int? relatedId) => _$this._relatedId = relatedId;

  int? _sortOrder;
  int? get sortOrder => _$this._sortOrder;
  set sortOrder(int? sortOrder) => _$this._sortOrder = sortOrder;

  Uint8List? _file;
  Uint8List? get file => _$this._file;
  set file(Uint8List? file) => _$this._file = file;

  MediaType? _mediaType;
  MediaType? get mediaType => _$this._mediaType;
  set mediaType(MediaType? mediaType) => _$this._mediaType = mediaType;

  String? _description;
  String? get description => _$this._description;
  set description(String? description) => _$this._description = description;

  BodyUploadMediaApiMediaUploadMediaPostBuilder() {
    BodyUploadMediaApiMediaUploadMediaPost._defaults(this);
  }

  BodyUploadMediaApiMediaUploadMediaPostBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _relatedType = $v.relatedType;
      _relatedId = $v.relatedId;
      _sortOrder = $v.sortOrder;
      _file = $v.file;
      _mediaType = $v.mediaType;
      _description = $v.description;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(BodyUploadMediaApiMediaUploadMediaPost other) {
    _$v = other as _$BodyUploadMediaApiMediaUploadMediaPost;
  }

  @override
  void update(
      void Function(BodyUploadMediaApiMediaUploadMediaPostBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  BodyUploadMediaApiMediaUploadMediaPost build() => _build();

  _$BodyUploadMediaApiMediaUploadMediaPost _build() {
    final _$result = _$v ??
        _$BodyUploadMediaApiMediaUploadMediaPost._(
          relatedType: BuiltValueNullFieldError.checkNotNull(relatedType,
              r'BodyUploadMediaApiMediaUploadMediaPost', 'relatedType'),
          relatedId: BuiltValueNullFieldError.checkNotNull(relatedId,
              r'BodyUploadMediaApiMediaUploadMediaPost', 'relatedId'),
          sortOrder: sortOrder,
          file: BuiltValueNullFieldError.checkNotNull(
              file, r'BodyUploadMediaApiMediaUploadMediaPost', 'file'),
          mediaType: mediaType,
          description: description,
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
