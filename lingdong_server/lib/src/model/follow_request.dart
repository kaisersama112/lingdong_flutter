//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'follow_request.g.dart';

/// FollowRequest，关注用户请求模型
///
/// Properties:
/// * [followingId] - Following Id
@BuiltValue()
abstract class FollowRequest implements Built<FollowRequest, FollowRequestBuilder> {
  /// Following Id
  @BuiltValueField(wireName: r'following_id')
  int get followingId;

  FollowRequest._();

  factory FollowRequest([void updates(FollowRequestBuilder b)]) = _$FollowRequest;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(FollowRequestBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<FollowRequest> get serializer => _$FollowRequestSerializer();
}

class _$FollowRequestSerializer implements PrimitiveSerializer<FollowRequest> {
  @override
  final Iterable<Type> types = const [FollowRequest, _$FollowRequest];

  @override
  final String wireName = r'FollowRequest';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    FollowRequest object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'following_id';
    yield serializers.serialize(
      object.followingId,
      specifiedType: const FullType(int),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    FollowRequest object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required FollowRequestBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
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
  FollowRequest deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = FollowRequestBuilder();
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

