// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dog_breed_response.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$DogBreedResponse extends DogBreedResponse {
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
  final bool? isPopular;
  @override
  final DateTime createdAt;
  @override
  final DateTime updatedAt;
  @override
  final BuiltList<MediaOut>? media;

  factory _$DogBreedResponse(
          [void Function(DogBreedResponseBuilder)? updates]) =>
      (DogBreedResponseBuilder()..update(updates))._build();

  _$DogBreedResponse._(
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
      this.isPopular,
      required this.createdAt,
      required this.updatedAt,
      this.media})
      : super._();
  @override
  DogBreedResponse rebuild(void Function(DogBreedResponseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  DogBreedResponseBuilder toBuilder() =>
      DogBreedResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is DogBreedResponse &&
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
        isPopular == other.isPopular &&
        createdAt == other.createdAt &&
        updatedAt == other.updatedAt &&
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
    _$hash = $jc(_$hash, isPopular.hashCode);
    _$hash = $jc(_$hash, createdAt.hashCode);
    _$hash = $jc(_$hash, updatedAt.hashCode);
    _$hash = $jc(_$hash, media.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'DogBreedResponse')
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
          ..add('isPopular', isPopular)
          ..add('createdAt', createdAt)
          ..add('updatedAt', updatedAt)
          ..add('media', media))
        .toString();
  }
}

class DogBreedResponseBuilder
    implements Builder<DogBreedResponse, DogBreedResponseBuilder> {
  _$DogBreedResponse? _$v;

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

  bool? _isPopular;
  bool? get isPopular => _$this._isPopular;
  set isPopular(bool? isPopular) => _$this._isPopular = isPopular;

  DateTime? _createdAt;
  DateTime? get createdAt => _$this._createdAt;
  set createdAt(DateTime? createdAt) => _$this._createdAt = createdAt;

  DateTime? _updatedAt;
  DateTime? get updatedAt => _$this._updatedAt;
  set updatedAt(DateTime? updatedAt) => _$this._updatedAt = updatedAt;

  ListBuilder<MediaOut>? _media;
  ListBuilder<MediaOut> get media => _$this._media ??= ListBuilder<MediaOut>();
  set media(ListBuilder<MediaOut>? media) => _$this._media = media;

  DogBreedResponseBuilder() {
    DogBreedResponse._defaults(this);
  }

  DogBreedResponseBuilder get _$this {
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
      _isPopular = $v.isPopular;
      _createdAt = $v.createdAt;
      _updatedAt = $v.updatedAt;
      _media = $v.media?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(DogBreedResponse other) {
    _$v = other as _$DogBreedResponse;
  }

  @override
  void update(void Function(DogBreedResponseBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  DogBreedResponse build() => _build();

  _$DogBreedResponse _build() {
    _$DogBreedResponse _$result;
    try {
      _$result = _$v ??
          _$DogBreedResponse._(
            id: BuiltValueNullFieldError.checkNotNull(
                id, r'DogBreedResponse', 'id'),
            name: BuiltValueNullFieldError.checkNotNull(
                name, r'DogBreedResponse', 'name'),
            englishName: BuiltValueNullFieldError.checkNotNull(
                englishName, r'DogBreedResponse', 'englishName'),
            origin: origin,
            group: group,
            size: size,
            lifespan: lifespan,
            temperament: temperament,
            appearance: appearance,
            careLevel: careLevel,
            activityLevel: activityLevel,
            isPopular: isPopular,
            createdAt: BuiltValueNullFieldError.checkNotNull(
                createdAt, r'DogBreedResponse', 'createdAt'),
            updatedAt: BuiltValueNullFieldError.checkNotNull(
                updatedAt, r'DogBreedResponse', 'updatedAt'),
            media: _media?.build(),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'media';
        _media?.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'DogBreedResponse', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
