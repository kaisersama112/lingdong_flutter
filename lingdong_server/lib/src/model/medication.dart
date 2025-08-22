//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'medication.g.dart';

/// Medication
///
/// Properties:
/// * [name] - Name，药物名称
/// * [dosage] - Dosage，剂量
/// * [frequency] - Frequency，用药频率
@BuiltValue()
abstract class Medication implements Built<Medication, MedicationBuilder> {
  /// Name，药物名称
  @BuiltValueField(wireName: r'name')
  String get name;

  /// Dosage，剂量
  @BuiltValueField(wireName: r'dosage')
  String get dosage;

  /// Frequency，用药频率
  @BuiltValueField(wireName: r'frequency')
  String get frequency;

  Medication._();

  factory Medication([void updates(MedicationBuilder b)]) = _$Medication;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(MedicationBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<Medication> get serializer => _$MedicationSerializer();
}

class _$MedicationSerializer implements PrimitiveSerializer<Medication> {
  @override
  final Iterable<Type> types = const [Medication, _$Medication];

  @override
  final String wireName = r'Medication';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    Medication object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'name';
    yield serializers.serialize(
      object.name,
      specifiedType: const FullType(String),
    );
    yield r'dosage';
    yield serializers.serialize(
      object.dosage,
      specifiedType: const FullType(String),
    );
    yield r'frequency';
    yield serializers.serialize(
      object.frequency,
      specifiedType: const FullType(String),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    Medication object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required MedicationBuilder result,
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
        case r'dosage':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.dosage = valueDes;
          break;
        case r'frequency':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.frequency = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  Medication deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = MedicationBuilder();
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

