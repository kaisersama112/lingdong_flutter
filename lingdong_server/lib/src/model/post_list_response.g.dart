// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_list_response.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$PostListResponse extends PostListResponse {
  @override
  final BuiltList<PostResponse> posts;
  @override
  final int total;

  factory _$PostListResponse(
          [void Function(PostListResponseBuilder)? updates]) =>
      (PostListResponseBuilder()..update(updates))._build();

  _$PostListResponse._({required this.posts, required this.total}) : super._();
  @override
  PostListResponse rebuild(void Function(PostListResponseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  PostListResponseBuilder toBuilder() =>
      PostListResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is PostListResponse &&
        posts == other.posts &&
        total == other.total;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, posts.hashCode);
    _$hash = $jc(_$hash, total.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'PostListResponse')
          ..add('posts', posts)
          ..add('total', total))
        .toString();
  }
}

class PostListResponseBuilder
    implements Builder<PostListResponse, PostListResponseBuilder> {
  _$PostListResponse? _$v;

  ListBuilder<PostResponse>? _posts;
  ListBuilder<PostResponse> get posts =>
      _$this._posts ??= ListBuilder<PostResponse>();
  set posts(ListBuilder<PostResponse>? posts) => _$this._posts = posts;

  int? _total;
  int? get total => _$this._total;
  set total(int? total) => _$this._total = total;

  PostListResponseBuilder() {
    PostListResponse._defaults(this);
  }

  PostListResponseBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _posts = $v.posts.toBuilder();
      _total = $v.total;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(PostListResponse other) {
    _$v = other as _$PostListResponse;
  }

  @override
  void update(void Function(PostListResponseBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  PostListResponse build() => _build();

  _$PostListResponse _build() {
    _$PostListResponse _$result;
    try {
      _$result = _$v ??
          _$PostListResponse._(
            posts: posts.build(),
            total: BuiltValueNullFieldError.checkNotNull(
                total, r'PostListResponse', 'total'),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'posts';
        posts.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'PostListResponse', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
