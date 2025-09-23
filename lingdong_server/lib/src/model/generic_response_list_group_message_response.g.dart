// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'generic_response_list_group_message_response.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$GenericResponseListGroupMessageResponse
    extends GenericResponseListGroupMessageResponse {
  @override
  final int? code;
  @override
  final String? msg;
  @override
  final BuiltList<GroupMessageResponse>? data;

  factory _$GenericResponseListGroupMessageResponse(
          [void Function(GenericResponseListGroupMessageResponseBuilder)?
              updates]) =>
      (GenericResponseListGroupMessageResponseBuilder()..update(updates))
          ._build();

  _$GenericResponseListGroupMessageResponse._({this.code, this.msg, this.data})
      : super._();
  @override
  GenericResponseListGroupMessageResponse rebuild(
          void Function(GenericResponseListGroupMessageResponseBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GenericResponseListGroupMessageResponseBuilder toBuilder() =>
      GenericResponseListGroupMessageResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GenericResponseListGroupMessageResponse &&
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
            r'GenericResponseListGroupMessageResponse')
          ..add('code', code)
          ..add('msg', msg)
          ..add('data', data))
        .toString();
  }
}

class GenericResponseListGroupMessageResponseBuilder
    implements
        Builder<GenericResponseListGroupMessageResponse,
            GenericResponseListGroupMessageResponseBuilder> {
  _$GenericResponseListGroupMessageResponse? _$v;

  int? _code;
  int? get code => _$this._code;
  set code(int? code) => _$this._code = code;

  String? _msg;
  String? get msg => _$this._msg;
  set msg(String? msg) => _$this._msg = msg;

  ListBuilder<GroupMessageResponse>? _data;
  ListBuilder<GroupMessageResponse> get data =>
      _$this._data ??= ListBuilder<GroupMessageResponse>();
  set data(ListBuilder<GroupMessageResponse>? data) => _$this._data = data;

  GenericResponseListGroupMessageResponseBuilder() {
    GenericResponseListGroupMessageResponse._defaults(this);
  }

  GenericResponseListGroupMessageResponseBuilder get _$this {
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
  void replace(GenericResponseListGroupMessageResponse other) {
    _$v = other as _$GenericResponseListGroupMessageResponse;
  }

  @override
  void update(
      void Function(GenericResponseListGroupMessageResponseBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GenericResponseListGroupMessageResponse build() => _build();

  _$GenericResponseListGroupMessageResponse _build() {
    _$GenericResponseListGroupMessageResponse _$result;
    try {
      _$result = _$v ??
          _$GenericResponseListGroupMessageResponse._(
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
            r'GenericResponseListGroupMessageResponse',
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
