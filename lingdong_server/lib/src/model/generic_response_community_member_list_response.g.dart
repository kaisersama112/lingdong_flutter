// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'generic_response_community_member_list_response.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$GenericResponseCommunityMemberListResponse
    extends GenericResponseCommunityMemberListResponse {
  @override
  final int? code;
  @override
  final String? msg;
  @override
  final CommunityMemberListResponse? data;

  factory _$GenericResponseCommunityMemberListResponse(
          [void Function(GenericResponseCommunityMemberListResponseBuilder)?
              updates]) =>
      (GenericResponseCommunityMemberListResponseBuilder()..update(updates))
          ._build();

  _$GenericResponseCommunityMemberListResponse._(
      {this.code, this.msg, this.data})
      : super._();
  @override
  GenericResponseCommunityMemberListResponse rebuild(
          void Function(GenericResponseCommunityMemberListResponseBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GenericResponseCommunityMemberListResponseBuilder toBuilder() =>
      GenericResponseCommunityMemberListResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GenericResponseCommunityMemberListResponse &&
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
            r'GenericResponseCommunityMemberListResponse')
          ..add('code', code)
          ..add('msg', msg)
          ..add('data', data))
        .toString();
  }
}

class GenericResponseCommunityMemberListResponseBuilder
    implements
        Builder<GenericResponseCommunityMemberListResponse,
            GenericResponseCommunityMemberListResponseBuilder> {
  _$GenericResponseCommunityMemberListResponse? _$v;

  int? _code;
  int? get code => _$this._code;
  set code(int? code) => _$this._code = code;

  String? _msg;
  String? get msg => _$this._msg;
  set msg(String? msg) => _$this._msg = msg;

  CommunityMemberListResponseBuilder? _data;
  CommunityMemberListResponseBuilder get data =>
      _$this._data ??= CommunityMemberListResponseBuilder();
  set data(CommunityMemberListResponseBuilder? data) => _$this._data = data;

  GenericResponseCommunityMemberListResponseBuilder() {
    GenericResponseCommunityMemberListResponse._defaults(this);
  }

  GenericResponseCommunityMemberListResponseBuilder get _$this {
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
  void replace(GenericResponseCommunityMemberListResponse other) {
    _$v = other as _$GenericResponseCommunityMemberListResponse;
  }

  @override
  void update(
      void Function(GenericResponseCommunityMemberListResponseBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  GenericResponseCommunityMemberListResponse build() => _build();

  _$GenericResponseCommunityMemberListResponse _build() {
    _$GenericResponseCommunityMemberListResponse _$result;
    try {
      _$result = _$v ??
          _$GenericResponseCommunityMemberListResponse._(
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
            r'GenericResponseCommunityMemberListResponse',
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
