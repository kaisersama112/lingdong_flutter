// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'follow_count_response.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$FollowCountResponse extends FollowCountResponse {
  @override
  final int followingCount;
  @override
  final int followersCount;

  factory _$FollowCountResponse(
          [void Function(FollowCountResponseBuilder)? updates]) =>
      (FollowCountResponseBuilder()..update(updates))._build();

  _$FollowCountResponse._(
      {required this.followingCount, required this.followersCount})
      : super._();
  @override
  FollowCountResponse rebuild(
          void Function(FollowCountResponseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  FollowCountResponseBuilder toBuilder() =>
      FollowCountResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is FollowCountResponse &&
        followingCount == other.followingCount &&
        followersCount == other.followersCount;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, followingCount.hashCode);
    _$hash = $jc(_$hash, followersCount.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'FollowCountResponse')
          ..add('followingCount', followingCount)
          ..add('followersCount', followersCount))
        .toString();
  }
}

class FollowCountResponseBuilder
    implements Builder<FollowCountResponse, FollowCountResponseBuilder> {
  _$FollowCountResponse? _$v;

  int? _followingCount;
  int? get followingCount => _$this._followingCount;
  set followingCount(int? followingCount) =>
      _$this._followingCount = followingCount;

  int? _followersCount;
  int? get followersCount => _$this._followersCount;
  set followersCount(int? followersCount) =>
      _$this._followersCount = followersCount;

  FollowCountResponseBuilder() {
    FollowCountResponse._defaults(this);
  }

  FollowCountResponseBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _followingCount = $v.followingCount;
      _followersCount = $v.followersCount;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(FollowCountResponse other) {
    _$v = other as _$FollowCountResponse;
  }

  @override
  void update(void Function(FollowCountResponseBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  FollowCountResponse build() => _build();

  _$FollowCountResponse _build() {
    final _$result = _$v ??
        _$FollowCountResponse._(
          followingCount: BuiltValueNullFieldError.checkNotNull(
              followingCount, r'FollowCountResponse', 'followingCount'),
          followersCount: BuiltValueNullFieldError.checkNotNull(
              followersCount, r'FollowCountResponse', 'followersCount'),
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
