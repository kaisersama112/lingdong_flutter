// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'group_message_create.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$GroupMessageCreate extends GroupMessageCreate {
  @override
  final int groupId;
  @override
  final String content;
  @override
  final int? messageType;
  @override
  final int? mediaId;

  factory _$GroupMessageCreate(
          [void Function(GroupMessageCreateBuilder)? updates]) =>
      (GroupMessageCreateBuilder()..update(updates))._build();

  _$GroupMessageCreate._(
      {required this.groupId,
      required this.content,
      this.messageType,
      this.mediaId})
      : super._();
  @override
  GroupMessageCreate rebuild(
          void Function(GroupMessageCreateBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GroupMessageCreateBuilder toBuilder() =>
      GroupMessageCreateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GroupMessageCreate &&
        groupId == other.groupId &&
        content == other.content &&
        messageType == other.messageType &&
        mediaId == other.mediaId;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, groupId.hashCode);
    _$hash = $jc(_$hash, content.hashCode);
    _$hash = $jc(_$hash, messageType.hashCode);
    _$hash = $jc(_$hash, mediaId.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GroupMessageCreate')
          ..add('groupId', groupId)
          ..add('content', content)
          ..add('messageType', messageType)
          ..add('mediaId', mediaId))
        .toString();
  }
}

class GroupMessageCreateBuilder
    implements Builder<GroupMessageCreate, GroupMessageCreateBuilder> {
  _$GroupMessageCreate? _$v;

  int? _groupId;
  int? get groupId => _$this._groupId;
  set groupId(int? groupId) => _$this._groupId = groupId;

  String? _content;
  String? get content => _$this._content;
  set content(String? content) => _$this._content = content;

  int? _messageType;
  int? get messageType => _$this._messageType;
  set messageType(int? messageType) => _$this._messageType = messageType;

  int? _mediaId;
  int? get mediaId => _$this._mediaId;
  set mediaId(int? mediaId) => _$this._mediaId = mediaId;

  GroupMessageCreateBuilder() {
    GroupMessageCreate._defaults(this);
  }

  GroupMessageCreateBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _groupId = $v.groupId;
      _content = $v.content;
      _messageType = $v.messageType;
      _mediaId = $v.mediaId;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GroupMessageCreate other) {
    _$v = other as _$GroupMessageCreate;
  }

  @override
  void update(void Function(GroupMessageCreateBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GroupMessageCreate build() => _build();

  _$GroupMessageCreate _build() {
    final _$result = _$v ??
        _$GroupMessageCreate._(
          groupId: BuiltValueNullFieldError.checkNotNull(
              groupId, r'GroupMessageCreate', 'groupId'),
          content: BuiltValueNullFieldError.checkNotNull(
              content, r'GroupMessageCreate', 'content'),
          messageType: messageType,
          mediaId: mediaId,
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
