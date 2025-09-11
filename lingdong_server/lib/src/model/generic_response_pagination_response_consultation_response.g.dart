// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'generic_response_pagination_response_consultation_response.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$GenericResponsePaginationResponseConsultationResponse
    extends GenericResponsePaginationResponseConsultationResponse {
  @override
  final int? code;
  @override
  final String? msg;
  @override
  final PaginationResponseConsultationResponse? data;

  factory _$GenericResponsePaginationResponseConsultationResponse(
          [void Function(
                  GenericResponsePaginationResponseConsultationResponseBuilder)?
              updates]) =>
      (GenericResponsePaginationResponseConsultationResponseBuilder()
            ..update(updates))
          ._build();

  _$GenericResponsePaginationResponseConsultationResponse._(
      {this.code, this.msg, this.data})
      : super._();
  @override
  GenericResponsePaginationResponseConsultationResponse rebuild(
          void Function(
                  GenericResponsePaginationResponseConsultationResponseBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GenericResponsePaginationResponseConsultationResponseBuilder toBuilder() =>
      GenericResponsePaginationResponseConsultationResponseBuilder()
        ..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GenericResponsePaginationResponseConsultationResponse &&
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
            r'GenericResponsePaginationResponseConsultationResponse')
          ..add('code', code)
          ..add('msg', msg)
          ..add('data', data))
        .toString();
  }
}

class GenericResponsePaginationResponseConsultationResponseBuilder
    implements
        Builder<GenericResponsePaginationResponseConsultationResponse,
            GenericResponsePaginationResponseConsultationResponseBuilder> {
  _$GenericResponsePaginationResponseConsultationResponse? _$v;

  int? _code;
  int? get code => _$this._code;
  set code(int? code) => _$this._code = code;

  String? _msg;
  String? get msg => _$this._msg;
  set msg(String? msg) => _$this._msg = msg;

  PaginationResponseConsultationResponseBuilder? _data;
  PaginationResponseConsultationResponseBuilder get data =>
      _$this._data ??= PaginationResponseConsultationResponseBuilder();
  set data(PaginationResponseConsultationResponseBuilder? data) =>
      _$this._data = data;

  GenericResponsePaginationResponseConsultationResponseBuilder() {
    GenericResponsePaginationResponseConsultationResponse._defaults(this);
  }

  GenericResponsePaginationResponseConsultationResponseBuilder get _$this {
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
  void replace(GenericResponsePaginationResponseConsultationResponse other) {
    _$v = other as _$GenericResponsePaginationResponseConsultationResponse;
  }

  @override
  void update(
      void Function(
              GenericResponsePaginationResponseConsultationResponseBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  GenericResponsePaginationResponseConsultationResponse build() => _build();

  _$GenericResponsePaginationResponseConsultationResponse _build() {
    _$GenericResponsePaginationResponseConsultationResponse _$result;
    try {
      _$result = _$v ??
          _$GenericResponsePaginationResponseConsultationResponse._(
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
            r'GenericResponsePaginationResponseConsultationResponse',
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
