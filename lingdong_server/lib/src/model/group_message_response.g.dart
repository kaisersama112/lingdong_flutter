// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'group_message_response.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$GroupMessageResponse extends GroupMessageResponse {
  @override
  final int id;
  @override
  final int groupId;
  @override
  final int senderId;
  @override
  final String senderNickname;
  @override
  final String content;
  @override
  final int messageType;
  @override
  final DateTime createdAt;
  @override
  final String? mediaUrl;
  @override
  final bool? isRead;

  factory _$GroupMessageResponse(
          [void Function(GroupMessageResponseBuilder)? updates]) =>
      (GroupMessageResponseBuilder()..update(updates))._build();

  _$GroupMessageResponse._(
      {required this.id,
      required this.groupId,
      required this.senderId,
      required this.senderNickname,
      required this.content,
      required this.messageType,
      required this.createdAt,
      this.mediaUrl,
      this.isRead})
      : super._();
  @override
  GroupMessageResponse rebuild(
          void Function(GroupMessageResponseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GroupMessageResponseBuilder toBuilder() =>
      GroupMessageResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GroupMessageResponse &&
        id == other.id &&
        groupId == other.groupId &&
        senderId == other.senderId &&
        senderNickname == other.senderNickname &&
        content == other.content &&
        messageType == other.messageType &&
        createdAt == other.createdAt &&
        mediaUrl == other.mediaUrl &&
        isRead == other.isRead;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, groupId.hashCode);
    _$hash = $jc(_$hash, senderId.hashCode);
    _$hash = $jc(_$hash, senderNickname.hashCode);
    _$hash = $jc(_$hash, content.hashCode);
    _$hash = $jc(_$hash, messageType.hashCode);
    _$hash = $jc(_$hash, createdAt.hashCode);
    _$hash = $jc(_$hash, mediaUrl.hashCode);
    _$hash = $jc(_$hash, isRead.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GroupMessageResponse')
          ..add('id', id)
          ..add('groupId', groupId)
          ..add('senderId', senderId)
          ..add('senderNickname', senderNickname)
          ..add('content', content)
          ..add('messageType', messageType)
          ..add('createdAt', createdAt)
          ..add('mediaUrl', mediaUrl)
          ..add('isRead', isRead))
        .toString();
  }
}

class GroupMessageResponseBuilder
    implements Builder<GroupMessageResponse, GroupMessageResponseBuilder> {
  _$GroupMessageResponse? _$v;

  int? _id;
  int? get id => _$this._id;
  set id(int? id) => _$this._id = id;

  int? _groupId;
  int? get groupId => _$this._groupId;
  set groupId(int? groupId) => _$this._groupId = groupId;

  int? _senderId;
  int? get senderId => _$this._senderId;
  set senderId(int? senderId) => _$this._senderId = senderId;

  String? _senderNickname;
  String? get senderNickname => _$this._senderNickname;
  set senderNickname(String? senderNickname) =>
      _$this._senderNickname = senderNickname;

  String? _content;
  String? get content => _$this._content;
  set content(String? content) => _$this._content = content;

  int? _messageType;
  int? get messageType => _$this._messageType;
  set messageType(int? messageType) => _$this._messageType = messageType;

  DateTime? _createdAt;
  DateTime? get createdAt => _$this._createdAt;
  set createdAt(DateTime? createdAt) => _$this._createdAt = createdAt;

  String? _mediaUrl;
  String? get mediaUrl => _$this._mediaUrl;
  set mediaUrl(String? mediaUrl) => _$this._mediaUrl = mediaUrl;

  bool? _isRead;
  bool? get isRead => _$this._isRead;
  set isRead(bool? isRead) => _$this._isRead = isRead;

  GroupMessageResponseBuilder() {
    GroupMessageResponse._defaults(this);
  }

  GroupMessageResponseBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _groupId = $v.groupId;
      _senderId = $v.senderId;
      _senderNickname = $v.senderNickname;
      _content = $v.content;
      _messageType = $v.messageType;
      _createdAt = $v.createdAt;
      _mediaUrl = $v.mediaUrl;
      _isRead = $v.isRead;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GroupMessageResponse other) {
    _$v = other as _$GroupMessageResponse;
  }

  @override
  void update(void Function(GroupMessageResponseBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GroupMessageResponse build() => _build();

  _$GroupMessageResponse _build() {
    final _$result = _$v ??
        _$GroupMessageResponse._(
          id: BuiltValueNullFieldError.checkNotNull(
              id, r'GroupMessageResponse', 'id'),
          groupId: BuiltValueNullFieldError.checkNotNull(
              groupId, r'GroupMessageResponse', 'groupId'),
          senderId: BuiltValueNullFieldError.checkNotNull(
              senderId, r'GroupMessageResponse', 'senderId'),
          senderNickname: BuiltValueNullFieldError.checkNotNull(
              senderNickname, r'GroupMessageResponse', 'senderNickname'),
          content: BuiltValueNullFieldError.checkNotNull(
              content, r'GroupMessageResponse', 'content'),
          messageType: BuiltValueNullFieldError.checkNotNull(
              messageType, r'GroupMessageResponse', 'messageType'),
          createdAt: BuiltValueNullFieldError.checkNotNull(
              createdAt, r'GroupMessageResponse', 'createdAt'),
          mediaUrl: mediaUrl,
          isRead: isRead,
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
