//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'body_delete_media_api_media_delete_media_post.g.dart';

/// Body_delete_media_api_media_delete_media_post
///
/// Properties:
/// * [mediaId] - Media Id
@BuiltValue()
abstract class BodyDeleteMediaApiMediaDeleteMediaPost implements Built<BodyDeleteMediaApiMediaDeleteMediaPost, BodyDeleteMediaApiMediaDeleteMediaPostBuilder> {
  /// Media Id
  @BuiltValueField(wireName: r'media_id')
  int get mediaId;

  BodyDeleteMediaApiMediaDeleteMediaPost._();

  factory BodyDeleteMediaApiMediaDeleteMediaPost([void updates(BodyDeleteMediaApiMediaDeleteMediaPostBuilder b)]) = _$BodyDeleteMediaApiMediaDeleteMediaPost;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(BodyDeleteMediaApiMediaDeleteMediaPostBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<BodyDeleteMediaApiMediaDeleteMediaPost> get serializer => _$BodyDeleteMediaApiMediaDeleteMediaPostSerializer();
}

class _$BodyDeleteMediaApiMediaDeleteMediaPostSerializer implements PrimitiveSerializer<BodyDeleteMediaApiMediaDeleteMediaPost> {
  @override
  final Iterable<Type> types = const [BodyDeleteMediaApiMediaDeleteMediaPost, _$BodyDeleteMediaApiMediaDeleteMediaPost];

  @override
  final String wireName = r'BodyDeleteMediaApiMediaDeleteMediaPost';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    BodyDeleteMediaApiMediaDeleteMediaPost object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'media_id';
    yield serializers.serialize(
      object.mediaId,
      specifiedType: const FullType(int),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    BodyDeleteMediaApiMediaDeleteMediaPost object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required BodyDeleteMediaApiMediaDeleteMediaPostBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'media_id':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.mediaId = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  BodyDeleteMediaApiMediaDeleteMediaPost deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = BodyDeleteMediaApiMediaDeleteMediaPostBuilder();
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

