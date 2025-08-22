// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'paged_response_dog_care_guide_out.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$PagedResponseDogCareGuideOut extends PagedResponseDogCareGuideOut {
  @override
  final BuiltList<DogCareGuideOut> items;
  @override
  final int total;
  @override
  final int page;
  @override
  final int size;
  @override
  final int pages;

  factory _$PagedResponseDogCareGuideOut(
          [void Function(PagedResponseDogCareGuideOutBuilder)? updates]) =>
      (PagedResponseDogCareGuideOutBuilder()..update(updates))._build();

  _$PagedResponseDogCareGuideOut._(
      {required this.items,
      required this.total,
      required this.page,
      required this.size,
      required this.pages})
      : super._();
  @override
  PagedResponseDogCareGuideOut rebuild(
          void Function(PagedResponseDogCareGuideOutBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  PagedResponseDogCareGuideOutBuilder toBuilder() =>
      PagedResponseDogCareGuideOutBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is PagedResponseDogCareGuideOut &&
        items == other.items &&
        total == other.total &&
        page == other.page &&
        size == other.size &&
        pages == other.pages;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, items.hashCode);
    _$hash = $jc(_$hash, total.hashCode);
    _$hash = $jc(_$hash, page.hashCode);
    _$hash = $jc(_$hash, size.hashCode);
    _$hash = $jc(_$hash, pages.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'PagedResponseDogCareGuideOut')
          ..add('items', items)
          ..add('total', total)
          ..add('page', page)
          ..add('size', size)
          ..add('pages', pages))
        .toString();
  }
}

class PagedResponseDogCareGuideOutBuilder
    implements
        Builder<PagedResponseDogCareGuideOut,
            PagedResponseDogCareGuideOutBuilder> {
  _$PagedResponseDogCareGuideOut? _$v;

  ListBuilder<DogCareGuideOut>? _items;
  ListBuilder<DogCareGuideOut> get items =>
      _$this._items ??= ListBuilder<DogCareGuideOut>();
  set items(ListBuilder<DogCareGuideOut>? items) => _$this._items = items;

  int? _total;
  int? get total => _$this._total;
  set total(int? total) => _$this._total = total;

  int? _page;
  int? get page => _$this._page;
  set page(int? page) => _$this._page = page;

  int? _size;
  int? get size => _$this._size;
  set size(int? size) => _$this._size = size;

  int? _pages;
  int? get pages => _$this._pages;
  set pages(int? pages) => _$this._pages = pages;

  PagedResponseDogCareGuideOutBuilder() {
    PagedResponseDogCareGuideOut._defaults(this);
  }

  PagedResponseDogCareGuideOutBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _items = $v.items.toBuilder();
      _total = $v.total;
      _page = $v.page;
      _size = $v.size;
      _pages = $v.pages;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(PagedResponseDogCareGuideOut other) {
    _$v = other as _$PagedResponseDogCareGuideOut;
  }

  @override
  void update(void Function(PagedResponseDogCareGuideOutBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  PagedResponseDogCareGuideOut build() => _build();

  _$PagedResponseDogCareGuideOut _build() {
    _$PagedResponseDogCareGuideOut _$result;
    try {
      _$result = _$v ??
          _$PagedResponseDogCareGuideOut._(
            items: items.build(),
            total: BuiltValueNullFieldError.checkNotNull(
                total, r'PagedResponseDogCareGuideOut', 'total'),
            page: BuiltValueNullFieldError.checkNotNull(
                page, r'PagedResponseDogCareGuideOut', 'page'),
            size: BuiltValueNullFieldError.checkNotNull(
                size, r'PagedResponseDogCareGuideOut', 'size'),
            pages: BuiltValueNullFieldError.checkNotNull(
                pages, r'PagedResponseDogCareGuideOut', 'pages'),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'items';
        items.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'PagedResponseDogCareGuideOut', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
