// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'generic_response_dog_behavior_guide_out.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$GenericResponseDogBehaviorGuideOut
    extends GenericResponseDogBehaviorGuideOut {
  @override
  final int? code;
  @override
  final String? msg;
  @override
  final DogBehaviorGuideOut? data;

  factory _$GenericResponseDogBehaviorGuideOut(
          [void Function(GenericResponseDogBehaviorGuideOutBuilder)?
              updates]) =>
      (GenericResponseDogBehaviorGuideOutBuilder()..update(updates))._build();

  _$GenericResponseDogBehaviorGuideOut._({this.code, this.msg, this.data})
      : super._();
  @override
  GenericResponseDogBehaviorGuideOut rebuild(
          void Function(GenericResponseDogBehaviorGuideOutBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GenericResponseDogBehaviorGuideOutBuilder toBuilder() =>
      GenericResponseDogBehaviorGuideOutBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GenericResponseDogBehaviorGuideOut &&
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
    return (newBuiltValueToStringHelper(r'GenericResponseDogBehaviorGuideOut')
          ..add('code', code)
          ..add('msg', msg)
          ..add('data', data))
        .toString();
  }
}

class GenericResponseDogBehaviorGuideOutBuilder
    implements
        Builder<GenericResponseDogBehaviorGuideOut,
            GenericResponseDogBehaviorGuideOutBuilder> {
  _$GenericResponseDogBehaviorGuideOut? _$v;

  int? _code;
  int? get code => _$this._code;
  set code(int? code) => _$this._code = code;

  String? _msg;
  String? get msg => _$this._msg;
  set msg(String? msg) => _$this._msg = msg;

  DogBehaviorGuideOutBuilder? _data;
  DogBehaviorGuideOutBuilder get data =>
      _$this._data ??= DogBehaviorGuideOutBuilder();
  set data(DogBehaviorGuideOutBuilder? data) => _$this._data = data;

  GenericResponseDogBehaviorGuideOutBuilder() {
    GenericResponseDogBehaviorGuideOut._defaults(this);
  }

  GenericResponseDogBehaviorGuideOutBuilder get _$this {
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
  void replace(GenericResponseDogBehaviorGuideOut other) {
    _$v = other as _$GenericResponseDogBehaviorGuideOut;
  }

  @override
  void update(
      void Function(GenericResponseDogBehaviorGuideOutBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GenericResponseDogBehaviorGuideOut build() => _build();

  _$GenericResponseDogBehaviorGuideOut _build() {
    _$GenericResponseDogBehaviorGuideOut _$result;
    try {
      _$result = _$v ??
          _$GenericResponseDogBehaviorGuideOut._(
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
            r'GenericResponseDogBehaviorGuideOut', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
