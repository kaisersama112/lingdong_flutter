//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:lingdong_server/src/model/pagination_response_vaccination_record_response.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'generic_response_pagination_response_vaccination_record_response.g.dart';

/// GenericResponse[PaginationResponse[VaccinationRecordResponse]]
///
/// Properties:
/// * [code] 
/// * [msg] 
/// * [data] 
@BuiltValue()
abstract class GenericResponsePaginationResponseVaccinationRecordResponse implements Built<GenericResponsePaginationResponseVaccinationRecordResponse, GenericResponsePaginationResponseVaccinationRecordResponseBuilder> {
  @BuiltValueField(wireName: r'code')
  int? get code;

  @BuiltValueField(wireName: r'msg')
  String? get msg;

  @BuiltValueField(wireName: r'data')
  PaginationResponseVaccinationRecordResponse? get data;

  GenericResponsePaginationResponseVaccinationRecordResponse._();

  factory GenericResponsePaginationResponseVaccinationRecordResponse([void updates(GenericResponsePaginationResponseVaccinationRecordResponseBuilder b)]) = _$GenericResponsePaginationResponseVaccinationRecordResponse;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(GenericResponsePaginationResponseVaccinationRecordResponseBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<GenericResponsePaginationResponseVaccinationRecordResponse> get serializer => _$GenericResponsePaginationResponseVaccinationRecordResponseSerializer();
}

class _$GenericResponsePaginationResponseVaccinationRecordResponseSerializer implements PrimitiveSerializer<GenericResponsePaginationResponseVaccinationRecordResponse> {
  @override
  final Iterable<Type> types = const [GenericResponsePaginationResponseVaccinationRecordResponse, _$GenericResponsePaginationResponseVaccinationRecordResponse];

  @override
  final String wireName = r'GenericResponsePaginationResponseVaccinationRecordResponse';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    GenericResponsePaginationResponseVaccinationRecordResponse object, {
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
        specifiedType: const FullType.nullable(PaginationResponseVaccinationRecordResponse),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    GenericResponsePaginationResponseVaccinationRecordResponse object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required GenericResponsePaginationResponseVaccinationRecordResponseBuilder result,
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
            specifiedType: const FullType.nullable(PaginationResponseVaccinationRecordResponse),
          ) as PaginationResponseVaccinationRecordResponse?;
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
  GenericResponsePaginationResponseVaccinationRecordResponse deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = GenericResponsePaginationResponseVaccinationRecordResponseBuilder();
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

