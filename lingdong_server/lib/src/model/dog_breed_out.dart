//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:lingdong_server/src/model/media_out.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'dog_breed_out.g.dart';

/// DogBreedOut
///
/// Properties:
/// * [id] - Id
/// * [name] - Name
/// * [englishName] - English Name
/// * [origin] 
/// * [group] 
/// * [size] 
/// * [lifespan] 
/// * [temperament] 
/// * [appearance] 
/// * [careLevel] 
/// * [activityLevel] 
/// * [popularity] 
/// * [isPopular] - Is Popular
/// * [createdAt] - Created At
/// * [media] 
@BuiltValue()
abstract class DogBreedOut implements Built<DogBreedOut, DogBreedOutBuilder> {
  /// Id
  @BuiltValueField(wireName: r'id')
  int get id;

  /// Name
  @BuiltValueField(wireName: r'name')
  String get name;

  /// English Name
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

  /// Is Popular
  @BuiltValueField(wireName: r'is_popular')
  bool get isPopular;

  /// Created At
  @BuiltValueField(wireName: r'created_at')
  DateTime get createdAt;

  @BuiltValueField(wireName: r'media')
  BuiltList<MediaOut>? get media;

  DogBreedOut._();

  factory DogBreedOut([void updates(DogBreedOutBuilder b)]) = _$DogBreedOut;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(DogBreedOutBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<DogBreedOut> get serializer => _$DogBreedOutSerializer();
}

class _$DogBreedOutSerializer implements PrimitiveSerializer<DogBreedOut> {
  @override
  final Iterable<Type> types = const [DogBreedOut, _$DogBreedOut];

  @override
  final String wireName = r'DogBreedOut';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    DogBreedOut object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'id';
    yield serializers.serialize(
      object.id,
      specifiedType: const FullType(int),
    );
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
    yield r'origin';
    yield object.origin == null ? null : serializers.serialize(
      object.origin,
      specifiedType: const FullType.nullable(String),
    );
    yield r'group';
    yield object.group == null ? null : serializers.serialize(
      object.group,
      specifiedType: const FullType.nullable(String),
    );
    yield r'size';
    yield object.size == null ? null : serializers.serialize(
      object.size,
      specifiedType: const FullType.nullable(String),
    );
    yield r'lifespan';
    yield object.lifespan == null ? null : serializers.serialize(
      object.lifespan,
      specifiedType: const FullType.nullable(String),
    );
    yield r'temperament';
    yield object.temperament == null ? null : serializers.serialize(
      object.temperament,
      specifiedType: const FullType.nullable(String),
    );
    yield r'appearance';
    yield object.appearance == null ? null : serializers.serialize(
      object.appearance,
      specifiedType: const FullType.nullable(String),
    );
    yield r'care_level';
    yield object.careLevel == null ? null : serializers.serialize(
      object.careLevel,
      specifiedType: const FullType.nullable(int),
    );
    yield r'activity_level';
    yield object.activityLevel == null ? null : serializers.serialize(
      object.activityLevel,
      specifiedType: const FullType.nullable(int),
    );
    yield r'popularity';
    yield object.popularity == null ? null : serializers.serialize(
      object.popularity,
      specifiedType: const FullType.nullable(int),
    );
    yield r'is_popular';
    yield serializers.serialize(
      object.isPopular,
      specifiedType: const FullType(bool),
    );
    yield r'created_at';
    yield serializers.serialize(
      object.createdAt,
      specifiedType: const FullType(DateTime),
    );
    if (object.media != null) {
      yield r'media';
      yield serializers.serialize(
        object.media,
        specifiedType: const FullType.nullable(BuiltList, [FullType(MediaOut)]),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    DogBreedOut object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required DogBreedOutBuilder result,
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
            specifiedType: const FullType(bool),
          ) as bool;
          result.isPopular = valueDes;
          break;
        case r'created_at':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(DateTime),
          ) as DateTime;
          result.createdAt = valueDes;
          break;
        case r'media':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(BuiltList, [FullType(MediaOut)]),
          ) as BuiltList<MediaOut>?;
          if (valueDes == null) continue;
          result.media.replace(valueDes);
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  DogBreedOut deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = DogBreedOutBuilder();
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

