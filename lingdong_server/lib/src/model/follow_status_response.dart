//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'follow_status_response.g.dart';

/// FollowStatusResponse，关注状态响应模型
///
/// Properties:
/// * [isFollowing] - Is Following
/// * [followingId] - Following Id
@BuiltValue()
abstract class FollowStatusResponse implements Built<FollowStatusResponse, FollowStatusResponseBuilder> {
  /// Is Following
  @BuiltValueField(wireName: r'is_following')
  bool get isFollowing;

  /// Following Id
  @BuiltValueField(wireName: r'following_id')
  int get followingId;

  FollowStatusResponse._();

  factory FollowStatusResponse([void updates(FollowStatusResponseBuilder b)]) = _$FollowStatusResponse;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(FollowStatusResponseBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<FollowStatusResponse> get serializer => _$FollowStatusResponseSerializer();
}

class _$FollowStatusResponseSerializer implements PrimitiveSerializer<FollowStatusResponse> {
  @override
  final Iterable<Type> types = const [FollowStatusResponse, _$FollowStatusResponse];

  @override
  final String wireName = r'FollowStatusResponse';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    FollowStatusResponse object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'is_following';
    yield serializers.serialize(
      object.isFollowing,
      specifiedType: const FullType(bool),
    );
    yield r'following_id';
    yield serializers.serialize(
      object.followingId,
      specifiedType: const FullType(int),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    FollowStatusResponse object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required FollowStatusResponseBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'is_following':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(bool),
          ) as bool;
          result.isFollowing = valueDes;
          break;
        case r'following_id':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.followingId = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  FollowStatusResponse deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = FollowStatusResponseBuilder();
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

