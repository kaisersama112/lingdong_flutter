//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'dog_age_stage_create.g.dart';

/// DogAgeStageCreate
///
/// Properties:
/// * [name] - Name
/// * [description] 
/// * [minAgeYears] 
/// * [maxAgeYears] 
@BuiltValue()
abstract class DogAgeStageCreate implements Built<DogAgeStageCreate, DogAgeStageCreateBuilder> {
  /// Name
  @BuiltValueField(wireName: r'name')
  String get name;

  @BuiltValueField(wireName: r'description')
  String? get description;

  @BuiltValueField(wireName: r'min_age_years')
  num? get minAgeYears;

  @BuiltValueField(wireName: r'max_age_years')
  num? get maxAgeYears;

  DogAgeStageCreate._();

  factory DogAgeStageCreate([void updates(DogAgeStageCreateBuilder b)]) = _$DogAgeStageCreate;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(DogAgeStageCreateBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<DogAgeStageCreate> get serializer => _$DogAgeStageCreateSerializer();
}

class _$DogAgeStageCreateSerializer implements PrimitiveSerializer<DogAgeStageCreate> {
  @override
  final Iterable<Type> types = const [DogAgeStageCreate, _$DogAgeStageCreate];

  @override
  final String wireName = r'DogAgeStageCreate';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    DogAgeStageCreate object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
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
  }

  @override
  Object serialize(
    Serializers serializers,
    DogAgeStageCreate object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required DogAgeStageCreateBuilder result,
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
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  DogAgeStageCreate deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = DogAgeStageCreateBuilder();
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

