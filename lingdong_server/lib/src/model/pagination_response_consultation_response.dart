//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:lingdong_server/src/model/consultation_response.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'pagination_response_consultation_response.g.dart';

/// PaginationResponse[ConsultationResponse]
///
/// Properties:
/// * [items] - Items，数据列表
/// * [skip] - Skip，跳过的记录数
/// * [size] - Size，每页记录数
/// * [total] - Total，总记录数
/// * [totalPages] - Total Pages，总页数
@BuiltValue()
abstract class PaginationResponseConsultationResponse implements Built<PaginationResponseConsultationResponse, PaginationResponseConsultationResponseBuilder> {
  /// Items，数据列表
  @BuiltValueField(wireName: r'items')
  BuiltList<ConsultationResponse> get items;

  /// Skip，跳过的记录数
  @BuiltValueField(wireName: r'skip')
  int get skip;

  /// Size，每页记录数
  @BuiltValueField(wireName: r'size')
  int get size;

  /// Total，总记录数
  @BuiltValueField(wireName: r'total')
  int get total;

  /// Total Pages，总页数
  @BuiltValueField(wireName: r'total_pages')
  int get totalPages;

  PaginationResponseConsultationResponse._();

  factory PaginationResponseConsultationResponse([void updates(PaginationResponseConsultationResponseBuilder b)]) = _$PaginationResponseConsultationResponse;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(PaginationResponseConsultationResponseBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<PaginationResponseConsultationResponse> get serializer => _$PaginationResponseConsultationResponseSerializer();
}

class _$PaginationResponseConsultationResponseSerializer implements PrimitiveSerializer<PaginationResponseConsultationResponse> {
  @override
  final Iterable<Type> types = const [PaginationResponseConsultationResponse, _$PaginationResponseConsultationResponse];

  @override
  final String wireName = r'PaginationResponseConsultationResponse';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    PaginationResponseConsultationResponse object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'items';
    yield serializers.serialize(
      object.items,
      specifiedType: const FullType(BuiltList, [FullType(ConsultationResponse)]),
    );
    yield r'skip';
    yield serializers.serialize(
      object.skip,
      specifiedType: const FullType(int),
    );
    yield r'size';
    yield serializers.serialize(
      object.size,
      specifiedType: const FullType(int),
    );
    yield r'total';
    yield serializers.serialize(
      object.total,
      specifiedType: const FullType(int),
    );
    yield r'total_pages';
    yield serializers.serialize(
      object.totalPages,
      specifiedType: const FullType(int),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    PaginationResponseConsultationResponse object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required PaginationResponseConsultationResponseBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'items':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(BuiltList, [FullType(ConsultationResponse)]),
          ) as BuiltList<ConsultationResponse>;
          result.items.replace(valueDes);
          break;
        case r'skip':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.skip = valueDes;
          break;
        case r'size':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.size = valueDes;
          break;
        case r'total':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.total = valueDes;
          break;
        case r'total_pages':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.totalPages = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  PaginationResponseConsultationResponse deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = PaginationResponseConsultationResponseBuilder();
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

