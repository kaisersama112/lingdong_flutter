// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'personality_create.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$PersonalityCreate extends PersonalityCreate {
  @override
  final String name;
  @override
  final String? description;

  factory _$PersonalityCreate(
          [void Function(PersonalityCreateBuilder)? updates]) =>
      (PersonalityCreateBuilder()..update(updates))._build();

  _$PersonalityCreate._({required this.name, this.description}) : super._();
  @override
  PersonalityCreate rebuild(void Function(PersonalityCreateBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  PersonalityCreateBuilder toBuilder() =>
      PersonalityCreateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is PersonalityCreate &&
        name == other.name &&
        description == other.description;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, description.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'PersonalityCreate')
          ..add('name', name)
          ..add('description', description))
        .toString();
  }
}

class PersonalityCreateBuilder
    implements Builder<PersonalityCreate, PersonalityCreateBuilder> {
  _$PersonalityCreate? _$v;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  String? _description;
  String? get description => _$this._description;
  set description(String? description) => _$this._description = description;

  PersonalityCreateBuilder() {
    PersonalityCreate._defaults(this);
  }

  PersonalityCreateBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _name = $v.name;
      _description = $v.description;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(PersonalityCreate other) {
    _$v = other as _$PersonalityCreate;
  }

  @override
  void update(void Function(PersonalityCreateBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  PersonalityCreate build() => _build();

  _$PersonalityCreate _build() {
    final _$result = _$v ??
        _$PersonalityCreate._(
          name: BuiltValueNullFieldError.checkNotNull(
              name, r'PersonalityCreate', 'name'),
          description: description,
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
