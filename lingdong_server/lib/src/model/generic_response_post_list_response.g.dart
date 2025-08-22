// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'generic_response_post_list_response.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$GenericResponsePostListResponse
    extends GenericResponsePostListResponse {
  @override
  final int? code;
  @override
  final String? msg;
  @override
  final PostListResponse? data;

  factory _$GenericResponsePostListResponse(
          [void Function(GenericResponsePostListResponseBuilder)? updates]) =>
      (GenericResponsePostListResponseBuilder()..update(updates))._build();

  _$GenericResponsePostListResponse._({this.code, this.msg, this.data})
      : super._();
  @override
  GenericResponsePostListResponse rebuild(
          void Function(GenericResponsePostListResponseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GenericResponsePostListResponseBuilder toBuilder() =>
      GenericResponsePostListResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GenericResponsePostListResponse &&
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
    return (newBuiltValueToStringHelper(r'GenericResponsePostListResponse')
          ..add('code', code)
          ..add('msg', msg)
          ..add('data', data))
        .toString();
  }
}

class GenericResponsePostListResponseBuilder
    implements
        Builder<GenericResponsePostListResponse,
            GenericResponsePostListResponseBuilder> {
  _$GenericResponsePostListResponse? _$v;

  int? _code;
  int? get code => _$this._code;
  set code(int? code) => _$this._code = code;

  String? _msg;
  String? get msg => _$this._msg;
  set msg(String? msg) => _$this._msg = msg;

  PostListResponseBuilder? _data;
  PostListResponseBuilder get data =>
      _$this._data ??= PostListResponseBuilder();
  set data(PostListResponseBuilder? data) => _$this._data = data;

  GenericResponsePostListResponseBuilder() {
    GenericResponsePostListResponse._defaults(this);
  }

  GenericResponsePostListResponseBuilder get _$this {
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
  void replace(GenericResponsePostListResponse other) {
    _$v = other as _$GenericResponsePostListResponse;
  }

  @override
  void update(void Function(GenericResponsePostListResponseBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GenericResponsePostListResponse build() => _build();

  _$GenericResponsePostListResponse _build() {
    _$GenericResponsePostListResponse _$result;
    try {
      _$result = _$v ??
          _$GenericResponsePostListResponse._(
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
            r'GenericResponsePostListResponse', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
