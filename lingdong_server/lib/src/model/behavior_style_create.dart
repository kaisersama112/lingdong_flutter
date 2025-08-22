//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'behavior_style_create.g.dart';

/// BehaviorStyleCreate，创建行为风格
///
/// Properties:
/// * [name] - Name，行为风格名称
/// * [description] 
@BuiltValue()
abstract class BehaviorStyleCreate implements Built<BehaviorStyleCreate, BehaviorStyleCreateBuilder> {
  /// Name，行为风格名称
  @BuiltValueField(wireName: r'name')
  String get name;

  @BuiltValueField(wireName: r'description')
  String? get description;

  BehaviorStyleCreate._();

  factory BehaviorStyleCreate([void updates(BehaviorStyleCreateBuilder b)]) = _$BehaviorStyleCreate;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(BehaviorStyleCreateBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<BehaviorStyleCreate> get serializer => _$BehaviorStyleCreateSerializer();
}

class _$BehaviorStyleCreateSerializer implements PrimitiveSerializer<BehaviorStyleCreate> {
  @override
  final Iterable<Type> types = const [BehaviorStyleCreate, _$BehaviorStyleCreate];

  @override
  final String wireName = r'BehaviorStyleCreate';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    BehaviorStyleCreate object, {
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
  }

  @override
  Object serialize(
    Serializers serializers,
    BehaviorStyleCreate object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required BehaviorStyleCreateBuilder result,
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
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  BehaviorStyleCreate deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = BehaviorStyleCreateBuilder();
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

