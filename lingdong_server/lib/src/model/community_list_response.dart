//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:lingdong_server/src/model/community_response.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'community_list_response.g.dart';

/// CommunityListResponse，社群列表分页响应模型
///
/// Properties:
/// * [communities] - Communities
/// * [total] - Total
@BuiltValue()
abstract class CommunityListResponse implements Built<CommunityListResponse, CommunityListResponseBuilder> {
  /// Communities
  @BuiltValueField(wireName: r'communities')
  BuiltList<CommunityResponse> get communities;

  /// Total
  @BuiltValueField(wireName: r'total')
  int get total;

  CommunityListResponse._();

  factory CommunityListResponse([void updates(CommunityListResponseBuilder b)]) = _$CommunityListResponse;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(CommunityListResponseBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<CommunityListResponse> get serializer => _$CommunityListResponseSerializer();
}

class _$CommunityListResponseSerializer implements PrimitiveSerializer<CommunityListResponse> {
  @override
  final Iterable<Type> types = const [CommunityListResponse, _$CommunityListResponse];

  @override
  final String wireName = r'CommunityListResponse';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    CommunityListResponse object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'communities';
    yield serializers.serialize(
      object.communities,
      specifiedType: const FullType(BuiltList, [FullType(CommunityResponse)]),
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
    CommunityListResponse object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required CommunityListResponseBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'communities':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(BuiltList, [FullType(CommunityResponse)]),
          ) as BuiltList<CommunityResponse>;
          result.communities.replace(valueDes);
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
  CommunityListResponse deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = CommunityListResponseBuilder();
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

