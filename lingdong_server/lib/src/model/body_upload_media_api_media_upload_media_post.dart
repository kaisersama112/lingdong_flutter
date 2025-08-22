//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:lingdong_server/src/model/related_type_enum.dart';
import 'dart:typed_data';
import 'package:lingdong_server/src/model/media_type.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'body_upload_media_api_media_upload_media_post.g.dart';

/// Body_upload_media_api_media_upload_media_post
///
/// Properties:
/// * [relatedType] 
/// * [relatedId] - Related Id
/// * [sortOrder] - Sort Order
/// * [file] - File
/// * [mediaType] 
/// * [description] 
@BuiltValue()
abstract class BodyUploadMediaApiMediaUploadMediaPost implements Built<BodyUploadMediaApiMediaUploadMediaPost, BodyUploadMediaApiMediaUploadMediaPostBuilder> {
  @BuiltValueField(wireName: r'related_type')
  RelatedTypeEnum get relatedType;
  // enum relatedTypeEnum {  1,  2,  3,  4,  };

  /// Related Id
  @BuiltValueField(wireName: r'related_id')
  int get relatedId;

  /// Sort Order
  @BuiltValueField(wireName: r'sort_order')
  int? get sortOrder;

  /// File
  @BuiltValueField(wireName: r'file')
  Uint8List get file;

  @BuiltValueField(wireName: r'media_type')
  MediaType? get mediaType;
  // enum mediaTypeEnum {  0,  1,  2,  };

  @BuiltValueField(wireName: r'description')
  String? get description;

  BodyUploadMediaApiMediaUploadMediaPost._();

  factory BodyUploadMediaApiMediaUploadMediaPost([void updates(BodyUploadMediaApiMediaUploadMediaPostBuilder b)]) = _$BodyUploadMediaApiMediaUploadMediaPost;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(BodyUploadMediaApiMediaUploadMediaPostBuilder b) => b
      ..sortOrder = 0;

  @BuiltValueSerializer(custom: true)
  static Serializer<BodyUploadMediaApiMediaUploadMediaPost> get serializer => _$BodyUploadMediaApiMediaUploadMediaPostSerializer();
}

class _$BodyUploadMediaApiMediaUploadMediaPostSerializer implements PrimitiveSerializer<BodyUploadMediaApiMediaUploadMediaPost> {
  @override
  final Iterable<Type> types = const [BodyUploadMediaApiMediaUploadMediaPost, _$BodyUploadMediaApiMediaUploadMediaPost];

  @override
  final String wireName = r'BodyUploadMediaApiMediaUploadMediaPost';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    BodyUploadMediaApiMediaUploadMediaPost object, {
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
    if (object.sortOrder != null) {
      yield r'sort_order';
      yield serializers.serialize(
        object.sortOrder,
        specifiedType: const FullType(int),
      );
    }
    yield r'file';
    yield serializers.serialize(
      object.file,
      specifiedType: const FullType(Uint8List),
    );
    if (object.mediaType != null) {
      yield r'media_type';
      yield serializers.serialize(
        object.mediaType,
        specifiedType: const FullType(MediaType),
      );
    }
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
    BodyUploadMediaApiMediaUploadMediaPost object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required BodyUploadMediaApiMediaUploadMediaPostBuilder result,
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
        case r'sort_order':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.sortOrder = valueDes;
          break;
        case r'file':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(Uint8List),
          ) as Uint8List;
          result.file = valueDes;
          break;
        case r'media_type':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(MediaType),
          ) as MediaType;
          result.mediaType = valueDes;
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
  BodyUploadMediaApiMediaUploadMediaPost deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = BodyUploadMediaApiMediaUploadMediaPostBuilder();
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

