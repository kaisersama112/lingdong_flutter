//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:lingdong_server/src/model/community_member_response.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'community_member_list_response.g.dart';

/// CommunityMemberListResponse，社群成员列表响应模型
///
/// Properties:
/// * [members] - Members
/// * [total] - Total
@BuiltValue()
abstract class CommunityMemberListResponse implements Built<CommunityMemberListResponse, CommunityMemberListResponseBuilder> {
  /// Members
  @BuiltValueField(wireName: r'members')
  BuiltList<CommunityMemberResponse> get members;

  /// Total
  @BuiltValueField(wireName: r'total')
  int get total;

  CommunityMemberListResponse._();

  factory CommunityMemberListResponse([void updates(CommunityMemberListResponseBuilder b)]) = _$CommunityMemberListResponse;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(CommunityMemberListResponseBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<CommunityMemberListResponse> get serializer => _$CommunityMemberListResponseSerializer();
}

class _$CommunityMemberListResponseSerializer implements PrimitiveSerializer<CommunityMemberListResponse> {
  @override
  final Iterable<Type> types = const [CommunityMemberListResponse, _$CommunityMemberListResponse];

  @override
  final String wireName = r'CommunityMemberListResponse';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    CommunityMemberListResponse object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'members';
    yield serializers.serialize(
      object.members,
      specifiedType: const FullType(BuiltList, [FullType(CommunityMemberResponse)]),
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
    CommunityMemberListResponse object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required CommunityMemberListResponseBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'members':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(BuiltList, [FullType(CommunityMemberResponse)]),
          ) as BuiltList<CommunityMemberResponse>;
          result.members.replace(valueDes);
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
  CommunityMemberListResponse deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = CommunityMemberListResponseBuilder();
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

