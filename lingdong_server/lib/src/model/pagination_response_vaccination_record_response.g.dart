// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pagination_response_vaccination_record_response.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$PaginationResponseVaccinationRecordResponse
    extends PaginationResponseVaccinationRecordResponse {
  @override
  final BuiltList<VaccinationRecordResponse> items;
  @override
  final int skip;
  @override
  final int size;
  @override
  final int total;
  @override
  final int totalPages;

  factory _$PaginationResponseVaccinationRecordResponse(
          [void Function(PaginationResponseVaccinationRecordResponseBuilder)?
              updates]) =>
      (PaginationResponseVaccinationRecordResponseBuilder()..update(updates))
          ._build();

  _$PaginationResponseVaccinationRecordResponse._(
      {required this.items,
      required this.skip,
      required this.size,
      required this.total,
      required this.totalPages})
      : super._();
  @override
  PaginationResponseVaccinationRecordResponse rebuild(
          void Function(PaginationResponseVaccinationRecordResponseBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  PaginationResponseVaccinationRecordResponseBuilder toBuilder() =>
      PaginationResponseVaccinationRecordResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is PaginationResponseVaccinationRecordResponse &&
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
            r'PaginationResponseVaccinationRecordResponse')
          ..add('items', items)
          ..add('skip', skip)
          ..add('size', size)
          ..add('total', total)
          ..add('totalPages', totalPages))
        .toString();
  }
}

class PaginationResponseVaccinationRecordResponseBuilder
    implements
        Builder<PaginationResponseVaccinationRecordResponse,
            PaginationResponseVaccinationRecordResponseBuilder> {
  _$PaginationResponseVaccinationRecordResponse? _$v;

  ListBuilder<VaccinationRecordResponse>? _items;
  ListBuilder<VaccinationRecordResponse> get items =>
      _$this._items ??= ListBuilder<VaccinationRecordResponse>();
  set items(ListBuilder<VaccinationRecordResponse>? items) =>
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

  PaginationResponseVaccinationRecordResponseBuilder() {
    PaginationResponseVaccinationRecordResponse._defaults(this);
  }

  PaginationResponseVaccinationRecordResponseBuilder get _$this {
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
  void replace(PaginationResponseVaccinationRecordResponse other) {
    _$v = other as _$PaginationResponseVaccinationRecordResponse;
  }

  @override
  void update(
      void Function(PaginationResponseVaccinationRecordResponseBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  PaginationResponseVaccinationRecordResponse build() => _build();

  _$PaginationResponseVaccinationRecordResponse _build() {
    _$PaginationResponseVaccinationRecordResponse _$result;
    try {
      _$result = _$v ??
          _$PaginationResponseVaccinationRecordResponse._(
            items: items.build(),
            skip: BuiltValueNullFieldError.checkNotNull(
                skip, r'PaginationResponseVaccinationRecordResponse', 'skip'),
            size: BuiltValueNullFieldError.checkNotNull(
                size, r'PaginationResponseVaccinationRecordResponse', 'size'),
            total: BuiltValueNullFieldError.checkNotNull(
                total, r'PaginationResponseVaccinationRecordResponse', 'total'),
            totalPages: BuiltValueNullFieldError.checkNotNull(totalPages,
                r'PaginationResponseVaccinationRecordResponse', 'totalPages'),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'items';
        items.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'PaginationResponseVaccinationRecordResponse',
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
