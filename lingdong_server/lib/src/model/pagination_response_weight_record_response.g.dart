// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pagination_response_weight_record_response.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$PaginationResponseWeightRecordResponse
    extends PaginationResponseWeightRecordResponse {
  @override
  final BuiltList<WeightRecordResponse> items;
  @override
  final int skip;
  @override
  final int size;
  @override
  final int total;
  @override
  final int totalPages;

  factory _$PaginationResponseWeightRecordResponse(
          [void Function(PaginationResponseWeightRecordResponseBuilder)?
              updates]) =>
      (PaginationResponseWeightRecordResponseBuilder()..update(updates))
          ._build();

  _$PaginationResponseWeightRecordResponse._(
      {required this.items,
      required this.skip,
      required this.size,
      required this.total,
      required this.totalPages})
      : super._();
  @override
  PaginationResponseWeightRecordResponse rebuild(
          void Function(PaginationResponseWeightRecordResponseBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  PaginationResponseWeightRecordResponseBuilder toBuilder() =>
      PaginationResponseWeightRecordResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is PaginationResponseWeightRecordResponse &&
        items == other.items &&
        skip == other.skip &&
        size == other.size &&
        total == other.total &&
        totalPages == other.totalPages;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, items.hashCode);
    _$hash = $jc(_$hash, skip.hashCode);
    _$hash = $jc(_$hash, size.hashCode);
    _$hash = $jc(_$hash, total.hashCode);
    _$hash = $jc(_$hash, totalPages.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(
            r'PaginationResponseWeightRecordResponse')
          ..add('items', items)
          ..add('skip', skip)
          ..add('size', size)
          ..add('total', total)
          ..add('totalPages', totalPages))
        .toString();
  }
}

class PaginationResponseWeightRecordResponseBuilder
    implements
        Builder<PaginationResponseWeightRecordResponse,
            PaginationResponseWeightRecordResponseBuilder> {
  _$PaginationResponseWeightRecordResponse? _$v;

  ListBuilder<WeightRecordResponse>? _items;
  ListBuilder<WeightRecordResponse> get items =>
      _$this._items ??= ListBuilder<WeightRecordResponse>();
  set items(ListBuilder<WeightRecordResponse>? items) => _$this._items = items;

  int? _skip;
  int? get skip => _$this._skip;
  set skip(int? skip) => _$this._skip = skip;

  int? _size;
  int? get size => _$this._size;
  set size(int? size) => _$this._size = size;

  int? _total;
  int? get total => _$this._total;
  set total(int? total) => _$this._total = total;

  int? _totalPages;
  int? get totalPages => _$this._totalPages;
  set totalPages(int? totalPages) => _$this._totalPages = totalPages;

  PaginationResponseWeightRecordResponseBuilder() {
    PaginationResponseWeightRecordResponse._defaults(this);
  }

  PaginationResponseWeightRecordResponseBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _items = $v.items.toBuilder();
      _skip = $v.skip;
      _size = $v.size;
      _total = $v.total;
      _totalPages = $v.totalPages;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(PaginationResponseWeightRecordResponse other) {
    _$v = other as _$PaginationResponseWeightRecordResponse;
  }

  @override
  void update(
      void Function(PaginationResponseWeightRecordResponseBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  PaginationResponseWeightRecordResponse build() => _build();

  _$PaginationResponseWeightRecordResponse _build() {
    _$PaginationResponseWeightRecordResponse _$result;
    try {
      _$result = _$v ??
          _$PaginationResponseWeightRecordResponse._(
            items: items.build(),
            skip: BuiltValueNullFieldError.checkNotNull(
                skip, r'PaginationResponseWeightRecordResponse', 'skip'),
            size: BuiltValueNullFieldError.checkNotNull(
                size, r'PaginationResponseWeightRecordResponse', 'size'),
            total: BuiltValueNullFieldError.checkNotNull(
                total, r'PaginationResponseWeightRecordResponse', 'total'),
            totalPages: BuiltValueNullFieldError.checkNotNull(totalPages,
                r'PaginationResponseWeightRecordResponse', 'totalPages'),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'items';
        items.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'PaginationResponseWeightRecordResponse',
            _$failedField,
            e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
