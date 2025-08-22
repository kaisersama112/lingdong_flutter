//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'dog_age_stage_update.g.dart';

/// DogAgeStageUpdate
///
/// Properties:
/// * [stageId] - Stage Id
/// * [name] 
/// * [description] 
/// * [minAgeYears] 
/// * [maxAgeYears] 
@BuiltValue()
abstract class DogAgeStageUpdate implements Built<DogAgeStageUpdate, DogAgeStageUpdateBuilder> {
  /// Stage Id
  @BuiltValueField(wireName: r'stage_id')
  int get stageId;

  @BuiltValueField(wireName: r'name')
  String? get name;

  @BuiltValueField(wireName: r'description')
  String? get description;

  @BuiltValueField(wireName: r'min_age_years')
  num? get minAgeYears;

  @BuiltValueField(wireName: r'max_age_years')
  num? get maxAgeYears;

  DogAgeStageUpdate._();

  factory DogAgeStageUpdate([void updates(DogAgeStageUpdateBuilder b)]) = _$DogAgeStageUpdate;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(DogAgeStageUpdateBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<DogAgeStageUpdate> get serializer => _$DogAgeStageUpdateSerializer();
}

class _$DogAgeStageUpdateSerializer implements PrimitiveSerializer<DogAgeStageUpdate> {
  @override
  final Iterable<Type> types = const [DogAgeStageUpdate, _$DogAgeStageUpdate];

  @override
  final String wireName = r'DogAgeStageUpdate';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    DogAgeStageUpdate object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'stage_id';
    yield serializers.serialize(
      object.stageId,
      specifiedType: const FullType(int),
    );
    if (object.name != null) {
      yield r'name';
      yield serializers.serialize(
        object.name,
        specifiedType: const FullType.nullable(String),
      );
    }
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
    DogAgeStageUpdate object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required DogAgeStageUpdateBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'stage_id':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.stageId = valueDes;
          break;
        case r'name':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
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
  DogAgeStageUpdate deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = DogAgeStageUpdateBuilder();
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

