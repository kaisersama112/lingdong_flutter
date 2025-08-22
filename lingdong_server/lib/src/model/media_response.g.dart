// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'media_response.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$MediaResponse extends MediaResponse {
  @override
  final MediaOut media;
  @override
  final int userId;

  factory _$MediaResponse([void Function(MediaResponseBuilder)? updates]) =>
      (MediaResponseBuilder()..update(updates))._build();

  _$MediaResponse._({required this.media, required this.userId}) : super._();
  @override
  MediaResponse rebuild(void Function(MediaResponseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  MediaResponseBuilder toBuilder() => MediaResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is MediaResponse &&
        media == other.media &&
        userId == other.userId;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, media.hashCode);
    _$hash = $jc(_$hash, userId.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'MediaResponse')
          ..add('media', media)
          ..add('userId', userId))
        .toString();
  }
}

class MediaResponseBuilder
    implements Builder<MediaResponse, MediaResponseBuilder> {
  _$MediaResponse? _$v;

  MediaOutBuilder? _media;
  MediaOutBuilder get media => _$this._media ??= MediaOutBuilder();
  set media(MediaOutBuilder? media) => _$this._media = media;

  int? _userId;
  int? get userId => _$this._userId;
  set userId(int? userId) => _$this._userId = userId;

  MediaResponseBuilder() {
    MediaResponse._defaults(this);
  }

  MediaResponseBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _media = $v.media.toBuilder();
      _userId = $v.userId;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(MediaResponse other) {
    _$v = other as _$MediaResponse;
  }

  @override
  void update(void Function(MediaResponseBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  MediaResponse build() => _build();

  _$MediaResponse _build() {
    _$MediaResponse _$result;
    try {
      _$result = _$v ??
          _$MediaResponse._(
            media: media.build(),
            userId: BuiltValueNullFieldError.checkNotNull(
                userId, r'MediaResponse', 'userId'),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'media';
        media.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'MediaResponse', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
