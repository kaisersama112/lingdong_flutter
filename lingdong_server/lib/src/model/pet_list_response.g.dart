// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pet_list_response.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$PetListResponse extends PetListResponse {
  @override
  final BuiltList<PetResponse>? pets;
  @override
  final int? total;

  factory _$PetListResponse([void Function(PetListResponseBuilder)? updates]) =>
      (PetListResponseBuilder()..update(updates))._build();

  _$PetListResponse._({this.pets, this.total}) : super._();
  @override
  PetListResponse rebuild(void Function(PetListResponseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  PetListResponseBuilder toBuilder() => PetListResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is PetListResponse &&
        pets == other.pets &&
        total == other.total;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, pets.hashCode);
    _$hash = $jc(_$hash, total.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'PetListResponse')
          ..add('pets', pets)
          ..add('total', total))
        .toString();
  }
}

class PetListResponseBuilder
    implements Builder<PetListResponse, PetListResponseBuilder> {
  _$PetListResponse? _$v;

  ListBuilder<PetResponse>? _pets;
  ListBuilder<PetResponse> get pets =>
      _$this._pets ??= ListBuilder<PetResponse>();
  set pets(ListBuilder<PetResponse>? pets) => _$this._pets = pets;

  int? _total;
  int? get total => _$this._total;
  set total(int? total) => _$this._total = total;

  PetListResponseBuilder() {
    PetListResponse._defaults(this);
  }

  PetListResponseBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _pets = $v.pets?.toBuilder();
      _total = $v.total;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(PetListResponse other) {
    _$v = other as _$PetListResponse;
  }

  @override
  void update(void Function(PetListResponseBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  PetListResponse build() => _build();

  _$PetListResponse _build() {
    _$PetListResponse _$result;
    try {
      _$result = _$v ??
          _$PetListResponse._(
            pets: _pets?.build(),
            total: total,
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'pets';
        _pets?.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'PetListResponse', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
