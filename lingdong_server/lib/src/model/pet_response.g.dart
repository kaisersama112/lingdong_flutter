// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pet_response.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$PetResponse extends PetResponse {
  @override
  final String? name;
  @override
  final String? species;
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
  final bool? neutered;
  @override
  final String? allergyHistory;
  @override
  final int id;

  factory _$PetResponse([void Function(PetResponseBuilder)? updates]) =>
      (PetResponseBuilder()..update(updates))._build();

  _$PetResponse._(
      {this.name,
      this.species,
      this.breed,
      this.birthday,
      this.chipId,
      this.avatar,
      this.gender,
      this.neutered,
      this.allergyHistory,
      required this.id})
      : super._();
  @override
  PetResponse rebuild(void Function(PetResponseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  PetResponseBuilder toBuilder() => PetResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is PetResponse &&
        name == other.name &&
        species == other.species &&
        breed == other.breed &&
        birthday == other.birthday &&
        chipId == other.chipId &&
        avatar == other.avatar &&
        gender == other.gender &&
        neutered == other.neutered &&
        allergyHistory == other.allergyHistory &&
        id == other.id;
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
    _$hash = $jc(_$hash, neutered.hashCode);
    _$hash = $jc(_$hash, allergyHistory.hashCode);
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'PetResponse')
          ..add('name', name)
          ..add('species', species)
          ..add('breed', breed)
          ..add('birthday', birthday)
          ..add('chipId', chipId)
          ..add('avatar', avatar)
          ..add('gender', gender)
          ..add('neutered', neutered)
          ..add('allergyHistory', allergyHistory)
          ..add('id', id))
        .toString();
  }
}

class PetResponseBuilder implements Builder<PetResponse, PetResponseBuilder> {
  _$PetResponse? _$v;

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

  bool? _neutered;
  bool? get neutered => _$this._neutered;
  set neutered(bool? neutered) => _$this._neutered = neutered;

  String? _allergyHistory;
  String? get allergyHistory => _$this._allergyHistory;
  set allergyHistory(String? allergyHistory) =>
      _$this._allergyHistory = allergyHistory;

  int? _id;
  int? get id => _$this._id;
  set id(int? id) => _$this._id = id;

  PetResponseBuilder() {
    PetResponse._defaults(this);
  }

  PetResponseBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _name = $v.name;
      _species = $v.species;
      _breed = $v.breed;
      _birthday = $v.birthday;
      _chipId = $v.chipId;
      _avatar = $v.avatar;
      _gender = $v.gender;
      _neutered = $v.neutered;
      _allergyHistory = $v.allergyHistory;
      _id = $v.id;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(PetResponse other) {
    _$v = other as _$PetResponse;
  }

  @override
  void update(void Function(PetResponseBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  PetResponse build() => _build();

  _$PetResponse _build() {
    final _$result = _$v ??
        _$PetResponse._(
          name: name,
          species: species,
          breed: breed,
          birthday: birthday,
          chipId: chipId,
          avatar: avatar,
          gender: gender,
          neutered: neutered,
          allergyHistory: allergyHistory,
          id: BuiltValueNullFieldError.checkNotNull(id, r'PetResponse', 'id'),
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
