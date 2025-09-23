//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:lingdong_server/src/model/conversation_message_response.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'conversation_response.g.dart';

/// ConversationResponse，会话响应模型
///
/// Properties:
/// * [id] - Id，会话ID
/// * [sessionId] - Session Id，会话唯一标识
/// * [userId] - User Id，用户ID
/// * [targetUserId] - Target User Id，目标用户ID
/// * [targetUsername] - Target Username，目标用户名
/// * [targetAvatar] 
/// * [createdAt] - Created At，创建时间
/// * [updatedAt] - Updated At，更新时间
/// * [lastMessage] 
/// * [unreadCount] - Unread Count，未读消息数
@BuiltValue()
abstract class ConversationResponse implements Built<ConversationResponse, ConversationResponseBuilder> {
  /// Id，会话ID
  @BuiltValueField(wireName: r'id')
  int get id;

  /// Session Id，会话唯一标识
  @BuiltValueField(wireName: r'session_id')
  String get sessionId;

  /// User Id，用户ID
  @BuiltValueField(wireName: r'user_id')
  int get userId;

  /// Target User Id，目标用户ID
  @BuiltValueField(wireName: r'target_user_id')
  int get targetUserId;

  /// Target Username，目标用户名
  @BuiltValueField(wireName: r'target_username')
  String get targetUsername;

  @BuiltValueField(wireName: r'target_avatar')
  String? get targetAvatar;

  /// Created At，创建时间
  @BuiltValueField(wireName: r'created_at')
  DateTime get createdAt;

  /// Updated At，更新时间
  @BuiltValueField(wireName: r'updated_at')
  DateTime get updatedAt;

  @BuiltValueField(wireName: r'last_message')
  ConversationMessageResponse? get lastMessage;

  /// Unread Count，未读消息数
  @BuiltValueField(wireName: r'unread_count')
  int? get unreadCount;

  ConversationResponse._();

  factory ConversationResponse([void updates(ConversationResponseBuilder b)]) = _$ConversationResponse;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(ConversationResponseBuilder b) => b
      ..unreadCount = 0;

  @BuiltValueSerializer(custom: true)
  static Serializer<ConversationResponse> get serializer => _$ConversationResponseSerializer();
}

class _$ConversationResponseSerializer implements PrimitiveSerializer<ConversationResponse> {
  @override
  final Iterable<Type> types = const [ConversationResponse, _$ConversationResponse];

  @override
  final String wireName = r'ConversationResponse';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    ConversationResponse object, {
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
    yield r'user_id';
    yield serializers.serialize(
      object.userId,
      specifiedType: const FullType(int),
    );
    yield r'target_user_id';
    yield serializers.serialize(
      object.targetUserId,
      specifiedType: const FullType(int),
    );
    yield r'target_username';
    yield serializers.serialize(
      object.targetUsername,
      specifiedType: const FullType(String),
    );
    if (object.targetAvatar != null) {
      yield r'target_avatar';
      yield serializers.serialize(
        object.targetAvatar,
        specifiedType: const FullType.nullable(String),
      );
    }
    yield r'created_at';
    yield serializers.serialize(
      object.createdAt,
      specifiedType: const FullType(DateTime),
    );
    yield r'updated_at';
    yield serializers.serialize(
      object.updatedAt,
      specifiedType: const FullType(DateTime),
    );
    if (object.lastMessage != null) {
      yield r'last_message';
      yield serializers.serialize(
        object.lastMessage,
        specifiedType: const FullType.nullable(ConversationMessageResponse),
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
    ConversationResponse object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required ConversationResponseBuilder result,
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
        case r'user_id':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.userId = valueDes;
          break;
        case r'target_user_id':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.targetUserId = valueDes;
          break;
        case r'target_username':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
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
        case r'created_at':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(DateTime),
          ) as DateTime;
          result.createdAt = valueDes;
          break;
        case r'updated_at':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(DateTime),
          ) as DateTime;
          result.updatedAt = valueDes;
          break;
        case r'last_message':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(ConversationMessageResponse),
          ) as ConversationMessageResponse?;
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
  ConversationResponse deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = ConversationResponseBuilder();
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

