//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'breed_detail.g.dart';

/// BreedDetail
///
/// Properties:
/// * [breedId] - Breed Id，品种id
@BuiltValue()
abstract class BreedDetail implements Built<BreedDetail, BreedDetailBuilder> {
  /// Breed Id，品种id
  @BuiltValueField(wireName: r'breed_id')
  int get breedId;

  BreedDetail._();

  factory BreedDetail([void updates(BreedDetailBuilder b)]) = _$BreedDetail;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(BreedDetailBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<BreedDetail> get serializer => _$BreedDetailSerializer();
}

class _$BreedDetailSerializer implements PrimitiveSerializer<BreedDetail> {
  @override
  final Iterable<Type> types = const [BreedDetail, _$BreedDetail];

  @override
  final String wireName = r'BreedDetail';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    BreedDetail object, {
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
    BreedDetail object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required BreedDetailBuilder result,
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
  BreedDetail deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = BreedDetailBuilder();
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

