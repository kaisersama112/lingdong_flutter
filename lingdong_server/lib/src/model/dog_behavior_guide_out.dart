//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'dog_behavior_guide_out.g.dart';

/// DogBehaviorGuideOut
///
/// Properties:
/// * [id] - Id
/// * [breedId] - Breed Id
/// * [ageStageId] 
/// * [title] - Title
/// * [content] 
/// * [createdAt] - Created At
/// * [updatedAt] - Updated At
/// * [ageStageName] 
@BuiltValue()
abstract class DogBehaviorGuideOut implements Built<DogBehaviorGuideOut, DogBehaviorGuideOutBuilder> {
  /// Id
  @BuiltValueField(wireName: r'id')
  int get id;

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

  /// Created At
  @BuiltValueField(wireName: r'created_at')
  DateTime get createdAt;

  /// Updated At
  @BuiltValueField(wireName: r'updated_at')
  DateTime get updatedAt;

  @BuiltValueField(wireName: r'age_stage_name')
  String? get ageStageName;

  DogBehaviorGuideOut._();

  factory DogBehaviorGuideOut([void updates(DogBehaviorGuideOutBuilder b)]) = _$DogBehaviorGuideOut;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(DogBehaviorGuideOutBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<DogBehaviorGuideOut> get serializer => _$DogBehaviorGuideOutSerializer();
}

class _$DogBehaviorGuideOutSerializer implements PrimitiveSerializer<DogBehaviorGuideOut> {
  @override
  final Iterable<Type> types = const [DogBehaviorGuideOut, _$DogBehaviorGuideOut];

  @override
  final String wireName = r'DogBehaviorGuideOut';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    DogBehaviorGuideOut object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'id';
    yield serializers.serialize(
      object.id,
      specifiedType: const FullType(int),
    );
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
    yield r'created_at';
    yield serializers.serialize(
      object.createdAt,
      specifiedType: const FullType(DateTime),
    );
    yield r'updated_at';
    yield serializers.serialize(
      object.updatedAt,
      specifiedType: const FullType(DateTime),
    );
    if (object.ageStageName != null) {
      yield r'age_stage_name';
      yield serializers.serialize(
        object.ageStageName,
        specifiedType: const FullType.nullable(String),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    DogBehaviorGuideOut object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required DogBehaviorGuideOutBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'id':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.id = valueDes;
          break;
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
        case r'created_at':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(DateTime),
          ) as DateTime;
          result.createdAt = valueDes;
          break;
        case r'updated_at':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(DateTime),
          ) as DateTime;
          result.updatedAt = valueDes;
          break;
        case r'age_stage_name':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.ageStageName = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  DogBehaviorGuideOut deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = DogBehaviorGuideOutBuilder();
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

