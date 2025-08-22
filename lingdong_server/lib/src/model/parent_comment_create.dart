//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:lingdong_server/src/model/media_create.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'parent_comment_create.g.dart';

/// ParentCommentCreate
///
/// Properties:
/// * [postId] - Post Id，动态ID
/// * [content] - Content，评论内容
/// * [medias] 
@BuiltValue()
abstract class ParentCommentCreate implements Built<ParentCommentCreate, ParentCommentCreateBuilder> {
  /// Post Id，动态ID
  @BuiltValueField(wireName: r'post_id')
  int get postId;

  /// Content，评论内容
  @BuiltValueField(wireName: r'content')
  String get content;

  @BuiltValueField(wireName: r'medias')
  BuiltList<MediaCreate>? get medias;

  ParentCommentCreate._();

  factory ParentCommentCreate([void updates(ParentCommentCreateBuilder b)]) = _$ParentCommentCreate;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(ParentCommentCreateBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<ParentCommentCreate> get serializer => _$ParentCommentCreateSerializer();
}

class _$ParentCommentCreateSerializer implements PrimitiveSerializer<ParentCommentCreate> {
  @override
  final Iterable<Type> types = const [ParentCommentCreate, _$ParentCommentCreate];

  @override
  final String wireName = r'ParentCommentCreate';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    ParentCommentCreate object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'post_id';
    yield serializers.serialize(
      object.postId,
      specifiedType: const FullType(int),
    );
    yield r'content';
    yield serializers.serialize(
      object.content,
      specifiedType: const FullType(String),
    );
    if (object.medias != null) {
      yield r'medias';
      yield serializers.serialize(
        object.medias,
        specifiedType: const FullType.nullable(BuiltList, [FullType(MediaCreate)]),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    ParentCommentCreate object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required ParentCommentCreateBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'post_id':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.postId = valueDes;
          break;
        case r'content':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.content = valueDes;
          break;
        case r'medias':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(BuiltList, [FullType(MediaCreate)]),
          ) as BuiltList<MediaCreate>?;
          if (valueDes == null) continue;
          result.medias.replace(valueDes);
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  ParentCommentCreate deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = ParentCommentCreateBuilder();
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

