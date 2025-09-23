//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'group_member_response.g.dart';

/// GroupMemberResponse，群成员响应模型
///
/// Properties:
/// * [id] - Id，成员ID
/// * [userId] - User Id，用户ID
/// * [nickname] 
/// * [username] - Username，用户名
/// * [avatar] 
/// * [joinedAt] - Joined At，加入时间
/// * [isAdmin] - Is Admin，是否管理员
/// * [isOwner] - Is Owner，是否群主
/// * [muted] - Muted，是否被禁言
@BuiltValue()
abstract class GroupMemberResponse implements Built<GroupMemberResponse, GroupMemberResponseBuilder> {
  /// Id，成员ID
  @BuiltValueField(wireName: r'id')
  int get id;

  /// User Id，用户ID
  @BuiltValueField(wireName: r'user_id')
  int get userId;

  @BuiltValueField(wireName: r'nickname')
  String? get nickname;

  /// Username，用户名
  @BuiltValueField(wireName: r'username')
  String get username;

  @BuiltValueField(wireName: r'avatar')
  String? get avatar;

  /// Joined At，加入时间
  @BuiltValueField(wireName: r'joined_at')
  DateTime get joinedAt;

  /// Is Admin，是否管理员
  @BuiltValueField(wireName: r'is_admin')
  bool? get isAdmin;

  /// Is Owner，是否群主
  @BuiltValueField(wireName: r'is_owner')
  bool? get isOwner;

  /// Muted，是否被禁言
  @BuiltValueField(wireName: r'muted')
  bool? get muted;

  GroupMemberResponse._();

  factory GroupMemberResponse([void updates(GroupMemberResponseBuilder b)]) = _$GroupMemberResponse;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(GroupMemberResponseBuilder b) => b
      ..isAdmin = false
      ..isOwner = false
      ..muted = false;

  @BuiltValueSerializer(custom: true)
  static Serializer<GroupMemberResponse> get serializer => _$GroupMemberResponseSerializer();
}

class _$GroupMemberResponseSerializer implements PrimitiveSerializer<GroupMemberResponse> {
  @override
  final Iterable<Type> types = const [GroupMemberResponse, _$GroupMemberResponse];

  @override
  final String wireName = r'GroupMemberResponse';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    GroupMemberResponse object, {
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
    if (object.nickname != null) {
      yield r'nickname';
      yield serializers.serialize(
        object.nickname,
        specifiedType: const FullType.nullable(String),
      );
    }
    yield r'username';
    yield serializers.serialize(
      object.username,
      specifiedType: const FullType(String),
    );
    if (object.avatar != null) {
      yield r'avatar';
      yield serializers.serialize(
        object.avatar,
        specifiedType: const FullType.nullable(String),
      );
    }
    yield r'joined_at';
    yield serializers.serialize(
      object.joinedAt,
      specifiedType: const FullType(DateTime),
    );
    if (object.isAdmin != null) {
      yield r'is_admin';
      yield serializers.serialize(
        object.isAdmin,
        specifiedType: const FullType(bool),
      );
    }
    if (object.isOwner != null) {
      yield r'is_owner';
      yield serializers.serialize(
        object.isOwner,
        specifiedType: const FullType(bool),
      );
    }
    if (object.muted != null) {
      yield r'muted';
      yield serializers.serialize(
        object.muted,
        specifiedType: const FullType(bool),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    GroupMemberResponse object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required GroupMemberResponseBuilder result,
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
        case r'nickname':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.nickname = valueDes;
          break;
        case r'username':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.username = valueDes;
          break;
        case r'avatar':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.avatar = valueDes;
          break;
        case r'joined_at':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(DateTime),
          ) as DateTime;
          result.joinedAt = valueDes;
          break;
        case r'is_admin':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(bool),
          ) as bool;
          result.isAdmin = valueDes;
          break;
        case r'is_owner':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(bool),
          ) as bool;
          result.isOwner = valueDes;
          break;
        case r'muted':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(bool),
          ) as bool;
          result.muted = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  GroupMemberResponse deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = GroupMemberResponseBuilder();
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

