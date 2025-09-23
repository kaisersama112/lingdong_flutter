// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'follow_request.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$FollowRequest extends FollowRequest {
  @override
  final int followingId;

  factory _$FollowRequest([void Function(FollowRequestBuilder)? updates]) =>
      (FollowRequestBuilder()..update(updates))._build();

  _$FollowRequest._({required this.followingId}) : super._();
  @override
  FollowRequest rebuild(void Function(FollowRequestBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  FollowRequestBuilder toBuilder() => FollowRequestBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is FollowRequest && followingId == other.followingId;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, followingId.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'FollowRequest')
          ..add('followingId', followingId))
        .toString();
  }
}

class FollowRequestBuilder
    implements Builder<FollowRequest, FollowRequestBuilder> {
  _$FollowRequest? _$v;

  int? _followingId;
  int? get followingId => _$this._followingId;
  set followingId(int? followingId) => _$this._followingId = followingId;

  FollowRequestBuilder() {
    FollowRequest._defaults(this);
  }

  FollowRequestBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _followingId = $v.followingId;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(FollowRequest other) {
    _$v = other as _$FollowRequest;
  }

  @override
  void update(void Function(FollowRequestBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  FollowRequest build() => _build();

  _$FollowRequest _build() {
    final _$result = _$v ??
        _$FollowRequest._(
          followingId: BuiltValueNullFieldError.checkNotNull(
              followingId, r'FollowRequest', 'followingId'),
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
