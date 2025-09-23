//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:lingdong_server/src/model/user_follow_item.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'user_follow_list_response.g.dart';

/// UserFollowListResponse，用户关注/粉丝列表响应模型
///
/// Properties:
/// * [items] - Items
/// * [total] - Total
/// * [skip] - Skip
/// * [limit] - Limit
@BuiltValue()
abstract class UserFollowListResponse implements Built<UserFollowListResponse, UserFollowListResponseBuilder> {
  /// Items
  @BuiltValueField(wireName: r'items')
  BuiltList<UserFollowItem> get items;

  /// Total
  @BuiltValueField(wireName: r'total')
  int get total;

  /// Skip
  @BuiltValueField(wireName: r'skip')
  int get skip;

  /// Limit
  @BuiltValueField(wireName: r'limit')
  int get limit;

  UserFollowListResponse._();

  factory UserFollowListResponse([void updates(UserFollowListResponseBuilder b)]) = _$UserFollowListResponse;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(UserFollowListResponseBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<UserFollowListResponse> get serializer => _$UserFollowListResponseSerializer();
}

class _$UserFollowListResponseSerializer implements PrimitiveSerializer<UserFollowListResponse> {
  @override
  final Iterable<Type> types = const [UserFollowListResponse, _$UserFollowListResponse];

  @override
  final String wireName = r'UserFollowListResponse';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    UserFollowListResponse object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'items';
    yield serializers.serialize(
      object.items,
      specifiedType: const FullType(BuiltList, [FullType(UserFollowItem)]),
    );
    yield r'total';
    yield serializers.serialize(
      object.total,
      specifiedType: const FullType(int),
    );
    yield r'skip';
    yield serializers.serialize(
      object.skip,
      specifiedType: const FullType(int),
    );
    yield r'limit';
    yield serializers.serialize(
      object.limit,
      specifiedType: const FullType(int),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    UserFollowListResponse object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required UserFollowListResponseBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'items':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(BuiltList, [FullType(UserFollowItem)]),
          ) as BuiltList<UserFollowItem>;
          result.items.replace(valueDes);
          break;
        case r'total':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.total = valueDes;
          break;
        case r'skip':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.skip = valueDes;
          break;
        case r'limit':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.limit = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  UserFollowListResponse deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = UserFollowListResponseBuilder();
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

