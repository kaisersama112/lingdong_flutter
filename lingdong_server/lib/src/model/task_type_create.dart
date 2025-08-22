//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'task_type_create.g.dart';

/// TaskTypeCreate，创建任务类型
///
/// Properties:
/// * [name] - Name，任务类型名称
/// * [description] 
@BuiltValue()
abstract class TaskTypeCreate implements Built<TaskTypeCreate, TaskTypeCreateBuilder> {
  /// Name，任务类型名称
  @BuiltValueField(wireName: r'name')
  String get name;

  @BuiltValueField(wireName: r'description')
  String? get description;

  TaskTypeCreate._();

  factory TaskTypeCreate([void updates(TaskTypeCreateBuilder b)]) = _$TaskTypeCreate;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(TaskTypeCreateBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<TaskTypeCreate> get serializer => _$TaskTypeCreateSerializer();
}

class _$TaskTypeCreateSerializer implements PrimitiveSerializer<TaskTypeCreate> {
  @override
  final Iterable<Type> types = const [TaskTypeCreate, _$TaskTypeCreate];

  @override
  final String wireName = r'TaskTypeCreate';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    TaskTypeCreate object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'name';
    yield serializers.serialize(
      object.name,
      specifiedType: const FullType(String),
    );
    if (object.description != null) {
      yield r'description';
      yield serializers.serialize(
        object.description,
        specifiedType: const FullType.nullable(String),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    TaskTypeCreate object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required TaskTypeCreateBuilder result,
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
        case r'description':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.description = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  TaskTypeCreate deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = TaskTypeCreateBuilder();
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

