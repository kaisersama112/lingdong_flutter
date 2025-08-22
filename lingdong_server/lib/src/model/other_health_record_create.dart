//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:built_value/json_object.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'other_health_record_create.g.dart';

/// OtherHealthRecordCreate
///
/// Properties:
/// * [petId] - Pet Id，宠物ID
/// * [otherType] - Other Type，其他记录类型
/// * [details] - Details，详细信息
@BuiltValue()
abstract class OtherHealthRecordCreate implements Built<OtherHealthRecordCreate, OtherHealthRecordCreateBuilder> {
  /// Pet Id，宠物ID
  @BuiltValueField(wireName: r'pet_id')
  int get petId;

  /// Other Type，其他记录类型
  @BuiltValueField(wireName: r'other_type')
  String get otherType;

  /// Details，详细信息
  @BuiltValueField(wireName: r'details')
  BuiltMap<String, JsonObject?> get details;

  OtherHealthRecordCreate._();

  factory OtherHealthRecordCreate([void updates(OtherHealthRecordCreateBuilder b)]) = _$OtherHealthRecordCreate;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(OtherHealthRecordCreateBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<OtherHealthRecordCreate> get serializer => _$OtherHealthRecordCreateSerializer();
}

class _$OtherHealthRecordCreateSerializer implements PrimitiveSerializer<OtherHealthRecordCreate> {
  @override
  final Iterable<Type> types = const [OtherHealthRecordCreate, _$OtherHealthRecordCreate];

  @override
  final String wireName = r'OtherHealthRecordCreate';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    OtherHealthRecordCreate object, {
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
  }

  @override
  Object serialize(
    Serializers serializers,
    OtherHealthRecordCreate object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required OtherHealthRecordCreateBuilder result,
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
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  OtherHealthRecordCreate deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = OtherHealthRecordCreateBuilder();
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

