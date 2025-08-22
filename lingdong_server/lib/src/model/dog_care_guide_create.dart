//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'dog_care_guide_create.g.dart';

/// DogCareGuideCreate
///
/// Properties:
/// * [breedId] - Breed Id，品种ID
/// * [ageStageId] - Age Stage Id，年龄阶段ID
/// * [title] - Title，指南标题，最多200个字符
/// * [content] 
@BuiltValue()
abstract class DogCareGuideCreate implements Built<DogCareGuideCreate, DogCareGuideCreateBuilder> {
  /// Breed Id，品种ID
  @BuiltValueField(wireName: r'breed_id')
  int get breedId;

  /// Age Stage Id，年龄阶段ID
  @BuiltValueField(wireName: r'age_stage_id')
  int get ageStageId;

  /// Title，指南标题，最多200个字符
  @BuiltValueField(wireName: r'title')
  String get title;

  @BuiltValueField(wireName: r'content')
  String? get content;

  DogCareGuideCreate._();

  factory DogCareGuideCreate([void updates(DogCareGuideCreateBuilder b)]) = _$DogCareGuideCreate;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(DogCareGuideCreateBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<DogCareGuideCreate> get serializer => _$DogCareGuideCreateSerializer();
}

class _$DogCareGuideCreateSerializer implements PrimitiveSerializer<DogCareGuideCreate> {
  @override
  final Iterable<Type> types = const [DogCareGuideCreate, _$DogCareGuideCreate];

  @override
  final String wireName = r'DogCareGuideCreate';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    DogCareGuideCreate object, {
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
    DogCareGuideCreate object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required DogCareGuideCreateBuilder result,
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
  DogCareGuideCreate deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = DogCareGuideCreateBuilder();
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

