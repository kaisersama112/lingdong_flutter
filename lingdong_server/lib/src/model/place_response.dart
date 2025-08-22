//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:lingdong_server/src/model/date.dart';
import 'package:lingdong_server/src/model/media_response.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'place_response.g.dart';

/// PlaceResponse
///
/// Properties:
/// * [name] - Name，场所名称
/// * [type] - Type，场所类型
/// * [longitude] - Longitude，经度
/// * [latitude] - Latitude，纬度
/// * [medias] - Medias，媒体信息列表
/// * [address] 
/// * [rating] 
/// * [description] 
/// * [id] - Id，场所ID
/// * [createdAt] - Created At，创建时间
/// * [updatedAt] - Updated At，更新时间
@BuiltValue()
abstract class PlaceResponse implements Built<PlaceResponse, PlaceResponseBuilder> {
  /// Name，场所名称
  @BuiltValueField(wireName: r'name')
  String get name;

  /// Type，场所类型
  @BuiltValueField(wireName: r'type')
  String get type;

  /// Longitude，经度
  @BuiltValueField(wireName: r'longitude')
  num get longitude;

  /// Latitude，纬度
  @BuiltValueField(wireName: r'latitude')
  num get latitude;

  /// Medias，媒体信息列表
  @BuiltValueField(wireName: r'medias')
  BuiltList<MediaResponse>? get medias;

  @BuiltValueField(wireName: r'address')
  String? get address;

  @BuiltValueField(wireName: r'rating')
  num? get rating;

  @BuiltValueField(wireName: r'description')
  String? get description;

  /// Id，场所ID
  @BuiltValueField(wireName: r'id')
  int get id;

  /// Created At，创建时间
  @BuiltValueField(wireName: r'created_at')
  Date get createdAt;

  /// Updated At，更新时间
  @BuiltValueField(wireName: r'updated_at')
  Date get updatedAt;

  PlaceResponse._();

  factory PlaceResponse([void updates(PlaceResponseBuilder b)]) = _$PlaceResponse;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(PlaceResponseBuilder b) => b
      ..medias = ListBuilder();

  @BuiltValueSerializer(custom: true)
  static Serializer<PlaceResponse> get serializer => _$PlaceResponseSerializer();
}

class _$PlaceResponseSerializer implements PrimitiveSerializer<PlaceResponse> {
  @override
  final Iterable<Type> types = const [PlaceResponse, _$PlaceResponse];

  @override
  final String wireName = r'PlaceResponse';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    PlaceResponse object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'name';
    yield serializers.serialize(
      object.name,
      specifiedType: const FullType(String),
    );
    yield r'type';
    yield serializers.serialize(
      object.type,
      specifiedType: const FullType(String),
    );
    yield r'longitude';
    yield serializers.serialize(
      object.longitude,
      specifiedType: const FullType(num),
    );
    yield r'latitude';
    yield serializers.serialize(
      object.latitude,
      specifiedType: const FullType(num),
    );
    if (object.medias != null) {
      yield r'medias';
      yield serializers.serialize(
        object.medias,
        specifiedType: const FullType(BuiltList, [FullType(MediaResponse)]),
      );
    }
    if (object.address != null) {
      yield r'address';
      yield serializers.serialize(
        object.address,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.rating != null) {
      yield r'rating';
      yield serializers.serialize(
        object.rating,
        specifiedType: const FullType.nullable(num),
      );
    }
    if (object.description != null) {
      yield r'description';
      yield serializers.serialize(
        object.description,
        specifiedType: const FullType.nullable(String),
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
      specifiedType: const FullType(Date),
    );
    yield r'updated_at';
    yield serializers.serialize(
      object.updatedAt,
      specifiedType: const FullType(Date),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    PlaceResponse object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required PlaceResponseBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'name':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.name = valueDes;
          break;
        case r'type':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.type = valueDes;
          break;
        case r'longitude':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(num),
          ) as num;
          result.longitude = valueDes;
          break;
        case r'latitude':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(num),
          ) as num;
          result.latitude = valueDes;
          break;
        case r'medias':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(BuiltList, [FullType(MediaResponse)]),
          ) as BuiltList<MediaResponse>;
          result.medias.replace(valueDes);
          break;
        case r'address':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.address = valueDes;
          break;
        case r'rating':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(num),
          ) as num?;
          if (valueDes == null) continue;
          result.rating = valueDes;
          break;
        case r'description':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.description = valueDes;
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
            specifiedType: const FullType(Date),
          ) as Date;
          result.createdAt = valueDes;
          break;
        case r'updated_at':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(Date),
          ) as Date;
          result.updatedAt = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  PlaceResponse deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = PlaceResponseBuilder();
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

