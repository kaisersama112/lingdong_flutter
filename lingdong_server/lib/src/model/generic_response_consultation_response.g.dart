// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'generic_response_consultation_response.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$GenericResponseConsultationResponse
    extends GenericResponseConsultationResponse {
  @override
  final int? code;
  @override
  final String? msg;
  @override
  final ConsultationResponse? data;

  factory _$GenericResponseConsultationResponse(
          [void Function(GenericResponseConsultationResponseBuilder)?
              updates]) =>
      (GenericResponseConsultationResponseBuilder()..update(updates))._build();

  _$GenericResponseConsultationResponse._({this.code, this.msg, this.data})
      : super._();
  @override
  GenericResponseConsultationResponse rebuild(
          void Function(GenericResponseConsultationResponseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GenericResponseConsultationResponseBuilder toBuilder() =>
      GenericResponseConsultationResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GenericResponseConsultationResponse &&
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
    return (newBuiltValueToStringHelper(r'GenericResponseConsultationResponse')
          ..add('code', code)
          ..add('msg', msg)
          ..add('data', data))
        .toString();
  }
}

class GenericResponseConsultationResponseBuilder
    implements
        Builder<GenericResponseConsultationResponse,
            GenericResponseConsultationResponseBuilder> {
  _$GenericResponseConsultationResponse? _$v;

  int? _code;
  int? get code => _$this._code;
  set code(int? code) => _$this._code = code;

  String? _msg;
  String? get msg => _$this._msg;
  set msg(String? msg) => _$this._msg = msg;

  ConsultationResponseBuilder? _data;
  ConsultationResponseBuilder get data =>
      _$this._data ??= ConsultationResponseBuilder();
  set data(ConsultationResponseBuilder? data) => _$this._data = data;

  GenericResponseConsultationResponseBuilder() {
    GenericResponseConsultationResponse._defaults(this);
  }

  GenericResponseConsultationResponseBuilder get _$this {
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
  void replace(GenericResponseConsultationResponse other) {
    _$v = other as _$GenericResponseConsultationResponse;
  }

  @override
  void update(
      void Function(GenericResponseConsultationResponseBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GenericResponseConsultationResponse build() => _build();

  _$GenericResponseConsultationResponse _build() {
    _$GenericResponseConsultationResponse _$result;
    try {
      _$result = _$v ??
          _$GenericResponseConsultationResponse._(
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
        throw BuiltValueNestedFieldError(r'GenericResponseConsultationResponse',
            _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
