// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'community_member_response.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$CommunityMemberResponse extends CommunityMemberResponse {
  @override
  final int id;
  @override
  final int userId;
  @override
  final int role;
  @override
  final int status;
  @override
  final DateTime joinedAt;
  @override
  final DateTime? approvalAt;

  factory _$CommunityMemberResponse(
          [void Function(CommunityMemberResponseBuilder)? updates]) =>
      (CommunityMemberResponseBuilder()..update(updates))._build();

  _$CommunityMemberResponse._(
      {required this.id,
      required this.userId,
      required this.role,
      required this.status,
      required this.joinedAt,
      this.approvalAt})
      : super._();
  @override
  CommunityMemberResponse rebuild(
          void Function(CommunityMemberResponseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  CommunityMemberResponseBuilder toBuilder() =>
      CommunityMemberResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is CommunityMemberResponse &&
        id == other.id &&
        userId == other.userId &&
        role == other.role &&
        status == other.status &&
        joinedAt == other.joinedAt &&
        approvalAt == other.approvalAt;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, userId.hashCode);
    _$hash = $jc(_$hash, role.hashCode);
    _$hash = $jc(_$hash, status.hashCode);
    _$hash = $jc(_$hash, joinedAt.hashCode);
    _$hash = $jc(_$hash, approvalAt.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'CommunityMemberResponse')
          ..add('id', id)
          ..add('userId', userId)
          ..add('role', role)
          ..add('status', status)
          ..add('joinedAt', joinedAt)
          ..add('approvalAt', approvalAt))
        .toString();
  }
}

class CommunityMemberResponseBuilder
    implements
        Builder<CommunityMemberResponse, CommunityMemberResponseBuilder> {
  _$CommunityMemberResponse? _$v;

  int? _id;
  int? get id => _$this._id;
  set id(int? id) => _$this._id = id;

  int? _userId;
  int? get userId => _$this._userId;
  set userId(int? userId) => _$this._userId = userId;

  int? _role;
  int? get role => _$this._role;
  set role(int? role) => _$this._role = role;

  int? _status;
  int? get status => _$this._status;
  set status(int? status) => _$this._status = status;

  DateTime? _joinedAt;
  DateTime? get joinedAt => _$this._joinedAt;
  set joinedAt(DateTime? joinedAt) => _$this._joinedAt = joinedAt;

  DateTime? _approvalAt;
  DateTime? get approvalAt => _$this._approvalAt;
  set approvalAt(DateTime? approvalAt) => _$this._approvalAt = approvalAt;

  CommunityMemberResponseBuilder() {
    CommunityMemberResponse._defaults(this);
  }

  CommunityMemberResponseBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _userId = $v.userId;
      _role = $v.role;
      _status = $v.status;
      _joinedAt = $v.joinedAt;
      _approvalAt = $v.approvalAt;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(CommunityMemberResponse other) {
    _$v = other as _$CommunityMemberResponse;
  }

  @override
  void update(void Function(CommunityMemberResponseBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  CommunityMemberResponse build() => _build();

  _$CommunityMemberResponse _build() {
    final _$result = _$v ??
        _$CommunityMemberResponse._(
          id: BuiltValueNullFieldError.checkNotNull(
              id, r'CommunityMemberResponse', 'id'),
          userId: BuiltValueNullFieldError.checkNotNull(
              userId, r'CommunityMemberResponse', 'userId'),
          role: BuiltValueNullFieldError.checkNotNull(
              role, r'CommunityMemberResponse', 'role'),
          status: BuiltValueNullFieldError.checkNotNull(
              status, r'CommunityMemberResponse', 'status'),
          joinedAt: BuiltValueNullFieldError.checkNotNull(
              joinedAt, r'CommunityMemberResponse', 'joinedAt'),
          approvalAt: approvalAt,
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
