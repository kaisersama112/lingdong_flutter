//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'group_message_create.g.dart';

/// GroupMessageCreate，创建群消息请求模型
///
/// Properties:
/// * [groupId] - Group Id，群聊ID
/// * [content] - Content，消息内容
/// * [messageType] - Message Type，消息类型
/// * [mediaId] 
@BuiltValue()
abstract class GroupMessageCreate implements Built<GroupMessageCreate, GroupMessageCreateBuilder> {
  /// Group Id，群聊ID
  @BuiltValueField(wireName: r'group_id')
  int get groupId;

  /// Content，消息内容
  @BuiltValueField(wireName: r'content')
  String get content;

  /// Message Type，消息类型
  @BuiltValueField(wireName: r'message_type')
  int? get messageType;

  @BuiltValueField(wireName: r'media_id')
  int? get mediaId;

  GroupMessageCreate._();

  factory GroupMessageCreate([void updates(GroupMessageCreateBuilder b)]) = _$GroupMessageCreate;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(GroupMessageCreateBuilder b) => b
      ..messageType = 0;

  @BuiltValueSerializer(custom: true)
  static Serializer<GroupMessageCreate> get serializer => _$GroupMessageCreateSerializer();
}

class _$GroupMessageCreateSerializer implements PrimitiveSerializer<GroupMessageCreate> {
  @override
  final Iterable<Type> types = const [GroupMessageCreate, _$GroupMessageCreate];

  @override
  final String wireName = r'GroupMessageCreate';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    GroupMessageCreate object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'group_id';
    yield serializers.serialize(
      object.groupId,
      specifiedType: const FullType(int),
    );
    yield r'content';
    yield serializers.serialize(
      object.content,
      specifiedType: const FullType(String),
    );
    if (object.messageType != null) {
      yield r'message_type';
      yield serializers.serialize(
        object.messageType,
        specifiedType: const FullType(int),
      );
    }
    if (object.mediaId != null) {
      yield r'media_id';
      yield serializers.serialize(
        object.mediaId,
        specifiedType: const FullType.nullable(int),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    GroupMessageCreate object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required GroupMessageCreateBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'group_id':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.groupId = valueDes;
          break;
        case r'content':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.content = valueDes;
          break;
        case r'message_type':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.messageType = valueDes;
          break;
        case r'media_id':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(int),
          ) as int?;
          if (valueDes == null) continue;
          result.mediaId = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  GroupMessageCreate deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = GroupMessageCreateBuilder();
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

