//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'community_response.g.dart';

/// CommunityResponse，社群列表响应模型
///
/// Properties:
/// * [id] 
/// * [name] 
/// * [description] 
/// * [avatar] 
/// * [creatorId] 
/// * [createdAt] 
/// * [status] - Status，状态(0:未激活,1:活跃,2:已归档)
/// * [coverImage] 
/// * [memberCount] 
/// * [isMember] - Is Member，当前用户是否已加入
@BuiltValue()
abstract class CommunityResponse implements Built<CommunityResponse, CommunityResponseBuilder> {
  @BuiltValueField(wireName: r'id')
  int? get id;

  @BuiltValueField(wireName: r'name')
  String? get name;

  @BuiltValueField(wireName: r'description')
  String? get description;

  @BuiltValueField(wireName: r'avatar')
  String? get avatar;

  @BuiltValueField(wireName: r'creator_id')
  int? get creatorId;

  @BuiltValueField(wireName: r'created_at')
  DateTime? get createdAt;

  /// Status，状态(0:未激活,1:活跃,2:已归档)
  @BuiltValueField(wireName: r'status')
  int? get status;

  @BuiltValueField(wireName: r'cover_image')
  String? get coverImage;

  @BuiltValueField(wireName: r'member_count')
  int? get memberCount;

  /// Is Member，当前用户是否已加入
  @BuiltValueField(wireName: r'is_member')
  bool? get isMember;

  CommunityResponse._();

  factory CommunityResponse([void updates(CommunityResponseBuilder b)]) = _$CommunityResponse;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(CommunityResponseBuilder b) => b
      ..status = 1
      ..isMember = false;

  @BuiltValueSerializer(custom: true)
  static Serializer<CommunityResponse> get serializer => _$CommunityResponseSerializer();
}

class _$CommunityResponseSerializer implements PrimitiveSerializer<CommunityResponse> {
  @override
  final Iterable<Type> types = const [CommunityResponse, _$CommunityResponse];

  @override
  final String wireName = r'CommunityResponse';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    CommunityResponse object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.id != null) {
      yield r'id';
      yield serializers.serialize(
        object.id,
        specifiedType: const FullType.nullable(int),
      );
    }
    if (object.name != null) {
      yield r'name';
      yield serializers.serialize(
        object.name,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.description != null) {
      yield r'description';
      yield serializers.serialize(
        object.description,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.avatar != null) {
      yield r'avatar';
      yield serializers.serialize(
        object.avatar,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.creatorId != null) {
      yield r'creator_id';
      yield serializers.serialize(
        object.creatorId,
        specifiedType: const FullType.nullable(int),
      );
    }
    if (object.createdAt != null) {
      yield r'created_at';
      yield serializers.serialize(
        object.createdAt,
        specifiedType: const FullType.nullable(DateTime),
      );
    }
    if (object.status != null) {
      yield r'status';
      yield serializers.serialize(
        object.status,
        specifiedType: const FullType(int),
      );
    }
    if (object.coverImage != null) {
      yield r'cover_image';
      yield serializers.serialize(
        object.coverImage,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.memberCount != null) {
      yield r'member_count';
      yield serializers.serialize(
        object.memberCount,
        specifiedType: const FullType.nullable(int),
      );
    }
    if (object.isMember != null) {
      yield r'is_member';
      yield serializers.serialize(
        object.isMember,
        specifiedType: const FullType(bool),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    CommunityResponse object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required CommunityResponseBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'id':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(int),
          ) as int?;
          if (valueDes == null) continue;
          result.id = valueDes;
          break;
        case r'name':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.name = valueDes;
          break;
        case r'description':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.description = valueDes;
          break;
        case r'avatar':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.avatar = valueDes;
          break;
        case r'creator_id':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(int),
          ) as int?;
          if (valueDes == null) continue;
          result.creatorId = valueDes;
          break;
        case r'created_at':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(DateTime),
          ) as DateTime?;
          if (valueDes == null) continue;
          result.createdAt = valueDes;
          break;
        case r'status':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.status = valueDes;
          break;
        case r'cover_image':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.coverImage = valueDes;
          break;
        case r'member_count':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(int),
          ) as int?;
          if (valueDes == null) continue;
          result.memberCount = valueDes;
          break;
        case r'is_member':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(bool),
          ) as bool;
          result.isMember = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  CommunityResponse deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = CommunityResponseBuilder();
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

