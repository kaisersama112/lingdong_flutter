//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'dog_age_stage_base.g.dart';

/// DogAgeStageBase
///
/// Properties:
/// * [stageId] - Stage Id
@BuiltValue()
abstract class DogAgeStageBase implements Built<DogAgeStageBase, DogAgeStageBaseBuilder> {
  /// Stage Id
  @BuiltValueField(wireName: r'stage_id')
  int get stageId;

  DogAgeStageBase._();

  factory DogAgeStageBase([void updates(DogAgeStageBaseBuilder b)]) = _$DogAgeStageBase;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(DogAgeStageBaseBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<DogAgeStageBase> get serializer => _$DogAgeStageBaseSerializer();
}

class _$DogAgeStageBaseSerializer implements PrimitiveSerializer<DogAgeStageBase> {
  @override
  final Iterable<Type> types = const [DogAgeStageBase, _$DogAgeStageBase];

  @override
  final String wireName = r'DogAgeStageBase';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    DogAgeStageBase object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'stage_id';
    yield serializers.serialize(
      object.stageId,
      specifiedType: const FullType(int),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    DogAgeStageBase object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required DogAgeStageBaseBuilder result,
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
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  DogAgeStageBase deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = DogAgeStageBaseBuilder();
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

