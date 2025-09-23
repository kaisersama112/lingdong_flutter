//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'follow_count_response.g.dart';

/// FollowCountResponse，关注/粉丝数量响应模型
///
/// Properties:
/// * [followingCount] - Following Count
/// * [followersCount] - Followers Count
@BuiltValue()
abstract class FollowCountResponse implements Built<FollowCountResponse, FollowCountResponseBuilder> {
  /// Following Count
  @BuiltValueField(wireName: r'following_count')
  int get followingCount;

  /// Followers Count
  @BuiltValueField(wireName: r'followers_count')
  int get followersCount;

  FollowCountResponse._();

  factory FollowCountResponse([void updates(FollowCountResponseBuilder b)]) = _$FollowCountResponse;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(FollowCountResponseBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<FollowCountResponse> get serializer => _$FollowCountResponseSerializer();
}

class _$FollowCountResponseSerializer implements PrimitiveSerializer<FollowCountResponse> {
  @override
  final Iterable<Type> types = const [FollowCountResponse, _$FollowCountResponse];

  @override
  final String wireName = r'FollowCountResponse';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    FollowCountResponse object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'following_count';
    yield serializers.serialize(
      object.followingCount,
      specifiedType: const FullType(int),
    );
    yield r'followers_count';
    yield serializers.serialize(
      object.followersCount,
      specifiedType: const FullType(int),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    FollowCountResponse object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required FollowCountResponseBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
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
  FollowCountResponse deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = FollowCountResponseBuilder();
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

