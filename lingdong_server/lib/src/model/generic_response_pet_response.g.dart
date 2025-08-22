// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'generic_response_pet_response.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$GenericResponsePetResponse extends GenericResponsePetResponse {
  @override
  final int? code;
  @override
  final String? msg;
  @override
  final PetResponse? data;

  factory _$GenericResponsePetResponse(
          [void Function(GenericResponsePetResponseBuilder)? updates]) =>
      (GenericResponsePetResponseBuilder()..update(updates))._build();

  _$GenericResponsePetResponse._({this.code, this.msg, this.data}) : super._();
  @override
  GenericResponsePetResponse rebuild(
          void Function(GenericResponsePetResponseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GenericResponsePetResponseBuilder toBuilder() =>
      GenericResponsePetResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GenericResponsePetResponse &&
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
    return (newBuiltValueToStringHelper(r'GenericResponsePetResponse')
          ..add('code', code)
          ..add('msg', msg)
          ..add('data', data))
        .toString();
  }
}

class GenericResponsePetResponseBuilder
    implements
        Builder<GenericResponsePetResponse, GenericResponsePetResponseBuilder> {
  _$GenericResponsePetResponse? _$v;

  int? _code;
  int? get code => _$this._code;
  set code(int? code) => _$this._code = code;

  String? _msg;
  String? get msg => _$this._msg;
  set msg(String? msg) => _$this._msg = msg;

  PetResponseBuilder? _data;
  PetResponseBuilder get data => _$this._data ??= PetResponseBuilder();
  set data(PetResponseBuilder? data) => _$this._data = data;

  GenericResponsePetResponseBuilder() {
    GenericResponsePetResponse._defaults(this);
  }

  GenericResponsePetResponseBuilder get _$this {
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
  void replace(GenericResponsePetResponse other) {
    _$v = other as _$GenericResponsePetResponse;
  }

  @override
  void update(void Function(GenericResponsePetResponseBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GenericResponsePetResponse build() => _build();

  _$GenericResponsePetResponse _build() {
    _$GenericResponsePetResponse _$result;
    try {
      _$result = _$v ??
          _$GenericResponsePetResponse._(
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
            r'GenericResponsePetResponse', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
