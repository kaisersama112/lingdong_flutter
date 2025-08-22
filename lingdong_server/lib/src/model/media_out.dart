//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:lingdong_server/src/model/related_type_enum.dart';
import 'package:lingdong_server/src/model/media_type.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'media_out.g.dart';

/// MediaOut
///
/// Properties:
/// * [relatedType] 
/// * [relatedId] - Related Id
/// * [mediaType] 
/// * [url] - Url
/// * [thumbnailUrl] 
/// * [description] 
/// * [sortOrder] - Sort Order
/// * [id] - Id
/// * [createdAt] - Created At
@BuiltValue()
abstract class MediaOut implements Built<MediaOut, MediaOutBuilder> {
  @BuiltValueField(wireName: r'related_type')
  RelatedTypeEnum get relatedType;
  // enum relatedTypeEnum {  1,  2,  3,  4,  };

  /// Related Id
  @BuiltValueField(wireName: r'related_id')
  int get relatedId;

  @BuiltValueField(wireName: r'media_type')
  MediaType get mediaType;
  // enum mediaTypeEnum {  0,  1,  2,  };

  /// Url
  @BuiltValueField(wireName: r'url')
  String get url;

  @BuiltValueField(wireName: r'thumbnail_url')
  String? get thumbnailUrl;

  @BuiltValueField(wireName: r'description')
  String? get description;

  /// Sort Order
  @BuiltValueField(wireName: r'sort_order')
  int? get sortOrder;

  /// Id
  @BuiltValueField(wireName: r'id')
  int get id;

  /// Created At
  @BuiltValueField(wireName: r'created_at')
  DateTime get createdAt;

  MediaOut._();

  factory MediaOut([void updates(MediaOutBuilder b)]) = _$MediaOut;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(MediaOutBuilder b) => b
      ..sortOrder = 0;

  @BuiltValueSerializer(custom: true)
  static Serializer<MediaOut> get serializer => _$MediaOutSerializer();
}

class _$MediaOutSerializer implements PrimitiveSerializer<MediaOut> {
  @override
  final Iterable<Type> types = const [MediaOut, _$MediaOut];

  @override
  final String wireName = r'MediaOut';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    MediaOut object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'related_type';
    yield serializers.serialize(
      object.relatedType,
      specifiedType: const FullType(RelatedTypeEnum),
    );
    yield r'related_id';
    yield serializers.serialize(
      object.relatedId,
      specifiedType: const FullType(int),
    );
    yield r'media_type';
    yield serializers.serialize(
      object.mediaType,
      specifiedType: const FullType(MediaType),
    );
    yield r'url';
    yield serializers.serialize(
      object.url,
      specifiedType: const FullType(String),
    );
    if (object.thumbnailUrl != null) {
      yield r'thumbnail_url';
      yield serializers.serialize(
        object.thumbnailUrl,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.description != null) {
      yield r'description';
      yield serializers.serialize(
        object.description,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.sortOrder != null) {
      yield r'sort_order';
      yield serializers.serialize(
        object.sortOrder,
        specifiedType: const FullType(int),
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
  }

  @override
  Object serialize(
    Serializers serializers,
    MediaOut object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required MediaOutBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'related_type':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(RelatedTypeEnum),
          ) as RelatedTypeEnum;
          result.relatedType = valueDes;
          break;
        case r'related_id':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.relatedId = valueDes;
          break;
        case r'media_type':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(MediaType),
          ) as MediaType;
          result.mediaType = valueDes;
          break;
        case r'url':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.url = valueDes;
          break;
        case r'thumbnail_url':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.thumbnailUrl = valueDes;
          break;
        case r'description':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.description = valueDes;
          break;
        case r'sort_order':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.sortOrder = valueDes;
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
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  MediaOut deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = MediaOutBuilder();
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

