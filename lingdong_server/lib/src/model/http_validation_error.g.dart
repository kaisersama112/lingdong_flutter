// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'http_validation_error.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$HttpValidationError extends HttpValidationError {
  @override
  final BuiltList<ValidationError>? detail;

  factory _$HttpValidationError(
          [void Function(HttpValidationErrorBuilder)? updates]) =>
      (HttpValidationErrorBuilder()..update(updates))._build();

  _$HttpValidationError._({this.detail}) : super._();
  @override
  HttpValidationError rebuild(
          void Function(HttpValidationErrorBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  HttpValidationErrorBuilder toBuilder() =>
      HttpValidationErrorBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is HttpValidationError && detail == other.detail;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, detail.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'HttpValidationError')
          ..add('detail', detail))
        .toString();
  }
}

class HttpValidationErrorBuilder
    implements Builder<HttpValidationError, HttpValidationErrorBuilder> {
  _$HttpValidationError? _$v;

  ListBuilder<ValidationError>? _detail;
  ListBuilder<ValidationError> get detail =>
      _$this._detail ??= ListBuilder<ValidationError>();
  set detail(ListBuilder<ValidationError>? detail) => _$this._detail = detail;

  HttpValidationErrorBuilder() {
    HttpValidationError._defaults(this);
  }

  HttpValidationErrorBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _detail = $v.detail?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(HttpValidationError other) {
    _$v = other as _$HttpValidationError;
  }

  @override
  void update(void Function(HttpValidationErrorBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  HttpValidationError build() => _build();

  _$HttpValidationError _build() {
    _$HttpValidationError _$result;
    try {
      _$result = _$v ??
          _$HttpValidationError._(
            detail: _detail?.build(),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'detail';
        _detail?.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'HttpValidationError', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
