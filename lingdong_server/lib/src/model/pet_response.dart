//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:lingdong_server/src/model/date.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'pet_response.g.dart';

/// PetResponse，宠物档案响应模型
///
/// Properties:
/// * [name] 
/// * [species] 
/// * [breed] 
/// * [birthday] 
/// * [chipId] 
/// * [avatar] 
/// * [gender] 
/// * [neutered] 
/// * [allergyHistory] 
/// * [id] - Id
@BuiltValue()
abstract class PetResponse implements Built<PetResponse, PetResponseBuilder> {
  @BuiltValueField(wireName: r'name')
  String? get name;

  @BuiltValueField(wireName: r'species')
  String? get species;

  @BuiltValueField(wireName: r'breed')
  String? get breed;

  @BuiltValueField(wireName: r'birthday')
  Date? get birthday;

  @BuiltValueField(wireName: r'chip_id')
  String? get chipId;

  @BuiltValueField(wireName: r'avatar')
  String? get avatar;

  @BuiltValueField(wireName: r'gender')
  String? get gender;

  @BuiltValueField(wireName: r'neutered')
  bool? get neutered;

  @BuiltValueField(wireName: r'allergy_history')
  String? get allergyHistory;

  /// Id
  @BuiltValueField(wireName: r'id')
  int get id;

  PetResponse._();

  factory PetResponse([void updates(PetResponseBuilder b)]) = _$PetResponse;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(PetResponseBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<PetResponse> get serializer => _$PetResponseSerializer();
}

class _$PetResponseSerializer implements PrimitiveSerializer<PetResponse> {
  @override
  final Iterable<Type> types = const [PetResponse, _$PetResponse];

  @override
  final String wireName = r'PetResponse';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    PetResponse object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.name != null) {
      yield r'name';
      yield serializers.serialize(
        object.name,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.species != null) {
      yield r'species';
      yield serializers.serialize(
        object.species,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.breed != null) {
      yield r'breed';
      yield serializers.serialize(
        object.breed,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.birthday != null) {
      yield r'birthday';
      yield serializers.serialize(
        object.birthday,
        specifiedType: const FullType.nullable(Date),
      );
    }
    if (object.chipId != null) {
      yield r'chip_id';
      yield serializers.serialize(
        object.chipId,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.avatar != null) {
      yield r'avatar';
      yield serializers.serialize(
        object.avatar,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.gender != null) {
      yield r'gender';
      yield serializers.serialize(
        object.gender,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.neutered != null) {
      yield r'neutered';
      yield serializers.serialize(
        object.neutered,
        specifiedType: const FullType.nullable(bool),
      );
    }
    if (object.allergyHistory != null) {
      yield r'allergy_history';
      yield serializers.serialize(
        object.allergyHistory,
        specifiedType: const FullType.nullable(String),
      );
    }
    yield r'id';
    yield serializers.serialize(
      object.id,
      specifiedType: const FullType(int),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    PetResponse object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required PetResponseBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'name':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.name = valueDes;
          break;
        case r'species':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.species = valueDes;
          break;
        case r'breed':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.breed = valueDes;
          break;
        case r'birthday':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(Date),
          ) as Date?;
          if (valueDes == null) continue;
          result.birthday = valueDes;
          break;
        case r'chip_id':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.chipId = valueDes;
          break;
        case r'avatar':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.avatar = valueDes;
          break;
        case r'gender':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.gender = valueDes;
          break;
        case r'neutered':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(bool),
          ) as bool?;
          if (valueDes == null) continue;
          result.neutered = valueDes;
          break;
        case r'allergy_history':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.allergyHistory = valueDes;
          break;
        case r'id':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.id = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  PetResponse deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = PetResponseBuilder();
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

