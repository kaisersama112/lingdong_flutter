// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'generic_response_list_behavior_style_response.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$GenericResponseListBehaviorStyleResponse
    extends GenericResponseListBehaviorStyleResponse {
  @override
  final int? code;
  @override
  final String? msg;
  @override
  final BuiltList<BehaviorStyleResponse>? data;

  factory _$GenericResponseListBehaviorStyleResponse(
          [void Function(GenericResponseListBehaviorStyleResponseBuilder)?
              updates]) =>
      (GenericResponseListBehaviorStyleResponseBuilder()..update(updates))
          ._build();

  _$GenericResponseListBehaviorStyleResponse._({this.code, this.msg, this.data})
      : super._();
  @override
  GenericResponseListBehaviorStyleResponse rebuild(
          void Function(GenericResponseListBehaviorStyleResponseBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GenericResponseListBehaviorStyleResponseBuilder toBuilder() =>
      GenericResponseListBehaviorStyleResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GenericResponseListBehaviorStyleResponse &&
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
            r'GenericResponseListBehaviorStyleResponse')
          ..add('code', code)
          ..add('msg', msg)
          ..add('data', data))
        .toString();
  }
}

class GenericResponseListBehaviorStyleResponseBuilder
    implements
        Builder<GenericResponseListBehaviorStyleResponse,
            GenericResponseListBehaviorStyleResponseBuilder> {
  _$GenericResponseListBehaviorStyleResponse? _$v;

  int? _code;
  int? get code => _$this._code;
  set code(int? code) => _$this._code = code;

  String? _msg;
  String? get msg => _$this._msg;
  set msg(String? msg) => _$this._msg = msg;

  ListBuilder<BehaviorStyleResponse>? _data;
  ListBuilder<BehaviorStyleResponse> get data =>
      _$this._data ??= ListBuilder<BehaviorStyleResponse>();
  set data(ListBuilder<BehaviorStyleResponse>? data) => _$this._data = data;

  GenericResponseListBehaviorStyleResponseBuilder() {
    GenericResponseListBehaviorStyleResponse._defaults(this);
  }

  GenericResponseListBehaviorStyleResponseBuilder get _$this {
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
  void replace(GenericResponseListBehaviorStyleResponse other) {
    _$v = other as _$GenericResponseListBehaviorStyleResponse;
  }

  @override
  void update(
      void Function(GenericResponseListBehaviorStyleResponseBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GenericResponseListBehaviorStyleResponse build() => _build();

  _$GenericResponseListBehaviorStyleResponse _build() {
    _$GenericResponseListBehaviorStyleResponse _$result;
    try {
      _$result = _$v ??
          _$GenericResponseListBehaviorStyleResponse._(
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
            r'GenericResponseListBehaviorStyleResponse',
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
