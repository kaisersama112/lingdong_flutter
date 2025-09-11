//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:lingdong_server/src/model/date.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'deworming_record_response.g.dart';

/// DewormingRecordResponse
///
/// Properties:
/// * [id] - Id，记录ID
/// * [petId] - Pet Id，宠物ID
/// * [dewormingType] - Deworming Type，驱虫类型
/// * [dewormingMedicineName] 
/// * [dewormingDosage] 
/// * [dewormingLocation] 
/// * [dewormingValidity] 
/// * [dewormingNextDate] 
/// * [createdAt] - Created At，创建时间
/// * [recordDate] - Record Date，记录日期
@BuiltValue()
abstract class DewormingRecordResponse implements Built<DewormingRecordResponse, DewormingRecordResponseBuilder> {
  /// Id，记录ID
  @BuiltValueField(wireName: r'id')
  int get id;

  /// Pet Id，宠物ID
  @BuiltValueField(wireName: r'pet_id')
  int get petId;

  /// Deworming Type，驱虫类型
  @BuiltValueField(wireName: r'deworming_type')
  String get dewormingType;

  @BuiltValueField(wireName: r'deworming_medicine_name')
  String? get dewormingMedicineName;

  @BuiltValueField(wireName: r'deworming_dosage')
  String? get dewormingDosage;

  @BuiltValueField(wireName: r'deworming_location')
  String? get dewormingLocation;

  @BuiltValueField(wireName: r'deworming_validity')
  String? get dewormingValidity;

  @BuiltValueField(wireName: r'deworming_next_date')
  Date? get dewormingNextDate;

  /// Created At，创建时间
  @BuiltValueField(wireName: r'created_at')
  String get createdAt;

  /// Record Date，记录日期
  @BuiltValueField(wireName: r'record_date')
  String get recordDate;

  DewormingRecordResponse._();

  factory DewormingRecordResponse([void updates(DewormingRecordResponseBuilder b)]) = _$DewormingRecordResponse;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(DewormingRecordResponseBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<DewormingRecordResponse> get serializer => _$DewormingRecordResponseSerializer();
}

class _$DewormingRecordResponseSerializer implements PrimitiveSerializer<DewormingRecordResponse> {
  @override
  final Iterable<Type> types = const [DewormingRecordResponse, _$DewormingRecordResponse];

  @override
  final String wireName = r'DewormingRecordResponse';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    DewormingRecordResponse object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'id';
    yield serializers.serialize(
      object.id,
      specifiedType: const FullType(int),
    );
    yield r'pet_id';
    yield serializers.serialize(
      object.petId,
      specifiedType: const FullType(int),
    );
    yield r'deworming_type';
    yield serializers.serialize(
      object.dewormingType,
      specifiedType: const FullType(String),
    );
    if (object.dewormingMedicineName != null) {
      yield r'deworming_medicine_name';
      yield serializers.serialize(
        object.dewormingMedicineName,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.dewormingDosage != null) {
      yield r'deworming_dosage';
      yield serializers.serialize(
        object.dewormingDosage,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.dewormingLocation != null) {
      yield r'deworming_location';
      yield serializers.serialize(
        object.dewormingLocation,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.dewormingValidity != null) {
      yield r'deworming_validity';
      yield serializers.serialize(
        object.dewormingValidity,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.dewormingNextDate != null) {
      yield r'deworming_next_date';
      yield serializers.serialize(
        object.dewormingNextDate,
        specifiedType: const FullType.nullable(Date),
      );
    }
    yield r'created_at';
    yield serializers.serialize(
      object.createdAt,
      specifiedType: const FullType(String),
    );
    yield r'record_date';
    yield serializers.serialize(
      object.recordDate,
      specifiedType: const FullType(String),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    DewormingRecordResponse object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required DewormingRecordResponseBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'id':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.id = valueDes;
          break;
        case r'pet_id':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.petId = valueDes;
          break;
        case r'deworming_type':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.dewormingType = valueDes;
          break;
        case r'deworming_medicine_name':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.dewormingMedicineName = valueDes;
          break;
        case r'deworming_dosage':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.dewormingDosage = valueDes;
          break;
        case r'deworming_location':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.dewormingLocation = valueDes;
          break;
        case r'deworming_validity':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.dewormingValidity = valueDes;
          break;
        case r'deworming_next_date':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(Date),
          ) as Date?;
          if (valueDes == null) continue;
          result.dewormingNextDate = valueDes;
          break;
        case r'created_at':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.createdAt = valueDes;
          break;
        case r'record_date':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
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
  DewormingRecordResponse deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = DewormingRecordResponseBuilder();
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

