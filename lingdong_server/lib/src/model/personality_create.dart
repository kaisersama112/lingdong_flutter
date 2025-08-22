//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'personality_create.g.dart';

/// PersonalityCreate，创建性格特征
///
/// Properties:
/// * [name] - Name，性格特征名称
/// * [description] 
@BuiltValue()
abstract class PersonalityCreate implements Built<PersonalityCreate, PersonalityCreateBuilder> {
  /// Name，性格特征名称
  @BuiltValueField(wireName: r'name')
  String get name;

  @BuiltValueField(wireName: r'description')
  String? get description;

  PersonalityCreate._();

  factory PersonalityCreate([void updates(PersonalityCreateBuilder b)]) = _$PersonalityCreate;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(PersonalityCreateBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<PersonalityCreate> get serializer => _$PersonalityCreateSerializer();
}

class _$PersonalityCreateSerializer implements PrimitiveSerializer<PersonalityCreate> {
  @override
  final Iterable<Type> types = const [PersonalityCreate, _$PersonalityCreate];

  @override
  final String wireName = r'PersonalityCreate';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    PersonalityCreate object, {
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
    PersonalityCreate object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required PersonalityCreateBuilder result,
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
  PersonalityCreate deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = PersonalityCreateBuilder();
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

