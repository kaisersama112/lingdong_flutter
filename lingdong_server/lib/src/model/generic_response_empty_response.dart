//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/json_object.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'generic_response_empty_response.g.dart';

/// GenericResponse[EmptyResponse]
///
/// Properties:
/// * [code] 
/// * [msg] 
/// * [data] - EmptyResponse，空响应模型（用于不需要返回数据的操作）
@BuiltValue()
abstract class GenericResponseEmptyResponse implements Built<GenericResponseEmptyResponse, GenericResponseEmptyResponseBuilder> {
  @BuiltValueField(wireName: r'code')
  int? get code;

  @BuiltValueField(wireName: r'msg')
  String? get msg;

  /// EmptyResponse，空响应模型（用于不需要返回数据的操作）
  @BuiltValueField(wireName: r'data')
  JsonObject? get data;

  GenericResponseEmptyResponse._();

  factory GenericResponseEmptyResponse([void updates(GenericResponseEmptyResponseBuilder b)]) = _$GenericResponseEmptyResponse;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(GenericResponseEmptyResponseBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<GenericResponseEmptyResponse> get serializer => _$GenericResponseEmptyResponseSerializer();
}

class _$GenericResponseEmptyResponseSerializer implements PrimitiveSerializer<GenericResponseEmptyResponse> {
  @override
  final Iterable<Type> types = const [GenericResponseEmptyResponse, _$GenericResponseEmptyResponse];

  @override
  final String wireName = r'GenericResponseEmptyResponse';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    GenericResponseEmptyResponse object, {
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
        specifiedType: const FullType(JsonObject),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    GenericResponseEmptyResponse object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required GenericResponseEmptyResponseBuilder result,
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
            specifiedType: const FullType(JsonObject),
          ) as JsonObject;
          result.data = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  GenericResponseEmptyResponse deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = GenericResponseEmptyResponseBuilder();
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

