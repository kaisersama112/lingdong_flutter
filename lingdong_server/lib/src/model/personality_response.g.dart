// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'personality_response.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$PersonalityResponse extends PersonalityResponse {
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

  factory _$PersonalityResponse(
          [void Function(PersonalityResponseBuilder)? updates]) =>
      (PersonalityResponseBuilder()..update(updates))._build();

  _$PersonalityResponse._(
      {required this.name,
      this.description,
      required this.id,
      required this.createdAt,
      required this.updatedAt})
      : super._();
  @override
  PersonalityResponse rebuild(
          void Function(PersonalityResponseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  PersonalityResponseBuilder toBuilder() =>
      PersonalityResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is PersonalityResponse &&
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
    return (newBuiltValueToStringHelper(r'PersonalityResponse')
          ..add('name', name)
          ..add('description', description)
          ..add('id', id)
          ..add('createdAt', createdAt)
          ..add('updatedAt', updatedAt))
        .toString();
  }
}

class PersonalityResponseBuilder
    implements Builder<PersonalityResponse, PersonalityResponseBuilder> {
  _$PersonalityResponse? _$v;

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

  PersonalityResponseBuilder() {
    PersonalityResponse._defaults(this);
  }

  PersonalityResponseBuilder get _$this {
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
  void replace(PersonalityResponse other) {
    _$v = other as _$PersonalityResponse;
  }

  @override
  void update(void Function(PersonalityResponseBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  PersonalityResponse build() => _build();

  _$PersonalityResponse _build() {
    final _$result = _$v ??
        _$PersonalityResponse._(
          name: BuiltValueNullFieldError.checkNotNull(
              name, r'PersonalityResponse', 'name'),
          description: description,
          id: BuiltValueNullFieldError.checkNotNull(
              id, r'PersonalityResponse', 'id'),
          createdAt: BuiltValueNullFieldError.checkNotNull(
              createdAt, r'PersonalityResponse', 'createdAt'),
          updatedAt: BuiltValueNullFieldError.checkNotNull(
              updatedAt, r'PersonalityResponse', 'updatedAt'),
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
