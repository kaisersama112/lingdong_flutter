//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'weight_record_response.g.dart';

/// WeightRecordResponse
///
/// Properties:
/// * [weightValue] - Weight Value，体重值
/// * [id] - Id，记录ID
@BuiltValue()
abstract class WeightRecordResponse implements Built<WeightRecordResponse, WeightRecordResponseBuilder> {
  /// Weight Value，体重值
  @BuiltValueField(wireName: r'weight_value')
  num get weightValue;

  /// Id，记录ID
  @BuiltValueField(wireName: r'id')
  int get id;

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
    yield r'weight_value';
    yield serializers.serialize(
      object.weightValue,
      specifiedType: const FullType(num),
    );
    yield r'id';
    yield serializers.serialize(
      object.id,
      specifiedType: const FullType(int),
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
        case r'weight_value':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(num),
          ) as num;
          result.weightValue = valueDes;
          break;
        case r'id':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.id = valueDes;
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

