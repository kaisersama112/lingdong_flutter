// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_type_create.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$TaskTypeCreate extends TaskTypeCreate {
  @override
  final String name;
  @override
  final String? description;

  factory _$TaskTypeCreate([void Function(TaskTypeCreateBuilder)? updates]) =>
      (TaskTypeCreateBuilder()..update(updates))._build();

  _$TaskTypeCreate._({required this.name, this.description}) : super._();
  @override
  TaskTypeCreate rebuild(void Function(TaskTypeCreateBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  TaskTypeCreateBuilder toBuilder() => TaskTypeCreateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is TaskTypeCreate &&
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
    return (newBuiltValueToStringHelper(r'TaskTypeCreate')
          ..add('name', name)
          ..add('description', description))
        .toString();
  }
}

class TaskTypeCreateBuilder
    implements Builder<TaskTypeCreate, TaskTypeCreateBuilder> {
  _$TaskTypeCreate? _$v;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  String? _description;
  String? get description => _$this._description;
  set description(String? description) => _$this._description = description;

  TaskTypeCreateBuilder() {
    TaskTypeCreate._defaults(this);
  }

  TaskTypeCreateBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _name = $v.name;
      _description = $v.description;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(TaskTypeCreate other) {
    _$v = other as _$TaskTypeCreate;
  }

  @override
  void update(void Function(TaskTypeCreateBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  TaskTypeCreate build() => _build();

  _$TaskTypeCreate _build() {
    final _$result = _$v ??
        _$TaskTypeCreate._(
          name: BuiltValueNullFieldError.checkNotNull(
              name, r'TaskTypeCreate', 'name'),
          description: description,
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
