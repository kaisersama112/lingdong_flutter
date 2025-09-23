//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'unfollow_request.g.dart';

/// UnfollowRequest，取消关注用户请求模型
///
/// Properties:
/// * [followingId] - Following Id
@BuiltValue()
abstract class UnfollowRequest implements Built<UnfollowRequest, UnfollowRequestBuilder> {
  /// Following Id
  @BuiltValueField(wireName: r'following_id')
  int get followingId;

  UnfollowRequest._();

  factory UnfollowRequest([void updates(UnfollowRequestBuilder b)]) = _$UnfollowRequest;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(UnfollowRequestBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<UnfollowRequest> get serializer => _$UnfollowRequestSerializer();
}

class _$UnfollowRequestSerializer implements PrimitiveSerializer<UnfollowRequest> {
  @override
  final Iterable<Type> types = const [UnfollowRequest, _$UnfollowRequest];

  @override
  final String wireName = r'UnfollowRequest';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    UnfollowRequest object, {
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
    UnfollowRequest object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required UnfollowRequestBuilder result,
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
  UnfollowRequest deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = UnfollowRequestBuilder();
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

