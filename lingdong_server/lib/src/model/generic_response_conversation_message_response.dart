//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:lingdong_server/src/model/conversation_message_response.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'generic_response_conversation_message_response.g.dart';

/// GenericResponse[ConversationMessageResponse]
///
/// Properties:
/// * [code] 
/// * [msg] 
/// * [data] 
@BuiltValue()
abstract class GenericResponseConversationMessageResponse implements Built<GenericResponseConversationMessageResponse, GenericResponseConversationMessageResponseBuilder> {
  @BuiltValueField(wireName: r'code')
  int? get code;

  @BuiltValueField(wireName: r'msg')
  String? get msg;

  @BuiltValueField(wireName: r'data')
  ConversationMessageResponse? get data;

  GenericResponseConversationMessageResponse._();

  factory GenericResponseConversationMessageResponse([void updates(GenericResponseConversationMessageResponseBuilder b)]) = _$GenericResponseConversationMessageResponse;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(GenericResponseConversationMessageResponseBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<GenericResponseConversationMessageResponse> get serializer => _$GenericResponseConversationMessageResponseSerializer();
}

class _$GenericResponseConversationMessageResponseSerializer implements PrimitiveSerializer<GenericResponseConversationMessageResponse> {
  @override
  final Iterable<Type> types = const [GenericResponseConversationMessageResponse, _$GenericResponseConversationMessageResponse];

  @override
  final String wireName = r'GenericResponseConversationMessageResponse';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    GenericResponseConversationMessageResponse object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.code != null) {
      yield r'code';
      yield serializers.serialize(
        object.code,
        specifiedType: const FullType.nullable(int),
      );
    }
    if (object.msg != null) {
      yield r'msg';
      yield serializers.serialize(
        object.msg,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.data != null) {
      yield r'data';
      yield serializers.serialize(
        object.data,
        specifiedType: const FullType.nullable(ConversationMessageResponse),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    GenericResponseConversationMessageResponse object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required GenericResponseConversationMessageResponseBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'code':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(int),
          ) as int?;
          if (valueDes == null) continue;
          result.code = valueDes;
          break;
        case r'msg':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.msg = valueDes;
          break;
        case r'data':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(ConversationMessageResponse),
          ) as ConversationMessageResponse?;
          if (valueDes == null) continue;
          result.data.replace(valueDes);
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  GenericResponseConversationMessageResponse deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = GenericResponseConversationMessageResponseBuilder();
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

