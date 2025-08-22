// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'media_type.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

const MediaType _$number0 = const MediaType._('number0');
const MediaType _$number1 = const MediaType._('number1');
const MediaType _$number2 = const MediaType._('number2');

MediaType _$valueOf(String name) {
  switch (name) {
    case 'number0':
      return _$number0;
    case 'number1':
      return _$number1;
    case 'number2':
      return _$number2;
    default:
      throw ArgumentError(name);
  }
}

final BuiltSet<MediaType> _$values = BuiltSet<MediaType>(const <MediaType>[
  _$number0,
  _$number1,
  _$number2,
]);

class _$MediaTypeMeta {
  const _$MediaTypeMeta();
  MediaType get number0 => _$number0;
  MediaType get number1 => _$number1;
  MediaType get number2 => _$number2;
  MediaType valueOf(String name) => _$valueOf(name);
  BuiltSet<MediaType> get values => _$values;
}

abstract class _$MediaTypeMixin {
  // ignore: non_constant_identifier_names
  _$MediaTypeMeta get MediaType => const _$MediaTypeMeta();
}

Serializer<MediaType> _$mediaTypeSerializer = _$MediaTypeSerializer();

class _$MediaTypeSerializer implements PrimitiveSerializer<MediaType> {
  static const Map<String, Object> _toWire = const <String, Object>{
    'number0': 0,
    'number1': 1,
    'number2': 2,
  };
  static const Map<Object, String> _fromWire = const <Object, String>{
    0: 'number0',
    1: 'number1',
    2: 'number2',
  };

  @override
  final Iterable<Type> types = const <Type>[MediaType];
  @override
  final String wireName = 'MediaType';

  @override
  Object serialize(Serializers serializers, MediaType object,
          {FullType specifiedType = FullType.unspecified}) =>
      _toWire[object.name] ?? object.name;

  @override
  MediaType deserialize(Serializers serializers, Object serialized,
          {FullType specifiedType = FullType.unspecified}) =>
      MediaType.valueOf(
          _fromWire[serialized] ?? (serialized is String ? serialized : ''));
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
