//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'media_type.g.dart';

class MediaType extends EnumClass {

  /// MediaType，媒体类型
  @BuiltValueEnumConst(wireNumber: 0)
  static const MediaType number0 = _$number0;
  /// MediaType，媒体类型
  @BuiltValueEnumConst(wireNumber: 1)
  static const MediaType number1 = _$number1;
  /// MediaType，媒体类型
  @BuiltValueEnumConst(wireNumber: 2)
  static const MediaType number2 = _$number2;

  static Serializer<MediaType> get serializer => _$mediaTypeSerializer;

  const MediaType._(String name): super(name);

  static BuiltSet<MediaType> get values => _$values;
  static MediaType valueOf(String name) => _$valueOf(name);
}

/// Optionally, enum_class can generate a mixin to go with your enum for use
/// with Angular. It exposes your enum constants as getters. So, if you mix it
/// in to your Dart component class, the values become available to the
/// corresponding Angular template.
///
/// Trigger mixin generation by writing a line like this one next to your enum.
abstract class MediaTypeMixin = Object with _$MediaTypeMixin;

