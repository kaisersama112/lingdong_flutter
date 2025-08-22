// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'related_type_enum.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

const RelatedTypeEnum _$number1 = const RelatedTypeEnum._('number1');
const RelatedTypeEnum _$number2 = const RelatedTypeEnum._('number2');
const RelatedTypeEnum _$number3 = const RelatedTypeEnum._('number3');
const RelatedTypeEnum _$number4 = const RelatedTypeEnum._('number4');

RelatedTypeEnum _$valueOf(String name) {
  switch (name) {
    case 'number1':
      return _$number1;
    case 'number2':
      return _$number2;
    case 'number3':
      return _$number3;
    case 'number4':
      return _$number4;
    default:
      throw ArgumentError(name);
  }
}

final BuiltSet<RelatedTypeEnum> _$values =
    BuiltSet<RelatedTypeEnum>(const <RelatedTypeEnum>[
  _$number1,
  _$number2,
  _$number3,
  _$number4,
]);

class _$RelatedTypeEnumMeta {
  const _$RelatedTypeEnumMeta();
  RelatedTypeEnum get number1 => _$number1;
  RelatedTypeEnum get number2 => _$number2;
  RelatedTypeEnum get number3 => _$number3;
  RelatedTypeEnum get number4 => _$number4;
  RelatedTypeEnum valueOf(String name) => _$valueOf(name);
  BuiltSet<RelatedTypeEnum> get values => _$values;
}

abstract class _$RelatedTypeEnumMixin {
  // ignore: non_constant_identifier_names
  _$RelatedTypeEnumMeta get RelatedTypeEnum => const _$RelatedTypeEnumMeta();
}

Serializer<RelatedTypeEnum> _$relatedTypeEnumSerializer =
    _$RelatedTypeEnumSerializer();

class _$RelatedTypeEnumSerializer
    implements PrimitiveSerializer<RelatedTypeEnum> {
  static const Map<String, Object> _toWire = const <String, Object>{
    'number1': 1,
    'number2': 2,
    'number3': 3,
    'number4': 4,
  };
  static const Map<Object, String> _fromWire = const <Object, String>{
    1: 'number1',
    2: 'number2',
    3: 'number3',
    4: 'number4',
  };

  @override
  final Iterable<Type> types = const <Type>[RelatedTypeEnum];
  @override
  final String wireName = 'RelatedTypeEnum';

  @override
  Object serialize(Serializers serializers, RelatedTypeEnum object,
          {FullType specifiedType = FullType.unspecified}) =>
      _toWire[object.name] ?? object.name;

  @override
  RelatedTypeEnum deserialize(Serializers serializers, Object serialized,
          {FullType specifiedType = FullType.unspecified}) =>
      RelatedTypeEnum.valueOf(
          _fromWire[serialized] ?? (serialized is String ? serialized : ''));
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
