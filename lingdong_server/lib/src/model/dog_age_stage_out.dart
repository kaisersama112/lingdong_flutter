//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'dog_age_stage_out.g.dart';

/// DogAgeStageOut
///
/// Properties:
/// * [id] - Id
/// * [name] - Name
/// * [description] 
/// * [minAgeYears] 
/// * [maxAgeYears] 
/// * [createdAt] - Created At
/// * [updatedAt] - Updated At
@BuiltValue()
abstract class DogAgeStageOut implements Built<DogAgeStageOut, DogAgeStageOutBuilder> {
  /// Id
  @BuiltValueField(wireName: r'id')
  int get id;

  /// Name
  @BuiltValueField(wireName: r'name')
  String get name;

  @BuiltValueField(wireName: r'description')
  String? get description;

  @BuiltValueField(wireName: r'min_age_years')
  num? get minAgeYears;

  @BuiltValueField(wireName: r'max_age_years')
  num? get maxAgeYears;

  /// Created At
  @BuiltValueField(wireName: r'created_at')
  DateTime get createdAt;

  /// Updated At
  @BuiltValueField(wireName: r'updated_at')
  DateTime get updatedAt;

  DogAgeStageOut._();

  factory DogAgeStageOut([void updates(DogAgeStageOutBuilder b)]) = _$DogAgeStageOut;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(DogAgeStageOutBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<DogAgeStageOut> get serializer => _$DogAgeStageOutSerializer();
}

class _$DogAgeStageOutSerializer implements PrimitiveSerializer<DogAgeStageOut> {
  @override
  final Iterable<Type> types = const [DogAgeStageOut, _$DogAgeStageOut];

  @override
  final String wireName = r'DogAgeStageOut';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    DogAgeStageOut object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'id';
    yield serializers.serialize(
      object.id,
      specifiedType: const FullType(int),
    );
    yield r'name';
    yield serializers.serialize(
      object.name,
      specifiedType: const FullType(String),
    );
    if (object.description != null) {
      yield r'description';
      yield serializers.serialize(
        object.description,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.minAgeYears != null) {
      yield r'min_age_years';
      yield serializers.serialize(
        object.minAgeYears,
        specifiedType: const FullType.nullable(num),
      );
    }
    if (object.maxAgeYears != null) {
      yield r'max_age_years';
      yield serializers.serialize(
        object.maxAgeYears,
        specifiedType: const FullType.nullable(num),
      );
    }
    yield r'created_at';
    yield serializers.serialize(
      object.createdAt,
      specifiedType: const FullType(DateTime),
    );
    yield r'updated_at';
    yield serializers.serialize(
      object.updatedAt,
      specifiedType: const FullType(DateTime),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    DogAgeStageOut object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required DogAgeStageOutBuilder result,
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
        case r'name':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.name = valueDes;
          break;
        case r'description':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.description = valueDes;
          break;
        case r'min_age_years':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(num),
          ) as num?;
          if (valueDes == null) continue;
          result.minAgeYears = valueDes;
          break;
        case r'max_age_years':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(num),
          ) as num?;
          if (valueDes == null) continue;
          result.maxAgeYears = valueDes;
          break;
        case r'created_at':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(DateTime),
          ) as DateTime;
          result.createdAt = valueDes;
          break;
        case r'updated_at':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(DateTime),
          ) as DateTime;
          result.updatedAt = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  DogAgeStageOut deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = DogAgeStageOutBuilder();
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

