//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:lingdong_server/src/model/date.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'beautification_record_create.g.dart';

/// BeautificationRecordCreate
///
/// Properties:
/// * [petId] - Pet Id，宠物ID
/// * [groomingType] - Grooming Type，美容类型
/// * [groomingDate] - Grooming Date，美容日期
/// * [groomingEstablishment] - Grooming Establishment，美容机构
/// * [groomerName] 
/// * [services] - Services，服务项目
/// * [productsUsed] 
/// * [notes] 
/// * [nextGroomingDate] 
@BuiltValue()
abstract class BeautificationRecordCreate implements Built<BeautificationRecordCreate, BeautificationRecordCreateBuilder> {
  /// Pet Id，宠物ID
  @BuiltValueField(wireName: r'pet_id')
  int get petId;

  /// Grooming Type，美容类型
  @BuiltValueField(wireName: r'grooming_type')
  String get groomingType;

  /// Grooming Date，美容日期
  @BuiltValueField(wireName: r'grooming_date')
  Date get groomingDate;

  /// Grooming Establishment，美容机构
  @BuiltValueField(wireName: r'grooming_establishment')
  String get groomingEstablishment;

  @BuiltValueField(wireName: r'groomer_name')
  String? get groomerName;

  /// Services，服务项目
  @BuiltValueField(wireName: r'services')
  BuiltList<String> get services;

  @BuiltValueField(wireName: r'products_used')
  BuiltList<String>? get productsUsed;

  @BuiltValueField(wireName: r'notes')
  String? get notes;

  @BuiltValueField(wireName: r'next_grooming_date')
  Date? get nextGroomingDate;

  BeautificationRecordCreate._();

  factory BeautificationRecordCreate([void updates(BeautificationRecordCreateBuilder b)]) = _$BeautificationRecordCreate;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(BeautificationRecordCreateBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<BeautificationRecordCreate> get serializer => _$BeautificationRecordCreateSerializer();
}

class _$BeautificationRecordCreateSerializer implements PrimitiveSerializer<BeautificationRecordCreate> {
  @override
  final Iterable<Type> types = const [BeautificationRecordCreate, _$BeautificationRecordCreate];

  @override
  final String wireName = r'BeautificationRecordCreate';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    BeautificationRecordCreate object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'pet_id';
    yield serializers.serialize(
      object.petId,
      specifiedType: const FullType(int),
    );
    yield r'grooming_type';
    yield serializers.serialize(
      object.groomingType,
      specifiedType: const FullType(String),
    );
    yield r'grooming_date';
    yield serializers.serialize(
      object.groomingDate,
      specifiedType: const FullType(Date),
    );
    yield r'grooming_establishment';
    yield serializers.serialize(
      object.groomingEstablishment,
      specifiedType: const FullType(String),
    );
    if (object.groomerName != null) {
      yield r'groomer_name';
      yield serializers.serialize(
        object.groomerName,
        specifiedType: const FullType.nullable(String),
      );
    }
    yield r'services';
    yield serializers.serialize(
      object.services,
      specifiedType: const FullType(BuiltList, [FullType(String)]),
    );
    if (object.productsUsed != null) {
      yield r'products_used';
      yield serializers.serialize(
        object.productsUsed,
        specifiedType: const FullType.nullable(BuiltList, [FullType(String)]),
      );
    }
    if (object.notes != null) {
      yield r'notes';
      yield serializers.serialize(
        object.notes,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.nextGroomingDate != null) {
      yield r'next_grooming_date';
      yield serializers.serialize(
        object.nextGroomingDate,
        specifiedType: const FullType.nullable(Date),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    BeautificationRecordCreate object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required BeautificationRecordCreateBuilder result,
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
        case r'grooming_type':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.groomingType = valueDes;
          break;
        case r'grooming_date':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(Date),
          ) as Date;
          result.groomingDate = valueDes;
          break;
        case r'grooming_establishment':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.groomingEstablishment = valueDes;
          break;
        case r'groomer_name':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.groomerName = valueDes;
          break;
        case r'services':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(BuiltList, [FullType(String)]),
          ) as BuiltList<String>;
          result.services.replace(valueDes);
          break;
        case r'products_used':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(BuiltList, [FullType(String)]),
          ) as BuiltList<String>?;
          if (valueDes == null) continue;
          result.productsUsed.replace(valueDes);
          break;
        case r'notes':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.notes = valueDes;
          break;
        case r'next_grooming_date':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(Date),
          ) as Date?;
          if (valueDes == null) continue;
          result.nextGroomingDate = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  BeautificationRecordCreate deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = BeautificationRecordCreateBuilder();
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

