//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'personality_response.g.dart';

/// PersonalityResponse，性格特征响应体
///
/// Properties:
/// * [name] - Name，性格特征名称
/// * [description] 
/// * [id] - Id，性格特征ID
/// * [createdAt] - Created At，创建时间
/// * [updatedAt] - Updated At，更新时间
@BuiltValue()
abstract class PersonalityResponse implements Built<PersonalityResponse, PersonalityResponseBuilder> {
  /// Name，性格特征名称
  @BuiltValueField(wireName: r'name')
  String get name;

  @BuiltValueField(wireName: r'description')
  String? get description;

  /// Id，性格特征ID
  @BuiltValueField(wireName: r'id')
  int get id;

  /// Created At，创建时间
  @BuiltValueField(wireName: r'created_at')
  DateTime get createdAt;

  /// Updated At，更新时间
  @BuiltValueField(wireName: r'updated_at')
  DateTime get updatedAt;

  PersonalityResponse._();

  factory PersonalityResponse([void updates(PersonalityResponseBuilder b)]) = _$PersonalityResponse;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(PersonalityResponseBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<PersonalityResponse> get serializer => _$PersonalityResponseSerializer();
}

class _$PersonalityResponseSerializer implements PrimitiveSerializer<PersonalityResponse> {
  @override
  final Iterable<Type> types = const [PersonalityResponse, _$PersonalityResponse];

  @override
  final String wireName = r'PersonalityResponse';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    PersonalityResponse object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'name';
    yield serializers.serialize(
      object.name,
      specifiedType: const FullType(String),
    );
    if (object.description != null) {
      yield r'description';
      yield serializers.serialize(
        object.description,
        specifiedType: const FullType.nullable(String),
      );
    }
    yield r'id';
    yield serializers.serialize(
      object.id,
      specifiedType: const FullType(int),
    );
    yield r'created_at';
    yield serializers.serialize(
      object.createdAt,
      specifiedType: const FullType(DateTime),
    );
    yield r'updated_at';
    yield serializers.serialize(
      object.updatedAt,
      specifiedType: const FullType(DateTime),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    PersonalityResponse object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required PersonalityResponseBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'name':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.name = valueDes;
          break;
        case r'description':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.description = valueDes;
          break;
        case r'id':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.id = valueDes;
          break;
        case r'created_at':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(DateTime),
          ) as DateTime;
          result.createdAt = valueDes;
          break;
        case r'updated_at':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(DateTime),
          ) as DateTime;
          result.updatedAt = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  PersonalityResponse deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = PersonalityResponseBuilder();
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

