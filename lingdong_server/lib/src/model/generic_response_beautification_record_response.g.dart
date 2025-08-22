// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'generic_response_beautification_record_response.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$GenericResponseBeautificationRecordResponse
    extends GenericResponseBeautificationRecordResponse {
  @override
  final int? code;
  @override
  final String? msg;
  @override
  final BeautificationRecordResponse? data;

  factory _$GenericResponseBeautificationRecordResponse(
          [void Function(GenericResponseBeautificationRecordResponseBuilder)?
              updates]) =>
      (GenericResponseBeautificationRecordResponseBuilder()..update(updates))
          ._build();

  _$GenericResponseBeautificationRecordResponse._(
      {this.code, this.msg, this.data})
      : super._();
  @override
  GenericResponseBeautificationRecordResponse rebuild(
          void Function(GenericResponseBeautificationRecordResponseBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GenericResponseBeautificationRecordResponseBuilder toBuilder() =>
      GenericResponseBeautificationRecordResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GenericResponseBeautificationRecordResponse &&
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
            r'GenericResponseBeautificationRecordResponse')
          ..add('code', code)
          ..add('msg', msg)
          ..add('data', data))
        .toString();
  }
}

class GenericResponseBeautificationRecordResponseBuilder
    implements
        Builder<GenericResponseBeautificationRecordResponse,
            GenericResponseBeautificationRecordResponseBuilder> {
  _$GenericResponseBeautificationRecordResponse? _$v;

  int? _code;
  int? get code => _$this._code;
  set code(int? code) => _$this._code = code;

  String? _msg;
  String? get msg => _$this._msg;
  set msg(String? msg) => _$this._msg = msg;

  BeautificationRecordResponseBuilder? _data;
  BeautificationRecordResponseBuilder get data =>
      _$this._data ??= BeautificationRecordResponseBuilder();
  set data(BeautificationRecordResponseBuilder? data) => _$this._data = data;

  GenericResponseBeautificationRecordResponseBuilder() {
    GenericResponseBeautificationRecordResponse._defaults(this);
  }

  GenericResponseBeautificationRecordResponseBuilder get _$this {
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
  void replace(GenericResponseBeautificationRecordResponse other) {
    _$v = other as _$GenericResponseBeautificationRecordResponse;
  }

  @override
  void update(
      void Function(GenericResponseBeautificationRecordResponseBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  GenericResponseBeautificationRecordResponse build() => _build();

  _$GenericResponseBeautificationRecordResponse _build() {
    _$GenericResponseBeautificationRecordResponse _$result;
    try {
      _$result = _$v ??
          _$GenericResponseBeautificationRecordResponse._(
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
            r'GenericResponseBeautificationRecordResponse',
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
