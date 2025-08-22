//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:lingdong_server/src/model/media_create.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'reply_create.g.dart';

/// ReplyCreate
///
/// Properties:
/// * [content] - Content，回复内容
/// * [medias] 
/// * [parentCommentId] - Parent Comment Id，顶级评论ID
@BuiltValue()
abstract class ReplyCreate implements Built<ReplyCreate, ReplyCreateBuilder> {
  /// Content，回复内容
  @BuiltValueField(wireName: r'content')
  String get content;

  @BuiltValueField(wireName: r'medias')
  BuiltList<MediaCreate>? get medias;

  /// Parent Comment Id，顶级评论ID
  @BuiltValueField(wireName: r'parent_comment_id')
  int get parentCommentId;

  ReplyCreate._();

  factory ReplyCreate([void updates(ReplyCreateBuilder b)]) = _$ReplyCreate;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(ReplyCreateBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<ReplyCreate> get serializer => _$ReplyCreateSerializer();
}

class _$ReplyCreateSerializer implements PrimitiveSerializer<ReplyCreate> {
  @override
  final Iterable<Type> types = const [ReplyCreate, _$ReplyCreate];

  @override
  final String wireName = r'ReplyCreate';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    ReplyCreate object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
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
    yield r'parent_comment_id';
    yield serializers.serialize(
      object.parentCommentId,
      specifiedType: const FullType(int),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    ReplyCreate object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required ReplyCreateBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
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
        case r'parent_comment_id':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.parentCommentId = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  ReplyCreate deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = ReplyCreateBuilder();
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

