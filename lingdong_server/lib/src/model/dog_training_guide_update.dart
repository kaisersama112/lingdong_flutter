//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'dog_training_guide_update.g.dart';

/// DogTrainingGuideUpdate
///
/// Properties:
/// * [breedId] 
/// * [ageStageId] 
/// * [title] 
/// * [content] 
@BuiltValue()
abstract class DogTrainingGuideUpdate implements Built<DogTrainingGuideUpdate, DogTrainingGuideUpdateBuilder> {
  @BuiltValueField(wireName: r'breed_id')
  int? get breedId;

  @BuiltValueField(wireName: r'age_stage_id')
  int? get ageStageId;

  @BuiltValueField(wireName: r'title')
  String? get title;

  @BuiltValueField(wireName: r'content')
  String? get content;

  DogTrainingGuideUpdate._();

  factory DogTrainingGuideUpdate([void updates(DogTrainingGuideUpdateBuilder b)]) = _$DogTrainingGuideUpdate;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(DogTrainingGuideUpdateBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<DogTrainingGuideUpdate> get serializer => _$DogTrainingGuideUpdateSerializer();
}

class _$DogTrainingGuideUpdateSerializer implements PrimitiveSerializer<DogTrainingGuideUpdate> {
  @override
  final Iterable<Type> types = const [DogTrainingGuideUpdate, _$DogTrainingGuideUpdate];

  @override
  final String wireName = r'DogTrainingGuideUpdate';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    DogTrainingGuideUpdate object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.breedId != null) {
      yield r'breed_id';
      yield serializers.serialize(
        object.breedId,
        specifiedType: const FullType.nullable(int),
      );
    }
    if (object.ageStageId != null) {
      yield r'age_stage_id';
      yield serializers.serialize(
        object.ageStageId,
        specifiedType: const FullType.nullable(int),
      );
    }
    if (object.title != null) {
      yield r'title';
      yield serializers.serialize(
        object.title,
        specifiedType: const FullType.nullable(String),
      );
    }
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
    DogTrainingGuideUpdate object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required DogTrainingGuideUpdateBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'breed_id':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(int),
          ) as int?;
          if (valueDes == null) continue;
          result.breedId = valueDes;
          break;
        case r'age_stage_id':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(int),
          ) as int?;
          if (valueDes == null) continue;
          result.ageStageId = valueDes;
          break;
        case r'title':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
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
  DogTrainingGuideUpdate deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = DogTrainingGuideUpdateBuilder();
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

