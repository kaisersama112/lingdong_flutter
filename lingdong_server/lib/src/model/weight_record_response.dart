//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:lingdong_server/src/model/date.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'weight_record_response.g.dart';

/// WeightRecordResponse
///
/// Properties:
/// * [petId] - Pet Id，宠物ID
/// * [weightValue] 
/// * [id] - Id，记录ID
/// * [createdAt] 
/// * [recordDate] 
@BuiltValue()
abstract class WeightRecordResponse implements Built<WeightRecordResponse, WeightRecordResponseBuilder> {
  /// Pet Id，宠物ID
  @BuiltValueField(wireName: r'pet_id')
  int get petId;

  @BuiltValueField(wireName: r'weight_value')
  num? get weightValue;

  /// Id，记录ID
  @BuiltValueField(wireName: r'id')
  int get id;

  @BuiltValueField(wireName: r'created_at')
  Date? get createdAt;

  @BuiltValueField(wireName: r'record_date')
  Date? get recordDate;

  WeightRecordResponse._();

  factory WeightRecordResponse([void updates(WeightRecordResponseBuilder b)]) = _$WeightRecordResponse;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(WeightRecordResponseBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<WeightRecordResponse> get serializer => _$WeightRecordResponseSerializer();
}

class _$WeightRecordResponseSerializer implements PrimitiveSerializer<WeightRecordResponse> {
  @override
  final Iterable<Type> types = const [WeightRecordResponse, _$WeightRecordResponse];

  @override
  final String wireName = r'WeightRecordResponse';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    WeightRecordResponse object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'pet_id';
    yield serializers.serialize(
      object.petId,
      specifiedType: const FullType(int),
    );
    yield r'weight_value';
    yield object.weightValue == null ? null : serializers.serialize(
      object.weightValue,
      specifiedType: const FullType.nullable(num),
    );
    yield r'id';
    yield serializers.serialize(
      object.id,
      specifiedType: const FullType(int),
    );
    yield r'created_at';
    yield object.createdAt == null ? null : serializers.serialize(
      object.createdAt,
      specifiedType: const FullType.nullable(Date),
    );
    yield r'record_date';
    yield object.recordDate == null ? null : serializers.serialize(
      object.recordDate,
      specifiedType: const FullType.nullable(Date),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    WeightRecordResponse object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required WeightRecordResponseBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'pet_id':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.petId = valueDes;
          break;
        case r'weight_value':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(num),
          ) as num?;
          if (valueDes == null) continue;
          result.weightValue = valueDes;
          break;
        case r'id':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.id = valueDes;
          break;
        case r'created_at':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(Date),
          ) as Date?;
          if (valueDes == null) continue;
          result.createdAt = valueDes;
          break;
        case r'record_date':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(Date),
          ) as Date?;
          if (valueDes == null) continue;
          result.recordDate = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  WeightRecordResponse deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = WeightRecordResponseBuilder();
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

