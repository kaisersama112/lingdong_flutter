//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:lingdong_server/src/model/pet_response.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'pet_list_response.g.dart';

/// PetListResponse，宠物档案列表响应模型
///
/// Properties:
/// * [pets] 
/// * [total] 
@BuiltValue()
abstract class PetListResponse implements Built<PetListResponse, PetListResponseBuilder> {
  @BuiltValueField(wireName: r'pets')
  BuiltList<PetResponse>? get pets;

  @BuiltValueField(wireName: r'total')
  int? get total;

  PetListResponse._();

  factory PetListResponse([void updates(PetListResponseBuilder b)]) = _$PetListResponse;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(PetListResponseBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<PetListResponse> get serializer => _$PetListResponseSerializer();
}

class _$PetListResponseSerializer implements PrimitiveSerializer<PetListResponse> {
  @override
  final Iterable<Type> types = const [PetListResponse, _$PetListResponse];

  @override
  final String wireName = r'PetListResponse';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    PetListResponse object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.pets != null) {
      yield r'pets';
      yield serializers.serialize(
        object.pets,
        specifiedType: const FullType.nullable(BuiltList, [FullType(PetResponse)]),
      );
    }
    if (object.total != null) {
      yield r'total';
      yield serializers.serialize(
        object.total,
        specifiedType: const FullType.nullable(int),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    PetListResponse object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required PetListResponseBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'pets':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(BuiltList, [FullType(PetResponse)]),
          ) as BuiltList<PetResponse>?;
          if (valueDes == null) continue;
          result.pets.replace(valueDes);
          break;
        case r'total':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(int),
          ) as int?;
          if (valueDes == null) continue;
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
  PetListResponse deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = PetListResponseBuilder();
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

