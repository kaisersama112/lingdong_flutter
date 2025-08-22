//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:lingdong_server/src/model/date.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'examination_record_response.g.dart';

/// ExaminationRecordResponse
///
/// Properties:
/// * [petId] - Pet Id，宠物ID
/// * [testType] - Test Type，检测类型
/// * [testDate] - Test Date，检测日期
/// * [testInstitution] - Test Institution，检测机构
/// * [attendingVet] 
/// * [testItems] - Test Items，检测项目
/// * [testResults] - Test Results，检测结果
/// * [referenceRange] 
/// * [doctorComments] 
/// * [recommendations] 
/// * [followUpRequired] 
/// * [nextCheckupDate] 
/// * [id] - Id，记录ID
@BuiltValue()
abstract class ExaminationRecordResponse implements Built<ExaminationRecordResponse, ExaminationRecordResponseBuilder> {
  /// Pet Id，宠物ID
  @BuiltValueField(wireName: r'pet_id')
  int get petId;

  /// Test Type，检测类型
  @BuiltValueField(wireName: r'test_type')
  String get testType;

  /// Test Date，检测日期
  @BuiltValueField(wireName: r'test_date')
  Date get testDate;

  /// Test Institution，检测机构
  @BuiltValueField(wireName: r'test_institution')
  String get testInstitution;

  @BuiltValueField(wireName: r'attending_vet')
  String? get attendingVet;

  /// Test Items，检测项目
  @BuiltValueField(wireName: r'test_items')
  BuiltList<String> get testItems;

  /// Test Results，检测结果
  @BuiltValueField(wireName: r'test_results')
  BuiltMap<String, String> get testResults;

  @BuiltValueField(wireName: r'reference_range')
  String? get referenceRange;

  @BuiltValueField(wireName: r'doctor_comments')
  String? get doctorComments;

  @BuiltValueField(wireName: r'recommendations')
  String? get recommendations;

  @BuiltValueField(wireName: r'follow_up_required')
  bool? get followUpRequired;

  @BuiltValueField(wireName: r'next_checkup_date')
  Date? get nextCheckupDate;

  /// Id，记录ID
  @BuiltValueField(wireName: r'id')
  int get id;

  ExaminationRecordResponse._();

  factory ExaminationRecordResponse([void updates(ExaminationRecordResponseBuilder b)]) = _$ExaminationRecordResponse;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(ExaminationRecordResponseBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<ExaminationRecordResponse> get serializer => _$ExaminationRecordResponseSerializer();
}

class _$ExaminationRecordResponseSerializer implements PrimitiveSerializer<ExaminationRecordResponse> {
  @override
  final Iterable<Type> types = const [ExaminationRecordResponse, _$ExaminationRecordResponse];

  @override
  final String wireName = r'ExaminationRecordResponse';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    ExaminationRecordResponse object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'pet_id';
    yield serializers.serialize(
      object.petId,
      specifiedType: const FullType(int),
    );
    yield r'test_type';
    yield serializers.serialize(
      object.testType,
      specifiedType: const FullType(String),
    );
    yield r'test_date';
    yield serializers.serialize(
      object.testDate,
      specifiedType: const FullType(Date),
    );
    yield r'test_institution';
    yield serializers.serialize(
      object.testInstitution,
      specifiedType: const FullType(String),
    );
    if (object.attendingVet != null) {
      yield r'attending_vet';
      yield serializers.serialize(
        object.attendingVet,
        specifiedType: const FullType.nullable(String),
      );
    }
    yield r'test_items';
    yield serializers.serialize(
      object.testItems,
      specifiedType: const FullType(BuiltList, [FullType(String)]),
    );
    yield r'test_results';
    yield serializers.serialize(
      object.testResults,
      specifiedType: const FullType(BuiltMap, [FullType(String), FullType(String)]),
    );
    if (object.referenceRange != null) {
      yield r'reference_range';
      yield serializers.serialize(
        object.referenceRange,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.doctorComments != null) {
      yield r'doctor_comments';
      yield serializers.serialize(
        object.doctorComments,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.recommendations != null) {
      yield r'recommendations';
      yield serializers.serialize(
        object.recommendations,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.followUpRequired != null) {
      yield r'follow_up_required';
      yield serializers.serialize(
        object.followUpRequired,
        specifiedType: const FullType.nullable(bool),
      );
    }
    if (object.nextCheckupDate != null) {
      yield r'next_checkup_date';
      yield serializers.serialize(
        object.nextCheckupDate,
        specifiedType: const FullType.nullable(Date),
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
    ExaminationRecordResponse object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required ExaminationRecordResponseBuilder result,
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
        case r'test_type':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.testType = valueDes;
          break;
        case r'test_date':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(Date),
          ) as Date;
          result.testDate = valueDes;
          break;
        case r'test_institution':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.testInstitution = valueDes;
          break;
        case r'attending_vet':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.attendingVet = valueDes;
          break;
        case r'test_items':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(BuiltList, [FullType(String)]),
          ) as BuiltList<String>;
          result.testItems.replace(valueDes);
          break;
        case r'test_results':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(BuiltMap, [FullType(String), FullType(String)]),
          ) as BuiltMap<String, String>;
          result.testResults.replace(valueDes);
          break;
        case r'reference_range':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.referenceRange = valueDes;
          break;
        case r'doctor_comments':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.doctorComments = valueDes;
          break;
        case r'recommendations':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.recommendations = valueDes;
          break;
        case r'follow_up_required':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(bool),
          ) as bool?;
          if (valueDes == null) continue;
          result.followUpRequired = valueDes;
          break;
        case r'next_checkup_date':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(Date),
          ) as Date?;
          if (valueDes == null) continue;
          result.nextCheckupDate = valueDes;
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
  ExaminationRecordResponse deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = ExaminationRecordResponseBuilder();
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

