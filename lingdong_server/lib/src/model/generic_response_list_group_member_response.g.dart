// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'generic_response_list_group_member_response.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$GenericResponseListGroupMemberResponse
    extends GenericResponseListGroupMemberResponse {
  @override
  final int? code;
  @override
  final String? msg;
  @override
  final BuiltList<GroupMemberResponse>? data;

  factory _$GenericResponseListGroupMemberResponse(
          [void Function(GenericResponseListGroupMemberResponseBuilder)?
              updates]) =>
      (GenericResponseListGroupMemberResponseBuilder()..update(updates))
          ._build();

  _$GenericResponseListGroupMemberResponse._({this.code, this.msg, this.data})
      : super._();
  @override
  GenericResponseListGroupMemberResponse rebuild(
          void Function(GenericResponseListGroupMemberResponseBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GenericResponseListGroupMemberResponseBuilder toBuilder() =>
      GenericResponseListGroupMemberResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GenericResponseListGroupMemberResponse &&
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
            r'GenericResponseListGroupMemberResponse')
          ..add('code', code)
          ..add('msg', msg)
          ..add('data', data))
        .toString();
  }
}

class GenericResponseListGroupMemberResponseBuilder
    implements
        Builder<GenericResponseListGroupMemberResponse,
            GenericResponseListGroupMemberResponseBuilder> {
  _$GenericResponseListGroupMemberResponse? _$v;

  int? _code;
  int? get code => _$this._code;
  set code(int? code) => _$this._code = code;

  String? _msg;
  String? get msg => _$this._msg;
  set msg(String? msg) => _$this._msg = msg;

  ListBuilder<GroupMemberResponse>? _data;
  ListBuilder<GroupMemberResponse> get data =>
      _$this._data ??= ListBuilder<GroupMemberResponse>();
  set data(ListBuilder<GroupMemberResponse>? data) => _$this._data = data;

  GenericResponseListGroupMemberResponseBuilder() {
    GenericResponseListGroupMemberResponse._defaults(this);
  }

  GenericResponseListGroupMemberResponseBuilder get _$this {
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
  void replace(GenericResponseListGroupMemberResponse other) {
    _$v = other as _$GenericResponseListGroupMemberResponse;
  }

  @override
  void update(
      void Function(GenericResponseListGroupMemberResponseBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GenericResponseListGroupMemberResponse build() => _build();

  _$GenericResponseListGroupMemberResponse _build() {
    _$GenericResponseListGroupMemberResponse _$result;
    try {
      _$result = _$v ??
          _$GenericResponseListGroupMemberResponse._(
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
            r'GenericResponseListGroupMemberResponse',
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
