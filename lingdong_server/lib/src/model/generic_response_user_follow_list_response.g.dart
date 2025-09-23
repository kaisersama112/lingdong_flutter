// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'generic_response_user_follow_list_response.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$GenericResponseUserFollowListResponse
    extends GenericResponseUserFollowListResponse {
  @override
  final int? code;
  @override
  final String? msg;
  @override
  final UserFollowListResponse? data;

  factory _$GenericResponseUserFollowListResponse(
          [void Function(GenericResponseUserFollowListResponseBuilder)?
              updates]) =>
      (GenericResponseUserFollowListResponseBuilder()..update(updates))
          ._build();

  _$GenericResponseUserFollowListResponse._({this.code, this.msg, this.data})
      : super._();
  @override
  GenericResponseUserFollowListResponse rebuild(
          void Function(GenericResponseUserFollowListResponseBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GenericResponseUserFollowListResponseBuilder toBuilder() =>
      GenericResponseUserFollowListResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GenericResponseUserFollowListResponse &&
        code == other.code &&
        msg == other.msg &&
        data == other.data;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, code.hashCode);
    _$hash = $jc(_$hash, msg.hashCode);
    _$hash = $jc(_$hash, data.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(
            r'GenericResponseUserFollowListResponse')
          ..add('code', code)
          ..add('msg', msg)
          ..add('data', data))
        .toString();
  }
}

class GenericResponseUserFollowListResponseBuilder
    implements
        Builder<GenericResponseUserFollowListResponse,
            GenericResponseUserFollowListResponseBuilder> {
  _$GenericResponseUserFollowListResponse? _$v;

  int? _code;
  int? get code => _$this._code;
  set code(int? code) => _$this._code = code;

  String? _msg;
  String? get msg => _$this._msg;
  set msg(String? msg) => _$this._msg = msg;

  UserFollowListResponseBuilder? _data;
  UserFollowListResponseBuilder get data =>
      _$this._data ??= UserFollowListResponseBuilder();
  set data(UserFollowListResponseBuilder? data) => _$this._data = data;

  GenericResponseUserFollowListResponseBuilder() {
    GenericResponseUserFollowListResponse._defaults(this);
  }

  GenericResponseUserFollowListResponseBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _code = $v.code;
      _msg = $v.msg;
      _data = $v.data?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GenericResponseUserFollowListResponse other) {
    _$v = other as _$GenericResponseUserFollowListResponse;
  }

  @override
  void update(
      void Function(GenericResponseUserFollowListResponseBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GenericResponseUserFollowListResponse build() => _build();

  _$GenericResponseUserFollowListResponse _build() {
    _$GenericResponseUserFollowListResponse _$result;
    try {
      _$result = _$v ??
          _$GenericResponseUserFollowListResponse._(
            code: code,
            msg: msg,
            data: _data?.build(),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'data';
        _data?.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'GenericResponseUserFollowListResponse',
            _$failedField,
            e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
