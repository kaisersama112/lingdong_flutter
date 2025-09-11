//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:lingdong_server/src/model/media_response.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'parent_comment.g.dart';

/// ParentComment
///
/// Properties:
/// * [id] - Id，评论ID
/// * [content] - Content，评论内容
/// * [postId] - Post Id，动态ID
/// * [userId] - User Id，用户ID
/// * [username] - Username，用户名
/// * [userAvatar] 
/// * [replyToUserId] 
/// * [createdAt] - Created At，创建时间
/// * [updatedAt] 
/// * [medias] 
/// * [likeCount] - Like Count，点赞数量
/// * [isLiked] - Is Liked，当前用户是否点赞
@BuiltValue()
abstract class ParentComment implements Built<ParentComment, ParentCommentBuilder> {
  /// Id，评论ID
  @BuiltValueField(wireName: r'id')
  int get id;

  /// Content，评论内容
  @BuiltValueField(wireName: r'content')
  String get content;

  /// Post Id，动态ID
  @BuiltValueField(wireName: r'post_id')
  int get postId;

  /// User Id，用户ID
  @BuiltValueField(wireName: r'user_id')
  int get userId;

  /// Username，用户名
  @BuiltValueField(wireName: r'username')
  String get username;

  @BuiltValueField(wireName: r'user_avatar')
  String? get userAvatar;

  @BuiltValueField(wireName: r'reply_to_user_id')
  int? get replyToUserId;

  /// Created At，创建时间
  @BuiltValueField(wireName: r'created_at')
  DateTime get createdAt;

  @BuiltValueField(wireName: r'updated_at')
  DateTime? get updatedAt;

  @BuiltValueField(wireName: r'medias')
  BuiltList<MediaResponse>? get medias;

  /// Like Count，点赞数量
  @BuiltValueField(wireName: r'like_count')
  int? get likeCount;

  /// Is Liked，当前用户是否点赞
  @BuiltValueField(wireName: r'is_liked')
  bool? get isLiked;

  ParentComment._();

  factory ParentComment([void updates(ParentCommentBuilder b)]) = _$ParentComment;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(ParentCommentBuilder b) => b
      ..likeCount = 0
      ..isLiked = false;

  @BuiltValueSerializer(custom: true)
  static Serializer<ParentComment> get serializer => _$ParentCommentSerializer();
}

class _$ParentCommentSerializer implements PrimitiveSerializer<ParentComment> {
  @override
  final Iterable<Type> types = const [ParentComment, _$ParentComment];

  @override
  final String wireName = r'ParentComment';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    ParentComment object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'id';
    yield serializers.serialize(
      object.id,
      specifiedType: const FullType(int),
    );
    yield r'content';
    yield serializers.serialize(
      object.content,
      specifiedType: const FullType(String),
    );
    yield r'post_id';
    yield serializers.serialize(
      object.postId,
      specifiedType: const FullType(int),
    );
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
    if (object.userAvatar != null) {
      yield r'user_avatar';
      yield serializers.serialize(
        object.userAvatar,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.replyToUserId != null) {
      yield r'reply_to_user_id';
      yield serializers.serialize(
        object.replyToUserId,
        specifiedType: const FullType.nullable(int),
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
    if (object.medias != null) {
      yield r'medias';
      yield serializers.serialize(
        object.medias,
        specifiedType: const FullType.nullable(BuiltList, [FullType(MediaResponse)]),
      );
    }
    if (object.likeCount != null) {
      yield r'like_count';
      yield serializers.serialize(
        object.likeCount,
        specifiedType: const FullType(int),
      );
    }
    if (object.isLiked != null) {
      yield r'is_liked';
      yield serializers.serialize(
        object.isLiked,
        specifiedType: const FullType(bool),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    ParentComment object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required ParentCommentBuilder result,
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
        case r'content':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.content = valueDes;
          break;
        case r'post_id':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.postId = valueDes;
          break;
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
        case r'user_avatar':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.userAvatar = valueDes;
          break;
        case r'reply_to_user_id':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(int),
          ) as int?;
          if (valueDes == null) continue;
          result.replyToUserId = valueDes;
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
        case r'medias':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(BuiltList, [FullType(MediaResponse)]),
          ) as BuiltList<MediaResponse>?;
          if (valueDes == null) continue;
          result.medias.replace(valueDes);
          break;
        case r'like_count':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.likeCount = valueDes;
          break;
        case r'is_liked':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(bool),
          ) as bool;
          result.isLiked = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  ParentComment deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = ParentCommentBuilder();
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

