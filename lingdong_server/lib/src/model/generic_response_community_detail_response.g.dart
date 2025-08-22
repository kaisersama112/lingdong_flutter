// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'generic_response_community_detail_response.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$GenericResponseCommunityDetailResponse
    extends GenericResponseCommunityDetailResponse {
  @override
  final int? code;
  @override
  final String? msg;
  @override
  final CommunityDetailResponse? data;

  factory _$GenericResponseCommunityDetailResponse(
          [void Function(GenericResponseCommunityDetailResponseBuilder)?
              updates]) =>
      (GenericResponseCommunityDetailResponseBuilder()..update(updates))
          ._build();

  _$GenericResponseCommunityDetailResponse._({this.code, this.msg, this.data})
      : super._();
  @override
  GenericResponseCommunityDetailResponse rebuild(
          void Function(GenericResponseCommunityDetailResponseBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GenericResponseCommunityDetailResponseBuilder toBuilder() =>
      GenericResponseCommunityDetailResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GenericResponseCommunityDetailResponse &&
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
            r'GenericResponseCommunityDetailResponse')
          ..add('code', code)
          ..add('msg', msg)
          ..add('data', data))
        .toString();
  }
}

class GenericResponseCommunityDetailResponseBuilder
    implements
        Builder<GenericResponseCommunityDetailResponse,
            GenericResponseCommunityDetailResponseBuilder> {
  _$GenericResponseCommunityDetailResponse? _$v;

  int? _code;
  int? get code => _$this._code;
  set code(int? code) => _$this._code = code;

  String? _msg;
  String? get msg => _$this._msg;
  set msg(String? msg) => _$this._msg = msg;

  CommunityDetailResponseBuilder? _data;
  CommunityDetailResponseBuilder get data =>
      _$this._data ??= CommunityDetailResponseBuilder();
  set data(CommunityDetailResponseBuilder? data) => _$this._data = data;

  GenericResponseCommunityDetailResponseBuilder() {
    GenericResponseCommunityDetailResponse._defaults(this);
  }

  GenericResponseCommunityDetailResponseBuilder get _$this {
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
  void replace(GenericResponseCommunityDetailResponse other) {
    _$v = other as _$GenericResponseCommunityDetailResponse;
  }

  @override
  void update(
      void Function(GenericResponseCommunityDetailResponseBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GenericResponseCommunityDetailResponse build() => _build();

  _$GenericResponseCommunityDetailResponse _build() {
    _$GenericResponseCommunityDetailResponse _$result;
    try {
      _$result = _$v ??
          _$GenericResponseCommunityDetailResponse._(
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
            r'GenericResponseCommunityDetailResponse',
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
