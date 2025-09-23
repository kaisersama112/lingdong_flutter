//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'add_message_to_conversation.g.dart';

/// AddMessageToConversation，向会话添加消息请求模型
///
/// Properties:
/// * [sessionId] - Session Id，会话唯一标识
/// * [content] - Content，消息内容
/// * [messageType] - Message Type，消息类型
/// * [mediaId] 
@BuiltValue()
abstract class AddMessageToConversation implements Built<AddMessageToConversation, AddMessageToConversationBuilder> {
  /// Session Id，会话唯一标识
  @BuiltValueField(wireName: r'session_id')
  String get sessionId;

  /// Content，消息内容
  @BuiltValueField(wireName: r'content')
  String get content;

  /// Message Type，消息类型
  @BuiltValueField(wireName: r'message_type')
  int? get messageType;

  @BuiltValueField(wireName: r'media_id')
  int? get mediaId;

  AddMessageToConversation._();

  factory AddMessageToConversation([void updates(AddMessageToConversationBuilder b)]) = _$AddMessageToConversation;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(AddMessageToConversationBuilder b) => b
      ..messageType = 0;

  @BuiltValueSerializer(custom: true)
  static Serializer<AddMessageToConversation> get serializer => _$AddMessageToConversationSerializer();
}

class _$AddMessageToConversationSerializer implements PrimitiveSerializer<AddMessageToConversation> {
  @override
  final Iterable<Type> types = const [AddMessageToConversation, _$AddMessageToConversation];

  @override
  final String wireName = r'AddMessageToConversation';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    AddMessageToConversation object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'session_id';
    yield serializers.serialize(
      object.sessionId,
      specifiedType: const FullType(String),
    );
    yield r'content';
    yield serializers.serialize(
      object.content,
      specifiedType: const FullType(String),
    );
    if (object.messageType != null) {
      yield r'message_type';
      yield serializers.serialize(
        object.messageType,
        specifiedType: const FullType(int),
      );
    }
    if (object.mediaId != null) {
      yield r'media_id';
      yield serializers.serialize(
        object.mediaId,
        specifiedType: const FullType.nullable(int),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    AddMessageToConversation object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required AddMessageToConversationBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'session_id':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.sessionId = valueDes;
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
        case r'media_id':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(int),
          ) as int?;
          if (valueDes == null) continue;
          result.mediaId = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  AddMessageToConversation deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = AddMessageToConversationBuilder();
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

