//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'user_follow_item.g.dart';

/// UserFollowItem，用户关注/粉丝列表项模型
///
/// Properties:
/// * [userId] - User Id
/// * [username] - Username
/// * [avatar] 
@BuiltValue()
abstract class UserFollowItem implements Built<UserFollowItem, UserFollowItemBuilder> {
  /// User Id
  @BuiltValueField(wireName: r'user_id')
  int get userId;

  /// Username
  @BuiltValueField(wireName: r'username')
  String get username;

  @BuiltValueField(wireName: r'avatar')
  String? get avatar;

  UserFollowItem._();

  factory UserFollowItem([void updates(UserFollowItemBuilder b)]) = _$UserFollowItem;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(UserFollowItemBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<UserFollowItem> get serializer => _$UserFollowItemSerializer();
}

class _$UserFollowItemSerializer implements PrimitiveSerializer<UserFollowItem> {
  @override
  final Iterable<Type> types = const [UserFollowItem, _$UserFollowItem];

  @override
  final String wireName = r'UserFollowItem';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    UserFollowItem object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'user_id';
    yield serializers.serialize(
      object.userId,
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
  }

  @override
  Object serialize(
    Serializers serializers,
    UserFollowItem object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required UserFollowItemBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'user_id':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.userId = valueDes;
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
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  UserFollowItem deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = UserFollowItemBuilder();
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

