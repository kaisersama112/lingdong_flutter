//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'group_conversation_create.g.dart';

/// GroupConversationCreate，创建群聊请求模型
///
/// Properties:
/// * [name] - Name，群聊名称
/// * [avatar] 
/// * [memberIds] - Member Ids，群成员ID列表
@BuiltValue()
abstract class GroupConversationCreate implements Built<GroupConversationCreate, GroupConversationCreateBuilder> {
  /// Name，群聊名称
  @BuiltValueField(wireName: r'name')
  String get name;

  @BuiltValueField(wireName: r'avatar')
  String? get avatar;

  /// Member Ids，群成员ID列表
  @BuiltValueField(wireName: r'member_ids')
  BuiltList<int> get memberIds;

  GroupConversationCreate._();

  factory GroupConversationCreate([void updates(GroupConversationCreateBuilder b)]) = _$GroupConversationCreate;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(GroupConversationCreateBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<GroupConversationCreate> get serializer => _$GroupConversationCreateSerializer();
}

class _$GroupConversationCreateSerializer implements PrimitiveSerializer<GroupConversationCreate> {
  @override
  final Iterable<Type> types = const [GroupConversationCreate, _$GroupConversationCreate];

  @override
  final String wireName = r'GroupConversationCreate';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    GroupConversationCreate object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'name';
    yield serializers.serialize(
      object.name,
      specifiedType: const FullType(String),
    );
    if (object.avatar != null) {
      yield r'avatar';
      yield serializers.serialize(
        object.avatar,
        specifiedType: const FullType.nullable(String),
      );
    }
    yield r'member_ids';
    yield serializers.serialize(
      object.memberIds,
      specifiedType: const FullType(BuiltList, [FullType(int)]),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    GroupConversationCreate object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required GroupConversationCreateBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'name':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.name = valueDes;
          break;
        case r'avatar':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.avatar = valueDes;
          break;
        case r'member_ids':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(BuiltList, [FullType(int)]),
          ) as BuiltList<int>;
          result.memberIds.replace(valueDes);
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  GroupConversationCreate deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = GroupConversationCreateBuilder();
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

