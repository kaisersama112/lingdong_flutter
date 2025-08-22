//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:lingdong_server/src/model/dog_breed_response.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'dog_breed_list_response.g.dart';

/// DogBreedListResponse，种类列表响应模型
///
/// Properties:
/// * [breeds] - Breeds
/// * [total] - Total
@BuiltValue()
abstract class DogBreedListResponse implements Built<DogBreedListResponse, DogBreedListResponseBuilder> {
  /// Breeds
  @BuiltValueField(wireName: r'breeds')
  BuiltList<DogBreedResponse> get breeds;

  /// Total
  @BuiltValueField(wireName: r'total')
  int get total;

  DogBreedListResponse._();

  factory DogBreedListResponse([void updates(DogBreedListResponseBuilder b)]) = _$DogBreedListResponse;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(DogBreedListResponseBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<DogBreedListResponse> get serializer => _$DogBreedListResponseSerializer();
}

class _$DogBreedListResponseSerializer implements PrimitiveSerializer<DogBreedListResponse> {
  @override
  final Iterable<Type> types = const [DogBreedListResponse, _$DogBreedListResponse];

  @override
  final String wireName = r'DogBreedListResponse';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    DogBreedListResponse object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'breeds';
    yield serializers.serialize(
      object.breeds,
      specifiedType: const FullType(BuiltList, [FullType(DogBreedResponse)]),
    );
    yield r'total';
    yield serializers.serialize(
      object.total,
      specifiedType: const FullType(int),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    DogBreedListResponse object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required DogBreedListResponseBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'breeds':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(BuiltList, [FullType(DogBreedResponse)]),
          ) as BuiltList<DogBreedResponse>;
          result.breeds.replace(valueDes);
          break;
        case r'total':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.total = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  DogBreedListResponse deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = DogBreedListResponseBuilder();
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

