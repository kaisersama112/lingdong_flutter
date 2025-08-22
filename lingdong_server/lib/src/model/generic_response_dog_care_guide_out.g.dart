// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'generic_response_dog_care_guide_out.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$GenericResponseDogCareGuideOut extends GenericResponseDogCareGuideOut {
  @override
  final int? code;
  @override
  final String? msg;
  @override
  final DogCareGuideOut? data;

  factory _$GenericResponseDogCareGuideOut(
          [void Function(GenericResponseDogCareGuideOutBuilder)? updates]) =>
      (GenericResponseDogCareGuideOutBuilder()..update(updates))._build();

  _$GenericResponseDogCareGuideOut._({this.code, this.msg, this.data})
      : super._();
  @override
  GenericResponseDogCareGuideOut rebuild(
          void Function(GenericResponseDogCareGuideOutBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GenericResponseDogCareGuideOutBuilder toBuilder() =>
      GenericResponseDogCareGuideOutBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GenericResponseDogCareGuideOut &&
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
    return (newBuiltValueToStringHelper(r'GenericResponseDogCareGuideOut')
          ..add('code', code)
          ..add('msg', msg)
          ..add('data', data))
        .toString();
  }
}

class GenericResponseDogCareGuideOutBuilder
    implements
        Builder<GenericResponseDogCareGuideOut,
            GenericResponseDogCareGuideOutBuilder> {
  _$GenericResponseDogCareGuideOut? _$v;

  int? _code;
  int? get code => _$this._code;
  set code(int? code) => _$this._code = code;

  String? _msg;
  String? get msg => _$this._msg;
  set msg(String? msg) => _$this._msg = msg;

  DogCareGuideOutBuilder? _data;
  DogCareGuideOutBuilder get data => _$this._data ??= DogCareGuideOutBuilder();
  set data(DogCareGuideOutBuilder? data) => _$this._data = data;

  GenericResponseDogCareGuideOutBuilder() {
    GenericResponseDogCareGuideOut._defaults(this);
  }

  GenericResponseDogCareGuideOutBuilder get _$this {
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
  void replace(GenericResponseDogCareGuideOut other) {
    _$v = other as _$GenericResponseDogCareGuideOut;
  }

  @override
  void update(void Function(GenericResponseDogCareGuideOutBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GenericResponseDogCareGuideOut build() => _build();

  _$GenericResponseDogCareGuideOut _build() {
    _$GenericResponseDogCareGuideOut _$result;
    try {
      _$result = _$v ??
          _$GenericResponseDogCareGuideOut._(
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
            r'GenericResponseDogCareGuideOut', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
