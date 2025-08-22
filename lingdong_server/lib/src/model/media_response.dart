//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:lingdong_server/src/model/media_out.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'media_response.g.dart';

/// MediaResponse
///
/// Properties:
/// * [media] 
/// * [userId] - User Id
@BuiltValue()
abstract class MediaResponse implements Built<MediaResponse, MediaResponseBuilder> {
  @BuiltValueField(wireName: r'media')
  MediaOut get media;

  /// User Id
  @BuiltValueField(wireName: r'user_id')
  int get userId;

  MediaResponse._();

  factory MediaResponse([void updates(MediaResponseBuilder b)]) = _$MediaResponse;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(MediaResponseBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<MediaResponse> get serializer => _$MediaResponseSerializer();
}

class _$MediaResponseSerializer implements PrimitiveSerializer<MediaResponse> {
  @override
  final Iterable<Type> types = const [MediaResponse, _$MediaResponse];

  @override
  final String wireName = r'MediaResponse';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    MediaResponse object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'media';
    yield serializers.serialize(
      object.media,
      specifiedType: const FullType(MediaOut),
    );
    yield r'user_id';
    yield serializers.serialize(
      object.userId,
      specifiedType: const FullType(int),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    MediaResponse object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required MediaResponseBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'media':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(MediaOut),
          ) as MediaOut;
          result.media.replace(valueDes);
          break;
        case r'user_id':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.userId = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  MediaResponse deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = MediaResponseBuilder();
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

