//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:lingdong_server/src/model/phone_code_login_response.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'generic_response_phone_code_login_response.g.dart';

/// GenericResponse[PhoneCodeLoginResponse]
///
/// Properties:
/// * [code] 
/// * [msg] 
/// * [data] 
@BuiltValue()
abstract class GenericResponsePhoneCodeLoginResponse implements Built<GenericResponsePhoneCodeLoginResponse, GenericResponsePhoneCodeLoginResponseBuilder> {
  @BuiltValueField(wireName: r'code')
  int? get code;

  @BuiltValueField(wireName: r'msg')
  String? get msg;

  @BuiltValueField(wireName: r'data')
  PhoneCodeLoginResponse? get data;

  GenericResponsePhoneCodeLoginResponse._();

  factory GenericResponsePhoneCodeLoginResponse([void updates(GenericResponsePhoneCodeLoginResponseBuilder b)]) = _$GenericResponsePhoneCodeLoginResponse;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(GenericResponsePhoneCodeLoginResponseBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<GenericResponsePhoneCodeLoginResponse> get serializer => _$GenericResponsePhoneCodeLoginResponseSerializer();
}

class _$GenericResponsePhoneCodeLoginResponseSerializer implements PrimitiveSerializer<GenericResponsePhoneCodeLoginResponse> {
  @override
  final Iterable<Type> types = const [GenericResponsePhoneCodeLoginResponse, _$GenericResponsePhoneCodeLoginResponse];

  @override
  final String wireName = r'GenericResponsePhoneCodeLoginResponse';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    GenericResponsePhoneCodeLoginResponse object, {
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
        specifiedType: const FullType.nullable(PhoneCodeLoginResponse),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    GenericResponsePhoneCodeLoginResponse object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required GenericResponsePhoneCodeLoginResponseBuilder result,
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
            specifiedType: const FullType.nullable(PhoneCodeLoginResponse),
          ) as PhoneCodeLoginResponse?;
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
  GenericResponsePhoneCodeLoginResponse deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = GenericResponsePhoneCodeLoginResponseBuilder();
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

