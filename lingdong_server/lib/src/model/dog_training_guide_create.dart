//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'dog_training_guide_create.g.dart';

/// DogTrainingGuideCreate
///
/// Properties:
/// * [breedId] - Breed Id
/// * [ageStageId] - Age Stage Id
/// * [title] - Title
/// * [content] 
@BuiltValue()
abstract class DogTrainingGuideCreate implements Built<DogTrainingGuideCreate, DogTrainingGuideCreateBuilder> {
  /// Breed Id
  @BuiltValueField(wireName: r'breed_id')
  int get breedId;

  /// Age Stage Id
  @BuiltValueField(wireName: r'age_stage_id')
  int get ageStageId;

  /// Title
  @BuiltValueField(wireName: r'title')
  String get title;

  @BuiltValueField(wireName: r'content')
  String? get content;

  DogTrainingGuideCreate._();

  factory DogTrainingGuideCreate([void updates(DogTrainingGuideCreateBuilder b)]) = _$DogTrainingGuideCreate;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(DogTrainingGuideCreateBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<DogTrainingGuideCreate> get serializer => _$DogTrainingGuideCreateSerializer();
}

class _$DogTrainingGuideCreateSerializer implements PrimitiveSerializer<DogTrainingGuideCreate> {
  @override
  final Iterable<Type> types = const [DogTrainingGuideCreate, _$DogTrainingGuideCreate];

  @override
  final String wireName = r'DogTrainingGuideCreate';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    DogTrainingGuideCreate object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'breed_id';
    yield serializers.serialize(
      object.breedId,
      specifiedType: const FullType(int),
    );
    yield r'age_stage_id';
    yield serializers.serialize(
      object.ageStageId,
      specifiedType: const FullType(int),
    );
    yield r'title';
    yield serializers.serialize(
      object.title,
      specifiedType: const FullType(String),
    );
    if (object.content != null) {
      yield r'content';
      yield serializers.serialize(
        object.content,
        specifiedType: const FullType.nullable(String),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    DogTrainingGuideCreate object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required DogTrainingGuideCreateBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'breed_id':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.breedId = valueDes;
          break;
        case r'age_stage_id':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.ageStageId = valueDes;
          break;
        case r'title':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.title = valueDes;
          break;
        case r'content':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.content = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  DogTrainingGuideCreate deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = DogTrainingGuideCreateBuilder();
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

