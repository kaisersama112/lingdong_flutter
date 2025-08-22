//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:lingdong_server/src/model/medication.dart';
import 'package:built_collection/built_collection.dart';
import 'package:lingdong_server/src/model/date.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'consultation_response.g.dart';

/// ConsultationResponse
///
/// Properties:
/// * [petId] - Pet Id，宠物ID
/// * [consultationType] - Consultation Type，就诊类型
/// * [hospitalName] - Hospital Name，医院名称
/// * [visitDate] - Visit Date，就诊日期
/// * [symptoms] - Symptoms，症状
/// * [diagnosis] - Diagnosis，诊断结果
/// * [treatmentPlan] - Treatment Plan，治疗方案
/// * [medications] - Medications，药物清单
/// * [doctorName] 
/// * [doctorPhone] 
/// * [doctorEmail] 
/// * [id] - Id，记录ID
@BuiltValue()
abstract class ConsultationResponse implements Built<ConsultationResponse, ConsultationResponseBuilder> {
  /// Pet Id，宠物ID
  @BuiltValueField(wireName: r'pet_id')
  int get petId;

  /// Consultation Type，就诊类型
  @BuiltValueField(wireName: r'consultation_type')
  String get consultationType;

  /// Hospital Name，医院名称
  @BuiltValueField(wireName: r'hospital_name')
  String get hospitalName;

  /// Visit Date，就诊日期
  @BuiltValueField(wireName: r'visit_date')
  Date get visitDate;

  /// Symptoms，症状
  @BuiltValueField(wireName: r'symptoms')
  String get symptoms;

  /// Diagnosis，诊断结果
  @BuiltValueField(wireName: r'diagnosis')
  String get diagnosis;

  /// Treatment Plan，治疗方案
  @BuiltValueField(wireName: r'treatment_plan')
  String get treatmentPlan;

  /// Medications，药物清单
  @BuiltValueField(wireName: r'medications')
  BuiltList<Medication> get medications;

  @BuiltValueField(wireName: r'doctor_name')
  String? get doctorName;

  @BuiltValueField(wireName: r'doctor_phone')
  String? get doctorPhone;

  @BuiltValueField(wireName: r'doctor_email')
  String? get doctorEmail;

  /// Id，记录ID
  @BuiltValueField(wireName: r'id')
  int get id;

  ConsultationResponse._();

  factory ConsultationResponse([void updates(ConsultationResponseBuilder b)]) = _$ConsultationResponse;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(ConsultationResponseBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<ConsultationResponse> get serializer => _$ConsultationResponseSerializer();
}

class _$ConsultationResponseSerializer implements PrimitiveSerializer<ConsultationResponse> {
  @override
  final Iterable<Type> types = const [ConsultationResponse, _$ConsultationResponse];

  @override
  final String wireName = r'ConsultationResponse';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    ConsultationResponse object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'pet_id';
    yield serializers.serialize(
      object.petId,
      specifiedType: const FullType(int),
    );
    yield r'consultation_type';
    yield serializers.serialize(
      object.consultationType,
      specifiedType: const FullType(String),
    );
    yield r'hospital_name';
    yield serializers.serialize(
      object.hospitalName,
      specifiedType: const FullType(String),
    );
    yield r'visit_date';
    yield serializers.serialize(
      object.visitDate,
      specifiedType: const FullType(Date),
    );
    yield r'symptoms';
    yield serializers.serialize(
      object.symptoms,
      specifiedType: const FullType(String),
    );
    yield r'diagnosis';
    yield serializers.serialize(
      object.diagnosis,
      specifiedType: const FullType(String),
    );
    yield r'treatment_plan';
    yield serializers.serialize(
      object.treatmentPlan,
      specifiedType: const FullType(String),
    );
    yield r'medications';
    yield serializers.serialize(
      object.medications,
      specifiedType: const FullType(BuiltList, [FullType(Medication)]),
    );
    if (object.doctorName != null) {
      yield r'doctor_name';
      yield serializers.serialize(
        object.doctorName,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.doctorPhone != null) {
      yield r'doctor_phone';
      yield serializers.serialize(
        object.doctorPhone,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.doctorEmail != null) {
      yield r'doctor_email';
      yield serializers.serialize(
        object.doctorEmail,
        specifiedType: const FullType.nullable(String),
      );
    }
    yield r'id';
    yield serializers.serialize(
      object.id,
      specifiedType: const FullType(int),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    ConsultationResponse object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required ConsultationResponseBuilder result,
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
        case r'consultation_type':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.consultationType = valueDes;
          break;
        case r'hospital_name':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.hospitalName = valueDes;
          break;
        case r'visit_date':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(Date),
          ) as Date;
          result.visitDate = valueDes;
          break;
        case r'symptoms':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.symptoms = valueDes;
          break;
        case r'diagnosis':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.diagnosis = valueDes;
          break;
        case r'treatment_plan':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.treatmentPlan = valueDes;
          break;
        case r'medications':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(BuiltList, [FullType(Medication)]),
          ) as BuiltList<Medication>;
          result.medications.replace(valueDes);
          break;
        case r'doctor_name':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.doctorName = valueDes;
          break;
        case r'doctor_phone':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.doctorPhone = valueDes;
          break;
        case r'doctor_email':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.doctorEmail = valueDes;
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
  ConsultationResponse deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = ConsultationResponseBuilder();
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

