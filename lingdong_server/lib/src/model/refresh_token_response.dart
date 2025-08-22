//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'refresh_token_response.g.dart';

/// RefreshTokenResponse，刷新令牌响应模型
///
/// Properties:
/// * [accessToken] - Access Token
/// * [tokenType] - Token Type
@BuiltValue()
abstract class RefreshTokenResponse implements Built<RefreshTokenResponse, RefreshTokenResponseBuilder> {
  /// Access Token
  @BuiltValueField(wireName: r'access_token')
  String get accessToken;

  /// Token Type
  @BuiltValueField(wireName: r'token_type')
  String get tokenType;

  RefreshTokenResponse._();

  factory RefreshTokenResponse([void updates(RefreshTokenResponseBuilder b)]) = _$RefreshTokenResponse;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(RefreshTokenResponseBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<RefreshTokenResponse> get serializer => _$RefreshTokenResponseSerializer();
}

class _$RefreshTokenResponseSerializer implements PrimitiveSerializer<RefreshTokenResponse> {
  @override
  final Iterable<Type> types = const [RefreshTokenResponse, _$RefreshTokenResponse];

  @override
  final String wireName = r'RefreshTokenResponse';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    RefreshTokenResponse object, {
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
  }

  @override
  Object serialize(
    Serializers serializers,
    RefreshTokenResponse object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required RefreshTokenResponseBuilder result,
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
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  RefreshTokenResponse deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = RefreshTokenResponseBuilder();
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

