// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dog_care_guide_base.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$DogCareGuideBase extends DogCareGuideBase {
  @override
  final int guideId;

  factory _$DogCareGuideBase(
          [void Function(DogCareGuideBaseBuilder)? updates]) =>
      (DogCareGuideBaseBuilder()..update(updates))._build();

  _$DogCareGuideBase._({required this.guideId}) : super._();
  @override
  DogCareGuideBase rebuild(void Function(DogCareGuideBaseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  DogCareGuideBaseBuilder toBuilder() =>
      DogCareGuideBaseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is DogCareGuideBase && guideId == other.guideId;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, guideId.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'DogCareGuideBase')
          ..add('guideId', guideId))
        .toString();
  }
}

class DogCareGuideBaseBuilder
    implements Builder<DogCareGuideBase, DogCareGuideBaseBuilder> {
  _$DogCareGuideBase? _$v;

  int? _guideId;
  int? get guideId => _$this._guideId;
  set guideId(int? guideId) => _$this._guideId = guideId;

  DogCareGuideBaseBuilder() {
    DogCareGuideBase._defaults(this);
  }

  DogCareGuideBaseBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _guideId = $v.guideId;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(DogCareGuideBase other) {
    _$v = other as _$DogCareGuideBase;
  }

  @override
  void update(void Function(DogCareGuideBaseBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  DogCareGuideBase build() => _build();

  _$DogCareGuideBase _build() {
    final _$result = _$v ??
        _$DogCareGuideBase._(
          guideId: BuiltValueNullFieldError.checkNotNull(
              guideId, r'DogCareGuideBase', 'guideId'),
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
