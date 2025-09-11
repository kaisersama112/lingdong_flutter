// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pagination_response_consultation_response.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$PaginationResponseConsultationResponse
    extends PaginationResponseConsultationResponse {
  @override
  final BuiltList<ConsultationResponse> items;
  @override
  final int skip;
  @override
  final int size;
  @override
  final int total;
  @override
  final int totalPages;

  factory _$PaginationResponseConsultationResponse(
          [void Function(PaginationResponseConsultationResponseBuilder)?
              updates]) =>
      (PaginationResponseConsultationResponseBuilder()..update(updates))
          ._build();

  _$PaginationResponseConsultationResponse._(
      {required this.items,
      required this.skip,
      required this.size,
      required this.total,
      required this.totalPages})
      : super._();
  @override
  PaginationResponseConsultationResponse rebuild(
          void Function(PaginationResponseConsultationResponseBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  PaginationResponseConsultationResponseBuilder toBuilder() =>
      PaginationResponseConsultationResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is PaginationResponseConsultationResponse &&
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
            r'PaginationResponseConsultationResponse')
          ..add('items', items)
          ..add('skip', skip)
          ..add('size', size)
          ..add('total', total)
          ..add('totalPages', totalPages))
        .toString();
  }
}

class PaginationResponseConsultationResponseBuilder
    implements
        Builder<PaginationResponseConsultationResponse,
            PaginationResponseConsultationResponseBuilder> {
  _$PaginationResponseConsultationResponse? _$v;

  ListBuilder<ConsultationResponse>? _items;
  ListBuilder<ConsultationResponse> get items =>
      _$this._items ??= ListBuilder<ConsultationResponse>();
  set items(ListBuilder<ConsultationResponse>? items) => _$this._items = items;

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

  PaginationResponseConsultationResponseBuilder() {
    PaginationResponseConsultationResponse._defaults(this);
  }

  PaginationResponseConsultationResponseBuilder get _$this {
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
  void replace(PaginationResponseConsultationResponse other) {
    _$v = other as _$PaginationResponseConsultationResponse;
  }

  @override
  void update(
      void Function(PaginationResponseConsultationResponseBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  PaginationResponseConsultationResponse build() => _build();

  _$PaginationResponseConsultationResponse _build() {
    _$PaginationResponseConsultationResponse _$result;
    try {
      _$result = _$v ??
          _$PaginationResponseConsultationResponse._(
            items: items.build(),
            skip: BuiltValueNullFieldError.checkNotNull(
                skip, r'PaginationResponseConsultationResponse', 'skip'),
            size: BuiltValueNullFieldError.checkNotNull(
                size, r'PaginationResponseConsultationResponse', 'size'),
            total: BuiltValueNullFieldError.checkNotNull(
                total, r'PaginationResponseConsultationResponse', 'total'),
            totalPages: BuiltValueNullFieldError.checkNotNull(totalPages,
                r'PaginationResponseConsultationResponse', 'totalPages'),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'items';
        items.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'PaginationResponseConsultationResponse',
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
