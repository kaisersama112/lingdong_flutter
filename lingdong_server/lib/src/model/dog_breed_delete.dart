//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'dog_breed_delete.g.dart';

/// DogBreedDelete
///
/// Properties:
/// * [breedId] - Breed Id，品种id
@BuiltValue()
abstract class DogBreedDelete implements Built<DogBreedDelete, DogBreedDeleteBuilder> {
  /// Breed Id，品种id
  @BuiltValueField(wireName: r'breed_id')
  int get breedId;

  DogBreedDelete._();

  factory DogBreedDelete([void updates(DogBreedDeleteBuilder b)]) = _$DogBreedDelete;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(DogBreedDeleteBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<DogBreedDelete> get serializer => _$DogBreedDeleteSerializer();
}

class _$DogBreedDeleteSerializer implements PrimitiveSerializer<DogBreedDelete> {
  @override
  final Iterable<Type> types = const [DogBreedDelete, _$DogBreedDelete];

  @override
  final String wireName = r'DogBreedDelete';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    DogBreedDelete object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'breed_id';
    yield serializers.serialize(
      object.breedId,
      specifiedType: const FullType(int),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    DogBreedDelete object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required DogBreedDeleteBuilder result,
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
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  DogBreedDelete deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = DogBreedDeleteBuilder();
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

