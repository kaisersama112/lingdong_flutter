// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'generic_response_dog_breed_list_response.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$GenericResponseDogBreedListResponse
    extends GenericResponseDogBreedListResponse {
  @override
  final int? code;
  @override
  final String? msg;
  @override
  final DogBreedListResponse? data;

  factory _$GenericResponseDogBreedListResponse(
          [void Function(GenericResponseDogBreedListResponseBuilder)?
              updates]) =>
      (GenericResponseDogBreedListResponseBuilder()..update(updates))._build();

  _$GenericResponseDogBreedListResponse._({this.code, this.msg, this.data})
      : super._();
  @override
  GenericResponseDogBreedListResponse rebuild(
          void Function(GenericResponseDogBreedListResponseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GenericResponseDogBreedListResponseBuilder toBuilder() =>
      GenericResponseDogBreedListResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GenericResponseDogBreedListResponse &&
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
    return (newBuiltValueToStringHelper(r'GenericResponseDogBreedListResponse')
          ..add('code', code)
          ..add('msg', msg)
          ..add('data', data))
        .toString();
  }
}

class GenericResponseDogBreedListResponseBuilder
    implements
        Builder<GenericResponseDogBreedListResponse,
            GenericResponseDogBreedListResponseBuilder> {
  _$GenericResponseDogBreedListResponse? _$v;

  int? _code;
  int? get code => _$this._code;
  set code(int? code) => _$this._code = code;

  String? _msg;
  String? get msg => _$this._msg;
  set msg(String? msg) => _$this._msg = msg;

  DogBreedListResponseBuilder? _data;
  DogBreedListResponseBuilder get data =>
      _$this._data ??= DogBreedListResponseBuilder();
  set data(DogBreedListResponseBuilder? data) => _$this._data = data;

  GenericResponseDogBreedListResponseBuilder() {
    GenericResponseDogBreedListResponse._defaults(this);
  }

  GenericResponseDogBreedListResponseBuilder get _$this {
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
  void replace(GenericResponseDogBreedListResponse other) {
    _$v = other as _$GenericResponseDogBreedListResponse;
  }

  @override
  void update(
      void Function(GenericResponseDogBreedListResponseBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GenericResponseDogBreedListResponse build() => _build();

  _$GenericResponseDogBreedListResponse _build() {
    _$GenericResponseDogBreedListResponse _$result;
    try {
      _$result = _$v ??
          _$GenericResponseDogBreedListResponse._(
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
        throw BuiltValueNestedFieldError(r'GenericResponseDogBreedListResponse',
            _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
