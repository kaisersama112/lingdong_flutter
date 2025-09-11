// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pagination_response_beautification_record_response.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$PaginationResponseBeautificationRecordResponse
    extends PaginationResponseBeautificationRecordResponse {
  @override
  final BuiltList<BeautificationRecordResponse> items;
  @override
  final int skip;
  @override
  final int size;
  @override
  final int total;
  @override
  final int totalPages;

  factory _$PaginationResponseBeautificationRecordResponse(
          [void Function(PaginationResponseBeautificationRecordResponseBuilder)?
              updates]) =>
      (PaginationResponseBeautificationRecordResponseBuilder()..update(updates))
          ._build();

  _$PaginationResponseBeautificationRecordResponse._(
      {required this.items,
      required this.skip,
      required this.size,
      required this.total,
      required this.totalPages})
      : super._();
  @override
  PaginationResponseBeautificationRecordResponse rebuild(
          void Function(PaginationResponseBeautificationRecordResponseBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  PaginationResponseBeautificationRecordResponseBuilder toBuilder() =>
      PaginationResponseBeautificationRecordResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is PaginationResponseBeautificationRecordResponse &&
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
            r'PaginationResponseBeautificationRecordResponse')
          ..add('items', items)
          ..add('skip', skip)
          ..add('size', size)
          ..add('total', total)
          ..add('totalPages', totalPages))
        .toString();
  }
}

class PaginationResponseBeautificationRecordResponseBuilder
    implements
        Builder<PaginationResponseBeautificationRecordResponse,
            PaginationResponseBeautificationRecordResponseBuilder> {
  _$PaginationResponseBeautificationRecordResponse? _$v;

  ListBuilder<BeautificationRecordResponse>? _items;
  ListBuilder<BeautificationRecordResponse> get items =>
      _$this._items ??= ListBuilder<BeautificationRecordResponse>();
  set items(ListBuilder<BeautificationRecordResponse>? items) =>
      _$this._items = items;

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

  PaginationResponseBeautificationRecordResponseBuilder() {
    PaginationResponseBeautificationRecordResponse._defaults(this);
  }

  PaginationResponseBeautificationRecordResponseBuilder get _$this {
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
  void replace(PaginationResponseBeautificationRecordResponse other) {
    _$v = other as _$PaginationResponseBeautificationRecordResponse;
  }

  @override
  void update(
      void Function(PaginationResponseBeautificationRecordResponseBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  PaginationResponseBeautificationRecordResponse build() => _build();

  _$PaginationResponseBeautificationRecordResponse _build() {
    _$PaginationResponseBeautificationRecordResponse _$result;
    try {
      _$result = _$v ??
          _$PaginationResponseBeautificationRecordResponse._(
            items: items.build(),
            skip: BuiltValueNullFieldError.checkNotNull(skip,
                r'PaginationResponseBeautificationRecordResponse', 'skip'),
            size: BuiltValueNullFieldError.checkNotNull(size,
                r'PaginationResponseBeautificationRecordResponse', 'size'),
            total: BuiltValueNullFieldError.checkNotNull(total,
                r'PaginationResponseBeautificationRecordResponse', 'total'),
            totalPages: BuiltValueNullFieldError.checkNotNull(
                totalPages,
                r'PaginationResponseBeautificationRecordResponse',
                'totalPages'),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'items';
        items.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'PaginationResponseBeautificationRecordResponse',
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
