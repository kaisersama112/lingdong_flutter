//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:lingdong_server/src/model/date.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'vaccination_record_create.g.dart';

/// VaccinationRecordCreate
///
/// Properties:
/// * [petId] - Pet Id，宠物ID
/// * [vaccinationType] - Vaccination Type，疫苗类型
/// * [vaccineName] 
/// * [vaccineManufacturer] 
/// * [vaccineBatchNumber] 
/// * [location] 
/// * [validityPeriod] 
/// * [nextDueDate] 
@BuiltValue()
abstract class VaccinationRecordCreate implements Built<VaccinationRecordCreate, VaccinationRecordCreateBuilder> {
  /// Pet Id，宠物ID
  @BuiltValueField(wireName: r'pet_id')
  int get petId;

  /// Vaccination Type，疫苗类型
  @BuiltValueField(wireName: r'vaccination_type')
  String get vaccinationType;

  @BuiltValueField(wireName: r'vaccine_name')
  String? get vaccineName;

  @BuiltValueField(wireName: r'vaccine_manufacturer')
  String? get vaccineManufacturer;

  @BuiltValueField(wireName: r'vaccine_batch_number')
  String? get vaccineBatchNumber;

  @BuiltValueField(wireName: r'location')
  String? get location;

  @BuiltValueField(wireName: r'validity_period')
  String? get validityPeriod;

  @BuiltValueField(wireName: r'next_due_date')
  Date? get nextDueDate;

  VaccinationRecordCreate._();

  factory VaccinationRecordCreate([void updates(VaccinationRecordCreateBuilder b)]) = _$VaccinationRecordCreate;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(VaccinationRecordCreateBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<VaccinationRecordCreate> get serializer => _$VaccinationRecordCreateSerializer();
}

class _$VaccinationRecordCreateSerializer implements PrimitiveSerializer<VaccinationRecordCreate> {
  @override
  final Iterable<Type> types = const [VaccinationRecordCreate, _$VaccinationRecordCreate];

  @override
  final String wireName = r'VaccinationRecordCreate';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    VaccinationRecordCreate object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'pet_id';
    yield serializers.serialize(
      object.petId,
      specifiedType: const FullType(int),
    );
    yield r'vaccination_type';
    yield serializers.serialize(
      object.vaccinationType,
      specifiedType: const FullType(String),
    );
    if (object.vaccineName != null) {
      yield r'vaccine_name';
      yield serializers.serialize(
        object.vaccineName,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.vaccineManufacturer != null) {
      yield r'vaccine_manufacturer';
      yield serializers.serialize(
        object.vaccineManufacturer,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.vaccineBatchNumber != null) {
      yield r'vaccine_batch_number';
      yield serializers.serialize(
        object.vaccineBatchNumber,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.location != null) {
      yield r'location';
      yield serializers.serialize(
        object.location,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.validityPeriod != null) {
      yield r'validity_period';
      yield serializers.serialize(
        object.validityPeriod,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.nextDueDate != null) {
      yield r'next_due_date';
      yield serializers.serialize(
        object.nextDueDate,
        specifiedType: const FullType.nullable(Date),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    VaccinationRecordCreate object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required VaccinationRecordCreateBuilder result,
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
        case r'vaccination_type':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.vaccinationType = valueDes;
          break;
        case r'vaccine_name':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.vaccineName = valueDes;
          break;
        case r'vaccine_manufacturer':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.vaccineManufacturer = valueDes;
          break;
        case r'vaccine_batch_number':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.vaccineBatchNumber = valueDes;
          break;
        case r'location':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.location = valueDes;
          break;
        case r'validity_period':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.validityPeriod = valueDes;
          break;
        case r'next_due_date':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(Date),
          ) as Date?;
          if (valueDes == null) continue;
          result.nextDueDate = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  VaccinationRecordCreate deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = VaccinationRecordCreateBuilder();
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

