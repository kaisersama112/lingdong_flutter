// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'generic_response_examination_record_response.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$GenericResponseExaminationRecordResponse
    extends GenericResponseExaminationRecordResponse {
  @override
  final int? code;
  @override
  final String? msg;
  @override
  final ExaminationRecordResponse? data;

  factory _$GenericResponseExaminationRecordResponse(
          [void Function(GenericResponseExaminationRecordResponseBuilder)?
              updates]) =>
      (GenericResponseExaminationRecordResponseBuilder()..update(updates))
          ._build();

  _$GenericResponseExaminationRecordResponse._({this.code, this.msg, this.data})
      : super._();
  @override
  GenericResponseExaminationRecordResponse rebuild(
          void Function(GenericResponseExaminationRecordResponseBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GenericResponseExaminationRecordResponseBuilder toBuilder() =>
      GenericResponseExaminationRecordResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GenericResponseExaminationRecordResponse &&
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
            r'GenericResponseExaminationRecordResponse')
          ..add('code', code)
          ..add('msg', msg)
          ..add('data', data))
        .toString();
  }
}

class GenericResponseExaminationRecordResponseBuilder
    implements
        Builder<GenericResponseExaminationRecordResponse,
            GenericResponseExaminationRecordResponseBuilder> {
  _$GenericResponseExaminationRecordResponse? _$v;

  int? _code;
  int? get code => _$this._code;
  set code(int? code) => _$this._code = code;

  String? _msg;
  String? get msg => _$this._msg;
  set msg(String? msg) => _$this._msg = msg;

  ExaminationRecordResponseBuilder? _data;
  ExaminationRecordResponseBuilder get data =>
      _$this._data ??= ExaminationRecordResponseBuilder();
  set data(ExaminationRecordResponseBuilder? data) => _$this._data = data;

  GenericResponseExaminationRecordResponseBuilder() {
    GenericResponseExaminationRecordResponse._defaults(this);
  }

  GenericResponseExaminationRecordResponseBuilder get _$this {
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
  void replace(GenericResponseExaminationRecordResponse other) {
    _$v = other as _$GenericResponseExaminationRecordResponse;
  }

  @override
  void update(
      void Function(GenericResponseExaminationRecordResponseBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GenericResponseExaminationRecordResponse build() => _build();

  _$GenericResponseExaminationRecordResponse _build() {
    _$GenericResponseExaminationRecordResponse _$result;
    try {
      _$result = _$v ??
          _$GenericResponseExaminationRecordResponse._(
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
            r'GenericResponseExaminationRecordResponse',
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
