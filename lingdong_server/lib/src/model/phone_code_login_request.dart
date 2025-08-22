//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'phone_code_login_request.g.dart';

/// PhoneCodeLoginRequest，手机号+验证码 登录/注册 请求模型
///
/// Properties:
/// * [phone] - Phone
/// * [code] - Code
@BuiltValue()
abstract class PhoneCodeLoginRequest implements Built<PhoneCodeLoginRequest, PhoneCodeLoginRequestBuilder> {
  /// Phone
  @BuiltValueField(wireName: r'phone')
  String get phone;

  /// Code
  @BuiltValueField(wireName: r'code')
  String get code;

  PhoneCodeLoginRequest._();

  factory PhoneCodeLoginRequest([void updates(PhoneCodeLoginRequestBuilder b)]) = _$PhoneCodeLoginRequest;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(PhoneCodeLoginRequestBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<PhoneCodeLoginRequest> get serializer => _$PhoneCodeLoginRequestSerializer();
}

class _$PhoneCodeLoginRequestSerializer implements PrimitiveSerializer<PhoneCodeLoginRequest> {
  @override
  final Iterable<Type> types = const [PhoneCodeLoginRequest, _$PhoneCodeLoginRequest];

  @override
  final String wireName = r'PhoneCodeLoginRequest';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    PhoneCodeLoginRequest object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'phone';
    yield serializers.serialize(
      object.phone,
      specifiedType: const FullType(String),
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
    PhoneCodeLoginRequest object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required PhoneCodeLoginRequestBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'phone':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.phone = valueDes;
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
  PhoneCodeLoginRequest deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = PhoneCodeLoginRequestBuilder();
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

