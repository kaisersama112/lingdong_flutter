// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'parent_comment_create.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$ParentCommentCreate extends ParentCommentCreate {
  @override
  final int postId;
  @override
  final String content;
  @override
  final BuiltList<MediaCreate>? medias;

  factory _$ParentCommentCreate(
          [void Function(ParentCommentCreateBuilder)? updates]) =>
      (ParentCommentCreateBuilder()..update(updates))._build();

  _$ParentCommentCreate._(
      {required this.postId, required this.content, this.medias})
      : super._();
  @override
  ParentCommentCreate rebuild(
          void Function(ParentCommentCreateBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ParentCommentCreateBuilder toBuilder() =>
      ParentCommentCreateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ParentCommentCreate &&
        postId == other.postId &&
        content == other.content &&
        medias == other.medias;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, postId.hashCode);
    _$hash = $jc(_$hash, content.hashCode);
    _$hash = $jc(_$hash, medias.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ParentCommentCreate')
          ..add('postId', postId)
          ..add('content', content)
          ..add('medias', medias))
        .toString();
  }
}

class ParentCommentCreateBuilder
    implements Builder<ParentCommentCreate, ParentCommentCreateBuilder> {
  _$ParentCommentCreate? _$v;

  int? _postId;
  int? get postId => _$this._postId;
  set postId(int? postId) => _$this._postId = postId;

  String? _content;
  String? get content => _$this._content;
  set content(String? content) => _$this._content = content;

  ListBuilder<MediaCreate>? _medias;
  ListBuilder<MediaCreate> get medias =>
      _$this._medias ??= ListBuilder<MediaCreate>();
  set medias(ListBuilder<MediaCreate>? medias) => _$this._medias = medias;

  ParentCommentCreateBuilder() {
    ParentCommentCreate._defaults(this);
  }

  ParentCommentCreateBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _postId = $v.postId;
      _content = $v.content;
      _medias = $v.medias?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ParentCommentCreate other) {
    _$v = other as _$ParentCommentCreate;
  }

  @override
  void update(void Function(ParentCommentCreateBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ParentCommentCreate build() => _build();

  _$ParentCommentCreate _build() {
    _$ParentCommentCreate _$result;
    try {
      _$result = _$v ??
          _$ParentCommentCreate._(
            postId: BuiltValueNullFieldError.checkNotNull(
                postId, r'ParentCommentCreate', 'postId'),
            content: BuiltValueNullFieldError.checkNotNull(
                content, r'ParentCommentCreate', 'content'),
            medias: _medias?.build(),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'medias';
        _medias?.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'ParentCommentCreate', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
