//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:lingdong_server/src/model/pagination_response_consultation_response.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'generic_response_pagination_response_consultation_response.g.dart';

/// GenericResponse[PaginationResponse[ConsultationResponse]]
///
/// Properties:
/// * [code] 
/// * [msg] 
/// * [data] 
@BuiltValue()
abstract class GenericResponsePaginationResponseConsultationResponse implements Built<GenericResponsePaginationResponseConsultationResponse, GenericResponsePaginationResponseConsultationResponseBuilder> {
  @BuiltValueField(wireName: r'code')
  int? get code;

  @BuiltValueField(wireName: r'msg')
  String? get msg;

  @BuiltValueField(wireName: r'data')
  PaginationResponseConsultationResponse? get data;

  GenericResponsePaginationResponseConsultationResponse._();

  factory GenericResponsePaginationResponseConsultationResponse([void updates(GenericResponsePaginationResponseConsultationResponseBuilder b)]) = _$GenericResponsePaginationResponseConsultationResponse;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(GenericResponsePaginationResponseConsultationResponseBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<GenericResponsePaginationResponseConsultationResponse> get serializer => _$GenericResponsePaginationResponseConsultationResponseSerializer();
}

class _$GenericResponsePaginationResponseConsultationResponseSerializer implements PrimitiveSerializer<GenericResponsePaginationResponseConsultationResponse> {
  @override
  final Iterable<Type> types = const [GenericResponsePaginationResponseConsultationResponse, _$GenericResponsePaginationResponseConsultationResponse];

  @override
  final String wireName = r'GenericResponsePaginationResponseConsultationResponse';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    GenericResponsePaginationResponseConsultationResponse object, {
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
        specifiedType: const FullType.nullable(PaginationResponseConsultationResponse),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    GenericResponsePaginationResponseConsultationResponse object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required GenericResponsePaginationResponseConsultationResponseBuilder result,
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
            specifiedType: const FullType.nullable(PaginationResponseConsultationResponse),
          ) as PaginationResponseConsultationResponse?;
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
  GenericResponsePaginationResponseConsultationResponse deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = GenericResponsePaginationResponseConsultationResponseBuilder();
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

