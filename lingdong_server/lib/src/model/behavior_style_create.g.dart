// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'behavior_style_create.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$BehaviorStyleCreate extends BehaviorStyleCreate {
  @override
  final String name;
  @override
  final String? description;

  factory _$BehaviorStyleCreate(
          [void Function(BehaviorStyleCreateBuilder)? updates]) =>
      (BehaviorStyleCreateBuilder()..update(updates))._build();

  _$BehaviorStyleCreate._({required this.name, this.description}) : super._();
  @override
  BehaviorStyleCreate rebuild(
          void Function(BehaviorStyleCreateBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  BehaviorStyleCreateBuilder toBuilder() =>
      BehaviorStyleCreateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is BehaviorStyleCreate &&
        name == other.name &&
        description == other.description;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, description.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'BehaviorStyleCreate')
          ..add('name', name)
          ..add('description', description))
        .toString();
  }
}

class BehaviorStyleCreateBuilder
    implements Builder<BehaviorStyleCreate, BehaviorStyleCreateBuilder> {
  _$BehaviorStyleCreate? _$v;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  String? _description;
  String? get description => _$this._description;
  set description(String? description) => _$this._description = description;

  BehaviorStyleCreateBuilder() {
    BehaviorStyleCreate._defaults(this);
  }

  BehaviorStyleCreateBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _name = $v.name;
      _description = $v.description;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(BehaviorStyleCreate other) {
    _$v = other as _$BehaviorStyleCreate;
  }

  @override
  void update(void Function(BehaviorStyleCreateBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  BehaviorStyleCreate build() => _build();

  _$BehaviorStyleCreate _build() {
    final _$result = _$v ??
        _$BehaviorStyleCreate._(
          name: BuiltValueNullFieldError.checkNotNull(
              name, r'BehaviorStyleCreate', 'name'),
          description: description,
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
