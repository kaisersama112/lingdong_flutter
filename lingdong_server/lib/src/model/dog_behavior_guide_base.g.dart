// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dog_behavior_guide_base.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$DogBehaviorGuideBase extends DogBehaviorGuideBase {
  @override
  final int behaviorGuideId;

  factory _$DogBehaviorGuideBase(
          [void Function(DogBehaviorGuideBaseBuilder)? updates]) =>
      (DogBehaviorGuideBaseBuilder()..update(updates))._build();

  _$DogBehaviorGuideBase._({required this.behaviorGuideId}) : super._();
  @override
  DogBehaviorGuideBase rebuild(
          void Function(DogBehaviorGuideBaseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  DogBehaviorGuideBaseBuilder toBuilder() =>
      DogBehaviorGuideBaseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is DogBehaviorGuideBase &&
        behaviorGuideId == other.behaviorGuideId;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, behaviorGuideId.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'DogBehaviorGuideBase')
          ..add('behaviorGuideId', behaviorGuideId))
        .toString();
  }
}

class DogBehaviorGuideBaseBuilder
    implements Builder<DogBehaviorGuideBase, DogBehaviorGuideBaseBuilder> {
  _$DogBehaviorGuideBase? _$v;

  int? _behaviorGuideId;
  int? get behaviorGuideId => _$this._behaviorGuideId;
  set behaviorGuideId(int? behaviorGuideId) =>
      _$this._behaviorGuideId = behaviorGuideId;

  DogBehaviorGuideBaseBuilder() {
    DogBehaviorGuideBase._defaults(this);
  }

  DogBehaviorGuideBaseBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _behaviorGuideId = $v.behaviorGuideId;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(DogBehaviorGuideBase other) {
    _$v = other as _$DogBehaviorGuideBase;
  }

  @override
  void update(void Function(DogBehaviorGuideBaseBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  DogBehaviorGuideBase build() => _build();

  _$DogBehaviorGuideBase _build() {
    final _$result = _$v ??
        _$DogBehaviorGuideBase._(
          behaviorGuideId: BuiltValueNullFieldError.checkNotNull(
              behaviorGuideId, r'DogBehaviorGuideBase', 'behaviorGuideId'),
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
