//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'group_message_response.g.dart';

/// GroupMessageResponse，群消息响应模型
///
/// Properties:
/// * [id] - Id，消息ID
/// * [groupId] - Group Id，群聊ID
/// * [senderId] - Sender Id，发送者ID
/// * [senderNickname] - Sender Nickname，发送者昵称
/// * [content] - Content，消息内容
/// * [messageType] - Message Type，消息类型
/// * [createdAt] - Created At，发送时间
/// * [mediaUrl] 
/// * [isRead] - Is Read，是否已读
@BuiltValue()
abstract class GroupMessageResponse implements Built<GroupMessageResponse, GroupMessageResponseBuilder> {
  /// Id，消息ID
  @BuiltValueField(wireName: r'id')
  int get id;

  /// Group Id，群聊ID
  @BuiltValueField(wireName: r'group_id')
  int get groupId;

  /// Sender Id，发送者ID
  @BuiltValueField(wireName: r'sender_id')
  int get senderId;

  /// Sender Nickname，发送者昵称
  @BuiltValueField(wireName: r'sender_nickname')
  String get senderNickname;

  /// Content，消息内容
  @BuiltValueField(wireName: r'content')
  String get content;

  /// Message Type，消息类型
  @BuiltValueField(wireName: r'message_type')
  int get messageType;

  /// Created At，发送时间
  @BuiltValueField(wireName: r'created_at')
  DateTime get createdAt;

  @BuiltValueField(wireName: r'media_url')
  String? get mediaUrl;

  /// Is Read，是否已读
  @BuiltValueField(wireName: r'is_read')
  bool? get isRead;

  GroupMessageResponse._();

  factory GroupMessageResponse([void updates(GroupMessageResponseBuilder b)]) = _$GroupMessageResponse;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(GroupMessageResponseBuilder b) => b
      ..isRead = false;

  @BuiltValueSerializer(custom: true)
  static Serializer<GroupMessageResponse> get serializer => _$GroupMessageResponseSerializer();
}

class _$GroupMessageResponseSerializer implements PrimitiveSerializer<GroupMessageResponse> {
  @override
  final Iterable<Type> types = const [GroupMessageResponse, _$GroupMessageResponse];

  @override
  final String wireName = r'GroupMessageResponse';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    GroupMessageResponse object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'id';
    yield serializers.serialize(
      object.id,
      specifiedType: const FullType(int),
    );
    yield r'group_id';
    yield serializers.serialize(
      object.groupId,
      specifiedType: const FullType(int),
    );
    yield r'sender_id';
    yield serializers.serialize(
      object.senderId,
      specifiedType: const FullType(int),
    );
    yield r'sender_nickname';
    yield serializers.serialize(
      object.senderNickname,
      specifiedType: const FullType(String),
    );
    yield r'content';
    yield serializers.serialize(
      object.content,
      specifiedType: const FullType(String),
    );
    yield r'message_type';
    yield serializers.serialize(
      object.messageType,
      specifiedType: const FullType(int),
    );
    yield r'created_at';
    yield serializers.serialize(
      object.createdAt,
      specifiedType: const FullType(DateTime),
    );
    if (object.mediaUrl != null) {
      yield r'media_url';
      yield serializers.serialize(
        object.mediaUrl,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.isRead != null) {
      yield r'is_read';
      yield serializers.serialize(
        object.isRead,
        specifiedType: const FullType(bool),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    GroupMessageResponse object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required GroupMessageResponseBuilder result,
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
        case r'group_id':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.groupId = valueDes;
          break;
        case r'sender_id':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.senderId = valueDes;
          break;
        case r'sender_nickname':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.senderNickname = valueDes;
          break;
        case r'content':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.content = valueDes;
          break;
        case r'message_type':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.messageType = valueDes;
          break;
        case r'created_at':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(DateTime),
          ) as DateTime;
          result.createdAt = valueDes;
          break;
        case r'media_url':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.mediaUrl = valueDes;
          break;
        case r'is_read':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(bool),
          ) as bool;
          result.isRead = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  GroupMessageResponse deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = GroupMessageResponseBuilder();
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

