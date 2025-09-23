//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'conversation_create.g.dart';

/// ConversationCreate，创建会话请求模型
///
/// Properties:
/// * [targetUserId] - Target User Id，目标用户ID
@BuiltValue()
abstract class ConversationCreate implements Built<ConversationCreate, ConversationCreateBuilder> {
  /// Target User Id，目标用户ID
  @BuiltValueField(wireName: r'target_user_id')
  int get targetUserId;

  ConversationCreate._();

  factory ConversationCreate([void updates(ConversationCreateBuilder b)]) = _$ConversationCreate;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(ConversationCreateBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<ConversationCreate> get serializer => _$ConversationCreateSerializer();
}

class _$ConversationCreateSerializer implements PrimitiveSerializer<ConversationCreate> {
  @override
  final Iterable<Type> types = const [ConversationCreate, _$ConversationCreate];

  @override
  final String wireName = r'ConversationCreate';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    ConversationCreate object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'target_user_id';
    yield serializers.serialize(
      object.targetUserId,
      specifiedType: const FullType(int),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    ConversationCreate object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required ConversationCreateBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'target_user_id':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.targetUserId = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  ConversationCreate deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = ConversationCreateBuilder();
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

