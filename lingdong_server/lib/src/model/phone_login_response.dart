//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'phone_login_response.g.dart';

/// PhoneLoginResponse，手机号登录响应模型
///
/// Properties:
/// * [accessToken] - Access Token
/// * [tokenType] - Token Type
/// * [refreshToken] - Refresh Token
/// * [isNewUser] - Is New User
@BuiltValue()
abstract class PhoneLoginResponse implements Built<PhoneLoginResponse, PhoneLoginResponseBuilder> {
  /// Access Token
  @BuiltValueField(wireName: r'access_token')
  String get accessToken;

  /// Token Type
  @BuiltValueField(wireName: r'token_type')
  String get tokenType;

  /// Refresh Token
  @BuiltValueField(wireName: r'refresh_token')
  String get refreshToken;

  /// Is New User
  @BuiltValueField(wireName: r'is_new_user')
  bool get isNewUser;

  PhoneLoginResponse._();

  factory PhoneLoginResponse([void updates(PhoneLoginResponseBuilder b)]) = _$PhoneLoginResponse;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(PhoneLoginResponseBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<PhoneLoginResponse> get serializer => _$PhoneLoginResponseSerializer();
}

class _$PhoneLoginResponseSerializer implements PrimitiveSerializer<PhoneLoginResponse> {
  @override
  final Iterable<Type> types = const [PhoneLoginResponse, _$PhoneLoginResponse];

  @override
  final String wireName = r'PhoneLoginResponse';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    PhoneLoginResponse object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'access_token';
    yield serializers.serialize(
      object.accessToken,
      specifiedType: const FullType(String),
    );
    yield r'token_type';
    yield serializers.serialize(
      object.tokenType,
      specifiedType: const FullType(String),
    );
    yield r'refresh_token';
    yield serializers.serialize(
      object.refreshToken,
      specifiedType: const FullType(String),
    );
    yield r'is_new_user';
    yield serializers.serialize(
      object.isNewUser,
      specifiedType: const FullType(bool),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    PhoneLoginResponse object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required PhoneLoginResponseBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'access_token':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.accessToken = valueDes;
          break;
        case r'token_type':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.tokenType = valueDes;
          break;
        case r'refresh_token':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.refreshToken = valueDes;
          break;
        case r'is_new_user':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(bool),
          ) as bool;
          result.isNewUser = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  PhoneLoginResponse deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = PhoneLoginResponseBuilder();
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

