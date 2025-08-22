// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'generic_response_weight_record_response.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$GenericResponseWeightRecordResponse
    extends GenericResponseWeightRecordResponse {
  @override
  final int? code;
  @override
  final String? msg;
  @override
  final WeightRecordResponse? data;

  factory _$GenericResponseWeightRecordResponse(
          [void Function(GenericResponseWeightRecordResponseBuilder)?
              updates]) =>
      (GenericResponseWeightRecordResponseBuilder()..update(updates))._build();

  _$GenericResponseWeightRecordResponse._({this.code, this.msg, this.data})
      : super._();
  @override
  GenericResponseWeightRecordResponse rebuild(
          void Function(GenericResponseWeightRecordResponseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GenericResponseWeightRecordResponseBuilder toBuilder() =>
      GenericResponseWeightRecordResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GenericResponseWeightRecordResponse &&
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
    return (newBuiltValueToStringHelper(r'GenericResponseWeightRecordResponse')
          ..add('code', code)
          ..add('msg', msg)
          ..add('data', data))
        .toString();
  }
}

class GenericResponseWeightRecordResponseBuilder
    implements
        Builder<GenericResponseWeightRecordResponse,
            GenericResponseWeightRecordResponseBuilder> {
  _$GenericResponseWeightRecordResponse? _$v;

  int? _code;
  int? get code => _$this._code;
  set code(int? code) => _$this._code = code;

  String? _msg;
  String? get msg => _$this._msg;
  set msg(String? msg) => _$this._msg = msg;

  WeightRecordResponseBuilder? _data;
  WeightRecordResponseBuilder get data =>
      _$this._data ??= WeightRecordResponseBuilder();
  set data(WeightRecordResponseBuilder? data) => _$this._data = data;

  GenericResponseWeightRecordResponseBuilder() {
    GenericResponseWeightRecordResponse._defaults(this);
  }

  GenericResponseWeightRecordResponseBuilder get _$this {
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
  void replace(GenericResponseWeightRecordResponse other) {
    _$v = other as _$GenericResponseWeightRecordResponse;
  }

  @override
  void update(
      void Function(GenericResponseWeightRecordResponseBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GenericResponseWeightRecordResponse build() => _build();

  _$GenericResponseWeightRecordResponse _build() {
    _$GenericResponseWeightRecordResponse _$result;
    try {
      _$result = _$v ??
          _$GenericResponseWeightRecordResponse._(
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
        throw BuiltValueNestedFieldError(r'GenericResponseWeightRecordResponse',
            _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
