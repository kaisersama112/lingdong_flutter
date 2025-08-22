//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'related_type_enum.g.dart';

class RelatedTypeEnum extends EnumClass {

  /// RelatedTypeEnum
  @BuiltValueEnumConst(wireNumber: 1)
  static const RelatedTypeEnum number1 = _$number1;
  /// RelatedTypeEnum
  @BuiltValueEnumConst(wireNumber: 2)
  static const RelatedTypeEnum number2 = _$number2;
  /// RelatedTypeEnum
  @BuiltValueEnumConst(wireNumber: 3)
  static const RelatedTypeEnum number3 = _$number3;
  /// RelatedTypeEnum
  @BuiltValueEnumConst(wireNumber: 4)
  static const RelatedTypeEnum number4 = _$number4;

  static Serializer<RelatedTypeEnum> get serializer => _$relatedTypeEnumSerializer;

  const RelatedTypeEnum._(String name): super(name);

  static BuiltSet<RelatedTypeEnum> get values => _$values;
  static RelatedTypeEnum valueOf(String name) => _$valueOf(name);
}

/// Optionally, enum_class can generate a mixin to go with your enum for use
/// with Angular. It exposes your enum constants as getters. So, if you mix it
/// in to your Dart component class, the values become available to the
/// corresponding Angular template.
///
/// Trigger mixin generation by writing a line like this one next to your enum.
abstract class RelatedTypeEnumMixin = Object with _$RelatedTypeEnumMixin;

