//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:lingdong_server/src/model/dog_care_guide_out.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'paged_response_dog_care_guide_out.g.dart';

/// PagedResponse[DogCareGuideOut]
///
/// Properties:
/// * [items] - Items
/// * [total] - Total
/// * [page] - Page
/// * [size] - Size
/// * [pages] - Pages
@BuiltValue()
abstract class PagedResponseDogCareGuideOut implements Built<PagedResponseDogCareGuideOut, PagedResponseDogCareGuideOutBuilder> {
  /// Items
  @BuiltValueField(wireName: r'items')
  BuiltList<DogCareGuideOut> get items;

  /// Total
  @BuiltValueField(wireName: r'total')
  int get total;

  /// Page
  @BuiltValueField(wireName: r'page')
  int get page;

  /// Size
  @BuiltValueField(wireName: r'size')
  int get size;

  /// Pages
  @BuiltValueField(wireName: r'pages')
  int get pages;

  PagedResponseDogCareGuideOut._();

  factory PagedResponseDogCareGuideOut([void updates(PagedResponseDogCareGuideOutBuilder b)]) = _$PagedResponseDogCareGuideOut;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(PagedResponseDogCareGuideOutBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<PagedResponseDogCareGuideOut> get serializer => _$PagedResponseDogCareGuideOutSerializer();
}

class _$PagedResponseDogCareGuideOutSerializer implements PrimitiveSerializer<PagedResponseDogCareGuideOut> {
  @override
  final Iterable<Type> types = const [PagedResponseDogCareGuideOut, _$PagedResponseDogCareGuideOut];

  @override
  final String wireName = r'PagedResponseDogCareGuideOut';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    PagedResponseDogCareGuideOut object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'items';
    yield serializers.serialize(
      object.items,
      specifiedType: const FullType(BuiltList, [FullType(DogCareGuideOut)]),
    );
    yield r'total';
    yield serializers.serialize(
      object.total,
      specifiedType: const FullType(int),
    );
    yield r'page';
    yield serializers.serialize(
      object.page,
      specifiedType: const FullType(int),
    );
    yield r'size';
    yield serializers.serialize(
      object.size,
      specifiedType: const FullType(int),
    );
    yield r'pages';
    yield serializers.serialize(
      object.pages,
      specifiedType: const FullType(int),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    PagedResponseDogCareGuideOut object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required PagedResponseDogCareGuideOutBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'items':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(BuiltList, [FullType(DogCareGuideOut)]),
          ) as BuiltList<DogCareGuideOut>;
          result.items.replace(valueDes);
          break;
        case r'total':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.total = valueDes;
          break;
        case r'page':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.page = valueDes;
          break;
        case r'size':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.size = valueDes;
          break;
        case r'pages':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.pages = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  PagedResponseDogCareGuideOut deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = PagedResponseDogCareGuideOutBuilder();
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

