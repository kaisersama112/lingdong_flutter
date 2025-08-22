// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'generic_response_list_task_type_response.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$GenericResponseListTaskTypeResponse
    extends GenericResponseListTaskTypeResponse {
  @override
  final int? code;
  @override
  final String? msg;
  @override
  final BuiltList<TaskTypeResponse>? data;

  factory _$GenericResponseListTaskTypeResponse(
          [void Function(GenericResponseListTaskTypeResponseBuilder)?
              updates]) =>
      (GenericResponseListTaskTypeResponseBuilder()..update(updates))._build();

  _$GenericResponseListTaskTypeResponse._({this.code, this.msg, this.data})
      : super._();
  @override
  GenericResponseListTaskTypeResponse rebuild(
          void Function(GenericResponseListTaskTypeResponseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GenericResponseListTaskTypeResponseBuilder toBuilder() =>
      GenericResponseListTaskTypeResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GenericResponseListTaskTypeResponse &&
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
    return (newBuiltValueToStringHelper(r'GenericResponseListTaskTypeResponse')
          ..add('code', code)
          ..add('msg', msg)
          ..add('data', data))
        .toString();
  }
}

class GenericResponseListTaskTypeResponseBuilder
    implements
        Builder<GenericResponseListTaskTypeResponse,
            GenericResponseListTaskTypeResponseBuilder> {
  _$GenericResponseListTaskTypeResponse? _$v;

  int? _code;
  int? get code => _$this._code;
  set code(int? code) => _$this._code = code;

  String? _msg;
  String? get msg => _$this._msg;
  set msg(String? msg) => _$this._msg = msg;

  ListBuilder<TaskTypeResponse>? _data;
  ListBuilder<TaskTypeResponse> get data =>
      _$this._data ??= ListBuilder<TaskTypeResponse>();
  set data(ListBuilder<TaskTypeResponse>? data) => _$this._data = data;

  GenericResponseListTaskTypeResponseBuilder() {
    GenericResponseListTaskTypeResponse._defaults(this);
  }

  GenericResponseListTaskTypeResponseBuilder get _$this {
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
  void replace(GenericResponseListTaskTypeResponse other) {
    _$v = other as _$GenericResponseListTaskTypeResponse;
  }

  @override
  void update(
      void Function(GenericResponseListTaskTypeResponseBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GenericResponseListTaskTypeResponse build() => _build();

  _$GenericResponseListTaskTypeResponse _build() {
    _$GenericResponseListTaskTypeResponse _$result;
    try {
      _$result = _$v ??
          _$GenericResponseListTaskTypeResponse._(
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
        throw BuiltValueNestedFieldError(r'GenericResponseListTaskTypeResponse',
            _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
