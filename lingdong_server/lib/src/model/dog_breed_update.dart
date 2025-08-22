//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'dog_breed_update.g.dart';

/// DogBreedUpdate
///
/// Properties:
/// * [breedId] - Breed Id，品种id
/// * [name] 
/// * [englishName] 
/// * [origin] 
/// * [group] 
/// * [size] 
/// * [lifespan] 
/// * [temperament] 
/// * [appearance] 
/// * [careLevel] 
/// * [activityLevel] 
/// * [isPopular] 
/// * [mediaIds] 
@BuiltValue()
abstract class DogBreedUpdate implements Built<DogBreedUpdate, DogBreedUpdateBuilder> {
  /// Breed Id，品种id
  @BuiltValueField(wireName: r'breed_id')
  int get breedId;

  @BuiltValueField(wireName: r'name')
  String? get name;

  @BuiltValueField(wireName: r'english_name')
  String? get englishName;

  @BuiltValueField(wireName: r'origin')
  String? get origin;

  @BuiltValueField(wireName: r'group')
  String? get group;

  @BuiltValueField(wireName: r'size')
  String? get size;

  @BuiltValueField(wireName: r'lifespan')
  String? get lifespan;

  @BuiltValueField(wireName: r'temperament')
  String? get temperament;

  @BuiltValueField(wireName: r'appearance')
  String? get appearance;

  @BuiltValueField(wireName: r'care_level')
  int? get careLevel;

  @BuiltValueField(wireName: r'activity_level')
  int? get activityLevel;

  @BuiltValueField(wireName: r'is_popular')
  bool? get isPopular;

  @BuiltValueField(wireName: r'media_ids')
  BuiltList<int>? get mediaIds;

  DogBreedUpdate._();

  factory DogBreedUpdate([void updates(DogBreedUpdateBuilder b)]) = _$DogBreedUpdate;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(DogBreedUpdateBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<DogBreedUpdate> get serializer => _$DogBreedUpdateSerializer();
}

class _$DogBreedUpdateSerializer implements PrimitiveSerializer<DogBreedUpdate> {
  @override
  final Iterable<Type> types = const [DogBreedUpdate, _$DogBreedUpdate];

  @override
  final String wireName = r'DogBreedUpdate';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    DogBreedUpdate object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'breed_id';
    yield serializers.serialize(
      object.breedId,
      specifiedType: const FullType(int),
    );
    if (object.name != null) {
      yield r'name';
      yield serializers.serialize(
        object.name,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.englishName != null) {
      yield r'english_name';
      yield serializers.serialize(
        object.englishName,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.origin != null) {
      yield r'origin';
      yield serializers.serialize(
        object.origin,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.group != null) {
      yield r'group';
      yield serializers.serialize(
        object.group,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.size != null) {
      yield r'size';
      yield serializers.serialize(
        object.size,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.lifespan != null) {
      yield r'lifespan';
      yield serializers.serialize(
        object.lifespan,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.temperament != null) {
      yield r'temperament';
      yield serializers.serialize(
        object.temperament,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.appearance != null) {
      yield r'appearance';
      yield serializers.serialize(
        object.appearance,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.careLevel != null) {
      yield r'care_level';
      yield serializers.serialize(
        object.careLevel,
        specifiedType: const FullType.nullable(int),
      );
    }
    if (object.activityLevel != null) {
      yield r'activity_level';
      yield serializers.serialize(
        object.activityLevel,
        specifiedType: const FullType.nullable(int),
      );
    }
    if (object.isPopular != null) {
      yield r'is_popular';
      yield serializers.serialize(
        object.isPopular,
        specifiedType: const FullType.nullable(bool),
      );
    }
    if (object.mediaIds != null) {
      yield r'media_ids';
      yield serializers.serialize(
        object.mediaIds,
        specifiedType: const FullType.nullable(BuiltList, [FullType(int)]),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    DogBreedUpdate object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required DogBreedUpdateBuilder result,
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
        case r'name':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.name = valueDes;
          break;
        case r'english_name':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.englishName = valueDes;
          break;
        case r'origin':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.origin = valueDes;
          break;
        case r'group':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.group = valueDes;
          break;
        case r'size':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.size = valueDes;
          break;
        case r'lifespan':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.lifespan = valueDes;
          break;
        case r'temperament':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.temperament = valueDes;
          break;
        case r'appearance':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.appearance = valueDes;
          break;
        case r'care_level':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(int),
          ) as int?;
          if (valueDes == null) continue;
          result.careLevel = valueDes;
          break;
        case r'activity_level':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(int),
          ) as int?;
          if (valueDes == null) continue;
          result.activityLevel = valueDes;
          break;
        case r'is_popular':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(bool),
          ) as bool?;
          if (valueDes == null) continue;
          result.isPopular = valueDes;
          break;
        case r'media_ids':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(BuiltList, [FullType(int)]),
          ) as BuiltList<int>?;
          if (valueDes == null) continue;
          result.mediaIds.replace(valueDes);
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  DogBreedUpdate deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = DogBreedUpdateBuilder();
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

