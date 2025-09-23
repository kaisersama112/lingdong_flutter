// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_follow_list_response.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$UserFollowListResponse extends UserFollowListResponse {
  @override
  final BuiltList<UserFollowItem> items;
  @override
  final int total;
  @override
  final int skip;
  @override
  final int limit;

  factory _$UserFollowListResponse(
          [void Function(UserFollowListResponseBuilder)? updates]) =>
      (UserFollowListResponseBuilder()..update(updates))._build();

  _$UserFollowListResponse._(
      {required this.items,
      required this.total,
      required this.skip,
      required this.limit})
      : super._();
  @override
  UserFollowListResponse rebuild(
          void Function(UserFollowListResponseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  UserFollowListResponseBuilder toBuilder() =>
      UserFollowListResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UserFollowListResponse &&
        items == other.items &&
        total == other.total &&
        skip == other.skip &&
        limit == other.limit;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, items.hashCode);
    _$hash = $jc(_$hash, total.hashCode);
    _$hash = $jc(_$hash, skip.hashCode);
    _$hash = $jc(_$hash, limit.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'UserFollowListResponse')
          ..add('items', items)
          ..add('total', total)
          ..add('skip', skip)
          ..add('limit', limit))
        .toString();
  }
}

class UserFollowListResponseBuilder
    implements Builder<UserFollowListResponse, UserFollowListResponseBuilder> {
  _$UserFollowListResponse? _$v;

  ListBuilder<UserFollowItem>? _items;
  ListBuilder<UserFollowItem> get items =>
      _$this._items ??= ListBuilder<UserFollowItem>();
  set items(ListBuilder<UserFollowItem>? items) => _$this._items = items;

  int? _total;
  int? get total => _$this._total;
  set total(int? total) => _$this._total = total;

  int? _skip;
  int? get skip => _$this._skip;
  set skip(int? skip) => _$this._skip = skip;

  int? _limit;
  int? get limit => _$this._limit;
  set limit(int? limit) => _$this._limit = limit;

  UserFollowListResponseBuilder() {
    UserFollowListResponse._defaults(this);
  }

  UserFollowListResponseBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _items = $v.items.toBuilder();
      _total = $v.total;
      _skip = $v.skip;
      _limit = $v.limit;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(UserFollowListResponse other) {
    _$v = other as _$UserFollowListResponse;
  }

  @override
  void update(void Function(UserFollowListResponseBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  UserFollowListResponse build() => _build();

  _$UserFollowListResponse _build() {
    _$UserFollowListResponse _$result;
    try {
      _$result = _$v ??
          _$UserFollowListResponse._(
            items: items.build(),
            total: BuiltValueNullFieldError.checkNotNull(
                total, r'UserFollowListResponse', 'total'),
            skip: BuiltValueNullFieldError.checkNotNull(
                skip, r'UserFollowListResponse', 'skip'),
            limit: BuiltValueNullFieldError.checkNotNull(
                limit, r'UserFollowListResponse', 'limit'),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'items';
        items.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'UserFollowListResponse', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
