// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'place_create.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$PlaceCreate extends PlaceCreate {
  @override
  final String name;
  @override
  final String type;
  @override
  final num longitude;
  @override
  final num latitude;
  @override
  final BuiltList<MediaCreate>? medias;
  @override
  final String? address;
  @override
  final num? rating;
  @override
  final String? description;

  factory _$PlaceCreate([void Function(PlaceCreateBuilder)? updates]) =>
      (PlaceCreateBuilder()..update(updates))._build();

  _$PlaceCreate._(
      {required this.name,
      required this.type,
      required this.longitude,
      required this.latitude,
      this.medias,
      this.address,
      this.rating,
      this.description})
      : super._();
  @override
  PlaceCreate rebuild(void Function(PlaceCreateBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  PlaceCreateBuilder toBuilder() => PlaceCreateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is PlaceCreate &&
        name == other.name &&
        type == other.type &&
        longitude == other.longitude &&
        latitude == other.latitude &&
        medias == other.medias &&
        address == other.address &&
        rating == other.rating &&
        description == other.description;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, type.hashCode);
    _$hash = $jc(_$hash, longitude.hashCode);
    _$hash = $jc(_$hash, latitude.hashCode);
    _$hash = $jc(_$hash, medias.hashCode);
    _$hash = $jc(_$hash, address.hashCode);
    _$hash = $jc(_$hash, rating.hashCode);
    _$hash = $jc(_$hash, description.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'PlaceCreate')
          ..add('name', name)
          ..add('type', type)
          ..add('longitude', longitude)
          ..add('latitude', latitude)
          ..add('medias', medias)
          ..add('address', address)
          ..add('rating', rating)
          ..add('description', description))
        .toString();
  }
}

class PlaceCreateBuilder implements Builder<PlaceCreate, PlaceCreateBuilder> {
  _$PlaceCreate? _$v;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  String? _type;
  String? get type => _$this._type;
  set type(String? type) => _$this._type = type;

  num? _longitude;
  num? get longitude => _$this._longitude;
  set longitude(num? longitude) => _$this._longitude = longitude;

  num? _latitude;
  num? get latitude => _$this._latitude;
  set latitude(num? latitude) => _$this._latitude = latitude;

  ListBuilder<MediaCreate>? _medias;
  ListBuilder<MediaCreate> get medias =>
      _$this._medias ??= ListBuilder<MediaCreate>();
  set medias(ListBuilder<MediaCreate>? medias) => _$this._medias = medias;

  String? _address;
  String? get address => _$this._address;
  set address(String? address) => _$this._address = address;

  num? _rating;
  num? get rating => _$this._rating;
  set rating(num? rating) => _$this._rating = rating;

  String? _description;
  String? get description => _$this._description;
  set description(String? description) => _$this._description = description;

  PlaceCreateBuilder() {
    PlaceCreate._defaults(this);
  }

  PlaceCreateBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _name = $v.name;
      _type = $v.type;
      _longitude = $v.longitude;
      _latitude = $v.latitude;
      _medias = $v.medias?.toBuilder();
      _address = $v.address;
      _rating = $v.rating;
      _description = $v.description;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(PlaceCreate other) {
    _$v = other as _$PlaceCreate;
  }

  @override
  void update(void Function(PlaceCreateBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  PlaceCreate build() => _build();

  _$PlaceCreate _build() {
    _$PlaceCreate _$result;
    try {
      _$result = _$v ??
          _$PlaceCreate._(
            name: BuiltValueNullFieldError.checkNotNull(
                name, r'PlaceCreate', 'name'),
            type: BuiltValueNullFieldError.checkNotNull(
                type, r'PlaceCreate', 'type'),
            longitude: BuiltValueNullFieldError.checkNotNull(
                longitude, r'PlaceCreate', 'longitude'),
            latitude: BuiltValueNullFieldError.checkNotNull(
                latitude, r'PlaceCreate', 'latitude'),
            medias: _medias?.build(),
            address: address,
            rating: rating,
            description: description,
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'medias';
        _medias?.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'PlaceCreate', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
