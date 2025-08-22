//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'dog_behavior_guide_create.g.dart';

/// DogBehaviorGuideCreate
///
/// Properties:
/// * [breedId] - Breed Id
/// * [ageStageId] 
/// * [title] - Title
/// * [content] 
@BuiltValue()
abstract class DogBehaviorGuideCreate implements Built<DogBehaviorGuideCreate, DogBehaviorGuideCreateBuilder> {
  /// Breed Id
  @BuiltValueField(wireName: r'breed_id')
  int get breedId;

  @BuiltValueField(wireName: r'age_stage_id')
  int? get ageStageId;

  /// Title
  @BuiltValueField(wireName: r'title')
  String get title;

  @BuiltValueField(wireName: r'content')
  String? get content;

  DogBehaviorGuideCreate._();

  factory DogBehaviorGuideCreate([void updates(DogBehaviorGuideCreateBuilder b)]) = _$DogBehaviorGuideCreate;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(DogBehaviorGuideCreateBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<DogBehaviorGuideCreate> get serializer => _$DogBehaviorGuideCreateSerializer();
}

class _$DogBehaviorGuideCreateSerializer implements PrimitiveSerializer<DogBehaviorGuideCreate> {
  @override
  final Iterable<Type> types = const [DogBehaviorGuideCreate, _$DogBehaviorGuideCreate];

  @override
  final String wireName = r'DogBehaviorGuideCreate';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    DogBehaviorGuideCreate object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'breed_id';
    yield serializers.serialize(
      object.breedId,
      specifiedType: const FullType(int),
    );
    if (object.ageStageId != null) {
      yield r'age_stage_id';
      yield serializers.serialize(
        object.ageStageId,
        specifiedType: const FullType.nullable(int),
      );
    }
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
    DogBehaviorGuideCreate object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required DogBehaviorGuideCreateBuilder result,
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
            specifiedType: const FullType.nullable(int),
          ) as int?;
          if (valueDes == null) continue;
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
  DogBehaviorGuideCreate deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = DogBehaviorGuideCreateBuilder();
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

