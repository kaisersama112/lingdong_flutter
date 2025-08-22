// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dog_breed_out.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$DogBreedOut extends DogBreedOut {
  @override
  final int id;
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
  final bool isPopular;
  @override
  final DateTime createdAt;
  @override
  final BuiltList<MediaOut>? media;

  factory _$DogBreedOut([void Function(DogBreedOutBuilder)? updates]) =>
      (DogBreedOutBuilder()..update(updates))._build();

  _$DogBreedOut._(
      {required this.id,
      required this.name,
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
      required this.isPopular,
      required this.createdAt,
      this.media})
      : super._();
  @override
  DogBreedOut rebuild(void Function(DogBreedOutBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  DogBreedOutBuilder toBuilder() => DogBreedOutBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is DogBreedOut &&
        id == other.id &&
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
        createdAt == other.createdAt &&
        media == other.media;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
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
    _$hash = $jc(_$hash, createdAt.hashCode);
    _$hash = $jc(_$hash, media.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'DogBreedOut')
          ..add('id', id)
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
          ..add('createdAt', createdAt)
          ..add('media', media))
        .toString();
  }
}

class DogBreedOutBuilder implements Builder<DogBreedOut, DogBreedOutBuilder> {
  _$DogBreedOut? _$v;

  int? _id;
  int? get id => _$this._id;
  set id(int? id) => _$this._id = id;

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

  DateTime? _createdAt;
  DateTime? get createdAt => _$this._createdAt;
  set createdAt(DateTime? createdAt) => _$this._createdAt = createdAt;

  ListBuilder<MediaOut>? _media;
  ListBuilder<MediaOut> get media => _$this._media ??= ListBuilder<MediaOut>();
  set media(ListBuilder<MediaOut>? media) => _$this._media = media;

  DogBreedOutBuilder() {
    DogBreedOut._defaults(this);
  }

  DogBreedOutBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
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
      _createdAt = $v.createdAt;
      _media = $v.media?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(DogBreedOut other) {
    _$v = other as _$DogBreedOut;
  }

  @override
  void update(void Function(DogBreedOutBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  DogBreedOut build() => _build();

  _$DogBreedOut _build() {
    _$DogBreedOut _$result;
    try {
      _$result = _$v ??
          _$DogBreedOut._(
            id: BuiltValueNullFieldError.checkNotNull(id, r'DogBreedOut', 'id'),
            name: BuiltValueNullFieldError.checkNotNull(
                name, r'DogBreedOut', 'name'),
            englishName: BuiltValueNullFieldError.checkNotNull(
                englishName, r'DogBreedOut', 'englishName'),
            origin: origin,
            group: group,
            size: size,
            lifespan: lifespan,
            temperament: temperament,
            appearance: appearance,
            careLevel: careLevel,
            activityLevel: activityLevel,
            popularity: popularity,
            isPopular: BuiltValueNullFieldError.checkNotNull(
                isPopular, r'DogBreedOut', 'isPopular'),
            createdAt: BuiltValueNullFieldError.checkNotNull(
                createdAt, r'DogBreedOut', 'createdAt'),
            media: _media?.build(),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'media';
        _media?.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'DogBreedOut', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
