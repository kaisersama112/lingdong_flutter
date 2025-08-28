import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import '../core/models.dart' as models;
import 'database_service.dart';
import 'user_auth_service.dart';
import 'package:lingdong_server/lingdong_server.dart' as server;

class RecordService {
  static final RecordService _instance = RecordService._internal();
  factory RecordService() => _instance;
  RecordService._internal();

  final DatabaseService _databaseService = DatabaseService();
  final UserAuthService _authService = UserAuthService();
  Dio? _dio;
  server.PetProfileApi? _petApi;

  /// 初始化API客户端
  void _initializeApiClient() {
    if (_dio != null && _petApi != null) return;

    _dio = Dio(
      BaseOptions(
        baseUrl: 'http://172.16.4.114:7009',
        connectTimeout: const Duration(seconds: 10),
        receiveTimeout: const Duration(seconds: 15),
        sendTimeout: const Duration(seconds: 10),
      ),
    );

    _updateAuthToken();
    _petApi = server.PetProfileApi(_dio!, server.standardSerializers);
  }

  /// 更新认证Token
  void _updateAuthToken() {
    if (_dio == null) return;
    final token = _getAuthToken();
    if (token.isNotEmpty) {
      _dio!.options.headers['Authorization'] = 'Bearer $token';
    }
  }

  /// 获取认证Token
  String _getAuthToken() {
    try {
      final token = _authService.getAccessToken();
      return token ?? "";
    } catch (e) {
      debugPrint('获取认证Token失败: $e');
      return "";
    }
  }

  /// 检查并更新认证Token
  void _ensureValidAuthToken() {
    if (_dio == null) return;
    final currentToken = _dio!.options.headers['Authorization'] as String?;
    if (currentToken == null || !currentToken.startsWith('Bearer ')) {
      _updateAuthToken();
    }
  }

  /// 生成唯一记录ID
  String generateRecordId() {
    final timestamp = DateTime.now().millisecondsSinceEpoch;
    final random = (timestamp % 10000).toString().padLeft(4, '0');
    return 'REC$timestamp$random';
  }

  // ==================== 响应解析辅助 ====================

  List<Map<String, dynamic>> _extractItemsAsMapList(
    server.GenericResponseDict? resp,
  ) {
    try {
      final dataMap = resp?.data;
      if (dataMap == null) return [];
      final itemsDynamic = dataMap['items']?.value;
      if (itemsDynamic is List) {
        return itemsDynamic
            .map<Map<String, dynamic>>((element) {
              if (element is Map<String, dynamic>) return element;
              if (element is Map) {
                return element.map((k, v) => MapEntry(k.toString(), v));
              }
              return <String, dynamic>{};
            })
            .where((m) => m.isNotEmpty)
            .toList();
      }
      return [];
    } catch (e) {
      debugPrint('解析响应items失败: $e');
      return [];
    }
  }

  void _logApiResponse(String label, server.GenericResponseDict? resp) {
    debugPrint('=== [$label] API Response ===');
    debugPrint('code: ${resp?.code}');
    debugPrint('msg: ${resp?.msg}');
    debugPrint('data keys: ${resp?.data?.keys.toList()}');
    if (resp?.data != null) {
      resp!.data!.forEach((key, value) {
        debugPrint('  $key: ${value?.value}');
      });
    }
    debugPrint('========================');
  }

  void _logParsedRecords(String label, List<models.HealthRecord> records) {
    debugPrint('=== [$label] Parsed Records ===');
    debugPrint('count: ${records.length}');
    for (int i = 0; i < records.length; i++) {
      final r = records[i];
      debugPrint(
        '  [$i] id:${r.id}, title:${r.title}, date:${r.date.toIso8601String()}, clinic:${r.clinic ?? "null"}, weight:${r.weight ?? "null"}',
      );
    }
    debugPrint('========================');
  }

  DateTime _parseDate(dynamic value) {
    try {
      if (value == null) return DateTime.now();
      if (value is String) {
        return DateTime.tryParse(value) ?? DateTime.now();
      }
      if (value is Map) {
        final year = (value['year'] ?? value['Year']) as int?;
        final month = (value['month'] ?? value['Month']) as int?;
        final day = (value['day'] ?? value['Day']) as int?;
        if (year != null && month != null && day != null) {
          return DateTime(year, month, day);
        }
      }
    } catch (_) {}
    return DateTime.now();
  }

  String _stringifyDetails(dynamic details) {
    if (details is Map) {
      final entries = <String>[];
      details.forEach((k, v) {
        if (v is List) {
          entries.add('$k: ${v.join(', ')}');
        } else {
          entries.add('$k: $v');
        }
      });
      return entries.join(' | ');
    }
    return details?.toString() ?? '';
  }

  // ==================== 疫苗接种记录 ====================

  /// 创建疫苗接种记录
  Future<models.HealthRecord> createVaccinationRecord(
    models.HealthRecord record,
  ) async {
    _initializeApiClient();
    _ensureValidAuthToken();

    try {
      final request = server.VaccinationRecordCreate(
        (b) => b
          ..petId = int.parse(record.petId)
          ..vaccinationType = record.title
          ..vaccineName = record.title
          ..location = record.clinic
          ..nextDueDate = server.Date(
            record.date.year,
            record.date.month,
            record.date.day,
          ),
      );

      final response = await _petApi!
          .createVaccinationRecordApiPetCreateVaccinationRecordPost(
            vaccinationRecordCreate: request,
          );

      if (response.data?.code != 200) {
        throw Exception('创建疫苗接种记录失败: ${response.data?.msg}');
      }

      await _saveRecordToLocal(record);
      return record;
    } catch (e) {
      debugPrint('创建疫苗接种记录失败: $e');
      await _saveRecordToLocal(record);
      return record;
    }
  }

  /// 获取疫苗接种记录列表
  Future<List<models.HealthRecord>> getVaccinationRecords(
    String petId, {
    int skip = 0,
    int size = 10,
  }) async {
    _initializeApiClient();
    _ensureValidAuthToken();

    try {
      final response = await _petApi!
          .getVaccinationRecordsByPetApiPetGetVaccinationRecordsByPetPetIdGet(
            petId: int.parse(petId),
            skip: skip,
            size: size,
          );

      if (response.data?.code != 200) {
        throw Exception('获取疫苗接种记录失败: ${response.data?.msg}');
      }

      _logApiResponse('Vaccination', response.data);
      final items = _extractItemsAsMapList(response.data);
      debugPrint('Extracted items count: ${items.length}');
      debugPrint('Items: $items');
      return items
          .map((record) => _convertVaccinationRecordToModel(record, petId))
          .toList();
    } catch (e) {
      debugPrint('从API获取疫苗接种记录失败，使用本地数据: $e');
      return await _getRecordsFromLocal(
        petId,
        models.HealthRecordType.vaccination,
      );
    }
  }

  // ==================== 驱虫记录 ====================

  Future<List<models.HealthRecord>> getDewormingRecords(
    String petId, {
    int skip = 0,
    int size = 10,
  }) async {
    _initializeApiClient();
    _ensureValidAuthToken();

    try {
      final response = await _petApi!
          .getDewormingRecordsByPetApiPetGetDewormingRecordsByPetPetIdGet(
            petId: int.parse(petId),
            skip: skip,
            size: size,
          );

      if (response.data?.code != 200) {
        throw Exception('获取驱虫记录失败: ${response.data?.msg}');
      }

      _logApiResponse('Deworming', response.data);
      final items = _extractItemsAsMapList(response.data);
      debugPrint('Extracted items count: ${items.length}');
      debugPrint('Items: $items');
      return items
          .map((record) => _convertDewormingRecordToModel(record, petId))
          .toList();
    } catch (e) {
      debugPrint('从API获取驱虫记录失败，使用本地数据: $e');
      return await _getRecordsFromLocal(
        petId,
        models.HealthRecordType.deworming,
      );
    }
  }

  // ==================== 体检记录 ====================

  Future<List<models.HealthRecord>> getExaminationRecords(
    String petId, {
    int skip = 0,
    int size = 10,
  }) async {
    _initializeApiClient();
    _ensureValidAuthToken();

    try {
      final response = await _petApi!
          .getExaminationRecordsByPetApiPetGetExaminationRecordsByPetPetIdGet(
            petId: int.parse(petId),
            skip: skip,
            size: size,
          );

      if (response.data?.code != 200) {
        throw Exception('获取体检记录失败: ${response.data?.msg}');
      }

      _logApiResponse('Examination', response.data);
      final items = _extractItemsAsMapList(response.data);
      debugPrint('Extracted items count: ${items.length}');
      debugPrint('Items: $items');
      return items
          .map((record) => _convertExaminationRecordToModel(record, petId))
          .toList();
    } catch (e) {
      debugPrint('从API获取体检记录失败，使用本地数据: $e');
      return await _getRecordsFromLocal(
        petId,
        models.HealthRecordType.vetVisit,
      );
    }
  }

  // ==================== 体重记录 ====================

  Future<List<models.HealthRecord>> getWeightRecords(
    String petId, {
    int skip = 0,
    int size = 10,
  }) async {
    _initializeApiClient();
    _ensureValidAuthToken();

    try {
      final response = await _petApi!
          .getWeightRecordsByPetApiPetGetWeightRecordsByPetPetIdGet(
            petId: int.parse(petId),
            skip: skip,
            size: size,
          );

      if (response.data?.code != 200) {
        throw Exception('获取体重记录失败: ${response.data?.msg}');
      }

      _logApiResponse('Weight', response.data);
      final items = _extractItemsAsMapList(response.data);
      debugPrint('Extracted items count: ${items.length}');
      debugPrint('Items: $items');
      return items
          .map((record) => _convertWeightRecordToModel(record, petId))
          .toList();
    } catch (e) {
      debugPrint('从API获取体重记录失败，使用本地数据: $e');
      return await _getRecordsFromLocal(petId, models.HealthRecordType.weight);
    }
  }

  // ==================== 美容养护记录 ====================

  Future<List<models.HealthRecord>> getGroomingRecords(
    String petId, {
    int skip = 0,
    int size = 10,
  }) async {
    _initializeApiClient();
    _ensureValidAuthToken();

    try {
      final response = await _petApi!
          .getGroomingRecordsByPetApiPetGetGroomingRecordsByPetPetIdGet(
            petId: int.parse(petId),
            skip: skip,
            size: size,
          );

      if (response.data?.code != 200) {
        throw Exception('获取美容记录失败: ${response.data?.msg}');
      }

      _logApiResponse('Grooming', response.data);
      final items = _extractItemsAsMapList(response.data);
      debugPrint('Extracted items count: ${items.length}');
      debugPrint('Items: $items');
      return items
          .map((record) => _convertGroomingRecordToModel(record, petId))
          .toList();
    } catch (e) {
      debugPrint('从API获取美容记录失败，使用本地数据: $e');
      return await _getRecordsFromLocal(
        petId,
        models.HealthRecordType.grooming,
      );
    }
  }

  // ==================== 其他健康记录 ====================

  Future<List<models.HealthRecord>> getOtherHealthRecords(
    String petId, {
    int skip = 0,
    int size = 10,
  }) async {
    _initializeApiClient();
    _ensureValidAuthToken();

    try {
      final response = await _petApi!
          .getOtherHealthRecordsByPetApiPetGetOtherHealthRecordsByPetPetIdGet(
            petId: int.parse(petId),
            skip: skip,
            size: size,
          );

      if (response.data?.code != 200) {
        throw Exception('获取其他健康记录失败: ${response.data?.msg}');
      }

      _logApiResponse('Other', response.data);
      final items = _extractItemsAsMapList(response.data);
      debugPrint('Extracted items count: ${items.length}');
      debugPrint('Items: $items');
      return items
          .map((record) => _convertOtherHealthRecordToModel(record, petId))
          .toList();
    } catch (e) {
      debugPrint('从API获取其他健康记录失败，使用本地数据: $e');
      return await _getRecordsFromLocal(
        petId,
        models.HealthRecordType.medication,
      );
    }
  }

  /// 更新疫苗接种记录
  Future<models.HealthRecord> updateVaccinationRecord(
    models.HealthRecord record,
  ) async {
    _initializeApiClient();
    _ensureValidAuthToken();

    try {
      final request = server.VaccinationRecordCreate(
        (b) => b
          ..petId = int.parse(record.petId)
          ..vaccinationType = record.title
          ..vaccineName = record.title
          ..location = record.clinic
          ..nextDueDate = server.Date(
            record.date.year,
            record.date.month,
            record.date.day,
          ),
      );

      final response = await _petApi!
          .updateVaccinationRecordApiPetUpdateVaccinationRecordRecordIdPost(
            recordId: int.parse(record.id),
            vaccinationRecordCreate: request,
          );

      if (response.data?.code != 200) {
        throw Exception('更新疫苗接种记录失败: ${response.data?.msg}');
      }

      await _updateRecordInLocal(record);
      return record;
    } catch (e) {
      debugPrint('更新疫苗接种记录失败: $e');
      await _updateRecordInLocal(record);
      return record;
    }
  }

  /// 删除疫苗接种记录
  Future<void> deleteVaccinationRecord(String recordId) async {
    _initializeApiClient();
    _ensureValidAuthToken();

    try {
      final response = await _petApi!
          .deleteVaccinationRecordApiPetDeleteVaccinationRecordRecordIdPost(
            recordId: int.parse(recordId),
          );

      if (response.data?.code != 200) {
        throw Exception('删除疫苗接种记录失败: ${response.data?.msg}');
      }

      await _deleteRecordFromLocal(recordId);
    } catch (e) {
      debugPrint('删除疫苗接种记录失败: $e');
      await _deleteRecordFromLocal(recordId);
    }
  }

  // ==================== 本地数据库操作 ====================

  /// 保存记录到本地数据库
  Future<void> _saveRecordToLocal(models.HealthRecord record) async {
    try {
      final db = await _databaseService.database;
      await db.insert('health_records', _recordToMap(record));
    } catch (e) {
      debugPrint('保存记录到本地数据库失败: $e');
    }
  }

  /// 从本地数据库获取记录
  Future<List<models.HealthRecord>> _getRecordsFromLocal(
    String petId,
    models.HealthRecordType type,
  ) async {
    try {
      final db = await _databaseService.database;
      final List<Map<String, dynamic>> maps = await db.query(
        'health_records',
        where: 'pet_id = ? AND type = ?',
        whereArgs: [petId, type.toString()],
        orderBy: 'date DESC',
      );

      return List.generate(maps.length, (i) => _mapToRecord(maps[i]));
    } catch (e) {
      debugPrint('从本地数据库获取记录失败: $e');
      return [];
    }
  }

  /// 更新本地数据库中的记录
  Future<void> _updateRecordInLocal(models.HealthRecord record) async {
    try {
      final db = await _databaseService.database;
      await db.update(
        'health_records',
        _recordToMap(record),
        where: 'id = ?',
        whereArgs: [record.id],
      );
    } catch (e) {
      debugPrint('更新本地数据库记录失败: $e');
    }
  }

  /// 从本地数据库删除记录
  Future<void> _deleteRecordFromLocal(String recordId) async {
    try {
      final db = await _databaseService.database;
      await db.delete('health_records', where: 'id = ?', whereArgs: [recordId]);
    } catch (e) {
      debugPrint('从本地数据库删除记录失败: $e');
    }
  }

  // ==================== 数据转换方法 ====================

  /// 将记录转换为数据库映射
  Map<String, dynamic> _recordToMap(models.HealthRecord record) {
    return {
      'id': record.id,
      'pet_id': record.petId,
      'type': record.type.toString(),
      'title': record.title,
      'date': record.date.toIso8601String(),
      'notes': record.notes,
      'clinic': record.clinic,
      'weight': record.weight,
      'created_time': DateTime.now().toIso8601String(),
      'updated_time': DateTime.now().toIso8601String(),
    };
  }

  /// 将数据库映射转换为记录
  models.HealthRecord _mapToRecord(Map<String, dynamic> map) {
    return models.HealthRecord(
      id: map['id'] as String,
      petId: map['pet_id'] as String,
      type: models.HealthRecordType.values.firstWhere(
        (e) => e.toString() == map['type'],
        orElse: () => models.HealthRecordType.medication,
      ),
      title: map['title'] as String,
      date: DateTime.parse(map['date'] as String),
      notes: map['notes'] as String?,
      clinic: map['clinic'] as String?,
      weight: (map['weight'] as num?)?.toDouble(),
    );
  }

  /// 转换疫苗接种记录
  models.HealthRecord _convertVaccinationRecordToModel(
    Map<String, dynamic> record,
    String petId,
  ) {
    final title = (record['vaccine_name'] ?? record['vaccination_type'] ?? '')
        .toString();
    final loc = (record['location'] ?? '').toString();
    final date = _parseDate(record['next_due_date']);
    return models.HealthRecord(
      id: record['id'].toString(),
      petId: petId,
      type: models.HealthRecordType.vaccination,
      title: title,
      date: date,
      notes: record['validity_period']?.toString(),
      clinic: loc.isEmpty ? null : loc,
      weight: null,
    );
  }

  /// 转换驱虫记录
  models.HealthRecord _convertDewormingRecordToModel(
    Map<String, dynamic> record,
    String petId,
  ) {
    final title = (record['deworming_type'] ?? '').toString();
    final loc = (record['deworming_location'] ?? '').toString();
    final date = _parseDate(record['deworming_next_date']);
    return models.HealthRecord(
      id: record['id'].toString(),
      petId: petId,
      type: models.HealthRecordType.deworming,
      title: title,
      date: date,
      notes: record['deworming_medicine_name']?.toString(),
      clinic: loc.isEmpty ? null : loc,
      weight: null,
    );
  }

  /// 转换体检记录
  models.HealthRecord _convertExaminationRecordToModel(
    Map<String, dynamic> record,
    String petId,
  ) {
    final title = (record['test_type'] ?? '').toString();
    final date = _parseDate(record['test_date']);
    final clinic = (record['test_institution'] ?? '').toString();
    return models.HealthRecord(
      id: record['id'].toString(),
      petId: petId,
      type: models.HealthRecordType.vetVisit,
      title: title,
      date: date,
      notes: record['doctor_comments']?.toString(),
      clinic: clinic.isEmpty ? null : clinic,
      weight: null,
    );
  }

  /// 转换体重记录
  models.HealthRecord _convertWeightRecordToModel(
    Map<String, dynamic> record,
    String petId,
  ) {
    final weightValue = (record['weight_value'] as num?)?.toDouble();
    return models.HealthRecord(
      id: record['id'].toString(),
      petId: petId,
      type: models.HealthRecordType.weight,
      title: '体重记录',
      date: DateTime.now(),
      notes: null,
      clinic: null,
      weight: weightValue,
    );
  }

  /// 转换美容记录
  models.HealthRecord _convertGroomingRecordToModel(
    Map<String, dynamic> record,
    String petId,
  ) {
    final title = (record['grooming_type'] ?? '').toString();
    final date = _parseDate(record['grooming_date']);
    final clinic = (record['grooming_establishment'] ?? '').toString();
    return models.HealthRecord(
      id: record['id'].toString(),
      petId: petId,
      type: models.HealthRecordType.grooming,
      title: title,
      date: date,
      notes: record['notes']?.toString(),
      clinic: clinic.isEmpty ? null : clinic,
      weight: null,
    );
  }

  /// 转换其他健康记录
  models.HealthRecord _convertOtherHealthRecordToModel(
    Map<String, dynamic> record,
    String petId,
  ) {
    final title = (record['other_type'] ?? record['record_type'] ?? '')
        .toString();
    final notes = record.containsKey('details')
        ? _stringifyDetails(record['details'])
        : (record['notes']?.toString());
    return models.HealthRecord(
      id: record['id'].toString(),
      petId: petId,
      type: models.HealthRecordType.medication,
      title: title,
      date: _parseDate(record['record_date']),
      notes: (notes != null && notes.isNotEmpty) ? notes : null,
      clinic: record['clinic']?.toString(),
      weight: null,
    );
  }

  /// 通用方法：根据记录类型创建记录
  Future<models.HealthRecord> createRecord(models.HealthRecord record) async {
    switch (record.type) {
      case models.HealthRecordType.vaccination:
        return await createVaccinationRecord(record);
      default:
        throw Exception('不支持的记录类型: ${record.type}');
    }
  }

  /// 通用方法：根据记录类型获取记录列表
  Future<List<models.HealthRecord>> getRecords(
    String petId,
    models.HealthRecordType type, {
    int skip = 0,
    int size = 10,
  }) async {
    switch (type) {
      case models.HealthRecordType.vaccination:
        return await getVaccinationRecords(petId, skip: skip, size: size);
      default:
        throw Exception('不支持的记录类型: $type');
    }
  }

  /// 通用方法：根据记录类型更新记录
  Future<models.HealthRecord> updateRecord(models.HealthRecord record) async {
    switch (record.type) {
      case models.HealthRecordType.vaccination:
        return await updateVaccinationRecord(record);
      default:
        throw Exception('不支持的记录类型: ${record.type}');
    }
  }

  /// 通用方法：根据记录类型删除记录
  Future<void> deleteRecord(
    String recordId,
    models.HealthRecordType type,
  ) async {
    switch (type) {
      case models.HealthRecordType.vaccination:
        await deleteVaccinationRecord(recordId);
        break;
      default:
        throw Exception('不支持的记录类型: $type');
    }
  }
}
