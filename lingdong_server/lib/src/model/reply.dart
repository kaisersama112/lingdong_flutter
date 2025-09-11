//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:lingdong_server/src/model/media_response.dart';
import 'package:built_value/json_object.dart';
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
/// * [replyToReplyId] 
/// * [replier] - Replier，回复人信息
/// * [replyTo] 
/// * [createdAt] - Created At，创建时间
/// * [updatedAt] 
/// * [replies] 
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

  @BuiltValueField(wireName: r'reply_to_reply_id')
  int? get replyToReplyId;

  /// Replier，回复人信息
  @BuiltValueField(wireName: r'replier')
  BuiltMap<String, JsonObject?> get replier;

  @BuiltValueField(wireName: r'reply_to')
  BuiltMap<String, JsonObject?>? get replyTo;

  /// Created At，创建时间
  @BuiltValueField(wireName: r'created_at')
  DateTime get createdAt;

  @BuiltValueField(wireName: r'updated_at')
  DateTime? get updatedAt;

  @BuiltValueField(wireName: r'replies')
  BuiltList<Reply>? get replies;

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
    if (object.replyToReplyId != null) {
      yield r'reply_to_reply_id';
      yield serializers.serialize(
        object.replyToReplyId,
        specifiedType: const FullType.nullable(int),
      );
    }
    yield r'replier';
    yield serializers.serialize(
      object.replier,
      specifiedType: const FullType(BuiltMap, [FullType(String), FullType.nullable(JsonObject)]),
    );
    if (object.replyTo != null) {
      yield r'reply_to';
      yield serializers.serialize(
        object.replyTo,
        specifiedType: const FullType.nullable(BuiltMap, [FullType(String), FullType.nullable(JsonObject)]),
      );
    }
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
    if (object.replies != null) {
      yield r'replies';
      yield serializers.serialize(
        object.replies,
        specifiedType: const FullType.nullable(BuiltList, [FullType(Reply)]),
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
        case r'reply_to_reply_id':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(int),
          ) as int?;
          if (valueDes == null) continue;
          result.replyToReplyId = valueDes;
          break;
        case r'replier':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(BuiltMap, [FullType(String), FullType.nullable(JsonObject)]),
          ) as BuiltMap<String, JsonObject?>;
          result.replier.replace(valueDes);
          break;
        case r'reply_to':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(BuiltMap, [FullType(String), FullType.nullable(JsonObject)]),
          ) as BuiltMap<String, JsonObject?>?;
          if (valueDes == null) continue;
          result.replyTo.replace(valueDes);
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
        case r'replies':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(BuiltList, [FullType(Reply)]),
          ) as BuiltList<Reply>?;
          if (valueDes == null) continue;
          result.replies.replace(valueDes);
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

