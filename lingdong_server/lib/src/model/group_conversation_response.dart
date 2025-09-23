//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:lingdong_server/src/model/group_message_response.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'group_conversation_response.g.dart';

/// GroupConversationResponse，群聊响应模型
///
/// Properties:
/// * [id] - Id，群聊ID
/// * [name] - Name，群聊名称
/// * [avatar] 
/// * [creatorId] - Creator Id，创建者ID
/// * [createdAt] - Created At，创建时间
/// * [memberCount] - Member Count，成员数量
/// * [lastMessage] 
/// * [unreadCount] - Unread Count，未读消息数
@BuiltValue()
abstract class GroupConversationResponse implements Built<GroupConversationResponse, GroupConversationResponseBuilder> {
  /// Id，群聊ID
  @BuiltValueField(wireName: r'id')
  int get id;

  /// Name，群聊名称
  @BuiltValueField(wireName: r'name')
  String get name;

  @BuiltValueField(wireName: r'avatar')
  String? get avatar;

  /// Creator Id，创建者ID
  @BuiltValueField(wireName: r'creator_id')
  int get creatorId;

  /// Created At，创建时间
  @BuiltValueField(wireName: r'created_at')
  DateTime get createdAt;

  /// Member Count，成员数量
  @BuiltValueField(wireName: r'member_count')
  int get memberCount;

  @BuiltValueField(wireName: r'last_message')
  GroupMessageResponse? get lastMessage;

  /// Unread Count，未读消息数
  @BuiltValueField(wireName: r'unread_count')
  int? get unreadCount;

  GroupConversationResponse._();

  factory GroupConversationResponse([void updates(GroupConversationResponseBuilder b)]) = _$GroupConversationResponse;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(GroupConversationResponseBuilder b) => b
      ..unreadCount = 0;

  @BuiltValueSerializer(custom: true)
  static Serializer<GroupConversationResponse> get serializer => _$GroupConversationResponseSerializer();
}

class _$GroupConversationResponseSerializer implements PrimitiveSerializer<GroupConversationResponse> {
  @override
  final Iterable<Type> types = const [GroupConversationResponse, _$GroupConversationResponse];

  @override
  final String wireName = r'GroupConversationResponse';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    GroupConversationResponse object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'id';
    yield serializers.serialize(
      object.id,
      specifiedType: const FullType(int),
    );
    yield r'name';
    yield serializers.serialize(
      object.name,
      specifiedType: const FullType(String),
    );
    if (object.avatar != null) {
      yield r'avatar';
      yield serializers.serialize(
        object.avatar,
        specifiedType: const FullType.nullable(String),
      );
    }
    yield r'creator_id';
    yield serializers.serialize(
      object.creatorId,
      specifiedType: const FullType(int),
    );
    yield r'created_at';
    yield serializers.serialize(
      object.createdAt,
      specifiedType: const FullType(DateTime),
    );
    yield r'member_count';
    yield serializers.serialize(
      object.memberCount,
      specifiedType: const FullType(int),
    );
    if (object.lastMessage != null) {
      yield r'last_message';
      yield serializers.serialize(
        object.lastMessage,
        specifiedType: const FullType.nullable(GroupMessageResponse),
      );
    }
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
    GroupConversationResponse object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required GroupConversationResponseBuilder result,
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
        case r'name':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.name = valueDes;
          break;
        case r'avatar':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.avatar = valueDes;
          break;
        case r'creator_id':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.creatorId = valueDes;
          break;
        case r'created_at':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(DateTime),
          ) as DateTime;
          result.createdAt = valueDes;
          break;
        case r'member_count':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.memberCount = valueDes;
          break;
        case r'last_message':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(GroupMessageResponse),
          ) as GroupMessageResponse?;
          if (valueDes == null) continue;
          result.lastMessage.replace(valueDes);
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
  GroupConversationResponse deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = GroupConversationResponseBuilder();
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

