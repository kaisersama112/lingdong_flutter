//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:lingdong_server/src/model/tag_response.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'tag_list_response.g.dart';

/// TagListResponse，标签列表响应模型
///
/// Properties:
/// * [tags] - Tags
/// * [total] - Total
@BuiltValue()
abstract class TagListResponse implements Built<TagListResponse, TagListResponseBuilder> {
  /// Tags
  @BuiltValueField(wireName: r'tags')
  BuiltList<TagResponse> get tags;

  /// Total
  @BuiltValueField(wireName: r'total')
  int get total;

  TagListResponse._();

  factory TagListResponse([void updates(TagListResponseBuilder b)]) = _$TagListResponse;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(TagListResponseBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<TagListResponse> get serializer => _$TagListResponseSerializer();
}

class _$TagListResponseSerializer implements PrimitiveSerializer<TagListResponse> {
  @override
  final Iterable<Type> types = const [TagListResponse, _$TagListResponse];

  @override
  final String wireName = r'TagListResponse';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    TagListResponse object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'tags';
    yield serializers.serialize(
      object.tags,
      specifiedType: const FullType(BuiltList, [FullType(TagResponse)]),
    );
    yield r'total';
    yield serializers.serialize(
      object.total,
      specifiedType: const FullType(int),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    TagListResponse object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required TagListResponseBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'tags':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(BuiltList, [FullType(TagResponse)]),
          ) as BuiltList<TagResponse>;
          result.tags.replace(valueDes);
          break;
        case r'total':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.total = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  TagListResponse deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = TagListResponseBuilder();
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

