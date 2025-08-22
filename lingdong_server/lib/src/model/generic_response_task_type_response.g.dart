// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'generic_response_task_type_response.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$GenericResponseTaskTypeResponse
    extends GenericResponseTaskTypeResponse {
  @override
  final int? code;
  @override
  final String? msg;
  @override
  final TaskTypeResponse? data;

  factory _$GenericResponseTaskTypeResponse(
          [void Function(GenericResponseTaskTypeResponseBuilder)? updates]) =>
      (GenericResponseTaskTypeResponseBuilder()..update(updates))._build();

  _$GenericResponseTaskTypeResponse._({this.code, this.msg, this.data})
      : super._();
  @override
  GenericResponseTaskTypeResponse rebuild(
          void Function(GenericResponseTaskTypeResponseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GenericResponseTaskTypeResponseBuilder toBuilder() =>
      GenericResponseTaskTypeResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GenericResponseTaskTypeResponse &&
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
    return (newBuiltValueToStringHelper(r'GenericResponseTaskTypeResponse')
          ..add('code', code)
          ..add('msg', msg)
          ..add('data', data))
        .toString();
  }
}

class GenericResponseTaskTypeResponseBuilder
    implements
        Builder<GenericResponseTaskTypeResponse,
            GenericResponseTaskTypeResponseBuilder> {
  _$GenericResponseTaskTypeResponse? _$v;

  int? _code;
  int? get code => _$this._code;
  set code(int? code) => _$this._code = code;

  String? _msg;
  String? get msg => _$this._msg;
  set msg(String? msg) => _$this._msg = msg;

  TaskTypeResponseBuilder? _data;
  TaskTypeResponseBuilder get data =>
      _$this._data ??= TaskTypeResponseBuilder();
  set data(TaskTypeResponseBuilder? data) => _$this._data = data;

  GenericResponseTaskTypeResponseBuilder() {
    GenericResponseTaskTypeResponse._defaults(this);
  }

  GenericResponseTaskTypeResponseBuilder get _$this {
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
  void replace(GenericResponseTaskTypeResponse other) {
    _$v = other as _$GenericResponseTaskTypeResponse;
  }

  @override
  void update(void Function(GenericResponseTaskTypeResponseBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GenericResponseTaskTypeResponse build() => _build();

  _$GenericResponseTaskTypeResponse _build() {
    _$GenericResponseTaskTypeResponse _$result;
    try {
      _$result = _$v ??
          _$GenericResponseTaskTypeResponse._(
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
            r'GenericResponseTaskTypeResponse', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
