//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:lingdong_server/src/model/media_response.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'reply.g.dart';

/// Reply
///
/// Properties:
/// * [content] - Content，回复内容
/// * [medias] 
/// * [id] - Id，回复ID
/// * [parentCommentId] - Parent Comment Id，顶级评论ID
/// * [userId] - User Id，用户ID
/// * [createdAt] - Created At，创建时间
/// * [updatedAt] 
@BuiltValue()
abstract class Reply implements Built<Reply, ReplyBuilder> {
  /// Content，回复内容
  @BuiltValueField(wireName: r'content')
  String get content;

  @BuiltValueField(wireName: r'medias')
  BuiltList<MediaResponse>? get medias;

  /// Id，回复ID
  @BuiltValueField(wireName: r'id')
  int get id;

  /// Parent Comment Id，顶级评论ID
  @BuiltValueField(wireName: r'parent_comment_id')
  int get parentCommentId;

  /// User Id，用户ID
  @BuiltValueField(wireName: r'user_id')
  int get userId;

  /// Created At，创建时间
  @BuiltValueField(wireName: r'created_at')
  DateTime get createdAt;

  @BuiltValueField(wireName: r'updated_at')
  DateTime? get updatedAt;

  Reply._();

  factory Reply([void updates(ReplyBuilder b)]) = _$Reply;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(ReplyBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<Reply> get serializer => _$ReplySerializer();
}

class _$ReplySerializer implements PrimitiveSerializer<Reply> {
  @override
  final Iterable<Type> types = const [Reply, _$Reply];

  @override
  final String wireName = r'Reply';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    Reply object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'content';
    yield serializers.serialize(
      object.content,
      specifiedType: const FullType(String),
    );
    if (object.medias != null) {
      yield r'medias';
      yield serializers.serialize(
        object.medias,
        specifiedType: const FullType.nullable(BuiltList, [FullType(MediaResponse)]),
      );
    }
    yield r'id';
    yield serializers.serialize(
      object.id,
      specifiedType: const FullType(int),
    );
    yield r'parent_comment_id';
    yield serializers.serialize(
      object.parentCommentId,
      specifiedType: const FullType(int),
    );
    yield r'user_id';
    yield serializers.serialize(
      object.userId,
      specifiedType: const FullType(int),
    );
    yield r'created_at';
    yield serializers.serialize(
      object.createdAt,
      specifiedType: const FullType(DateTime),
    );
    if (object.updatedAt != null) {
      yield r'updated_at';
      yield serializers.serialize(
        object.updatedAt,
        specifiedType: const FullType.nullable(DateTime),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    Reply object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required ReplyBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'content':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.content = valueDes;
          break;
        case r'medias':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(BuiltList, [FullType(MediaResponse)]),
          ) as BuiltList<MediaResponse>?;
          if (valueDes == null) continue;
          result.medias.replace(valueDes);
          break;
        case r'id':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.id = valueDes;
          break;
        case r'parent_comment_id':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.parentCommentId = valueDes;
          break;
        case r'user_id':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.userId = valueDes;
          break;
        case r'created_at':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(DateTime),
          ) as DateTime;
          result.createdAt = valueDes;
          break;
        case r'updated_at':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(DateTime),
          ) as DateTime?;
          if (valueDes == null) continue;
          result.updatedAt = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  Reply deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = ReplyBuilder();
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

