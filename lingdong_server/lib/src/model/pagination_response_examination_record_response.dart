//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:lingdong_server/src/model/examination_record_response.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'pagination_response_examination_record_response.g.dart';

/// PaginationResponse[ExaminationRecordResponse]
///
/// Properties:
/// * [items] - Items，数据列表
/// * [skip] - Skip，跳过的记录数
/// * [size] - Size，每页记录数
/// * [total] - Total，总记录数
/// * [totalPages] - Total Pages，总页数
@BuiltValue()
abstract class PaginationResponseExaminationRecordResponse implements Built<PaginationResponseExaminationRecordResponse, PaginationResponseExaminationRecordResponseBuilder> {
  /// Items，数据列表
  @BuiltValueField(wireName: r'items')
  BuiltList<ExaminationRecordResponse> get items;

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

  PaginationResponseExaminationRecordResponse._();

  factory PaginationResponseExaminationRecordResponse([void updates(PaginationResponseExaminationRecordResponseBuilder b)]) = _$PaginationResponseExaminationRecordResponse;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(PaginationResponseExaminationRecordResponseBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<PaginationResponseExaminationRecordResponse> get serializer => _$PaginationResponseExaminationRecordResponseSerializer();
}

class _$PaginationResponseExaminationRecordResponseSerializer implements PrimitiveSerializer<PaginationResponseExaminationRecordResponse> {
  @override
  final Iterable<Type> types = const [PaginationResponseExaminationRecordResponse, _$PaginationResponseExaminationRecordResponse];

  @override
  final String wireName = r'PaginationResponseExaminationRecordResponse';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    PaginationResponseExaminationRecordResponse object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'items';
    yield serializers.serialize(
      object.items,
      specifiedType: const FullType(BuiltList, [FullType(ExaminationRecordResponse)]),
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
    PaginationResponseExaminationRecordResponse object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required PaginationResponseExaminationRecordResponseBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'items':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(BuiltList, [FullType(ExaminationRecordResponse)]),
          ) as BuiltList<ExaminationRecordResponse>;
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
  PaginationResponseExaminationRecordResponse deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = PaginationResponseExaminationRecordResponseBuilder();
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

