//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'dog_breed_create.g.dart';

/// DogBreedCreate
///
/// Properties:
/// * [name] - Name，品种名称
/// * [englishName] - English Name，品种英文名称
/// * [origin] 
/// * [group] 
/// * [size] 
/// * [lifespan] 
/// * [temperament] 
/// * [appearance] 
/// * [careLevel] 
/// * [activityLevel] 
/// * [popularity] 
/// * [isPopular] 
/// * [mediaIds] 
@BuiltValue()
abstract class DogBreedCreate implements Built<DogBreedCreate, DogBreedCreateBuilder> {
  /// Name，品种名称
  @BuiltValueField(wireName: r'name')
  String get name;

  /// English Name，品种英文名称
  @BuiltValueField(wireName: r'english_name')
  String get englishName;

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

  @BuiltValueField(wireName: r'popularity')
  int? get popularity;

  @BuiltValueField(wireName: r'is_popular')
  bool? get isPopular;

  @BuiltValueField(wireName: r'media_ids')
  BuiltList<int>? get mediaIds;

  DogBreedCreate._();

  factory DogBreedCreate([void updates(DogBreedCreateBuilder b)]) = _$DogBreedCreate;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(DogBreedCreateBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<DogBreedCreate> get serializer => _$DogBreedCreateSerializer();
}

class _$DogBreedCreateSerializer implements PrimitiveSerializer<DogBreedCreate> {
  @override
  final Iterable<Type> types = const [DogBreedCreate, _$DogBreedCreate];

  @override
  final String wireName = r'DogBreedCreate';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    DogBreedCreate object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'name';
    yield serializers.serialize(
      object.name,
      specifiedType: const FullType(String),
    );
    yield r'english_name';
    yield serializers.serialize(
      object.englishName,
      specifiedType: const FullType(String),
    );
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
    if (object.popularity != null) {
      yield r'popularity';
      yield serializers.serialize(
        object.popularity,
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
    DogBreedCreate object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required DogBreedCreateBuilder result,
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
        case r'english_name':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
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
        case r'popularity':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(int),
          ) as int?;
          if (valueDes == null) continue;
          result.popularity = valueDes;
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
  DogBreedCreate deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = DogBreedCreateBuilder();
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

