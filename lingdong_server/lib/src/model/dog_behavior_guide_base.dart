//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'dog_behavior_guide_base.g.dart';

/// DogBehaviorGuideBase
///
/// Properties:
/// * [behaviorGuideId] - Behavior Guide Id
@BuiltValue()
abstract class DogBehaviorGuideBase implements Built<DogBehaviorGuideBase, DogBehaviorGuideBaseBuilder> {
  /// Behavior Guide Id
  @BuiltValueField(wireName: r'behavior_guide_id')
  int get behaviorGuideId;

  DogBehaviorGuideBase._();

  factory DogBehaviorGuideBase([void updates(DogBehaviorGuideBaseBuilder b)]) = _$DogBehaviorGuideBase;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(DogBehaviorGuideBaseBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<DogBehaviorGuideBase> get serializer => _$DogBehaviorGuideBaseSerializer();
}

class _$DogBehaviorGuideBaseSerializer implements PrimitiveSerializer<DogBehaviorGuideBase> {
  @override
  final Iterable<Type> types = const [DogBehaviorGuideBase, _$DogBehaviorGuideBase];

  @override
  final String wireName = r'DogBehaviorGuideBase';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    DogBehaviorGuideBase object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'behavior_guide_id';
    yield serializers.serialize(
      object.behaviorGuideId,
      specifiedType: const FullType(int),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    DogBehaviorGuideBase object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required DogBehaviorGuideBaseBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'behavior_guide_id':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.behaviorGuideId = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  DogBehaviorGuideBase deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = DogBehaviorGuideBaseBuilder();
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

