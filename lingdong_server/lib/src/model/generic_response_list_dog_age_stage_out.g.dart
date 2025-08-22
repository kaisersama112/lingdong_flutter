// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'generic_response_list_dog_age_stage_out.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$GenericResponseListDogAgeStageOut
    extends GenericResponseListDogAgeStageOut {
  @override
  final int? code;
  @override
  final String? msg;
  @override
  final BuiltList<DogAgeStageOut>? data;

  factory _$GenericResponseListDogAgeStageOut(
          [void Function(GenericResponseListDogAgeStageOutBuilder)? updates]) =>
      (GenericResponseListDogAgeStageOutBuilder()..update(updates))._build();

  _$GenericResponseListDogAgeStageOut._({this.code, this.msg, this.data})
      : super._();
  @override
  GenericResponseListDogAgeStageOut rebuild(
          void Function(GenericResponseListDogAgeStageOutBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GenericResponseListDogAgeStageOutBuilder toBuilder() =>
      GenericResponseListDogAgeStageOutBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GenericResponseListDogAgeStageOut &&
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
    return (newBuiltValueToStringHelper(r'GenericResponseListDogAgeStageOut')
          ..add('code', code)
          ..add('msg', msg)
          ..add('data', data))
        .toString();
  }
}

class GenericResponseListDogAgeStageOutBuilder
    implements
        Builder<GenericResponseListDogAgeStageOut,
            GenericResponseListDogAgeStageOutBuilder> {
  _$GenericResponseListDogAgeStageOut? _$v;

  int? _code;
  int? get code => _$this._code;
  set code(int? code) => _$this._code = code;

  String? _msg;
  String? get msg => _$this._msg;
  set msg(String? msg) => _$this._msg = msg;

  ListBuilder<DogAgeStageOut>? _data;
  ListBuilder<DogAgeStageOut> get data =>
      _$this._data ??= ListBuilder<DogAgeStageOut>();
  set data(ListBuilder<DogAgeStageOut>? data) => _$this._data = data;

  GenericResponseListDogAgeStageOutBuilder() {
    GenericResponseListDogAgeStageOut._defaults(this);
  }

  GenericResponseListDogAgeStageOutBuilder get _$this {
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
  void replace(GenericResponseListDogAgeStageOut other) {
    _$v = other as _$GenericResponseListDogAgeStageOut;
  }

  @override
  void update(
      void Function(GenericResponseListDogAgeStageOutBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GenericResponseListDogAgeStageOut build() => _build();

  _$GenericResponseListDogAgeStageOut _build() {
    _$GenericResponseListDogAgeStageOut _$result;
    try {
      _$result = _$v ??
          _$GenericResponseListDogAgeStageOut._(
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
            r'GenericResponseListDogAgeStageOut', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
