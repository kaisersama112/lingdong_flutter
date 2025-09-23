//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'user_response.g.dart';

/// UserResponse
///
/// Properties:
/// * [id] - Id
/// * [username] - Username
/// * [avatar] 
/// * [followingCount] - Following Count
/// * [followersCount] - Followers Count
/// * [isFollowing] 
@BuiltValue()
abstract class UserResponse implements Built<UserResponse, UserResponseBuilder> {
  /// Id
  @BuiltValueField(wireName: r'id')
  int get id;

  /// Username
  @BuiltValueField(wireName: r'username')
  String get username;

  @BuiltValueField(wireName: r'avatar')
  String? get avatar;

  /// Following Count
  @BuiltValueField(wireName: r'following_count')
  int? get followingCount;

  /// Followers Count
  @BuiltValueField(wireName: r'followers_count')
  int? get followersCount;

  @BuiltValueField(wireName: r'is_following')
  bool? get isFollowing;

  UserResponse._();

  factory UserResponse([void updates(UserResponseBuilder b)]) = _$UserResponse;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(UserResponseBuilder b) => b
      ..followingCount = 0
      ..followersCount = 0;

  @BuiltValueSerializer(custom: true)
  static Serializer<UserResponse> get serializer => _$UserResponseSerializer();
}

class _$UserResponseSerializer implements PrimitiveSerializer<UserResponse> {
  @override
  final Iterable<Type> types = const [UserResponse, _$UserResponse];

  @override
  final String wireName = r'UserResponse';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    UserResponse object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'id';
    yield serializers.serialize(
      object.id,
      specifiedType: const FullType(int),
    );
    yield r'username';
    yield serializers.serialize(
      object.username,
      specifiedType: const FullType(String),
    );
    if (object.avatar != null) {
      yield r'avatar';
      yield serializers.serialize(
        object.avatar,
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
    if (object.isFollowing != null) {
      yield r'is_following';
      yield serializers.serialize(
        object.isFollowing,
        specifiedType: const FullType.nullable(bool),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    UserResponse object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required UserResponseBuilder result,
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
        case r'username':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.username = valueDes;
          break;
        case r'avatar':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.avatar = valueDes;
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
        case r'is_following':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(bool),
          ) as bool?;
          if (valueDes == null) continue;
          result.isFollowing = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  UserResponse deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = UserResponseBuilder();
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

