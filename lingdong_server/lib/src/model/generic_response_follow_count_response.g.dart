// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'generic_response_follow_count_response.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$GenericResponseFollowCountResponse
    extends GenericResponseFollowCountResponse {
  @override
  final int? code;
  @override
  final String? msg;
  @override
  final FollowCountResponse? data;

  factory _$GenericResponseFollowCountResponse(
          [void Function(GenericResponseFollowCountResponseBuilder)?
              updates]) =>
      (GenericResponseFollowCountResponseBuilder()..update(updates))._build();

  _$GenericResponseFollowCountResponse._({this.code, this.msg, this.data})
      : super._();
  @override
  GenericResponseFollowCountResponse rebuild(
          void Function(GenericResponseFollowCountResponseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GenericResponseFollowCountResponseBuilder toBuilder() =>
      GenericResponseFollowCountResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GenericResponseFollowCountResponse &&
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
    return (newBuiltValueToStringHelper(r'GenericResponseFollowCountResponse')
          ..add('code', code)
          ..add('msg', msg)
          ..add('data', data))
        .toString();
  }
}

class GenericResponseFollowCountResponseBuilder
    implements
        Builder<GenericResponseFollowCountResponse,
            GenericResponseFollowCountResponseBuilder> {
  _$GenericResponseFollowCountResponse? _$v;

  int? _code;
  int? get code => _$this._code;
  set code(int? code) => _$this._code = code;

  String? _msg;
  String? get msg => _$this._msg;
  set msg(String? msg) => _$this._msg = msg;

  FollowCountResponseBuilder? _data;
  FollowCountResponseBuilder get data =>
      _$this._data ??= FollowCountResponseBuilder();
  set data(FollowCountResponseBuilder? data) => _$this._data = data;

  GenericResponseFollowCountResponseBuilder() {
    GenericResponseFollowCountResponse._defaults(this);
  }

  GenericResponseFollowCountResponseBuilder get _$this {
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
  void replace(GenericResponseFollowCountResponse other) {
    _$v = other as _$GenericResponseFollowCountResponse;
  }

  @override
  void update(
      void Function(GenericResponseFollowCountResponseBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GenericResponseFollowCountResponse build() => _build();

  _$GenericResponseFollowCountResponse _build() {
    _$GenericResponseFollowCountResponse _$result;
    try {
      _$result = _$v ??
          _$GenericResponseFollowCountResponse._(
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
            r'GenericResponseFollowCountResponse', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
