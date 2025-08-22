// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tag_create.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$TagCreate extends TagCreate {
  @override
  final String name;
  @override
  final String? description;
  @override
  final bool? isVisible;

  factory _$TagCreate([void Function(TagCreateBuilder)? updates]) =>
      (TagCreateBuilder()..update(updates))._build();

  _$TagCreate._({required this.name, this.description, this.isVisible})
      : super._();
  @override
  TagCreate rebuild(void Function(TagCreateBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  TagCreateBuilder toBuilder() => TagCreateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is TagCreate &&
        name == other.name &&
        description == other.description &&
        isVisible == other.isVisible;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, description.hashCode);
    _$hash = $jc(_$hash, isVisible.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'TagCreate')
          ..add('name', name)
          ..add('description', description)
          ..add('isVisible', isVisible))
        .toString();
  }
}

class TagCreateBuilder implements Builder<TagCreate, TagCreateBuilder> {
  _$TagCreate? _$v;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  String? _description;
  String? get description => _$this._description;
  set description(String? description) => _$this._description = description;

  bool? _isVisible;
  bool? get isVisible => _$this._isVisible;
  set isVisible(bool? isVisible) => _$this._isVisible = isVisible;

  TagCreateBuilder() {
    TagCreate._defaults(this);
  }

  TagCreateBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _name = $v.name;
      _description = $v.description;
      _isVisible = $v.isVisible;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(TagCreate other) {
    _$v = other as _$TagCreate;
  }

  @override
  void update(void Function(TagCreateBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  TagCreate build() => _build();

  _$TagCreate _build() {
    final _$result = _$v ??
        _$TagCreate._(
          name:
              BuiltValueNullFieldError.checkNotNull(name, r'TagCreate', 'name'),
          description: description,
          isVisible: isVisible,
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
