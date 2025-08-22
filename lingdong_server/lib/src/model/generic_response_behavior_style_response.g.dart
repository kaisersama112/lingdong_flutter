// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'generic_response_behavior_style_response.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$GenericResponseBehaviorStyleResponse
    extends GenericResponseBehaviorStyleResponse {
  @override
  final int? code;
  @override
  final String? msg;
  @override
  final BehaviorStyleResponse? data;

  factory _$GenericResponseBehaviorStyleResponse(
          [void Function(GenericResponseBehaviorStyleResponseBuilder)?
              updates]) =>
      (GenericResponseBehaviorStyleResponseBuilder()..update(updates))._build();

  _$GenericResponseBehaviorStyleResponse._({this.code, this.msg, this.data})
      : super._();
  @override
  GenericResponseBehaviorStyleResponse rebuild(
          void Function(GenericResponseBehaviorStyleResponseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GenericResponseBehaviorStyleResponseBuilder toBuilder() =>
      GenericResponseBehaviorStyleResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GenericResponseBehaviorStyleResponse &&
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
    return (newBuiltValueToStringHelper(r'GenericResponseBehaviorStyleResponse')
          ..add('code', code)
          ..add('msg', msg)
          ..add('data', data))
        .toString();
  }
}

class GenericResponseBehaviorStyleResponseBuilder
    implements
        Builder<GenericResponseBehaviorStyleResponse,
            GenericResponseBehaviorStyleResponseBuilder> {
  _$GenericResponseBehaviorStyleResponse? _$v;

  int? _code;
  int? get code => _$this._code;
  set code(int? code) => _$this._code = code;

  String? _msg;
  String? get msg => _$this._msg;
  set msg(String? msg) => _$this._msg = msg;

  BehaviorStyleResponseBuilder? _data;
  BehaviorStyleResponseBuilder get data =>
      _$this._data ??= BehaviorStyleResponseBuilder();
  set data(BehaviorStyleResponseBuilder? data) => _$this._data = data;

  GenericResponseBehaviorStyleResponseBuilder() {
    GenericResponseBehaviorStyleResponse._defaults(this);
  }

  GenericResponseBehaviorStyleResponseBuilder get _$this {
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
  void replace(GenericResponseBehaviorStyleResponse other) {
    _$v = other as _$GenericResponseBehaviorStyleResponse;
  }

  @override
  void update(
      void Function(GenericResponseBehaviorStyleResponseBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GenericResponseBehaviorStyleResponse build() => _build();

  _$GenericResponseBehaviorStyleResponse _build() {
    _$GenericResponseBehaviorStyleResponse _$result;
    try {
      _$result = _$v ??
          _$GenericResponseBehaviorStyleResponse._(
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
            r'GenericResponseBehaviorStyleResponse',
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
