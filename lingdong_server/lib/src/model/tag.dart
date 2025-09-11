//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:lingdong_server/src/model/model_null.dart';
import 'dart:core';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:one_of/any_of.dart';

part 'tag.g.dart';

/// Tag
@BuiltValue()
abstract class Tag implements Built<Tag, TagBuilder> {
  /// Any Of [ModelNull], [String]
  AnyOf get anyOf;

  Tag._();

  factory Tag([void updates(TagBuilder b)]) = _$Tag;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(TagBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<Tag> get serializer => _$TagSerializer();
}

class _$TagSerializer implements PrimitiveSerializer<Tag> {
  @override
  final Iterable<Type> types = const [Tag, _$Tag];

  @override
  final String wireName = r'Tag';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    Tag object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
  }

  @override
  Object serialize(
    Serializers serializers,
    Tag object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final anyOf = object.anyOf;
    return serializers.serialize(anyOf, specifiedType: FullType(AnyOf, anyOf.valueTypes.map((type) => FullType(type)).toList()))!;
  }

  @override
  Tag deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = TagBuilder();
    Object? anyOfDataSrc;
    final targetType = const FullType(AnyOf, [FullType(String), FullType(ModelNull), ]);
    anyOfDataSrc = serialized;
    result.anyOf = serializers.deserialize(anyOfDataSrc, specifiedType: targetType) as AnyOf;
    return result.build();
  }
}

