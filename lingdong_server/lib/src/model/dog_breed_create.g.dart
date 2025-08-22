// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dog_breed_create.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$DogBreedCreate extends DogBreedCreate {
  @override
  final String name;
  @override
  final String englishName;
  @override
  final String? origin;
  @override
  final String? group;
  @override
  final String? size;
  @override
  final String? lifespan;
  @override
  final String? temperament;
  @override
  final String? appearance;
  @override
  final int? careLevel;
  @override
  final int? activityLevel;
  @override
  final int? popularity;
  @override
  final bool? isPopular;
  @override
  final BuiltList<int>? mediaIds;

  factory _$DogBreedCreate([void Function(DogBreedCreateBuilder)? updates]) =>
      (DogBreedCreateBuilder()..update(updates))._build();

  _$DogBreedCreate._(
      {required this.name,
      required this.englishName,
      this.origin,
      this.group,
      this.size,
      this.lifespan,
      this.temperament,
      this.appearance,
      this.careLevel,
      this.activityLevel,
      this.popularity,
      this.isPopular,
      this.mediaIds})
      : super._();
  @override
  DogBreedCreate rebuild(void Function(DogBreedCreateBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  DogBreedCreateBuilder toBuilder() => DogBreedCreateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is DogBreedCreate &&
        name == other.name &&
        englishName == other.englishName &&
        origin == other.origin &&
        group == other.group &&
        size == other.size &&
        lifespan == other.lifespan &&
        temperament == other.temperament &&
        appearance == other.appearance &&
        careLevel == other.careLevel &&
        activityLevel == other.activityLevel &&
        popularity == other.popularity &&
        isPopular == other.isPopular &&
        mediaIds == other.mediaIds;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, englishName.hashCode);
    _$hash = $jc(_$hash, origin.hashCode);
    _$hash = $jc(_$hash, group.hashCode);
    _$hash = $jc(_$hash, size.hashCode);
    _$hash = $jc(_$hash, lifespan.hashCode);
    _$hash = $jc(_$hash, temperament.hashCode);
    _$hash = $jc(_$hash, appearance.hashCode);
    _$hash = $jc(_$hash, careLevel.hashCode);
    _$hash = $jc(_$hash, activityLevel.hashCode);
    _$hash = $jc(_$hash, popularity.hashCode);
    _$hash = $jc(_$hash, isPopular.hashCode);
    _$hash = $jc(_$hash, mediaIds.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'DogBreedCreate')
          ..add('name', name)
          ..add('englishName', englishName)
          ..add('origin', origin)
          ..add('group', group)
          ..add('size', size)
          ..add('lifespan', lifespan)
          ..add('temperament', temperament)
          ..add('appearance', appearance)
          ..add('careLevel', careLevel)
          ..add('activityLevel', activityLevel)
          ..add('popularity', popularity)
          ..add('isPopular', isPopular)
          ..add('mediaIds', mediaIds))
        .toString();
  }
}

class DogBreedCreateBuilder
    implements Builder<DogBreedCreate, DogBreedCreateBuilder> {
  _$DogBreedCreate? _$v;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  String? _englishName;
  String? get englishName => _$this._englishName;
  set englishName(String? englishName) => _$this._englishName = englishName;

  String? _origin;
  String? get origin => _$this._origin;
  set origin(String? origin) => _$this._origin = origin;

  String? _group;
  String? get group => _$this._group;
  set group(String? group) => _$this._group = group;

  String? _size;
  String? get size => _$this._size;
  set size(String? size) => _$this._size = size;

  String? _lifespan;
  String? get lifespan => _$this._lifespan;
  set lifespan(String? lifespan) => _$this._lifespan = lifespan;

  String? _temperament;
  String? get temperament => _$this._temperament;
  set temperament(String? temperament) => _$this._temperament = temperament;

  String? _appearance;
  String? get appearance => _$this._appearance;
  set appearance(String? appearance) => _$this._appearance = appearance;

  int? _careLevel;
  int? get careLevel => _$this._careLevel;
  set careLevel(int? careLevel) => _$this._careLevel = careLevel;

  int? _activityLevel;
  int? get activityLevel => _$this._activityLevel;
  set activityLevel(int? activityLevel) =>
      _$this._activityLevel = activityLevel;

  int? _popularity;
  int? get popularity => _$this._popularity;
  set popularity(int? popularity) => _$this._popularity = popularity;

  bool? _isPopular;
  bool? get isPopular => _$this._isPopular;
  set isPopular(bool? isPopular) => _$this._isPopular = isPopular;

  ListBuilder<int>? _mediaIds;
  ListBuilder<int> get mediaIds => _$this._mediaIds ??= ListBuilder<int>();
  set mediaIds(ListBuilder<int>? mediaIds) => _$this._mediaIds = mediaIds;

  DogBreedCreateBuilder() {
    DogBreedCreate._defaults(this);
  }

  DogBreedCreateBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _name = $v.name;
      _englishName = $v.englishName;
      _origin = $v.origin;
      _group = $v.group;
      _size = $v.size;
      _lifespan = $v.lifespan;
      _temperament = $v.temperament;
      _appearance = $v.appearance;
      _careLevel = $v.careLevel;
      _activityLevel = $v.activityLevel;
      _popularity = $v.popularity;
      _isPopular = $v.isPopular;
      _mediaIds = $v.mediaIds?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(DogBreedCreate other) {
    _$v = other as _$DogBreedCreate;
  }

  @override
  void update(void Function(DogBreedCreateBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  DogBreedCreate build() => _build();

  _$DogBreedCreate _build() {
    _$DogBreedCreate _$result;
    try {
      _$result = _$v ??
          _$DogBreedCreate._(
            name: BuiltValueNullFieldError.checkNotNull(
                name, r'DogBreedCreate', 'name'),
            englishName: BuiltValueNullFieldError.checkNotNull(
                englishName, r'DogBreedCreate', 'englishName'),
            origin: origin,
            group: group,
            size: size,
            lifespan: lifespan,
            temperament: temperament,
            appearance: appearance,
            careLevel: careLevel,
            activityLevel: activityLevel,
            popularity: popularity,
            isPopular: isPopular,
            mediaIds: _mediaIds?.build(),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'mediaIds';
        _mediaIds?.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'DogBreedCreate', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
