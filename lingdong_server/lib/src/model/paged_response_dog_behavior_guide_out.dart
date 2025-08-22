//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:lingdong_server/src/model/dog_behavior_guide_out.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'paged_response_dog_behavior_guide_out.g.dart';

/// PagedResponse[DogBehaviorGuideOut]
///
/// Properties:
/// * [total] - Total
/// * [items] - Items
/// * [page] - Page
/// * [pageSize] - Page Size
@BuiltValue()
abstract class PagedResponseDogBehaviorGuideOut implements Built<PagedResponseDogBehaviorGuideOut, PagedResponseDogBehaviorGuideOutBuilder> {
  /// Total
  @BuiltValueField(wireName: r'total')
  int get total;

  /// Items
  @BuiltValueField(wireName: r'items')
  BuiltList<DogBehaviorGuideOut> get items;

  /// Page
  @BuiltValueField(wireName: r'page')
  int get page;

  /// Page Size
  @BuiltValueField(wireName: r'page_size')
  int get pageSize;

  PagedResponseDogBehaviorGuideOut._();

  factory PagedResponseDogBehaviorGuideOut([void updates(PagedResponseDogBehaviorGuideOutBuilder b)]) = _$PagedResponseDogBehaviorGuideOut;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(PagedResponseDogBehaviorGuideOutBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<PagedResponseDogBehaviorGuideOut> get serializer => _$PagedResponseDogBehaviorGuideOutSerializer();
}

class _$PagedResponseDogBehaviorGuideOutSerializer implements PrimitiveSerializer<PagedResponseDogBehaviorGuideOut> {
  @override
  final Iterable<Type> types = const [PagedResponseDogBehaviorGuideOut, _$PagedResponseDogBehaviorGuideOut];

  @override
  final String wireName = r'PagedResponseDogBehaviorGuideOut';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    PagedResponseDogBehaviorGuideOut object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'total';
    yield serializers.serialize(
      object.total,
      specifiedType: const FullType(int),
    );
    yield r'items';
    yield serializers.serialize(
      object.items,
      specifiedType: const FullType(BuiltList, [FullType(DogBehaviorGuideOut)]),
    );
    yield r'page';
    yield serializers.serialize(
      object.page,
      specifiedType: const FullType(int),
    );
    yield r'page_size';
    yield serializers.serialize(
      object.pageSize,
      specifiedType: const FullType(int),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    PagedResponseDogBehaviorGuideOut object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required PagedResponseDogBehaviorGuideOutBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'total':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.total = valueDes;
          break;
        case r'items':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(BuiltList, [FullType(DogBehaviorGuideOut)]),
          ) as BuiltList<DogBehaviorGuideOut>;
          result.items.replace(valueDes);
          break;
        case r'page':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.page = valueDes;
          break;
        case r'page_size':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.pageSize = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  PagedResponseDogBehaviorGuideOut deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = PagedResponseDogBehaviorGuideOutBuilder();
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

