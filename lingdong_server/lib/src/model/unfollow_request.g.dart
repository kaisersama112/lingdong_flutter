// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'unfollow_request.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$UnfollowRequest extends UnfollowRequest {
  @override
  final int followingId;

  factory _$UnfollowRequest([void Function(UnfollowRequestBuilder)? updates]) =>
      (UnfollowRequestBuilder()..update(updates))._build();

  _$UnfollowRequest._({required this.followingId}) : super._();
  @override
  UnfollowRequest rebuild(void Function(UnfollowRequestBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  UnfollowRequestBuilder toBuilder() => UnfollowRequestBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UnfollowRequest && followingId == other.followingId;
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
    return (newBuiltValueToStringHelper(r'UnfollowRequest')
          ..add('followingId', followingId))
        .toString();
  }
}

class UnfollowRequestBuilder
    implements Builder<UnfollowRequest, UnfollowRequestBuilder> {
  _$UnfollowRequest? _$v;

  int? _followingId;
  int? get followingId => _$this._followingId;
  set followingId(int? followingId) => _$this._followingId = followingId;

  UnfollowRequestBuilder() {
    UnfollowRequest._defaults(this);
  }

  UnfollowRequestBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _followingId = $v.followingId;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(UnfollowRequest other) {
    _$v = other as _$UnfollowRequest;
  }

  @override
  void update(void Function(UnfollowRequestBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  UnfollowRequest build() => _build();

  _$UnfollowRequest _build() {
    final _$result = _$v ??
        _$UnfollowRequest._(
          followingId: BuiltValueNullFieldError.checkNotNull(
              followingId, r'UnfollowRequest', 'followingId'),
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
