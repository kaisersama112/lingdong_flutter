// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'membership_approval.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$MembershipApproval extends MembershipApproval {
  @override
  final int? memberId;
  @override
  final bool? approved;
  @override
  final String? comment;

  factory _$MembershipApproval(
          [void Function(MembershipApprovalBuilder)? updates]) =>
      (MembershipApprovalBuilder()..update(updates))._build();

  _$MembershipApproval._({this.memberId, this.approved, this.comment})
      : super._();
  @override
  MembershipApproval rebuild(
          void Function(MembershipApprovalBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  MembershipApprovalBuilder toBuilder() =>
      MembershipApprovalBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is MembershipApproval &&
        memberId == other.memberId &&
        approved == other.approved &&
        comment == other.comment;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, memberId.hashCode);
    _$hash = $jc(_$hash, approved.hashCode);
    _$hash = $jc(_$hash, comment.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'MembershipApproval')
          ..add('memberId', memberId)
          ..add('approved', approved)
          ..add('comment', comment))
        .toString();
  }
}

class MembershipApprovalBuilder
    implements Builder<MembershipApproval, MembershipApprovalBuilder> {
  _$MembershipApproval? _$v;

  int? _memberId;
  int? get memberId => _$this._memberId;
  set memberId(int? memberId) => _$this._memberId = memberId;

  bool? _approved;
  bool? get approved => _$this._approved;
  set approved(bool? approved) => _$this._approved = approved;

  String? _comment;
  String? get comment => _$this._comment;
  set comment(String? comment) => _$this._comment = comment;

  MembershipApprovalBuilder() {
    MembershipApproval._defaults(this);
  }

  MembershipApprovalBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _memberId = $v.memberId;
      _approved = $v.approved;
      _comment = $v.comment;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(MembershipApproval other) {
    _$v = other as _$MembershipApproval;
  }

  @override
  void update(void Function(MembershipApprovalBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  MembershipApproval build() => _build();

  _$MembershipApproval _build() {
    final _$result = _$v ??
        _$MembershipApproval._(
          memberId: memberId,
          approved: approved,
          comment: comment,
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
