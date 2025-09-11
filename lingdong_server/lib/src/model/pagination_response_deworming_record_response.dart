//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:lingdong_server/src/model/deworming_record_response.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'pagination_response_deworming_record_response.g.dart';

/// PaginationResponse[DewormingRecordResponse]
///
/// Properties:
/// * [items] - Items，数据列表
/// * [skip] - Skip，跳过的记录数
/// * [size] - Size，每页记录数
/// * [total] - Total，总记录数
/// * [totalPages] - Total Pages，总页数
@BuiltValue()
abstract class PaginationResponseDewormingRecordResponse implements Built<PaginationResponseDewormingRecordResponse, PaginationResponseDewormingRecordResponseBuilder> {
  /// Items，数据列表
  @BuiltValueField(wireName: r'items')
  BuiltList<DewormingRecordResponse> get items;

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

  PaginationResponseDewormingRecordResponse._();

  factory PaginationResponseDewormingRecordResponse([void updates(PaginationResponseDewormingRecordResponseBuilder b)]) = _$PaginationResponseDewormingRecordResponse;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(PaginationResponseDewormingRecordResponseBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<PaginationResponseDewormingRecordResponse> get serializer => _$PaginationResponseDewormingRecordResponseSerializer();
}

class _$PaginationResponseDewormingRecordResponseSerializer implements PrimitiveSerializer<PaginationResponseDewormingRecordResponse> {
  @override
  final Iterable<Type> types = const [PaginationResponseDewormingRecordResponse, _$PaginationResponseDewormingRecordResponse];

  @override
  final String wireName = r'PaginationResponseDewormingRecordResponse';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    PaginationResponseDewormingRecordResponse object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'items';
    yield serializers.serialize(
      object.items,
      specifiedType: const FullType(BuiltList, [FullType(DewormingRecordResponse)]),
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
    PaginationResponseDewormingRecordResponse object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required PaginationResponseDewormingRecordResponseBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'items':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(BuiltList, [FullType(DewormingRecordResponse)]),
          ) as BuiltList<DewormingRecordResponse>;
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
  PaginationResponseDewormingRecordResponse deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = PaginationResponseDewormingRecordResponseBuilder();
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

