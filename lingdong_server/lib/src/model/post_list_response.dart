//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:lingdong_server/src/model/post_response.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'post_list_response.g.dart';

/// PostListResponse，动态列表响应模型
///
/// Properties:
/// * [posts] - Posts
/// * [total] - Total
@BuiltValue()
abstract class PostListResponse implements Built<PostListResponse, PostListResponseBuilder> {
  /// Posts
  @BuiltValueField(wireName: r'posts')
  BuiltList<PostResponse> get posts;

  /// Total
  @BuiltValueField(wireName: r'total')
  int get total;

  PostListResponse._();

  factory PostListResponse([void updates(PostListResponseBuilder b)]) = _$PostListResponse;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(PostListResponseBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<PostListResponse> get serializer => _$PostListResponseSerializer();
}

class _$PostListResponseSerializer implements PrimitiveSerializer<PostListResponse> {
  @override
  final Iterable<Type> types = const [PostListResponse, _$PostListResponse];

  @override
  final String wireName = r'PostListResponse';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    PostListResponse object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'posts';
    yield serializers.serialize(
      object.posts,
      specifiedType: const FullType(BuiltList, [FullType(PostResponse)]),
    );
    yield r'total';
    yield serializers.serialize(
      object.total,
      specifiedType: const FullType(int),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    PostListResponse object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required PostListResponseBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'posts':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(BuiltList, [FullType(PostResponse)]),
          ) as BuiltList<PostResponse>;
          result.posts.replace(valueDes);
          break;
        case r'total':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.total = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  PostListResponse deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = PostListResponseBuilder();
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

