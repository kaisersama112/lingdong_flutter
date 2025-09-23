//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:lingdong_server/src/model/user_follow_list_response.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'generic_response_user_follow_list_response.g.dart';

/// GenericResponse[UserFollowListResponse]
///
/// Properties:
/// * [code] 
/// * [msg] 
/// * [data] 
@BuiltValue()
abstract class GenericResponseUserFollowListResponse implements Built<GenericResponseUserFollowListResponse, GenericResponseUserFollowListResponseBuilder> {
  @BuiltValueField(wireName: r'code')
  int? get code;

  @BuiltValueField(wireName: r'msg')
  String? get msg;

  @BuiltValueField(wireName: r'data')
  UserFollowListResponse? get data;

  GenericResponseUserFollowListResponse._();

  factory GenericResponseUserFollowListResponse([void updates(GenericResponseUserFollowListResponseBuilder b)]) = _$GenericResponseUserFollowListResponse;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(GenericResponseUserFollowListResponseBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<GenericResponseUserFollowListResponse> get serializer => _$GenericResponseUserFollowListResponseSerializer();
}

class _$GenericResponseUserFollowListResponseSerializer implements PrimitiveSerializer<GenericResponseUserFollowListResponse> {
  @override
  final Iterable<Type> types = const [GenericResponseUserFollowListResponse, _$GenericResponseUserFollowListResponse];

  @override
  final String wireName = r'GenericResponseUserFollowListResponse';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    GenericResponseUserFollowListResponse object, {
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
        specifiedType: const FullType.nullable(UserFollowListResponse),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    GenericResponseUserFollowListResponse object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required GenericResponseUserFollowListResponseBuilder result,
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
            specifiedType: const FullType.nullable(UserFollowListResponse),
          ) as UserFollowListResponse?;
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
  GenericResponseUserFollowListResponse deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = GenericResponseUserFollowListResponseBuilder();
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

