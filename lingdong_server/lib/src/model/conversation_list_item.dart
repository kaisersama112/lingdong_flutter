//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'conversation_list_item.g.dart';

/// ConversationListItem，会话列表项模型
///
/// Properties:
/// * [id] - Id，会话ID
/// * [sessionId] - Session Id，会话唯一标识
/// * [targetUserId] 
/// * [targetUsername] 
/// * [targetAvatar] 
/// * [groupId] 
/// * [groupName] 
/// * [groupAvatar] 
/// * [lastMessage] - Last Message，最后一条消息
/// * [lastMessageTime] - Last Message Time，最后一条消息时间
/// * [unreadCount] - Unread Count，未读消息数
@BuiltValue()
abstract class ConversationListItem implements Built<ConversationListItem, ConversationListItemBuilder> {
  /// Id，会话ID
  @BuiltValueField(wireName: r'id')
  int get id;

  /// Session Id，会话唯一标识
  @BuiltValueField(wireName: r'session_id')
  String get sessionId;

  @BuiltValueField(wireName: r'target_user_id')
  int? get targetUserId;

  @BuiltValueField(wireName: r'target_username')
  String? get targetUsername;

  @BuiltValueField(wireName: r'target_avatar')
  String? get targetAvatar;

  @BuiltValueField(wireName: r'group_id')
  int? get groupId;

  @BuiltValueField(wireName: r'group_name')
  String? get groupName;

  @BuiltValueField(wireName: r'group_avatar')
  String? get groupAvatar;

  /// Last Message，最后一条消息
  @BuiltValueField(wireName: r'last_message')
  String get lastMessage;

  /// Last Message Time，最后一条消息时间
  @BuiltValueField(wireName: r'last_message_time')
  DateTime get lastMessageTime;

  /// Unread Count，未读消息数
  @BuiltValueField(wireName: r'unread_count')
  int? get unreadCount;

  ConversationListItem._();

  factory ConversationListItem([void updates(ConversationListItemBuilder b)]) = _$ConversationListItem;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(ConversationListItemBuilder b) => b
      ..unreadCount = 0;

  @BuiltValueSerializer(custom: true)
  static Serializer<ConversationListItem> get serializer => _$ConversationListItemSerializer();
}

class _$ConversationListItemSerializer implements PrimitiveSerializer<ConversationListItem> {
  @override
  final Iterable<Type> types = const [ConversationListItem, _$ConversationListItem];

  @override
  final String wireName = r'ConversationListItem';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    ConversationListItem object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'id';
    yield serializers.serialize(
      object.id,
      specifiedType: const FullType(int),
    );
    yield r'session_id';
    yield serializers.serialize(
      object.sessionId,
      specifiedType: const FullType(String),
    );
    if (object.targetUserId != null) {
      yield r'target_user_id';
      yield serializers.serialize(
        object.targetUserId,
        specifiedType: const FullType.nullable(int),
      );
    }
    if (object.targetUsername != null) {
      yield r'target_username';
      yield serializers.serialize(
        object.targetUsername,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.targetAvatar != null) {
      yield r'target_avatar';
      yield serializers.serialize(
        object.targetAvatar,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.groupId != null) {
      yield r'group_id';
      yield serializers.serialize(
        object.groupId,
        specifiedType: const FullType.nullable(int),
      );
    }
    if (object.groupName != null) {
      yield r'group_name';
      yield serializers.serialize(
        object.groupName,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.groupAvatar != null) {
      yield r'group_avatar';
      yield serializers.serialize(
        object.groupAvatar,
        specifiedType: const FullType.nullable(String),
      );
    }
    yield r'last_message';
    yield serializers.serialize(
      object.lastMessage,
      specifiedType: const FullType(String),
    );
    yield r'last_message_time';
    yield serializers.serialize(
      object.lastMessageTime,
      specifiedType: const FullType(DateTime),
    );
    if (object.unreadCount != null) {
      yield r'unread_count';
      yield serializers.serialize(
        object.unreadCount,
        specifiedType: const FullType(int),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    ConversationListItem object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required ConversationListItemBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'id':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.id = valueDes;
          break;
        case r'session_id':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.sessionId = valueDes;
          break;
        case r'target_user_id':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(int),
          ) as int?;
          if (valueDes == null) continue;
          result.targetUserId = valueDes;
          break;
        case r'target_username':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.targetUsername = valueDes;
          break;
        case r'target_avatar':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.targetAvatar = valueDes;
          break;
        case r'group_id':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(int),
          ) as int?;
          if (valueDes == null) continue;
          result.groupId = valueDes;
          break;
        case r'group_name':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.groupName = valueDes;
          break;
        case r'group_avatar':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.groupAvatar = valueDes;
          break;
        case r'last_message':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.lastMessage = valueDes;
          break;
        case r'last_message_time':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(DateTime),
          ) as DateTime;
          result.lastMessageTime = valueDes;
          break;
        case r'unread_count':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.unreadCount = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  ConversationListItem deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = ConversationListItemBuilder();
    final serializedList = (serialized as Iterable<Object?>).toList();
    final unhandled = <Object?>[];
    _deserializeProperties(
      serializers,
      serialized,
      specifiedType: specifiedType,
      serializedList: serializedList,
      unhandled: unhandled,
      result: result,
    );
    return result.build();
  }
}

