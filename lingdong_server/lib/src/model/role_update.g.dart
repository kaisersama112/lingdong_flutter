// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'role_update.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$RoleUpdate extends RoleUpdate {
  @override
  final int? memberId;
  @override
  final int? newRole;

  factory _$RoleUpdate([void Function(RoleUpdateBuilder)? updates]) =>
      (RoleUpdateBuilder()..update(updates))._build();

  _$RoleUpdate._({this.memberId, this.newRole}) : super._();
  @override
  RoleUpdate rebuild(void Function(RoleUpdateBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  RoleUpdateBuilder toBuilder() => RoleUpdateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is RoleUpdate &&
        memberId == other.memberId &&
        newRole == other.newRole;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, memberId.hashCode);
    _$hash = $jc(_$hash, newRole.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'RoleUpdate')
          ..add('memberId', memberId)
          ..add('newRole', newRole))
        .toString();
  }
}

class RoleUpdateBuilder implements Builder<RoleUpdate, RoleUpdateBuilder> {
  _$RoleUpdate? _$v;

  int? _memberId;
  int? get memberId => _$this._memberId;
  set memberId(int? memberId) => _$this._memberId = memberId;

  int? _newRole;
  int? get newRole => _$this._newRole;
  set newRole(int? newRole) => _$this._newRole = newRole;

  RoleUpdateBuilder() {
    RoleUpdate._defaults(this);
  }

  RoleUpdateBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _memberId = $v.memberId;
      _newRole = $v.newRole;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(RoleUpdate other) {
    _$v = other as _$RoleUpdate;
  }

  @override
  void update(void Function(RoleUpdateBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  RoleUpdate build() => _build();

  _$RoleUpdate _build() {
    final _$result = _$v ??
        _$RoleUpdate._(
          memberId: memberId,
          newRole: newRole,
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
