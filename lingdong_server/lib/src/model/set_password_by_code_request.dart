//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'set_password_by_code_request.g.dart';

/// SetPasswordByCodeRequest，通过手机号+验证码设置密码（无需登录）
///
/// Properties:
/// * [phone] - Phone
/// * [code] - Code
/// * [newPassword] - New Password
@BuiltValue()
abstract class SetPasswordByCodeRequest implements Built<SetPasswordByCodeRequest, SetPasswordByCodeRequestBuilder> {
  /// Phone
  @BuiltValueField(wireName: r'phone')
  String get phone;

  /// Code
  @BuiltValueField(wireName: r'code')
  String get code;

  /// New Password
  @BuiltValueField(wireName: r'new_password')
  String get newPassword;

  SetPasswordByCodeRequest._();

  factory SetPasswordByCodeRequest([void updates(SetPasswordByCodeRequestBuilder b)]) = _$SetPasswordByCodeRequest;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(SetPasswordByCodeRequestBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<SetPasswordByCodeRequest> get serializer => _$SetPasswordByCodeRequestSerializer();
}

class _$SetPasswordByCodeRequestSerializer implements PrimitiveSerializer<SetPasswordByCodeRequest> {
  @override
  final Iterable<Type> types = const [SetPasswordByCodeRequest, _$SetPasswordByCodeRequest];

  @override
  final String wireName = r'SetPasswordByCodeRequest';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    SetPasswordByCodeRequest object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'phone';
    yield serializers.serialize(
      object.phone,
      specifiedType: const FullType(String),
    );
    yield r'code';
    yield serializers.serialize(
      object.code,
      specifiedType: const FullType(String),
    );
    yield r'new_password';
    yield serializers.serialize(
      object.newPassword,
      specifiedType: const FullType(String),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    SetPasswordByCodeRequest object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required SetPasswordByCodeRequestBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'phone':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.phone = valueDes;
          break;
        case r'code':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.code = valueDes;
          break;
        case r'new_password':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.newPassword = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  SetPasswordByCodeRequest deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = SetPasswordByCodeRequestBuilder();
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

