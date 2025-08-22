// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'community_list_response.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$CommunityListResponse extends CommunityListResponse {
  @override
  final BuiltList<CommunityResponse> communities;
  @override
  final int total;

  factory _$CommunityListResponse(
          [void Function(CommunityListResponseBuilder)? updates]) =>
      (CommunityListResponseBuilder()..update(updates))._build();

  _$CommunityListResponse._({required this.communities, required this.total})
      : super._();
  @override
  CommunityListResponse rebuild(
          void Function(CommunityListResponseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  CommunityListResponseBuilder toBuilder() =>
      CommunityListResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is CommunityListResponse &&
        communities == other.communities &&
        total == other.total;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, communities.hashCode);
    _$hash = $jc(_$hash, total.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'CommunityListResponse')
          ..add('communities', communities)
          ..add('total', total))
        .toString();
  }
}

class CommunityListResponseBuilder
    implements Builder<CommunityListResponse, CommunityListResponseBuilder> {
  _$CommunityListResponse? _$v;

  ListBuilder<CommunityResponse>? _communities;
  ListBuilder<CommunityResponse> get communities =>
      _$this._communities ??= ListBuilder<CommunityResponse>();
  set communities(ListBuilder<CommunityResponse>? communities) =>
      _$this._communities = communities;

  int? _total;
  int? get total => _$this._total;
  set total(int? total) => _$this._total = total;

  CommunityListResponseBuilder() {
    CommunityListResponse._defaults(this);
  }

  CommunityListResponseBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _communities = $v.communities.toBuilder();
      _total = $v.total;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(CommunityListResponse other) {
    _$v = other as _$CommunityListResponse;
  }

  @override
  void update(void Function(CommunityListResponseBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  CommunityListResponse build() => _build();

  _$CommunityListResponse _build() {
    _$CommunityListResponse _$result;
    try {
      _$result = _$v ??
          _$CommunityListResponse._(
            communities: communities.build(),
            total: BuiltValueNullFieldError.checkNotNull(
                total, r'CommunityListResponse', 'total'),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'communities';
        communities.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'CommunityListResponse', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
