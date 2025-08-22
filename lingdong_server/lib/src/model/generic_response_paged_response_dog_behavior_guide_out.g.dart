// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'generic_response_paged_response_dog_behavior_guide_out.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$GenericResponsePagedResponseDogBehaviorGuideOut
    extends GenericResponsePagedResponseDogBehaviorGuideOut {
  @override
  final int? code;
  @override
  final String? msg;
  @override
  final PagedResponseDogBehaviorGuideOut? data;

  factory _$GenericResponsePagedResponseDogBehaviorGuideOut(
          [void Function(
                  GenericResponsePagedResponseDogBehaviorGuideOutBuilder)?
              updates]) =>
      (GenericResponsePagedResponseDogBehaviorGuideOutBuilder()
            ..update(updates))
          ._build();

  _$GenericResponsePagedResponseDogBehaviorGuideOut._(
      {this.code, this.msg, this.data})
      : super._();
  @override
  GenericResponsePagedResponseDogBehaviorGuideOut rebuild(
          void Function(GenericResponsePagedResponseDogBehaviorGuideOutBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GenericResponsePagedResponseDogBehaviorGuideOutBuilder toBuilder() =>
      GenericResponsePagedResponseDogBehaviorGuideOutBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GenericResponsePagedResponseDogBehaviorGuideOut &&
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
    return (newBuiltValueToStringHelper(
            r'GenericResponsePagedResponseDogBehaviorGuideOut')
          ..add('code', code)
          ..add('msg', msg)
          ..add('data', data))
        .toString();
  }
}

class GenericResponsePagedResponseDogBehaviorGuideOutBuilder
    implements
        Builder<GenericResponsePagedResponseDogBehaviorGuideOut,
            GenericResponsePagedResponseDogBehaviorGuideOutBuilder> {
  _$GenericResponsePagedResponseDogBehaviorGuideOut? _$v;

  int? _code;
  int? get code => _$this._code;
  set code(int? code) => _$this._code = code;

  String? _msg;
  String? get msg => _$this._msg;
  set msg(String? msg) => _$this._msg = msg;

  PagedResponseDogBehaviorGuideOutBuilder? _data;
  PagedResponseDogBehaviorGuideOutBuilder get data =>
      _$this._data ??= PagedResponseDogBehaviorGuideOutBuilder();
  set data(PagedResponseDogBehaviorGuideOutBuilder? data) =>
      _$this._data = data;

  GenericResponsePagedResponseDogBehaviorGuideOutBuilder() {
    GenericResponsePagedResponseDogBehaviorGuideOut._defaults(this);
  }

  GenericResponsePagedResponseDogBehaviorGuideOutBuilder get _$this {
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
  void replace(GenericResponsePagedResponseDogBehaviorGuideOut other) {
    _$v = other as _$GenericResponsePagedResponseDogBehaviorGuideOut;
  }

  @override
  void update(
      void Function(GenericResponsePagedResponseDogBehaviorGuideOutBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  GenericResponsePagedResponseDogBehaviorGuideOut build() => _build();

  _$GenericResponsePagedResponseDogBehaviorGuideOut _build() {
    _$GenericResponsePagedResponseDogBehaviorGuideOut _$result;
    try {
      _$result = _$v ??
          _$GenericResponsePagedResponseDogBehaviorGuideOut._(
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
            r'GenericResponsePagedResponseDogBehaviorGuideOut',
            _$failedField,
            e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
