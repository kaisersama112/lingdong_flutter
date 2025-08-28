//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:lingdong_server/src/model/date.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'pet_create.g.dart';

/// PetCreate，宠物档案创建模型
///
/// Properties:
/// * [name] - Name，宠物名称
/// * [species] - Species，物种(狗/猫)
/// * [breed] 
/// * [birthday] 
/// * [chipId] 
/// * [avatar] 
/// * [gender] 
/// * [weight] 
/// * [neutered] 
/// * [allergyHistory] 
@BuiltValue()
abstract class PetCreate implements Built<PetCreate, PetCreateBuilder> {
  /// Name，宠物名称
  @BuiltValueField(wireName: r'name')
  String get name;

  /// Species，物种(狗/猫)
  @BuiltValueField(wireName: r'species')
  String get species;

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

  @BuiltValueField(wireName: r'weight')
  num? get weight;

  @BuiltValueField(wireName: r'neutered')
  bool? get neutered;

  @BuiltValueField(wireName: r'allergy_history')
  String? get allergyHistory;

  PetCreate._();

  factory PetCreate([void updates(PetCreateBuilder b)]) = _$PetCreate;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(PetCreateBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<PetCreate> get serializer => _$PetCreateSerializer();
}

class _$PetCreateSerializer implements PrimitiveSerializer<PetCreate> {
  @override
  final Iterable<Type> types = const [PetCreate, _$PetCreate];

  @override
  final String wireName = r'PetCreate';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    PetCreate object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'name';
    yield serializers.serialize(
      object.name,
      specifiedType: const FullType(String),
    );
    yield r'species';
    yield serializers.serialize(
      object.species,
      specifiedType: const FullType(String),
    );
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
    if (object.weight != null) {
      yield r'weight';
      yield serializers.serialize(
        object.weight,
        specifiedType: const FullType.nullable(num),
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
  }

  @override
  Object serialize(
    Serializers serializers,
    PetCreate object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required PetCreateBuilder result,
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
        case r'species':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
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
        case r'weight':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(num),
          ) as num?;
          if (valueDes == null) continue;
          result.weight = valueDes;
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
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  PetCreate deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = PetCreateBuilder();
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

