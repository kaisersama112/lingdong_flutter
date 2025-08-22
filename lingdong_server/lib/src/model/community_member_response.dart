//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'community_member_response.g.dart';

/// CommunityMemberResponse，社群成员响应模型
///
/// Properties:
/// * [id] - Id
/// * [userId] - User Id
/// * [role] - Role，角色(0:普通成员,1:管理员,2:超级管理员)
/// * [status] - Status，状态(0:待审核,1:已批准,2:已拒绝,3:已封禁)
/// * [joinedAt] - Joined At
/// * [approvalAt] 
@BuiltValue()
abstract class CommunityMemberResponse implements Built<CommunityMemberResponse, CommunityMemberResponseBuilder> {
  /// Id
  @BuiltValueField(wireName: r'id')
  int get id;

  /// User Id
  @BuiltValueField(wireName: r'user_id')
  int get userId;

  /// Role，角色(0:普通成员,1:管理员,2:超级管理员)
  @BuiltValueField(wireName: r'role')
  int get role;

  /// Status，状态(0:待审核,1:已批准,2:已拒绝,3:已封禁)
  @BuiltValueField(wireName: r'status')
  int get status;

  /// Joined At
  @BuiltValueField(wireName: r'joined_at')
  DateTime get joinedAt;

  @BuiltValueField(wireName: r'approval_at')
  DateTime? get approvalAt;

  CommunityMemberResponse._();

  factory CommunityMemberResponse([void updates(CommunityMemberResponseBuilder b)]) = _$CommunityMemberResponse;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(CommunityMemberResponseBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<CommunityMemberResponse> get serializer => _$CommunityMemberResponseSerializer();
}

class _$CommunityMemberResponseSerializer implements PrimitiveSerializer<CommunityMemberResponse> {
  @override
  final Iterable<Type> types = const [CommunityMemberResponse, _$CommunityMemberResponse];

  @override
  final String wireName = r'CommunityMemberResponse';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    CommunityMemberResponse object, {
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
    yield r'role';
    yield serializers.serialize(
      object.role,
      specifiedType: const FullType(int),
    );
    yield r'status';
    yield serializers.serialize(
      object.status,
      specifiedType: const FullType(int),
    );
    yield r'joined_at';
    yield serializers.serialize(
      object.joinedAt,
      specifiedType: const FullType(DateTime),
    );
    yield r'approval_at';
    yield object.approvalAt == null ? null : serializers.serialize(
      object.approvalAt,
      specifiedType: const FullType.nullable(DateTime),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    CommunityMemberResponse object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required CommunityMemberResponseBuilder result,
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
        case r'role':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.role = valueDes;
          break;
        case r'status':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.status = valueDes;
          break;
        case r'joined_at':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(DateTime),
          ) as DateTime;
          result.joinedAt = valueDes;
          break;
        case r'approval_at':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(DateTime),
          ) as DateTime?;
          if (valueDes == null) continue;
          result.approvalAt = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  CommunityMemberResponse deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = CommunityMemberResponseBuilder();
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

