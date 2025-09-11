//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:built_value/json_object.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'other_health_record_response.g.dart';

/// OtherHealthRecordResponse
///
/// Properties:
/// * [petId] - Pet Id，宠物ID
/// * [otherType] - Other Type，其他记录类型
/// * [details] - Details，详细信息
/// * [id] - Id，记录ID
/// * [createdAt] - Created At，创建时间
/// * [recordDate] - Record Date，记录日期
@BuiltValue()
abstract class OtherHealthRecordResponse implements Built<OtherHealthRecordResponse, OtherHealthRecordResponseBuilder> {
  /// Pet Id，宠物ID
  @BuiltValueField(wireName: r'pet_id')
  int get petId;

  /// Other Type，其他记录类型
  @BuiltValueField(wireName: r'other_type')
  String get otherType;

  /// Details，详细信息
  @BuiltValueField(wireName: r'details')
  BuiltMap<String, JsonObject?> get details;

  /// Id，记录ID
  @BuiltValueField(wireName: r'id')
  int get id;

  /// Created At，创建时间
  @BuiltValueField(wireName: r'created_at')
  String get createdAt;

  /// Record Date，记录日期
  @BuiltValueField(wireName: r'record_date')
  String get recordDate;

  OtherHealthRecordResponse._();

  factory OtherHealthRecordResponse([void updates(OtherHealthRecordResponseBuilder b)]) = _$OtherHealthRecordResponse;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(OtherHealthRecordResponseBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<OtherHealthRecordResponse> get serializer => _$OtherHealthRecordResponseSerializer();
}

class _$OtherHealthRecordResponseSerializer implements PrimitiveSerializer<OtherHealthRecordResponse> {
  @override
  final Iterable<Type> types = const [OtherHealthRecordResponse, _$OtherHealthRecordResponse];

  @override
  final String wireName = r'OtherHealthRecordResponse';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    OtherHealthRecordResponse object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'pet_id';
    yield serializers.serialize(
      object.petId,
      specifiedType: const FullType(int),
    );
    yield r'other_type';
    yield serializers.serialize(
      object.otherType,
      specifiedType: const FullType(String),
    );
    yield r'details';
    yield serializers.serialize(
      object.details,
      specifiedType: const FullType(BuiltMap, [FullType(String), FullType.nullable(JsonObject)]),
    );
    yield r'id';
    yield serializers.serialize(
      object.id,
      specifiedType: const FullType(int),
    );
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
    OtherHealthRecordResponse object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required OtherHealthRecordResponseBuilder result,
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
        case r'other_type':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.otherType = valueDes;
          break;
        case r'details':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(BuiltMap, [FullType(String), FullType.nullable(JsonObject)]),
          ) as BuiltMap<String, JsonObject?>;
          result.details.replace(valueDes);
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
  OtherHealthRecordResponse deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = OtherHealthRecordResponseBuilder();
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

