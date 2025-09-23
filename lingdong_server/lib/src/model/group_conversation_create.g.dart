// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'group_conversation_create.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$GroupConversationCreate extends GroupConversationCreate {
  @override
  final String name;
  @override
  final String? avatar;
  @override
  final BuiltList<int> memberIds;

  factory _$GroupConversationCreate(
          [void Function(GroupConversationCreateBuilder)? updates]) =>
      (GroupConversationCreateBuilder()..update(updates))._build();

  _$GroupConversationCreate._(
      {required this.name, this.avatar, required this.memberIds})
      : super._();
  @override
  GroupConversationCreate rebuild(
          void Function(GroupConversationCreateBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GroupConversationCreateBuilder toBuilder() =>
      GroupConversationCreateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GroupConversationCreate &&
        name == other.name &&
        avatar == other.avatar &&
        memberIds == other.memberIds;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, avatar.hashCode);
    _$hash = $jc(_$hash, memberIds.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GroupConversationCreate')
          ..add('name', name)
          ..add('avatar', avatar)
          ..add('memberIds', memberIds))
        .toString();
  }
}

class GroupConversationCreateBuilder
    implements
        Builder<GroupConversationCreate, GroupConversationCreateBuilder> {
  _$GroupConversationCreate? _$v;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  String? _avatar;
  String? get avatar => _$this._avatar;
  set avatar(String? avatar) => _$this._avatar = avatar;

  ListBuilder<int>? _memberIds;
  ListBuilder<int> get memberIds => _$this._memberIds ??= ListBuilder<int>();
  set memberIds(ListBuilder<int>? memberIds) => _$this._memberIds = memberIds;

  GroupConversationCreateBuilder() {
    GroupConversationCreate._defaults(this);
  }

  GroupConversationCreateBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _name = $v.name;
      _avatar = $v.avatar;
      _memberIds = $v.memberIds.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GroupConversationCreate other) {
    _$v = other as _$GroupConversationCreate;
  }

  @override
  void update(void Function(GroupConversationCreateBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GroupConversationCreate build() => _build();

  _$GroupConversationCreate _build() {
    _$GroupConversationCreate _$result;
    try {
      _$result = _$v ??
          _$GroupConversationCreate._(
            name: BuiltValueNullFieldError.checkNotNull(
                name, r'GroupConversationCreate', 'name'),
            avatar: avatar,
            memberIds: memberIds.build(),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'memberIds';
        memberIds.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'GroupConversationCreate', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
