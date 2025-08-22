// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pagination_params.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$PaginationParams extends PaginationParams {
  @override
  final int? skip;
  @override
  final int? limit;

  factory _$PaginationParams(
          [void Function(PaginationParamsBuilder)? updates]) =>
      (PaginationParamsBuilder()..update(updates))._build();

  _$PaginationParams._({this.skip, this.limit}) : super._();
  @override
  PaginationParams rebuild(void Function(PaginationParamsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  PaginationParamsBuilder toBuilder() =>
      PaginationParamsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is PaginationParams &&
        skip == other.skip &&
        limit == other.limit;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, skip.hashCode);
    _$hash = $jc(_$hash, limit.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'PaginationParams')
          ..add('skip', skip)
          ..add('limit', limit))
        .toString();
  }
}

class PaginationParamsBuilder
    implements Builder<PaginationParams, PaginationParamsBuilder> {
  _$PaginationParams? _$v;

  int? _skip;
  int? get skip => _$this._skip;
  set skip(int? skip) => _$this._skip = skip;

  int? _limit;
  int? get limit => _$this._limit;
  set limit(int? limit) => _$this._limit = limit;

  PaginationParamsBuilder() {
    PaginationParams._defaults(this);
  }

  PaginationParamsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _skip = $v.skip;
      _limit = $v.limit;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(PaginationParams other) {
    _$v = other as _$PaginationParams;
  }

  @override
  void update(void Function(PaginationParamsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  PaginationParams build() => _build();

  _$PaginationParams _build() {
    final _$result = _$v ??
        _$PaginationParams._(
          skip: skip,
          limit: limit,
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
