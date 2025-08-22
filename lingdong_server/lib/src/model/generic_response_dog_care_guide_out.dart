//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:lingdong_server/src/model/dog_care_guide_out.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'generic_response_dog_care_guide_out.g.dart';

/// GenericResponse[DogCareGuideOut]
///
/// Properties:
/// * [code] 
/// * [msg] 
/// * [data] 
@BuiltValue()
abstract class GenericResponseDogCareGuideOut implements Built<GenericResponseDogCareGuideOut, GenericResponseDogCareGuideOutBuilder> {
  @BuiltValueField(wireName: r'code')
  int? get code;

  @BuiltValueField(wireName: r'msg')
  String? get msg;

  @BuiltValueField(wireName: r'data')
  DogCareGuideOut? get data;

  GenericResponseDogCareGuideOut._();

  factory GenericResponseDogCareGuideOut([void updates(GenericResponseDogCareGuideOutBuilder b)]) = _$GenericResponseDogCareGuideOut;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(GenericResponseDogCareGuideOutBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<GenericResponseDogCareGuideOut> get serializer => _$GenericResponseDogCareGuideOutSerializer();
}

class _$GenericResponseDogCareGuideOutSerializer implements PrimitiveSerializer<GenericResponseDogCareGuideOut> {
  @override
  final Iterable<Type> types = const [GenericResponseDogCareGuideOut, _$GenericResponseDogCareGuideOut];

  @override
  final String wireName = r'GenericResponseDogCareGuideOut';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    GenericResponseDogCareGuideOut object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.code != null) {
      yield r'code';
      yield serializers.serialize(
        object.code,
        specifiedType: const FullType.nullable(int),
      );
    }
    if (object.msg != null) {
      yield r'msg';
      yield serializers.serialize(
        object.msg,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.data != null) {
      yield r'data';
      yield serializers.serialize(
        object.data,
        specifiedType: const FullType.nullable(DogCareGuideOut),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    GenericResponseDogCareGuideOut object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required GenericResponseDogCareGuideOutBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'code':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(int),
          ) as int?;
          if (valueDes == null) continue;
          result.code = valueDes;
          break;
        case r'msg':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.msg = valueDes;
          break;
        case r'data':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(DogCareGuideOut),
          ) as DogCareGuideOut?;
          if (valueDes == null) continue;
          result.data.replace(valueDes);
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  GenericResponseDogCareGuideOut deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = GenericResponseDogCareGuideOutBuilder();
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

