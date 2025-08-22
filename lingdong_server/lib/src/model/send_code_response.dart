//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'send_code_response.g.dart';

/// SendCodeResponse，发送验证码响应模型
///
/// Properties:
/// * [expireIn] - Expire In
/// * [code] - Code
@BuiltValue()
abstract class SendCodeResponse implements Built<SendCodeResponse, SendCodeResponseBuilder> {
  /// Expire In
  @BuiltValueField(wireName: r'expire_in')
  int get expireIn;

  /// Code
  @BuiltValueField(wireName: r'code')
  String get code;

  SendCodeResponse._();

  factory SendCodeResponse([void updates(SendCodeResponseBuilder b)]) = _$SendCodeResponse;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(SendCodeResponseBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<SendCodeResponse> get serializer => _$SendCodeResponseSerializer();
}

class _$SendCodeResponseSerializer implements PrimitiveSerializer<SendCodeResponse> {
  @override
  final Iterable<Type> types = const [SendCodeResponse, _$SendCodeResponse];

  @override
  final String wireName = r'SendCodeResponse';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    SendCodeResponse object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'expire_in';
    yield serializers.serialize(
      object.expireIn,
      specifiedType: const FullType(int),
    );
    yield r'code';
    yield serializers.serialize(
      object.code,
      specifiedType: const FullType(String),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    SendCodeResponse object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required SendCodeResponseBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'expire_in':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.expireIn = valueDes;
          break;
        case r'code':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.code = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  SendCodeResponse deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = SendCodeResponseBuilder();
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

