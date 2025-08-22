//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'dog_care_guide_base.g.dart';

/// DogCareGuideBase
///
/// Properties:
/// * [guideId] - Guide Id
@BuiltValue()
abstract class DogCareGuideBase implements Built<DogCareGuideBase, DogCareGuideBaseBuilder> {
  /// Guide Id
  @BuiltValueField(wireName: r'guide_id')
  int get guideId;

  DogCareGuideBase._();

  factory DogCareGuideBase([void updates(DogCareGuideBaseBuilder b)]) = _$DogCareGuideBase;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(DogCareGuideBaseBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<DogCareGuideBase> get serializer => _$DogCareGuideBaseSerializer();
}

class _$DogCareGuideBaseSerializer implements PrimitiveSerializer<DogCareGuideBase> {
  @override
  final Iterable<Type> types = const [DogCareGuideBase, _$DogCareGuideBase];

  @override
  final String wireName = r'DogCareGuideBase';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    DogCareGuideBase object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'guide_id';
    yield serializers.serialize(
      object.guideId,
      specifiedType: const FullType(int),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    DogCareGuideBase object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required DogCareGuideBaseBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'guide_id':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.guideId = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  DogCareGuideBase deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = DogCareGuideBaseBuilder();
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

