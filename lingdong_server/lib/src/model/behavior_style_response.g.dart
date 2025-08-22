// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'behavior_style_response.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$BehaviorStyleResponse extends BehaviorStyleResponse {
  @override
  final String name;
  @override
  final String? description;
  @override
  final int id;
  @override
  final DateTime createdAt;
  @override
  final DateTime updatedAt;

  factory _$BehaviorStyleResponse(
          [void Function(BehaviorStyleResponseBuilder)? updates]) =>
      (BehaviorStyleResponseBuilder()..update(updates))._build();

  _$BehaviorStyleResponse._(
      {required this.name,
      this.description,
      required this.id,
      required this.createdAt,
      required this.updatedAt})
      : super._();
  @override
  BehaviorStyleResponse rebuild(
          void Function(BehaviorStyleResponseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  BehaviorStyleResponseBuilder toBuilder() =>
      BehaviorStyleResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is BehaviorStyleResponse &&
        name == other.name &&
        description == other.description &&
        id == other.id &&
        createdAt == other.createdAt &&
        updatedAt == other.updatedAt;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, description.hashCode);
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, createdAt.hashCode);
    _$hash = $jc(_$hash, updatedAt.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'BehaviorStyleResponse')
          ..add('name', name)
          ..add('description', description)
          ..add('id', id)
          ..add('createdAt', createdAt)
          ..add('updatedAt', updatedAt))
        .toString();
  }
}

class BehaviorStyleResponseBuilder
    implements Builder<BehaviorStyleResponse, BehaviorStyleResponseBuilder> {
  _$BehaviorStyleResponse? _$v;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  String? _description;
  String? get description => _$this._description;
  set description(String? description) => _$this._description = description;

  int? _id;
  int? get id => _$this._id;
  set id(int? id) => _$this._id = id;

  DateTime? _createdAt;
  DateTime? get createdAt => _$this._createdAt;
  set createdAt(DateTime? createdAt) => _$this._createdAt = createdAt;

  DateTime? _updatedAt;
  DateTime? get updatedAt => _$this._updatedAt;
  set updatedAt(DateTime? updatedAt) => _$this._updatedAt = updatedAt;

  BehaviorStyleResponseBuilder() {
    BehaviorStyleResponse._defaults(this);
  }

  BehaviorStyleResponseBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _name = $v.name;
      _description = $v.description;
      _id = $v.id;
      _createdAt = $v.createdAt;
      _updatedAt = $v.updatedAt;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(BehaviorStyleResponse other) {
    _$v = other as _$BehaviorStyleResponse;
  }

  @override
  void update(void Function(BehaviorStyleResponseBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  BehaviorStyleResponse build() => _build();

  _$BehaviorStyleResponse _build() {
    final _$result = _$v ??
        _$BehaviorStyleResponse._(
          name: BuiltValueNullFieldError.checkNotNull(
              name, r'BehaviorStyleResponse', 'name'),
          description: description,
          id: BuiltValueNullFieldError.checkNotNull(
              id, r'BehaviorStyleResponse', 'id'),
          createdAt: BuiltValueNullFieldError.checkNotNull(
              createdAt, r'BehaviorStyleResponse', 'createdAt'),
          updatedAt: BuiltValueNullFieldError.checkNotNull(
              updatedAt, r'BehaviorStyleResponse', 'updatedAt'),
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
