//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'dog_care_guide_update.g.dart';

/// DogCareGuideUpdate
///
/// Properties:
/// * [guideId] - Guide Id
/// * [breedId] 
/// * [ageStageId] 
/// * [title] 
/// * [content] 
@BuiltValue()
abstract class DogCareGuideUpdate implements Built<DogCareGuideUpdate, DogCareGuideUpdateBuilder> {
  /// Guide Id
  @BuiltValueField(wireName: r'guide_id')
  int get guideId;

  @BuiltValueField(wireName: r'breed_id')
  int? get breedId;

  @BuiltValueField(wireName: r'age_stage_id')
  int? get ageStageId;

  @BuiltValueField(wireName: r'title')
  String? get title;

  @BuiltValueField(wireName: r'content')
  String? get content;

  DogCareGuideUpdate._();

  factory DogCareGuideUpdate([void updates(DogCareGuideUpdateBuilder b)]) = _$DogCareGuideUpdate;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(DogCareGuideUpdateBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<DogCareGuideUpdate> get serializer => _$DogCareGuideUpdateSerializer();
}

class _$DogCareGuideUpdateSerializer implements PrimitiveSerializer<DogCareGuideUpdate> {
  @override
  final Iterable<Type> types = const [DogCareGuideUpdate, _$DogCareGuideUpdate];

  @override
  final String wireName = r'DogCareGuideUpdate';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    DogCareGuideUpdate object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'guide_id';
    yield serializers.serialize(
      object.guideId,
      specifiedType: const FullType(int),
    );
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
    DogCareGuideUpdate object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required DogCareGuideUpdateBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'guide_id':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.guideId = valueDes;
          break;
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
  DogCareGuideUpdate deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = DogCareGuideUpdateBuilder();
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

