// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'follow_status_response.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$FollowStatusResponse extends FollowStatusResponse {
  @override
  final bool isFollowing;
  @override
  final int followingId;

  factory _$FollowStatusResponse(
          [void Function(FollowStatusResponseBuilder)? updates]) =>
      (FollowStatusResponseBuilder()..update(updates))._build();

  _$FollowStatusResponse._(
      {required this.isFollowing, required this.followingId})
      : super._();
  @override
  FollowStatusResponse rebuild(
          void Function(FollowStatusResponseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  FollowStatusResponseBuilder toBuilder() =>
      FollowStatusResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is FollowStatusResponse &&
        isFollowing == other.isFollowing &&
        followingId == other.followingId;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, isFollowing.hashCode);
    _$hash = $jc(_$hash, followingId.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'FollowStatusResponse')
          ..add('isFollowing', isFollowing)
          ..add('followingId', followingId))
        .toString();
  }
}

class FollowStatusResponseBuilder
    implements Builder<FollowStatusResponse, FollowStatusResponseBuilder> {
  _$FollowStatusResponse? _$v;

  bool? _isFollowing;
  bool? get isFollowing => _$this._isFollowing;
  set isFollowing(bool? isFollowing) => _$this._isFollowing = isFollowing;

  int? _followingId;
  int? get followingId => _$this._followingId;
  set followingId(int? followingId) => _$this._followingId = followingId;

  FollowStatusResponseBuilder() {
    FollowStatusResponse._defaults(this);
  }

  FollowStatusResponseBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _isFollowing = $v.isFollowing;
      _followingId = $v.followingId;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(FollowStatusResponse other) {
    _$v = other as _$FollowStatusResponse;
  }

  @override
  void update(void Function(FollowStatusResponseBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  FollowStatusResponse build() => _build();

  _$FollowStatusResponse _build() {
    final _$result = _$v ??
        _$FollowStatusResponse._(
          isFollowing: BuiltValueNullFieldError.checkNotNull(
              isFollowing, r'FollowStatusResponse', 'isFollowing'),
          followingId: BuiltValueNullFieldError.checkNotNull(
              followingId, r'FollowStatusResponse', 'followingId'),
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
