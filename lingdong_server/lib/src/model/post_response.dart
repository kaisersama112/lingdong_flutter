//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:lingdong_server/src/model/media_out.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'post_response.g.dart';

/// PostResponse，动态详情响应模型
///
/// Properties:
/// * [id] - Id
/// * [userId] - User Id
/// * [username] - Username，发布者用户名
/// * [userAvatar]
/// * [communityId]
/// * [communityName]
/// * [content] - Content
/// * [createdAt]
/// * [updatedAt]
/// * [medias] - Medias，媒体文件列表
/// * [likeCount] - Like Count，点赞数
/// * [commentCount] - Comment Count，评论数
/// * [favoriteCount] - Favorite Count，收藏数
/// * [shareCount] - Share Count，分享数
/// * [isLiked] - Is Liked，当前用户是否已点赞
/// * [isFavorited] - Is Favorited，当前用户是否已收藏
/// * [tags]
/// * [visibility] - Visibility，可见性
/// * [location]
@BuiltValue()
abstract class PostResponse
    implements Built<PostResponse, PostResponseBuilder> {
  /// Id
  @BuiltValueField(wireName: r'id')
  int get id;

  /// User Id
  @BuiltValueField(wireName: r'user_id')
  int get userId;

  /// Username，发布者用户名
  @BuiltValueField(wireName: r'username')
  String get username;

  @BuiltValueField(wireName: r'user_avatar')
  String? get userAvatar;

  @BuiltValueField(wireName: r'community_id')
  int? get communityId;

  @BuiltValueField(wireName: r'community_name')
  String? get communityName;

  /// Content
  @BuiltValueField(wireName: r'content')
  String get content;

  @BuiltValueField(wireName: r'created_at')
  DateTime? get createdAt;

  @BuiltValueField(wireName: r'updated_at')
  DateTime? get updatedAt;

  /// Medias，媒体文件列表
  @BuiltValueField(wireName: r'medias')
  BuiltList<MediaOut>? get medias;

  /// Like Count，点赞数
  @BuiltValueField(wireName: r'like_count')
  int? get likeCount;

  /// Comment Count，评论数
  @BuiltValueField(wireName: r'comment_count')
  int? get commentCount;

  /// Favorite Count，收藏数
  @BuiltValueField(wireName: r'favorite_count')
  int? get favoriteCount;

  /// Share Count，分享数
  @BuiltValueField(wireName: r'share_count')
  int? get shareCount;

  /// Is Liked，当前用户是否已点赞
  @BuiltValueField(wireName: r'is_liked')
  bool? get isLiked;

  /// Is Favorited，当前用户是否已收藏
  @BuiltValueField(wireName: r'is_favorited')
  bool? get isFavorited;

  @BuiltValueField(wireName: r'tags')
  String? get tags;

  /// Visibility，可见性
  @BuiltValueField(wireName: r'visibility')
  int? get visibility;

  @BuiltValueField(wireName: r'location')
  String? get location;

  PostResponse._();

  factory PostResponse([void updates(PostResponseBuilder b)]) = _$PostResponse;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(PostResponseBuilder b) => b
    ..medias = ListBuilder()
    ..likeCount = 0
    ..commentCount = 0
    ..favoriteCount = 0
    ..shareCount = 0
    ..isLiked = false
    ..isFavorited = false
    ..visibility = 2;

  @BuiltValueSerializer(custom: true)
  static Serializer<PostResponse> get serializer => _$PostResponseSerializer();
}

class _$PostResponseSerializer implements PrimitiveSerializer<PostResponse> {
  @override
  final Iterable<Type> types = const [PostResponse, _$PostResponse];

  @override
  final String wireName = r'PostResponse';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    PostResponse object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'id';
    yield serializers.serialize(
      object.id,
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
    yield r'community_id';
    yield object.communityId == null
        ? null
        : serializers.serialize(
            object.communityId,
            specifiedType: const FullType.nullable(int),
          );
    if (object.communityName != null) {
      yield r'community_name';
      yield serializers.serialize(
        object.communityName,
        specifiedType: const FullType.nullable(String),
      );
    }
    yield r'content';
    yield serializers.serialize(
      object.content,
      specifiedType: const FullType(String),
    );
    if (object.createdAt != null) {
      yield r'created_at';
      yield serializers.serialize(
        object.createdAt,
        specifiedType: const FullType.nullable(DateTime),
      );
    }
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
        specifiedType: const FullType(BuiltList, [FullType(MediaOut)]),
      );
    }
    if (object.likeCount != null) {
      yield r'like_count';
      yield serializers.serialize(
        object.likeCount,
        specifiedType: const FullType(int),
      );
    }
    if (object.commentCount != null) {
      yield r'comment_count';
      yield serializers.serialize(
        object.commentCount,
        specifiedType: const FullType(int),
      );
    }
    if (object.favoriteCount != null) {
      yield r'favorite_count';
      yield serializers.serialize(
        object.favoriteCount,
        specifiedType: const FullType(int),
      );
    }
    if (object.shareCount != null) {
      yield r'share_count';
      yield serializers.serialize(
        object.shareCount,
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
    if (object.isFavorited != null) {
      yield r'is_favorited';
      yield serializers.serialize(
        object.isFavorited,
        specifiedType: const FullType(bool),
      );
    }
    if (object.tags != null) {
      yield r'tags';
      yield serializers.serialize(
        object.tags,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.visibility != null) {
      yield r'visibility';
      yield serializers.serialize(
        object.visibility,
        specifiedType: const FullType(int),
      );
    }
    if (object.location != null) {
      yield r'location';
      yield serializers.serialize(
        object.location,
        specifiedType: const FullType.nullable(String),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    PostResponse object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object,
            specifiedType: specifiedType)
        .toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required PostResponseBuilder result,
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
        case r'community_id':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(int),
          ) as int?;
          if (valueDes == null) continue;
          result.communityId = valueDes;
          break;
        case r'community_name':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.communityName = valueDes;
          break;
        case r'content':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.content = valueDes;
          break;
        case r'created_at':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(DateTime),
          ) as DateTime?;
          if (valueDes == null) continue;
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
            specifiedType: const FullType(BuiltList, [FullType(MediaOut)]),
          ) as BuiltList<MediaOut>;
          result.medias.replace(valueDes);
          break;
        case r'like_count':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.likeCount = valueDes;
          break;
        case r'comment_count':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.commentCount = valueDes;
          break;
        case r'favorite_count':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.favoriteCount = valueDes;
          break;
        case r'share_count':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.shareCount = valueDes;
          break;
        case r'is_liked':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(bool),
          ) as bool;
          result.isLiked = valueDes;
          break;
        case r'is_favorited':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(bool),
          ) as bool;
          result.isFavorited = valueDes;
          break;
        case r'tags':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.tags = valueDes;
          break;
        case r'visibility':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.visibility = valueDes;
          break;
        case r'location':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.location = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  PostResponse deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = PostResponseBuilder();
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
