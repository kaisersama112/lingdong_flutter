// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dog_breed_update.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$DogBreedUpdate extends DogBreedUpdate {
  @override
  final int breedId;
  @override
  final String? name;
  @override
  final String? englishName;
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
  final bool? isPopular;
  @override
  final BuiltList<int>? mediaIds;

  factory _$DogBreedUpdate([void Function(DogBreedUpdateBuilder)? updates]) =>
      (DogBreedUpdateBuilder()..update(updates))._build();

  _$DogBreedUpdate._(
      {required this.breedId,
      this.name,
      this.englishName,
      this.origin,
      this.group,
      this.size,
      this.lifespan,
      this.temperament,
      this.appearance,
      this.careLevel,
      this.activityLevel,
      this.isPopular,
      this.mediaIds})
      : super._();
  @override
  DogBreedUpdate rebuild(void Function(DogBreedUpdateBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  DogBreedUpdateBuilder toBuilder() => DogBreedUpdateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is DogBreedUpdate &&
        breedId == other.breedId &&
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
        isPopular == other.isPopular &&
        mediaIds == other.mediaIds;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, breedId.hashCode);
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
    _$hash = $jc(_$hash, isPopular.hashCode);
    _$hash = $jc(_$hash, mediaIds.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'DogBreedUpdate')
          ..add('breedId', breedId)
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
          ..add('isPopular', isPopular)
          ..add('mediaIds', mediaIds))
        .toString();
  }
}

class DogBreedUpdateBuilder
    implements Builder<DogBreedUpdate, DogBreedUpdateBuilder> {
  _$DogBreedUpdate? _$v;

  int? _breedId;
  int? get breedId => _$this._breedId;
  set breedId(int? breedId) => _$this._breedId = breedId;

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

  bool? _isPopular;
  bool? get isPopular => _$this._isPopular;
  set isPopular(bool? isPopular) => _$this._isPopular = isPopular;

  ListBuilder<int>? _mediaIds;
  ListBuilder<int> get mediaIds => _$this._mediaIds ??= ListBuilder<int>();
  set mediaIds(ListBuilder<int>? mediaIds) => _$this._mediaIds = mediaIds;

  DogBreedUpdateBuilder() {
    DogBreedUpdate._defaults(this);
  }

  DogBreedUpdateBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _breedId = $v.breedId;
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
      _isPopular = $v.isPopular;
      _mediaIds = $v.mediaIds?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(DogBreedUpdate other) {
    _$v = other as _$DogBreedUpdate;
  }

  @override
  void update(void Function(DogBreedUpdateBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  DogBreedUpdate build() => _build();

  _$DogBreedUpdate _build() {
    _$DogBreedUpdate _$result;
    try {
      _$result = _$v ??
          _$DogBreedUpdate._(
            breedId: BuiltValueNullFieldError.checkNotNull(
                breedId, r'DogBreedUpdate', 'breedId'),
            name: name,
            englishName: englishName,
            origin: origin,
            group: group,
            size: size,
            lifespan: lifespan,
            temperament: temperament,
            appearance: appearance,
            careLevel: careLevel,
            activityLevel: activityLevel,
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
            r'DogBreedUpdate', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
