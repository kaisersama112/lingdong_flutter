// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'generic_response_dog_age_stage_out.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$GenericResponseDogAgeStageOut extends GenericResponseDogAgeStageOut {
  @override
  final int? code;
  @override
  final String? msg;
  @override
  final DogAgeStageOut? data;

  factory _$GenericResponseDogAgeStageOut(
          [void Function(GenericResponseDogAgeStageOutBuilder)? updates]) =>
      (GenericResponseDogAgeStageOutBuilder()..update(updates))._build();

  _$GenericResponseDogAgeStageOut._({this.code, this.msg, this.data})
      : super._();
  @override
  GenericResponseDogAgeStageOut rebuild(
          void Function(GenericResponseDogAgeStageOutBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GenericResponseDogAgeStageOutBuilder toBuilder() =>
      GenericResponseDogAgeStageOutBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GenericResponseDogAgeStageOut &&
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
    return (newBuiltValueToStringHelper(r'GenericResponseDogAgeStageOut')
          ..add('code', code)
          ..add('msg', msg)
          ..add('data', data))
        .toString();
  }
}

class GenericResponseDogAgeStageOutBuilder
    implements
        Builder<GenericResponseDogAgeStageOut,
            GenericResponseDogAgeStageOutBuilder> {
  _$GenericResponseDogAgeStageOut? _$v;

  int? _code;
  int? get code => _$this._code;
  set code(int? code) => _$this._code = code;

  String? _msg;
  String? get msg => _$this._msg;
  set msg(String? msg) => _$this._msg = msg;

  DogAgeStageOutBuilder? _data;
  DogAgeStageOutBuilder get data => _$this._data ??= DogAgeStageOutBuilder();
  set data(DogAgeStageOutBuilder? data) => _$this._data = data;

  GenericResponseDogAgeStageOutBuilder() {
    GenericResponseDogAgeStageOut._defaults(this);
  }

  GenericResponseDogAgeStageOutBuilder get _$this {
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
  void replace(GenericResponseDogAgeStageOut other) {
    _$v = other as _$GenericResponseDogAgeStageOut;
  }

  @override
  void update(void Function(GenericResponseDogAgeStageOutBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GenericResponseDogAgeStageOut build() => _build();

  _$GenericResponseDogAgeStageOut _build() {
    _$GenericResponseDogAgeStageOut _$result;
    try {
      _$result = _$v ??
          _$GenericResponseDogAgeStageOut._(
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
            r'GenericResponseDogAgeStageOut', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
