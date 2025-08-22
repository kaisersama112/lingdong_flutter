// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'place_response.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$PlaceResponse extends PlaceResponse {
  @override
  final String name;
  @override
  final String type;
  @override
  final num longitude;
  @override
  final num latitude;
  @override
  final BuiltList<MediaResponse>? medias;
  @override
  final String? address;
  @override
  final num? rating;
  @override
  final String? description;
  @override
  final int id;
  @override
  final Date createdAt;
  @override
  final Date updatedAt;

  factory _$PlaceResponse([void Function(PlaceResponseBuilder)? updates]) =>
      (PlaceResponseBuilder()..update(updates))._build();

  _$PlaceResponse._(
      {required this.name,
      required this.type,
      required this.longitude,
      required this.latitude,
      this.medias,
      this.address,
      this.rating,
      this.description,
      required this.id,
      required this.createdAt,
      required this.updatedAt})
      : super._();
  @override
  PlaceResponse rebuild(void Function(PlaceResponseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  PlaceResponseBuilder toBuilder() => PlaceResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is PlaceResponse &&
        name == other.name &&
        type == other.type &&
        longitude == other.longitude &&
        latitude == other.latitude &&
        medias == other.medias &&
        address == other.address &&
        rating == other.rating &&
        description == other.description &&
        id == other.id &&
        createdAt == other.createdAt &&
        updatedAt == other.updatedAt;
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
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, createdAt.hashCode);
    _$hash = $jc(_$hash, updatedAt.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'PlaceResponse')
          ..add('name', name)
          ..add('type', type)
          ..add('longitude', longitude)
          ..add('latitude', latitude)
          ..add('medias', medias)
          ..add('address', address)
          ..add('rating', rating)
          ..add('description', description)
          ..add('id', id)
          ..add('createdAt', createdAt)
          ..add('updatedAt', updatedAt))
        .toString();
  }
}

class PlaceResponseBuilder
    implements Builder<PlaceResponse, PlaceResponseBuilder> {
  _$PlaceResponse? _$v;

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

  ListBuilder<MediaResponse>? _medias;
  ListBuilder<MediaResponse> get medias =>
      _$this._medias ??= ListBuilder<MediaResponse>();
  set medias(ListBuilder<MediaResponse>? medias) => _$this._medias = medias;

  String? _address;
  String? get address => _$this._address;
  set address(String? address) => _$this._address = address;

  num? _rating;
  num? get rating => _$this._rating;
  set rating(num? rating) => _$this._rating = rating;

  String? _description;
  String? get description => _$this._description;
  set description(String? description) => _$this._description = description;

  int? _id;
  int? get id => _$this._id;
  set id(int? id) => _$this._id = id;

  Date? _createdAt;
  Date? get createdAt => _$this._createdAt;
  set createdAt(Date? createdAt) => _$this._createdAt = createdAt;

  Date? _updatedAt;
  Date? get updatedAt => _$this._updatedAt;
  set updatedAt(Date? updatedAt) => _$this._updatedAt = updatedAt;

  PlaceResponseBuilder() {
    PlaceResponse._defaults(this);
  }

  PlaceResponseBuilder get _$this {
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
      _id = $v.id;
      _createdAt = $v.createdAt;
      _updatedAt = $v.updatedAt;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(PlaceResponse other) {
    _$v = other as _$PlaceResponse;
  }

  @override
  void update(void Function(PlaceResponseBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  PlaceResponse build() => _build();

  _$PlaceResponse _build() {
    _$PlaceResponse _$result;
    try {
      _$result = _$v ??
          _$PlaceResponse._(
            name: BuiltValueNullFieldError.checkNotNull(
                name, r'PlaceResponse', 'name'),
            type: BuiltValueNullFieldError.checkNotNull(
                type, r'PlaceResponse', 'type'),
            longitude: BuiltValueNullFieldError.checkNotNull(
                longitude, r'PlaceResponse', 'longitude'),
            latitude: BuiltValueNullFieldError.checkNotNull(
                latitude, r'PlaceResponse', 'latitude'),
            medias: _medias?.build(),
            address: address,
            rating: rating,
            description: description,
            id: BuiltValueNullFieldError.checkNotNull(
                id, r'PlaceResponse', 'id'),
            createdAt: BuiltValueNullFieldError.checkNotNull(
                createdAt, r'PlaceResponse', 'createdAt'),
            updatedAt: BuiltValueNullFieldError.checkNotNull(
                updatedAt, r'PlaceResponse', 'updatedAt'),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'medias';
        _medias?.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'PlaceResponse', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
