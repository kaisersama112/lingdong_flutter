// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'community_member_list_response.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$CommunityMemberListResponse extends CommunityMemberListResponse {
  @override
  final BuiltList<CommunityMemberResponse> members;
  @override
  final int total;

  factory _$CommunityMemberListResponse(
          [void Function(CommunityMemberListResponseBuilder)? updates]) =>
      (CommunityMemberListResponseBuilder()..update(updates))._build();

  _$CommunityMemberListResponse._({required this.members, required this.total})
      : super._();
  @override
  CommunityMemberListResponse rebuild(
          void Function(CommunityMemberListResponseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  CommunityMemberListResponseBuilder toBuilder() =>
      CommunityMemberListResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is CommunityMemberListResponse &&
        members == other.members &&
        total == other.total;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, members.hashCode);
    _$hash = $jc(_$hash, total.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'CommunityMemberListResponse')
          ..add('members', members)
          ..add('total', total))
        .toString();
  }
}

class CommunityMemberListResponseBuilder
    implements
        Builder<CommunityMemberListResponse,
            CommunityMemberListResponseBuilder> {
  _$CommunityMemberListResponse? _$v;

  ListBuilder<CommunityMemberResponse>? _members;
  ListBuilder<CommunityMemberResponse> get members =>
      _$this._members ??= ListBuilder<CommunityMemberResponse>();
  set members(ListBuilder<CommunityMemberResponse>? members) =>
      _$this._members = members;

  int? _total;
  int? get total => _$this._total;
  set total(int? total) => _$this._total = total;

  CommunityMemberListResponseBuilder() {
    CommunityMemberListResponse._defaults(this);
  }

  CommunityMemberListResponseBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _members = $v.members.toBuilder();
      _total = $v.total;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(CommunityMemberListResponse other) {
    _$v = other as _$CommunityMemberListResponse;
  }

  @override
  void update(void Function(CommunityMemberListResponseBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  CommunityMemberListResponse build() => _build();

  _$CommunityMemberListResponse _build() {
    _$CommunityMemberListResponse _$result;
    try {
      _$result = _$v ??
          _$CommunityMemberListResponse._(
            members: members.build(),
            total: BuiltValueNullFieldError.checkNotNull(
                total, r'CommunityMemberListResponse', 'total'),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'members';
        members.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'CommunityMemberListResponse', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
