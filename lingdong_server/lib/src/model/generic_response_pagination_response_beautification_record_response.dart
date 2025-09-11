//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:lingdong_server/src/model/pagination_response_beautification_record_response.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'generic_response_pagination_response_beautification_record_response.g.dart';

/// GenericResponse[PaginationResponse[BeautificationRecordResponse]]
///
/// Properties:
/// * [code] 
/// * [msg] 
/// * [data] 
@BuiltValue()
abstract class GenericResponsePaginationResponseBeautificationRecordResponse implements Built<GenericResponsePaginationResponseBeautificationRecordResponse, GenericResponsePaginationResponseBeautificationRecordResponseBuilder> {
  @BuiltValueField(wireName: r'code')
  int? get code;

  @BuiltValueField(wireName: r'msg')
  String? get msg;

  @BuiltValueField(wireName: r'data')
  PaginationResponseBeautificationRecordResponse? get data;

  GenericResponsePaginationResponseBeautificationRecordResponse._();

  factory GenericResponsePaginationResponseBeautificationRecordResponse([void updates(GenericResponsePaginationResponseBeautificationRecordResponseBuilder b)]) = _$GenericResponsePaginationResponseBeautificationRecordResponse;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(GenericResponsePaginationResponseBeautificationRecordResponseBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<GenericResponsePaginationResponseBeautificationRecordResponse> get serializer => _$GenericResponsePaginationResponseBeautificationRecordResponseSerializer();
}

class _$GenericResponsePaginationResponseBeautificationRecordResponseSerializer implements PrimitiveSerializer<GenericResponsePaginationResponseBeautificationRecordResponse> {
  @override
  final Iterable<Type> types = const [GenericResponsePaginationResponseBeautificationRecordResponse, _$GenericResponsePaginationResponseBeautificationRecordResponse];

  @override
  final String wireName = r'GenericResponsePaginationResponseBeautificationRecordResponse';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    GenericResponsePaginationResponseBeautificationRecordResponse object, {
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
        specifiedType: const FullType.nullable(PaginationResponseBeautificationRecordResponse),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    GenericResponsePaginationResponseBeautificationRecordResponse object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required GenericResponsePaginationResponseBeautificationRecordResponseBuilder result,
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
            specifiedType: const FullType.nullable(PaginationResponseBeautificationRecordResponse),
          ) as PaginationResponseBeautificationRecordResponse?;
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
  GenericResponsePaginationResponseBeautificationRecordResponse deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = GenericResponsePaginationResponseBeautificationRecordResponseBuilder();
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

