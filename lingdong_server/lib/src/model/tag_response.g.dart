// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tag_response.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$TagResponse extends TagResponse {
  @override
  final int? id;
  @override
  final String? name;
  @override
  final String? description;
  @override
  final int? popularity;
  @override
  final bool? isPopular;
  @override
  final bool? isVisible;
  @override
  final DateTime? createdAt;
  @override
  final DateTime? updatedAt;

  factory _$TagResponse([void Function(TagResponseBuilder)? updates]) =>
      (TagResponseBuilder()..update(updates))._build();

  _$TagResponse._(
      {this.id,
      this.name,
      this.description,
      this.popularity,
      this.isPopular,
      this.isVisible,
      this.createdAt,
      this.updatedAt})
      : super._();
  @override
  TagResponse rebuild(void Function(TagResponseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  TagResponseBuilder toBuilder() => TagResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is TagResponse &&
        id == other.id &&
        name == other.name &&
        description == other.description &&
        popularity == other.popularity &&
        isPopular == other.isPopular &&
        isVisible == other.isVisible &&
        createdAt == other.createdAt &&
        updatedAt == other.updatedAt;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, description.hashCode);
    _$hash = $jc(_$hash, popularity.hashCode);
    _$hash = $jc(_$hash, isPopular.hashCode);
    _$hash = $jc(_$hash, isVisible.hashCode);
    _$hash = $jc(_$hash, createdAt.hashCode);
    _$hash = $jc(_$hash, updatedAt.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'TagResponse')
          ..add('id', id)
          ..add('name', name)
          ..add('description', description)
          ..add('popularity', popularity)
          ..add('isPopular', isPopular)
          ..add('isVisible', isVisible)
          ..add('createdAt', createdAt)
          ..add('updatedAt', updatedAt))
        .toString();
  }
}

class TagResponseBuilder implements Builder<TagResponse, TagResponseBuilder> {
  _$TagResponse? _$v;

  int? _id;
  int? get id => _$this._id;
  set id(int? id) => _$this._id = id;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  String? _description;
  String? get description => _$this._description;
  set description(String? description) => _$this._description = description;

  int? _popularity;
  int? get popularity => _$this._popularity;
  set popularity(int? popularity) => _$this._popularity = popularity;

  bool? _isPopular;
  bool? get isPopular => _$this._isPopular;
  set isPopular(bool? isPopular) => _$this._isPopular = isPopular;

  bool? _isVisible;
  bool? get isVisible => _$this._isVisible;
  set isVisible(bool? isVisible) => _$this._isVisible = isVisible;

  DateTime? _createdAt;
  DateTime? get createdAt => _$this._createdAt;
  set createdAt(DateTime? createdAt) => _$this._createdAt = createdAt;

  DateTime? _updatedAt;
  DateTime? get updatedAt => _$this._updatedAt;
  set updatedAt(DateTime? updatedAt) => _$this._updatedAt = updatedAt;

  TagResponseBuilder() {
    TagResponse._defaults(this);
  }

  TagResponseBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _name = $v.name;
      _description = $v.description;
      _popularity = $v.popularity;
      _isPopular = $v.isPopular;
      _isVisible = $v.isVisible;
      _createdAt = $v.createdAt;
      _updatedAt = $v.updatedAt;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(TagResponse other) {
    _$v = other as _$TagResponse;
  }

  @override
  void update(void Function(TagResponseBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  TagResponse build() => _build();

  _$TagResponse _build() {
    final _$result = _$v ??
        _$TagResponse._(
          id: id,
          name: name,
          description: description,
          popularity: popularity,
          isPopular: isPopular,
          isVisible: isVisible,
          createdAt: createdAt,
          updatedAt: updatedAt,
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
