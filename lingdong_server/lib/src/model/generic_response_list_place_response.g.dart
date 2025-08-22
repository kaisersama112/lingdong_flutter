// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'generic_response_list_place_response.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$GenericResponseListPlaceResponse
    extends GenericResponseListPlaceResponse {
  @override
  final int? code;
  @override
  final String? msg;
  @override
  final BuiltList<PlaceResponse>? data;

  factory _$GenericResponseListPlaceResponse(
          [void Function(GenericResponseListPlaceResponseBuilder)? updates]) =>
      (GenericResponseListPlaceResponseBuilder()..update(updates))._build();

  _$GenericResponseListPlaceResponse._({this.code, this.msg, this.data})
      : super._();
  @override
  GenericResponseListPlaceResponse rebuild(
          void Function(GenericResponseListPlaceResponseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GenericResponseListPlaceResponseBuilder toBuilder() =>
      GenericResponseListPlaceResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GenericResponseListPlaceResponse &&
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
    return (newBuiltValueToStringHelper(r'GenericResponseListPlaceResponse')
          ..add('code', code)
          ..add('msg', msg)
          ..add('data', data))
        .toString();
  }
}

class GenericResponseListPlaceResponseBuilder
    implements
        Builder<GenericResponseListPlaceResponse,
            GenericResponseListPlaceResponseBuilder> {
  _$GenericResponseListPlaceResponse? _$v;

  int? _code;
  int? get code => _$this._code;
  set code(int? code) => _$this._code = code;

  String? _msg;
  String? get msg => _$this._msg;
  set msg(String? msg) => _$this._msg = msg;

  ListBuilder<PlaceResponse>? _data;
  ListBuilder<PlaceResponse> get data =>
      _$this._data ??= ListBuilder<PlaceResponse>();
  set data(ListBuilder<PlaceResponse>? data) => _$this._data = data;

  GenericResponseListPlaceResponseBuilder() {
    GenericResponseListPlaceResponse._defaults(this);
  }

  GenericResponseListPlaceResponseBuilder get _$this {
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
  void replace(GenericResponseListPlaceResponse other) {
    _$v = other as _$GenericResponseListPlaceResponse;
  }

  @override
  void update(void Function(GenericResponseListPlaceResponseBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GenericResponseListPlaceResponse build() => _build();

  _$GenericResponseListPlaceResponse _build() {
    _$GenericResponseListPlaceResponse _$result;
    try {
      _$result = _$v ??
          _$GenericResponseListPlaceResponse._(
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
            r'GenericResponseListPlaceResponse', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
