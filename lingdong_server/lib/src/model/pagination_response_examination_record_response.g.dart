// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pagination_response_examination_record_response.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$PaginationResponseExaminationRecordResponse
    extends PaginationResponseExaminationRecordResponse {
  @override
  final BuiltList<ExaminationRecordResponse> items;
  @override
  final int skip;
  @override
  final int size;
  @override
  final int total;
  @override
  final int totalPages;

  factory _$PaginationResponseExaminationRecordResponse(
          [void Function(PaginationResponseExaminationRecordResponseBuilder)?
              updates]) =>
      (PaginationResponseExaminationRecordResponseBuilder()..update(updates))
          ._build();

  _$PaginationResponseExaminationRecordResponse._(
      {required this.items,
      required this.skip,
      required this.size,
      required this.total,
      required this.totalPages})
      : super._();
  @override
  PaginationResponseExaminationRecordResponse rebuild(
          void Function(PaginationResponseExaminationRecordResponseBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  PaginationResponseExaminationRecordResponseBuilder toBuilder() =>
      PaginationResponseExaminationRecordResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is PaginationResponseExaminationRecordResponse &&
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
            r'PaginationResponseExaminationRecordResponse')
          ..add('items', items)
          ..add('skip', skip)
          ..add('size', size)
          ..add('total', total)
          ..add('totalPages', totalPages))
        .toString();
  }
}

class PaginationResponseExaminationRecordResponseBuilder
    implements
        Builder<PaginationResponseExaminationRecordResponse,
            PaginationResponseExaminationRecordResponseBuilder> {
  _$PaginationResponseExaminationRecordResponse? _$v;

  ListBuilder<ExaminationRecordResponse>? _items;
  ListBuilder<ExaminationRecordResponse> get items =>
      _$this._items ??= ListBuilder<ExaminationRecordResponse>();
  set items(ListBuilder<ExaminationRecordResponse>? items) =>
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

  PaginationResponseExaminationRecordResponseBuilder() {
    PaginationResponseExaminationRecordResponse._defaults(this);
  }

  PaginationResponseExaminationRecordResponseBuilder get _$this {
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
  void replace(PaginationResponseExaminationRecordResponse other) {
    _$v = other as _$PaginationResponseExaminationRecordResponse;
  }

  @override
  void update(
      void Function(PaginationResponseExaminationRecordResponseBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  PaginationResponseExaminationRecordResponse build() => _build();

  _$PaginationResponseExaminationRecordResponse _build() {
    _$PaginationResponseExaminationRecordResponse _$result;
    try {
      _$result = _$v ??
          _$PaginationResponseExaminationRecordResponse._(
            items: items.build(),
            skip: BuiltValueNullFieldError.checkNotNull(
                skip, r'PaginationResponseExaminationRecordResponse', 'skip'),
            size: BuiltValueNullFieldError.checkNotNull(
                size, r'PaginationResponseExaminationRecordResponse', 'size'),
            total: BuiltValueNullFieldError.checkNotNull(
                total, r'PaginationResponseExaminationRecordResponse', 'total'),
            totalPages: BuiltValueNullFieldError.checkNotNull(totalPages,
                r'PaginationResponseExaminationRecordResponse', 'totalPages'),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'items';
        items.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'PaginationResponseExaminationRecordResponse',
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
