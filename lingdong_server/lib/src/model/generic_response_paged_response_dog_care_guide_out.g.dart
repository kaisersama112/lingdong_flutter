// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'generic_response_paged_response_dog_care_guide_out.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$GenericResponsePagedResponseDogCareGuideOut
    extends GenericResponsePagedResponseDogCareGuideOut {
  @override
  final int? code;
  @override
  final String? msg;
  @override
  final PagedResponseDogCareGuideOut? data;

  factory _$GenericResponsePagedResponseDogCareGuideOut(
          [void Function(GenericResponsePagedResponseDogCareGuideOutBuilder)?
              updates]) =>
      (GenericResponsePagedResponseDogCareGuideOutBuilder()..update(updates))
          ._build();

  _$GenericResponsePagedResponseDogCareGuideOut._(
      {this.code, this.msg, this.data})
      : super._();
  @override
  GenericResponsePagedResponseDogCareGuideOut rebuild(
          void Function(GenericResponsePagedResponseDogCareGuideOutBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GenericResponsePagedResponseDogCareGuideOutBuilder toBuilder() =>
      GenericResponsePagedResponseDogCareGuideOutBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GenericResponsePagedResponseDogCareGuideOut &&
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
            r'GenericResponsePagedResponseDogCareGuideOut')
          ..add('code', code)
          ..add('msg', msg)
          ..add('data', data))
        .toString();
  }
}

class GenericResponsePagedResponseDogCareGuideOutBuilder
    implements
        Builder<GenericResponsePagedResponseDogCareGuideOut,
            GenericResponsePagedResponseDogCareGuideOutBuilder> {
  _$GenericResponsePagedResponseDogCareGuideOut? _$v;

  int? _code;
  int? get code => _$this._code;
  set code(int? code) => _$this._code = code;

  String? _msg;
  String? get msg => _$this._msg;
  set msg(String? msg) => _$this._msg = msg;

  PagedResponseDogCareGuideOutBuilder? _data;
  PagedResponseDogCareGuideOutBuilder get data =>
      _$this._data ??= PagedResponseDogCareGuideOutBuilder();
  set data(PagedResponseDogCareGuideOutBuilder? data) => _$this._data = data;

  GenericResponsePagedResponseDogCareGuideOutBuilder() {
    GenericResponsePagedResponseDogCareGuideOut._defaults(this);
  }

  GenericResponsePagedResponseDogCareGuideOutBuilder get _$this {
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
  void replace(GenericResponsePagedResponseDogCareGuideOut other) {
    _$v = other as _$GenericResponsePagedResponseDogCareGuideOut;
  }

  @override
  void update(
      void Function(GenericResponsePagedResponseDogCareGuideOutBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  GenericResponsePagedResponseDogCareGuideOut build() => _build();

  _$GenericResponsePagedResponseDogCareGuideOut _build() {
    _$GenericResponsePagedResponseDogCareGuideOut _$result;
    try {
      _$result = _$v ??
          _$GenericResponsePagedResponseDogCareGuideOut._(
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
            r'GenericResponsePagedResponseDogCareGuideOut',
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
