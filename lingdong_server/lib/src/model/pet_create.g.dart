// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pet_create.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$PetCreate extends PetCreate {
  @override
  final String name;
  @override
  final String species;
  @override
  final String? breed;
  @override
  final Date? birthday;
  @override
  final String? chipId;
  @override
  final String? avatar;
  @override
  final String? gender;
  @override
  final num? weight;
  @override
  final bool? neutered;
  @override
  final String? allergyHistory;

  factory _$PetCreate([void Function(PetCreateBuilder)? updates]) =>
      (PetCreateBuilder()..update(updates))._build();

  _$PetCreate._(
      {required this.name,
      required this.species,
      this.breed,
      this.birthday,
      this.chipId,
      this.avatar,
      this.gender,
      this.weight,
      this.neutered,
      this.allergyHistory})
      : super._();
  @override
  PetCreate rebuild(void Function(PetCreateBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  PetCreateBuilder toBuilder() => PetCreateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is PetCreate &&
        name == other.name &&
        species == other.species &&
        breed == other.breed &&
        birthday == other.birthday &&
        chipId == other.chipId &&
        avatar == other.avatar &&
        gender == other.gender &&
        weight == other.weight &&
        neutered == other.neutered &&
        allergyHistory == other.allergyHistory;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, species.hashCode);
    _$hash = $jc(_$hash, breed.hashCode);
    _$hash = $jc(_$hash, birthday.hashCode);
    _$hash = $jc(_$hash, chipId.hashCode);
    _$hash = $jc(_$hash, avatar.hashCode);
    _$hash = $jc(_$hash, gender.hashCode);
    _$hash = $jc(_$hash, weight.hashCode);
    _$hash = $jc(_$hash, neutered.hashCode);
    _$hash = $jc(_$hash, allergyHistory.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'PetCreate')
          ..add('name', name)
          ..add('species', species)
          ..add('breed', breed)
          ..add('birthday', birthday)
          ..add('chipId', chipId)
          ..add('avatar', avatar)
          ..add('gender', gender)
          ..add('weight', weight)
          ..add('neutered', neutered)
          ..add('allergyHistory', allergyHistory))
        .toString();
  }
}

class PetCreateBuilder implements Builder<PetCreate, PetCreateBuilder> {
  _$PetCreate? _$v;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  String? _species;
  String? get species => _$this._species;
  set species(String? species) => _$this._species = species;

  String? _breed;
  String? get breed => _$this._breed;
  set breed(String? breed) => _$this._breed = breed;

  Date? _birthday;
  Date? get birthday => _$this._birthday;
  set birthday(Date? birthday) => _$this._birthday = birthday;

  String? _chipId;
  String? get chipId => _$this._chipId;
  set chipId(String? chipId) => _$this._chipId = chipId;

  String? _avatar;
  String? get avatar => _$this._avatar;
  set avatar(String? avatar) => _$this._avatar = avatar;

  String? _gender;
  String? get gender => _$this._gender;
  set gender(String? gender) => _$this._gender = gender;

  num? _weight;
  num? get weight => _$this._weight;
  set weight(num? weight) => _$this._weight = weight;

  bool? _neutered;
  bool? get neutered => _$this._neutered;
  set neutered(bool? neutered) => _$this._neutered = neutered;

  String? _allergyHistory;
  String? get allergyHistory => _$this._allergyHistory;
  set allergyHistory(String? allergyHistory) =>
      _$this._allergyHistory = allergyHistory;

  PetCreateBuilder() {
    PetCreate._defaults(this);
  }

  PetCreateBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _name = $v.name;
      _species = $v.species;
      _breed = $v.breed;
      _birthday = $v.birthday;
      _chipId = $v.chipId;
      _avatar = $v.avatar;
      _gender = $v.gender;
      _weight = $v.weight;
      _neutered = $v.neutered;
      _allergyHistory = $v.allergyHistory;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(PetCreate other) {
    _$v = other as _$PetCreate;
  }

  @override
  void update(void Function(PetCreateBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  PetCreate build() => _build();

  _$PetCreate _build() {
    final _$result = _$v ??
        _$PetCreate._(
          name:
              BuiltValueNullFieldError.checkNotNull(name, r'PetCreate', 'name'),
          species: BuiltValueNullFieldError.checkNotNull(
              species, r'PetCreate', 'species'),
          breed: breed,
          birthday: birthday,
          chipId: chipId,
          avatar: avatar,
          gender: gender,
          weight: weight,
          neutered: neutered,
          allergyHistory: allergyHistory,
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
