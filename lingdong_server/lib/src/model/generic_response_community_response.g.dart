// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'generic_response_community_response.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$GenericResponseCommunityResponse
    extends GenericResponseCommunityResponse {
  @override
  final int? code;
  @override
  final String? msg;
  @override
  final CommunityResponse? data;

  factory _$GenericResponseCommunityResponse(
          [void Function(GenericResponseCommunityResponseBuilder)? updates]) =>
      (GenericResponseCommunityResponseBuilder()..update(updates))._build();

  _$GenericResponseCommunityResponse._({this.code, this.msg, this.data})
      : super._();
  @override
  GenericResponseCommunityResponse rebuild(
          void Function(GenericResponseCommunityResponseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GenericResponseCommunityResponseBuilder toBuilder() =>
      GenericResponseCommunityResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GenericResponseCommunityResponse &&
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
    return (newBuiltValueToStringHelper(r'GenericResponseCommunityResponse')
          ..add('code', code)
          ..add('msg', msg)
          ..add('data', data))
        .toString();
  }
}

class GenericResponseCommunityResponseBuilder
    implements
        Builder<GenericResponseCommunityResponse,
            GenericResponseCommunityResponseBuilder> {
  _$GenericResponseCommunityResponse? _$v;

  int? _code;
  int? get code => _$this._code;
  set code(int? code) => _$this._code = code;

  String? _msg;
  String? get msg => _$this._msg;
  set msg(String? msg) => _$this._msg = msg;

  CommunityResponseBuilder? _data;
  CommunityResponseBuilder get data =>
      _$this._data ??= CommunityResponseBuilder();
  set data(CommunityResponseBuilder? data) => _$this._data = data;

  GenericResponseCommunityResponseBuilder() {
    GenericResponseCommunityResponse._defaults(this);
  }

  GenericResponseCommunityResponseBuilder get _$this {
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
  void replace(GenericResponseCommunityResponse other) {
    _$v = other as _$GenericResponseCommunityResponse;
  }

  @override
  void update(void Function(GenericResponseCommunityResponseBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GenericResponseCommunityResponse build() => _build();

  _$GenericResponseCommunityResponse _build() {
    _$GenericResponseCommunityResponse _$result;
    try {
      _$result = _$v ??
          _$GenericResponseCommunityResponse._(
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
            r'GenericResponseCommunityResponse', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
