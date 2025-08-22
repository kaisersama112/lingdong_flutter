//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:lingdong_server/src/model/media_out.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'dog_breed_response.g.dart';

/// DogBreedResponse
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
/// * [isPopular] 
/// * [createdAt] - Created At
/// * [updatedAt] - Updated At
/// * [media] - Media
@BuiltValue()
abstract class DogBreedResponse implements Built<DogBreedResponse, DogBreedResponseBuilder> {
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

  @BuiltValueField(wireName: r'is_popular')
  bool? get isPopular;

  /// Created At
  @BuiltValueField(wireName: r'created_at')
  DateTime get createdAt;

  /// Updated At
  @BuiltValueField(wireName: r'updated_at')
  DateTime get updatedAt;

  /// Media
  @BuiltValueField(wireName: r'media')
  BuiltList<MediaOut>? get media;

  DogBreedResponse._();

  factory DogBreedResponse([void updates(DogBreedResponseBuilder b)]) = _$DogBreedResponse;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(DogBreedResponseBuilder b) => b
      ..media = ListBuilder();

  @BuiltValueSerializer(custom: true)
  static Serializer<DogBreedResponse> get serializer => _$DogBreedResponseSerializer();
}

class _$DogBreedResponseSerializer implements PrimitiveSerializer<DogBreedResponse> {
  @override
  final Iterable<Type> types = const [DogBreedResponse, _$DogBreedResponse];

  @override
  final String wireName = r'DogBreedResponse';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    DogBreedResponse object, {
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
    if (object.media != null) {
      yield r'media';
      yield serializers.serialize(
        object.media,
        specifiedType: const FullType(BuiltList, [FullType(MediaOut)]),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    DogBreedResponse object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required DogBreedResponseBuilder result,
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
        case r'is_popular':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(bool),
          ) as bool?;
          if (valueDes == null) continue;
          result.isPopular = valueDes;
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
        case r'media':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(BuiltList, [FullType(MediaOut)]),
          ) as BuiltList<MediaOut>;
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
  DogBreedResponse deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = DogBreedResponseBuilder();
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

