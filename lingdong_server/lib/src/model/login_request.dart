//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'login_request.g.dart';

/// LoginRequest，登录请求模型
///
/// Properties:
/// * [identifier] - Identifier
/// * [password] - Password
@BuiltValue()
abstract class LoginRequest implements Built<LoginRequest, LoginRequestBuilder> {
  /// Identifier
  @BuiltValueField(wireName: r'identifier')
  String get identifier;

  /// Password
  @BuiltValueField(wireName: r'password')
  String get password;

  LoginRequest._();

  factory LoginRequest([void updates(LoginRequestBuilder b)]) = _$LoginRequest;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(LoginRequestBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<LoginRequest> get serializer => _$LoginRequestSerializer();
}

class _$LoginRequestSerializer implements PrimitiveSerializer<LoginRequest> {
  @override
  final Iterable<Type> types = const [LoginRequest, _$LoginRequest];

  @override
  final String wireName = r'LoginRequest';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    LoginRequest object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'identifier';
    yield serializers.serialize(
      object.identifier,
      specifiedType: const FullType(String),
    );
    yield r'password';
    yield serializers.serialize(
      object.password,
      specifiedType: const FullType(String),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    LoginRequest object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required LoginRequestBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'identifier':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.identifier = valueDes;
          break;
        case r'password':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.password = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  LoginRequest deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = LoginRequestBuilder();
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

