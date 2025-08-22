// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'generic_response_place_response.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$GenericResponsePlaceResponse extends GenericResponsePlaceResponse {
  @override
  final int? code;
  @override
  final String? msg;
  @override
  final PlaceResponse? data;

  factory _$GenericResponsePlaceResponse(
          [void Function(GenericResponsePlaceResponseBuilder)? updates]) =>
      (GenericResponsePlaceResponseBuilder()..update(updates))._build();

  _$GenericResponsePlaceResponse._({this.code, this.msg, this.data})
      : super._();
  @override
  GenericResponsePlaceResponse rebuild(
          void Function(GenericResponsePlaceResponseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GenericResponsePlaceResponseBuilder toBuilder() =>
      GenericResponsePlaceResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GenericResponsePlaceResponse &&
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
    return (newBuiltValueToStringHelper(r'GenericResponsePlaceResponse')
          ..add('code', code)
          ..add('msg', msg)
          ..add('data', data))
        .toString();
  }
}

class GenericResponsePlaceResponseBuilder
    implements
        Builder<GenericResponsePlaceResponse,
            GenericResponsePlaceResponseBuilder> {
  _$GenericResponsePlaceResponse? _$v;

  int? _code;
  int? get code => _$this._code;
  set code(int? code) => _$this._code = code;

  String? _msg;
  String? get msg => _$this._msg;
  set msg(String? msg) => _$this._msg = msg;

  PlaceResponseBuilder? _data;
  PlaceResponseBuilder get data => _$this._data ??= PlaceResponseBuilder();
  set data(PlaceResponseBuilder? data) => _$this._data = data;

  GenericResponsePlaceResponseBuilder() {
    GenericResponsePlaceResponse._defaults(this);
  }

  GenericResponsePlaceResponseBuilder get _$this {
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
  void replace(GenericResponsePlaceResponse other) {
    _$v = other as _$GenericResponsePlaceResponse;
  }

  @override
  void update(void Function(GenericResponsePlaceResponseBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GenericResponsePlaceResponse build() => _build();

  _$GenericResponsePlaceResponse _build() {
    _$GenericResponsePlaceResponse _$result;
    try {
      _$result = _$v ??
          _$GenericResponsePlaceResponse._(
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
            r'GenericResponsePlaceResponse', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
