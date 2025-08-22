// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tag_list_response.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$TagListResponse extends TagListResponse {
  @override
  final BuiltList<TagResponse> tags;
  @override
  final int total;

  factory _$TagListResponse([void Function(TagListResponseBuilder)? updates]) =>
      (TagListResponseBuilder()..update(updates))._build();

  _$TagListResponse._({required this.tags, required this.total}) : super._();
  @override
  TagListResponse rebuild(void Function(TagListResponseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  TagListResponseBuilder toBuilder() => TagListResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is TagListResponse &&
        tags == other.tags &&
        total == other.total;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, tags.hashCode);
    _$hash = $jc(_$hash, total.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'TagListResponse')
          ..add('tags', tags)
          ..add('total', total))
        .toString();
  }
}

class TagListResponseBuilder
    implements Builder<TagListResponse, TagListResponseBuilder> {
  _$TagListResponse? _$v;

  ListBuilder<TagResponse>? _tags;
  ListBuilder<TagResponse> get tags =>
      _$this._tags ??= ListBuilder<TagResponse>();
  set tags(ListBuilder<TagResponse>? tags) => _$this._tags = tags;

  int? _total;
  int? get total => _$this._total;
  set total(int? total) => _$this._total = total;

  TagListResponseBuilder() {
    TagListResponse._defaults(this);
  }

  TagListResponseBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _tags = $v.tags.toBuilder();
      _total = $v.total;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(TagListResponse other) {
    _$v = other as _$TagListResponse;
  }

  @override
  void update(void Function(TagListResponseBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  TagListResponse build() => _build();

  _$TagListResponse _build() {
    _$TagListResponse _$result;
    try {
      _$result = _$v ??
          _$TagListResponse._(
            tags: tags.build(),
            total: BuiltValueNullFieldError.checkNotNull(
                total, r'TagListResponse', 'total'),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'tags';
        tags.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'TagListResponse', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
