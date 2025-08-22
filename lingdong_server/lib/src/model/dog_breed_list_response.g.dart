// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dog_breed_list_response.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$DogBreedListResponse extends DogBreedListResponse {
  @override
  final BuiltList<DogBreedResponse> breeds;
  @override
  final int total;

  factory _$DogBreedListResponse(
          [void Function(DogBreedListResponseBuilder)? updates]) =>
      (DogBreedListResponseBuilder()..update(updates))._build();

  _$DogBreedListResponse._({required this.breeds, required this.total})
      : super._();
  @override
  DogBreedListResponse rebuild(
          void Function(DogBreedListResponseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  DogBreedListResponseBuilder toBuilder() =>
      DogBreedListResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is DogBreedListResponse &&
        breeds == other.breeds &&
        total == other.total;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, breeds.hashCode);
    _$hash = $jc(_$hash, total.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'DogBreedListResponse')
          ..add('breeds', breeds)
          ..add('total', total))
        .toString();
  }
}

class DogBreedListResponseBuilder
    implements Builder<DogBreedListResponse, DogBreedListResponseBuilder> {
  _$DogBreedListResponse? _$v;

  ListBuilder<DogBreedResponse>? _breeds;
  ListBuilder<DogBreedResponse> get breeds =>
      _$this._breeds ??= ListBuilder<DogBreedResponse>();
  set breeds(ListBuilder<DogBreedResponse>? breeds) => _$this._breeds = breeds;

  int? _total;
  int? get total => _$this._total;
  set total(int? total) => _$this._total = total;

  DogBreedListResponseBuilder() {
    DogBreedListResponse._defaults(this);
  }

  DogBreedListResponseBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _breeds = $v.breeds.toBuilder();
      _total = $v.total;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(DogBreedListResponse other) {
    _$v = other as _$DogBreedListResponse;
  }

  @override
  void update(void Function(DogBreedListResponseBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  DogBreedListResponse build() => _build();

  _$DogBreedListResponse _build() {
    _$DogBreedListResponse _$result;
    try {
      _$result = _$v ??
          _$DogBreedListResponse._(
            breeds: breeds.build(),
            total: BuiltValueNullFieldError.checkNotNull(
                total, r'DogBreedListResponse', 'total'),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'breeds';
        breeds.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'DogBreedListResponse', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
