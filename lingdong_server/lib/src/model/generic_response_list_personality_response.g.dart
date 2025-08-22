// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'generic_response_list_personality_response.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$GenericResponseListPersonalityResponse
    extends GenericResponseListPersonalityResponse {
  @override
  final int? code;
  @override
  final String? msg;
  @override
  final BuiltList<PersonalityResponse>? data;

  factory _$GenericResponseListPersonalityResponse(
          [void Function(GenericResponseListPersonalityResponseBuilder)?
              updates]) =>
      (GenericResponseListPersonalityResponseBuilder()..update(updates))
          ._build();

  _$GenericResponseListPersonalityResponse._({this.code, this.msg, this.data})
      : super._();
  @override
  GenericResponseListPersonalityResponse rebuild(
          void Function(GenericResponseListPersonalityResponseBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GenericResponseListPersonalityResponseBuilder toBuilder() =>
      GenericResponseListPersonalityResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GenericResponseListPersonalityResponse &&
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
            r'GenericResponseListPersonalityResponse')
          ..add('code', code)
          ..add('msg', msg)
          ..add('data', data))
        .toString();
  }
}

class GenericResponseListPersonalityResponseBuilder
    implements
        Builder<GenericResponseListPersonalityResponse,
            GenericResponseListPersonalityResponseBuilder> {
  _$GenericResponseListPersonalityResponse? _$v;

  int? _code;
  int? get code => _$this._code;
  set code(int? code) => _$this._code = code;

  String? _msg;
  String? get msg => _$this._msg;
  set msg(String? msg) => _$this._msg = msg;

  ListBuilder<PersonalityResponse>? _data;
  ListBuilder<PersonalityResponse> get data =>
      _$this._data ??= ListBuilder<PersonalityResponse>();
  set data(ListBuilder<PersonalityResponse>? data) => _$this._data = data;

  GenericResponseListPersonalityResponseBuilder() {
    GenericResponseListPersonalityResponse._defaults(this);
  }

  GenericResponseListPersonalityResponseBuilder get _$this {
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
  void replace(GenericResponseListPersonalityResponse other) {
    _$v = other as _$GenericResponseListPersonalityResponse;
  }

  @override
  void update(
      void Function(GenericResponseListPersonalityResponseBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GenericResponseListPersonalityResponse build() => _build();

  _$GenericResponseListPersonalityResponse _build() {
    _$GenericResponseListPersonalityResponse _$result;
    try {
      _$result = _$v ??
          _$GenericResponseListPersonalityResponse._(
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
            r'GenericResponseListPersonalityResponse',
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
