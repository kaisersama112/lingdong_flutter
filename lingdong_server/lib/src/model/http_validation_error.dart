//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:lingdong_server/src/model/validation_error.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'http_validation_error.g.dart';

/// HTTPValidationError
///
/// Properties:
/// * [detail] - Detail
@BuiltValue()
abstract class HttpValidationError implements Built<HttpValidationError, HttpValidationErrorBuilder> {
  /// Detail
  @BuiltValueField(wireName: r'detail')
  BuiltList<ValidationError>? get detail;

  HttpValidationError._();

  factory HttpValidationError([void updates(HttpValidationErrorBuilder b)]) = _$HttpValidationError;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(HttpValidationErrorBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<HttpValidationError> get serializer => _$HttpValidationErrorSerializer();
}

class _$HttpValidationErrorSerializer implements PrimitiveSerializer<HttpValidationError> {
  @override
  final Iterable<Type> types = const [HttpValidationError, _$HttpValidationError];

  @override
  final String wireName = r'HttpValidationError';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    HttpValidationError object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.detail != null) {
      yield r'detail';
      yield serializers.serialize(
        object.detail,
        specifiedType: const FullType(BuiltList, [FullType(ValidationError)]),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    HttpValidationError object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required HttpValidationErrorBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'detail':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(BuiltList, [FullType(ValidationError)]),
          ) as BuiltList<ValidationError>;
          result.detail.replace(valueDes);
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  HttpValidationError deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = HttpValidationErrorBuilder();
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

