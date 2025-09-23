//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'user_info_response.g.dart';

/// UserInfoResponse，用户信息响应模型
///
/// Properties:
/// * [id] - Id
/// * [phone] 
/// * [username] - Username
/// * [email] 
/// * [avatar] 
/// * [isPasswordSet] - Is Password Set
/// * [level] - Level
/// * [createdAt] 
/// * [updatedAt] 
/// * [followingCount] - Following Count
/// * [followersCount] - Followers Count
@BuiltValue()
abstract class UserInfoResponse implements Built<UserInfoResponse, UserInfoResponseBuilder> {
  /// Id
  @BuiltValueField(wireName: r'id')
  int get id;

  @BuiltValueField(wireName: r'phone')
  String? get phone;

  /// Username
  @BuiltValueField(wireName: r'username')
  String get username;

  @BuiltValueField(wireName: r'email')
  String? get email;

  @BuiltValueField(wireName: r'avatar')
  String? get avatar;

  /// Is Password Set
  @BuiltValueField(wireName: r'is_password_set')
  bool get isPasswordSet;

  /// Level
  @BuiltValueField(wireName: r'level')
  int? get level;

  @BuiltValueField(wireName: r'created_at')
  String? get createdAt;

  @BuiltValueField(wireName: r'updated_at')
  String? get updatedAt;

  /// Following Count
  @BuiltValueField(wireName: r'following_count')
  int? get followingCount;

  /// Followers Count
  @BuiltValueField(wireName: r'followers_count')
  int? get followersCount;

  UserInfoResponse._();

  factory UserInfoResponse([void updates(UserInfoResponseBuilder b)]) = _$UserInfoResponse;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(UserInfoResponseBuilder b) => b
      ..level = 3
      ..followingCount = 0
      ..followersCount = 0;

  @BuiltValueSerializer(custom: true)
  static Serializer<UserInfoResponse> get serializer => _$UserInfoResponseSerializer();
}

class _$UserInfoResponseSerializer implements PrimitiveSerializer<UserInfoResponse> {
  @override
  final Iterable<Type> types = const [UserInfoResponse, _$UserInfoResponse];

  @override
  final String wireName = r'UserInfoResponse';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    UserInfoResponse object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'id';
    yield serializers.serialize(
      object.id,
      specifiedType: const FullType(int),
    );
    if (object.phone != null) {
      yield r'phone';
      yield serializers.serialize(
        object.phone,
        specifiedType: const FullType.nullable(String),
      );
    }
    yield r'username';
    yield serializers.serialize(
      object.username,
      specifiedType: const FullType(String),
    );
    if (object.email != null) {
      yield r'email';
      yield serializers.serialize(
        object.email,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.avatar != null) {
      yield r'avatar';
      yield serializers.serialize(
        object.avatar,
        specifiedType: const FullType.nullable(String),
      );
    }
    yield r'is_password_set';
    yield serializers.serialize(
      object.isPasswordSet,
      specifiedType: const FullType(bool),
    );
    if (object.level != null) {
      yield r'level';
      yield serializers.serialize(
        object.level,
        specifiedType: const FullType(int),
      );
    }
    if (object.createdAt != null) {
      yield r'created_at';
      yield serializers.serialize(
        object.createdAt,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.updatedAt != null) {
      yield r'updated_at';
      yield serializers.serialize(
        object.updatedAt,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.followingCount != null) {
      yield r'following_count';
      yield serializers.serialize(
        object.followingCount,
        specifiedType: const FullType(int),
      );
    }
    if (object.followersCount != null) {
      yield r'followers_count';
      yield serializers.serialize(
        object.followersCount,
        specifiedType: const FullType(int),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    UserInfoResponse object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required UserInfoResponseBuilder result,
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
        case r'phone':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.phone = valueDes;
          break;
        case r'username':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.username = valueDes;
          break;
        case r'email':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.email = valueDes;
          break;
        case r'avatar':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.avatar = valueDes;
          break;
        case r'is_password_set':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(bool),
          ) as bool;
          result.isPasswordSet = valueDes;
          break;
        case r'level':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.level = valueDes;
          break;
        case r'created_at':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.createdAt = valueDes;
          break;
        case r'updated_at':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.updatedAt = valueDes;
          break;
        case r'following_count':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.followingCount = valueDes;
          break;
        case r'followers_count':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.followersCount = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  UserInfoResponse deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = UserInfoResponseBuilder();
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

