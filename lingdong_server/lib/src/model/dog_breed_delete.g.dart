// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dog_breed_delete.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$DogBreedDelete extends DogBreedDelete {
  @override
  final int breedId;

  factory _$DogBreedDelete([void Function(DogBreedDeleteBuilder)? updates]) =>
      (DogBreedDeleteBuilder()..update(updates))._build();

  _$DogBreedDelete._({required this.breedId}) : super._();
  @override
  DogBreedDelete rebuild(void Function(DogBreedDeleteBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  DogBreedDeleteBuilder toBuilder() => DogBreedDeleteBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is DogBreedDelete && breedId == other.breedId;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, breedId.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'DogBreedDelete')
          ..add('breedId', breedId))
        .toString();
  }
}

class DogBreedDeleteBuilder
    implements Builder<DogBreedDelete, DogBreedDeleteBuilder> {
  _$DogBreedDelete? _$v;

  int? _breedId;
  int? get breedId => _$this._breedId;
  set breedId(int? breedId) => _$this._breedId = breedId;

  DogBreedDeleteBuilder() {
    DogBreedDelete._defaults(this);
  }

  DogBreedDeleteBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _breedId = $v.breedId;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(DogBreedDelete other) {
    _$v = other as _$DogBreedDelete;
  }

  @override
  void update(void Function(DogBreedDeleteBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  DogBreedDelete build() => _build();

  _$DogBreedDelete _build() {
    final _$result = _$v ??
        _$DogBreedDelete._(
          breedId: BuiltValueNullFieldError.checkNotNull(
              breedId, r'DogBreedDelete', 'breedId'),
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
