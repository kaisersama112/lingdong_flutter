// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pagination_response_other_health_record_response.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$PaginationResponseOtherHealthRecordResponse
    extends PaginationResponseOtherHealthRecordResponse {
  @override
  final BuiltList<OtherHealthRecordResponse> items;
  @override
  final int skip;
  @override
  final int size;
  @override
  final int total;
  @override
  final int totalPages;

  factory _$PaginationResponseOtherHealthRecordResponse(
          [void Function(PaginationResponseOtherHealthRecordResponseBuilder)?
              updates]) =>
      (PaginationResponseOtherHealthRecordResponseBuilder()..update(updates))
          ._build();

  _$PaginationResponseOtherHealthRecordResponse._(
      {required this.items,
      required this.skip,
      required this.size,
      required this.total,
      required this.totalPages})
      : super._();
  @override
  PaginationResponseOtherHealthRecordResponse rebuild(
          void Function(PaginationResponseOtherHealthRecordResponseBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  PaginationResponseOtherHealthRecordResponseBuilder toBuilder() =>
      PaginationResponseOtherHealthRecordResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is PaginationResponseOtherHealthRecordResponse &&
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
            r'PaginationResponseOtherHealthRecordResponse')
          ..add('items', items)
          ..add('skip', skip)
          ..add('size', size)
          ..add('total', total)
          ..add('totalPages', totalPages))
        .toString();
  }
}

class PaginationResponseOtherHealthRecordResponseBuilder
    implements
        Builder<PaginationResponseOtherHealthRecordResponse,
            PaginationResponseOtherHealthRecordResponseBuilder> {
  _$PaginationResponseOtherHealthRecordResponse? _$v;

  ListBuilder<OtherHealthRecordResponse>? _items;
  ListBuilder<OtherHealthRecordResponse> get items =>
      _$this._items ??= ListBuilder<OtherHealthRecordResponse>();
  set items(ListBuilder<OtherHealthRecordResponse>? items) =>
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

  PaginationResponseOtherHealthRecordResponseBuilder() {
    PaginationResponseOtherHealthRecordResponse._defaults(this);
  }

  PaginationResponseOtherHealthRecordResponseBuilder get _$this {
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
  void replace(PaginationResponseOtherHealthRecordResponse other) {
    _$v = other as _$PaginationResponseOtherHealthRecordResponse;
  }

  @override
  void update(
      void Function(PaginationResponseOtherHealthRecordResponseBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  PaginationResponseOtherHealthRecordResponse build() => _build();

  _$PaginationResponseOtherHealthRecordResponse _build() {
    _$PaginationResponseOtherHealthRecordResponse _$result;
    try {
      _$result = _$v ??
          _$PaginationResponseOtherHealthRecordResponse._(
            items: items.build(),
            skip: BuiltValueNullFieldError.checkNotNull(
                skip, r'PaginationResponseOtherHealthRecordResponse', 'skip'),
            size: BuiltValueNullFieldError.checkNotNull(
                size, r'PaginationResponseOtherHealthRecordResponse', 'size'),
            total: BuiltValueNullFieldError.checkNotNull(
                total, r'PaginationResponseOtherHealthRecordResponse', 'total'),
            totalPages: BuiltValueNullFieldError.checkNotNull(totalPages,
                r'PaginationResponseOtherHealthRecordResponse', 'totalPages'),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'items';
        items.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'PaginationResponseOtherHealthRecordResponse',
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
