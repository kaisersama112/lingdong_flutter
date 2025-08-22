// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'generic_response_community_list_response.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$GenericResponseCommunityListResponse
    extends GenericResponseCommunityListResponse {
  @override
  final int? code;
  @override
  final String? msg;
  @override
  final CommunityListResponse? data;

  factory _$GenericResponseCommunityListResponse(
          [void Function(GenericResponseCommunityListResponseBuilder)?
              updates]) =>
      (GenericResponseCommunityListResponseBuilder()..update(updates))._build();

  _$GenericResponseCommunityListResponse._({this.code, this.msg, this.data})
      : super._();
  @override
  GenericResponseCommunityListResponse rebuild(
          void Function(GenericResponseCommunityListResponseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GenericResponseCommunityListResponseBuilder toBuilder() =>
      GenericResponseCommunityListResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GenericResponseCommunityListResponse &&
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
    return (newBuiltValueToStringHelper(r'GenericResponseCommunityListResponse')
          ..add('code', code)
          ..add('msg', msg)
          ..add('data', data))
        .toString();
  }
}

class GenericResponseCommunityListResponseBuilder
    implements
        Builder<GenericResponseCommunityListResponse,
            GenericResponseCommunityListResponseBuilder> {
  _$GenericResponseCommunityListResponse? _$v;

  int? _code;
  int? get code => _$this._code;
  set code(int? code) => _$this._code = code;

  String? _msg;
  String? get msg => _$this._msg;
  set msg(String? msg) => _$this._msg = msg;

  CommunityListResponseBuilder? _data;
  CommunityListResponseBuilder get data =>
      _$this._data ??= CommunityListResponseBuilder();
  set data(CommunityListResponseBuilder? data) => _$this._data = data;

  GenericResponseCommunityListResponseBuilder() {
    GenericResponseCommunityListResponse._defaults(this);
  }

  GenericResponseCommunityListResponseBuilder get _$this {
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
  void replace(GenericResponseCommunityListResponse other) {
    _$v = other as _$GenericResponseCommunityListResponse;
  }

  @override
  void update(
      void Function(GenericResponseCommunityListResponseBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GenericResponseCommunityListResponse build() => _build();

  _$GenericResponseCommunityListResponse _build() {
    _$GenericResponseCommunityListResponse _$result;
    try {
      _$result = _$v ??
          _$GenericResponseCommunityListResponse._(
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
            r'GenericResponseCommunityListResponse',
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
