// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pagination_response_deworming_record_response.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$PaginationResponseDewormingRecordResponse
    extends PaginationResponseDewormingRecordResponse {
  @override
  final BuiltList<DewormingRecordResponse> items;
  @override
  final int skip;
  @override
  final int size;
  @override
  final int total;
  @override
  final int totalPages;

  factory _$PaginationResponseDewormingRecordResponse(
          [void Function(PaginationResponseDewormingRecordResponseBuilder)?
              updates]) =>
      (PaginationResponseDewormingRecordResponseBuilder()..update(updates))
          ._build();

  _$PaginationResponseDewormingRecordResponse._(
      {required this.items,
      required this.skip,
      required this.size,
      required this.total,
      required this.totalPages})
      : super._();
  @override
  PaginationResponseDewormingRecordResponse rebuild(
          void Function(PaginationResponseDewormingRecordResponseBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  PaginationResponseDewormingRecordResponseBuilder toBuilder() =>
      PaginationResponseDewormingRecordResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is PaginationResponseDewormingRecordResponse &&
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
            r'PaginationResponseDewormingRecordResponse')
          ..add('items', items)
          ..add('skip', skip)
          ..add('size', size)
          ..add('total', total)
          ..add('totalPages', totalPages))
        .toString();
  }
}

class PaginationResponseDewormingRecordResponseBuilder
    implements
        Builder<PaginationResponseDewormingRecordResponse,
            PaginationResponseDewormingRecordResponseBuilder> {
  _$PaginationResponseDewormingRecordResponse? _$v;

  ListBuilder<DewormingRecordResponse>? _items;
  ListBuilder<DewormingRecordResponse> get items =>
      _$this._items ??= ListBuilder<DewormingRecordResponse>();
  set items(ListBuilder<DewormingRecordResponse>? items) =>
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

  PaginationResponseDewormingRecordResponseBuilder() {
    PaginationResponseDewormingRecordResponse._defaults(this);
  }

  PaginationResponseDewormingRecordResponseBuilder get _$this {
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
  void replace(PaginationResponseDewormingRecordResponse other) {
    _$v = other as _$PaginationResponseDewormingRecordResponse;
  }

  @override
  void update(
      void Function(PaginationResponseDewormingRecordResponseBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  PaginationResponseDewormingRecordResponse build() => _build();

  _$PaginationResponseDewormingRecordResponse _build() {
    _$PaginationResponseDewormingRecordResponse _$result;
    try {
      _$result = _$v ??
          _$PaginationResponseDewormingRecordResponse._(
            items: items.build(),
            skip: BuiltValueNullFieldError.checkNotNull(
                skip, r'PaginationResponseDewormingRecordResponse', 'skip'),
            size: BuiltValueNullFieldError.checkNotNull(
                size, r'PaginationResponseDewormingRecordResponse', 'size'),
            total: BuiltValueNullFieldError.checkNotNull(
                total, r'PaginationResponseDewormingRecordResponse', 'total'),
            totalPages: BuiltValueNullFieldError.checkNotNull(totalPages,
                r'PaginationResponseDewormingRecordResponse', 'totalPages'),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'items';
        items.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'PaginationResponseDewormingRecordResponse',
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
