//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'pagination_params.g.dart';

/// PaginationParams，分页参数模型
///
/// Properties:
/// * [skip] - Skip，起始位置
/// * [limit] - Limit，每页数量
@BuiltValue()
abstract class PaginationParams implements Built<PaginationParams, PaginationParamsBuilder> {
  /// Skip，起始位置
  @BuiltValueField(wireName: r'skip')
  int? get skip;

  /// Limit，每页数量
  @BuiltValueField(wireName: r'limit')
  int? get limit;

  PaginationParams._();

  factory PaginationParams([void updates(PaginationParamsBuilder b)]) = _$PaginationParams;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(PaginationParamsBuilder b) => b
      ..skip = 0
      ..limit = 20;

  @BuiltValueSerializer(custom: true)
  static Serializer<PaginationParams> get serializer => _$PaginationParamsSerializer();
}

class _$PaginationParamsSerializer implements PrimitiveSerializer<PaginationParams> {
  @override
  final Iterable<Type> types = const [PaginationParams, _$PaginationParams];

  @override
  final String wireName = r'PaginationParams';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    PaginationParams object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.skip != null) {
      yield r'skip';
      yield serializers.serialize(
        object.skip,
        specifiedType: const FullType(int),
      );
    }
    if (object.limit != null) {
      yield r'limit';
      yield serializers.serialize(
        object.limit,
        specifiedType: const FullType(int),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    PaginationParams object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required PaginationParamsBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'skip':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.skip = valueDes;
          break;
        case r'limit':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.limit = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  PaginationParams deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = PaginationParamsBuilder();
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

