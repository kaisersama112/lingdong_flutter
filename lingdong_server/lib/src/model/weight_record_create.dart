//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'weight_record_create.g.dart';

/// WeightRecordCreate
///
/// Properties:
/// * [weightValue] - Weight Value，体重值
@BuiltValue()
abstract class WeightRecordCreate implements Built<WeightRecordCreate, WeightRecordCreateBuilder> {
  /// Weight Value，体重值
  @BuiltValueField(wireName: r'weight_value')
  num get weightValue;

  WeightRecordCreate._();

  factory WeightRecordCreate([void updates(WeightRecordCreateBuilder b)]) = _$WeightRecordCreate;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(WeightRecordCreateBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<WeightRecordCreate> get serializer => _$WeightRecordCreateSerializer();
}

class _$WeightRecordCreateSerializer implements PrimitiveSerializer<WeightRecordCreate> {
  @override
  final Iterable<Type> types = const [WeightRecordCreate, _$WeightRecordCreate];

  @override
  final String wireName = r'WeightRecordCreate';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    WeightRecordCreate object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'weight_value';
    yield serializers.serialize(
      object.weightValue,
      specifiedType: const FullType(num),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    WeightRecordCreate object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required WeightRecordCreateBuilder result,
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
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  WeightRecordCreate deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = WeightRecordCreateBuilder();
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

