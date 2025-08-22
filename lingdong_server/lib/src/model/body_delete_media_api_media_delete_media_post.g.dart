// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'body_delete_media_api_media_delete_media_post.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$BodyDeleteMediaApiMediaDeleteMediaPost
    extends BodyDeleteMediaApiMediaDeleteMediaPost {
  @override
  final int mediaId;

  factory _$BodyDeleteMediaApiMediaDeleteMediaPost(
          [void Function(BodyDeleteMediaApiMediaDeleteMediaPostBuilder)?
              updates]) =>
      (BodyDeleteMediaApiMediaDeleteMediaPostBuilder()..update(updates))
          ._build();

  _$BodyDeleteMediaApiMediaDeleteMediaPost._({required this.mediaId})
      : super._();
  @override
  BodyDeleteMediaApiMediaDeleteMediaPost rebuild(
          void Function(BodyDeleteMediaApiMediaDeleteMediaPostBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  BodyDeleteMediaApiMediaDeleteMediaPostBuilder toBuilder() =>
      BodyDeleteMediaApiMediaDeleteMediaPostBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is BodyDeleteMediaApiMediaDeleteMediaPost &&
        mediaId == other.mediaId;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, mediaId.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(
            r'BodyDeleteMediaApiMediaDeleteMediaPost')
          ..add('mediaId', mediaId))
        .toString();
  }
}

class BodyDeleteMediaApiMediaDeleteMediaPostBuilder
    implements
        Builder<BodyDeleteMediaApiMediaDeleteMediaPost,
            BodyDeleteMediaApiMediaDeleteMediaPostBuilder> {
  _$BodyDeleteMediaApiMediaDeleteMediaPost? _$v;

  int? _mediaId;
  int? get mediaId => _$this._mediaId;
  set mediaId(int? mediaId) => _$this._mediaId = mediaId;

  BodyDeleteMediaApiMediaDeleteMediaPostBuilder() {
    BodyDeleteMediaApiMediaDeleteMediaPost._defaults(this);
  }

  BodyDeleteMediaApiMediaDeleteMediaPostBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _mediaId = $v.mediaId;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(BodyDeleteMediaApiMediaDeleteMediaPost other) {
    _$v = other as _$BodyDeleteMediaApiMediaDeleteMediaPost;
  }

  @override
  void update(
      void Function(BodyDeleteMediaApiMediaDeleteMediaPostBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  BodyDeleteMediaApiMediaDeleteMediaPost build() => _build();

  _$BodyDeleteMediaApiMediaDeleteMediaPost _build() {
    final _$result = _$v ??
        _$BodyDeleteMediaApiMediaDeleteMediaPost._(
          mediaId: BuiltValueNullFieldError.checkNotNull(
              mediaId, r'BodyDeleteMediaApiMediaDeleteMediaPost', 'mediaId'),
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
