// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'paged_response_dog_behavior_guide_out.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$PagedResponseDogBehaviorGuideOut
    extends PagedResponseDogBehaviorGuideOut {
  @override
  final int total;
  @override
  final BuiltList<DogBehaviorGuideOut> items;
  @override
  final int page;
  @override
  final int pageSize;

  factory _$PagedResponseDogBehaviorGuideOut(
          [void Function(PagedResponseDogBehaviorGuideOutBuilder)? updates]) =>
      (PagedResponseDogBehaviorGuideOutBuilder()..update(updates))._build();

  _$PagedResponseDogBehaviorGuideOut._(
      {required this.total,
      required this.items,
      required this.page,
      required this.pageSize})
      : super._();
  @override
  PagedResponseDogBehaviorGuideOut rebuild(
          void Function(PagedResponseDogBehaviorGuideOutBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  PagedResponseDogBehaviorGuideOutBuilder toBuilder() =>
      PagedResponseDogBehaviorGuideOutBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is PagedResponseDogBehaviorGuideOut &&
        total == other.total &&
        items == other.items &&
        page == other.page &&
        pageSize == other.pageSize;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, total.hashCode);
    _$hash = $jc(_$hash, items.hashCode);
    _$hash = $jc(_$hash, page.hashCode);
    _$hash = $jc(_$hash, pageSize.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'PagedResponseDogBehaviorGuideOut')
          ..add('total', total)
          ..add('items', items)
          ..add('page', page)
          ..add('pageSize', pageSize))
        .toString();
  }
}

class PagedResponseDogBehaviorGuideOutBuilder
    implements
        Builder<PagedResponseDogBehaviorGuideOut,
            PagedResponseDogBehaviorGuideOutBuilder> {
  _$PagedResponseDogBehaviorGuideOut? _$v;

  int? _total;
  int? get total => _$this._total;
  set total(int? total) => _$this._total = total;

  ListBuilder<DogBehaviorGuideOut>? _items;
  ListBuilder<DogBehaviorGuideOut> get items =>
      _$this._items ??= ListBuilder<DogBehaviorGuideOut>();
  set items(ListBuilder<DogBehaviorGuideOut>? items) => _$this._items = items;

  int? _page;
  int? get page => _$this._page;
  set page(int? page) => _$this._page = page;

  int? _pageSize;
  int? get pageSize => _$this._pageSize;
  set pageSize(int? pageSize) => _$this._pageSize = pageSize;

  PagedResponseDogBehaviorGuideOutBuilder() {
    PagedResponseDogBehaviorGuideOut._defaults(this);
  }

  PagedResponseDogBehaviorGuideOutBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _total = $v.total;
      _items = $v.items.toBuilder();
      _page = $v.page;
      _pageSize = $v.pageSize;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(PagedResponseDogBehaviorGuideOut other) {
    _$v = other as _$PagedResponseDogBehaviorGuideOut;
  }

  @override
  void update(void Function(PagedResponseDogBehaviorGuideOutBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  PagedResponseDogBehaviorGuideOut build() => _build();

  _$PagedResponseDogBehaviorGuideOut _build() {
    _$PagedResponseDogBehaviorGuideOut _$result;
    try {
      _$result = _$v ??
          _$PagedResponseDogBehaviorGuideOut._(
            total: BuiltValueNullFieldError.checkNotNull(
                total, r'PagedResponseDogBehaviorGuideOut', 'total'),
            items: items.build(),
            page: BuiltValueNullFieldError.checkNotNull(
                page, r'PagedResponseDogBehaviorGuideOut', 'page'),
            pageSize: BuiltValueNullFieldError.checkNotNull(
                pageSize, r'PagedResponseDogBehaviorGuideOut', 'pageSize'),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'items';
        items.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'PagedResponseDogBehaviorGuideOut', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
