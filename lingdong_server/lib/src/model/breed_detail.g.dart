// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'breed_detail.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$BreedDetail extends BreedDetail {
  @override
  final int breedId;

  factory _$BreedDetail([void Function(BreedDetailBuilder)? updates]) =>
      (BreedDetailBuilder()..update(updates))._build();

  _$BreedDetail._({required this.breedId}) : super._();
  @override
  BreedDetail rebuild(void Function(BreedDetailBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  BreedDetailBuilder toBuilder() => BreedDetailBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is BreedDetail && breedId == other.breedId;
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
    return (newBuiltValueToStringHelper(r'BreedDetail')
          ..add('breedId', breedId))
        .toString();
  }
}

class BreedDetailBuilder implements Builder<BreedDetail, BreedDetailBuilder> {
  _$BreedDetail? _$v;

  int? _breedId;
  int? get breedId => _$this._breedId;
  set breedId(int? breedId) => _$this._breedId = breedId;

  BreedDetailBuilder() {
    BreedDetail._defaults(this);
  }

  BreedDetailBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _breedId = $v.breedId;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(BreedDetail other) {
    _$v = other as _$BreedDetail;
  }

  @override
  void update(void Function(BreedDetailBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  BreedDetail build() => _build();

  _$BreedDetail _build() {
    final _$result = _$v ??
        _$BreedDetail._(
          breedId: BuiltValueNullFieldError.checkNotNull(
              breedId, r'BreedDetail', 'breedId'),
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
