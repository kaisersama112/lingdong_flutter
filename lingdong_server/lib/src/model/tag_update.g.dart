// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tag_update.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$TagUpdate extends TagUpdate {
  @override
  final String? name;
  @override
  final String? description;
  @override
  final bool? isVisible;

  factory _$TagUpdate([void Function(TagUpdateBuilder)? updates]) =>
      (TagUpdateBuilder()..update(updates))._build();

  _$TagUpdate._({this.name, this.description, this.isVisible}) : super._();
  @override
  TagUpdate rebuild(void Function(TagUpdateBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  TagUpdateBuilder toBuilder() => TagUpdateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is TagUpdate &&
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
    return (newBuiltValueToStringHelper(r'TagUpdate')
          ..add('name', name)
          ..add('description', description)
          ..add('isVisible', isVisible))
        .toString();
  }
}

class TagUpdateBuilder implements Builder<TagUpdate, TagUpdateBuilder> {
  _$TagUpdate? _$v;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  String? _description;
  String? get description => _$this._description;
  set description(String? description) => _$this._description = description;

  bool? _isVisible;
  bool? get isVisible => _$this._isVisible;
  set isVisible(bool? isVisible) => _$this._isVisible = isVisible;

  TagUpdateBuilder() {
    TagUpdate._defaults(this);
  }

  TagUpdateBuilder get _$this {
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
  void replace(TagUpdate other) {
    _$v = other as _$TagUpdate;
  }

  @override
  void update(void Function(TagUpdateBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  TagUpdate build() => _build();

  _$TagUpdate _build() {
    final _$result = _$v ??
        _$TagUpdate._(
          name: name,
          description: description,
          isVisible: isVisible,
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
