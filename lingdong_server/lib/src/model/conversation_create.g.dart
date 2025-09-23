// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'conversation_create.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$ConversationCreate extends ConversationCreate {
  @override
  final int targetUserId;

  factory _$ConversationCreate(
          [void Function(ConversationCreateBuilder)? updates]) =>
      (ConversationCreateBuilder()..update(updates))._build();

  _$ConversationCreate._({required this.targetUserId}) : super._();
  @override
  ConversationCreate rebuild(
          void Function(ConversationCreateBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ConversationCreateBuilder toBuilder() =>
      ConversationCreateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ConversationCreate && targetUserId == other.targetUserId;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, targetUserId.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ConversationCreate')
          ..add('targetUserId', targetUserId))
        .toString();
  }
}

class ConversationCreateBuilder
    implements Builder<ConversationCreate, ConversationCreateBuilder> {
  _$ConversationCreate? _$v;

  int? _targetUserId;
  int? get targetUserId => _$this._targetUserId;
  set targetUserId(int? targetUserId) => _$this._targetUserId = targetUserId;

  ConversationCreateBuilder() {
    ConversationCreate._defaults(this);
  }

  ConversationCreateBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _targetUserId = $v.targetUserId;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ConversationCreate other) {
    _$v = other as _$ConversationCreate;
  }

  @override
  void update(void Function(ConversationCreateBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ConversationCreate build() => _build();

  _$ConversationCreate _build() {
    final _$result = _$v ??
        _$ConversationCreate._(
          targetUserId: BuiltValueNullFieldError.checkNotNull(
              targetUserId, r'ConversationCreate', 'targetUserId'),
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
