// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'generic_response_dog_breed_out.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$GenericResponseDogBreedOut extends GenericResponseDogBreedOut {
  @override
  final int? code;
  @override
  final String? msg;
  @override
  final DogBreedOut? data;

  factory _$GenericResponseDogBreedOut(
          [void Function(GenericResponseDogBreedOutBuilder)? updates]) =>
      (GenericResponseDogBreedOutBuilder()..update(updates))._build();

  _$GenericResponseDogBreedOut._({this.code, this.msg, this.data}) : super._();
  @override
  GenericResponseDogBreedOut rebuild(
          void Function(GenericResponseDogBreedOutBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GenericResponseDogBreedOutBuilder toBuilder() =>
      GenericResponseDogBreedOutBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GenericResponseDogBreedOut &&
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
    return (newBuiltValueToStringHelper(r'GenericResponseDogBreedOut')
          ..add('code', code)
          ..add('msg', msg)
          ..add('data', data))
        .toString();
  }
}

class GenericResponseDogBreedOutBuilder
    implements
        Builder<GenericResponseDogBreedOut, GenericResponseDogBreedOutBuilder> {
  _$GenericResponseDogBreedOut? _$v;

  int? _code;
  int? get code => _$this._code;
  set code(int? code) => _$this._code = code;

  String? _msg;
  String? get msg => _$this._msg;
  set msg(String? msg) => _$this._msg = msg;

  DogBreedOutBuilder? _data;
  DogBreedOutBuilder get data => _$this._data ??= DogBreedOutBuilder();
  set data(DogBreedOutBuilder? data) => _$this._data = data;

  GenericResponseDogBreedOutBuilder() {
    GenericResponseDogBreedOut._defaults(this);
  }

  GenericResponseDogBreedOutBuilder get _$this {
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
  void replace(GenericResponseDogBreedOut other) {
    _$v = other as _$GenericResponseDogBreedOut;
  }

  @override
  void update(void Function(GenericResponseDogBreedOutBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GenericResponseDogBreedOut build() => _build();

  _$GenericResponseDogBreedOut _build() {
    _$GenericResponseDogBreedOut _$result;
    try {
      _$result = _$v ??
          _$GenericResponseDogBreedOut._(
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
            r'GenericResponseDogBreedOut', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
