//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'role_update.g.dart';

/// RoleUpdate，成员角色更新请求模型
///
/// Properties:
/// * [memberId] 
/// * [newRole] 
@BuiltValue()
abstract class RoleUpdate implements Built<RoleUpdate, RoleUpdateBuilder> {
  @BuiltValueField(wireName: r'member_id')
  int? get memberId;

  @BuiltValueField(wireName: r'new_role')
  int? get newRole;

  RoleUpdate._();

  factory RoleUpdate([void updates(RoleUpdateBuilder b)]) = _$RoleUpdate;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(RoleUpdateBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<RoleUpdate> get serializer => _$RoleUpdateSerializer();
}

class _$RoleUpdateSerializer implements PrimitiveSerializer<RoleUpdate> {
  @override
  final Iterable<Type> types = const [RoleUpdate, _$RoleUpdate];

  @override
  final String wireName = r'RoleUpdate';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    RoleUpdate object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.memberId != null) {
      yield r'member_id';
      yield serializers.serialize(
        object.memberId,
        specifiedType: const FullType.nullable(int),
      );
    }
    if (object.newRole != null) {
      yield r'new_role';
      yield serializers.serialize(
        object.newRole,
        specifiedType: const FullType.nullable(int),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    RoleUpdate object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required RoleUpdateBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'member_id':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(int),
          ) as int?;
          if (valueDes == null) continue;
          result.memberId = valueDes;
          break;
        case r'new_role':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(int),
          ) as int?;
          if (valueDes == null) continue;
          result.newRole = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  RoleUpdate deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = RoleUpdateBuilder();
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

