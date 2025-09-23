import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import '../core/models.dart' as models;
import 'database_service.dart';
import 'user_auth_service.dart';
import 'package:lingdong_server/lingdong_server.dart' as server;
import 'dart:async'; // Added for Completer
import '../core/api_config.dart';

class PetService {
  static final PetService _instance = PetService._internal();
  factory PetService() => _instance;
  PetService._internal();

  final DatabaseService _databaseService = DatabaseService();
  final UserAuthService _authService = UserAuthService();
  Dio? _dio;
  server.PetProfileApi? _petApi;

  /// 初始化API客户端
  void _initializeApiClient() {
    if (_dio != null && _petApi != null) return;

    _dio = Dio(
      BaseOptions(
        baseUrl: ApiConfig.baseUrl,
        connectTimeout: ApiConfig.connectTimeout,
        receiveTimeout: ApiConfig.receiveTimeout,
        sendTimeout: ApiConfig.sendTimeout,
      ),
    );

    // 设置认证头 - 从UserAuthService获取Token
    _updateAuthToken();

    _petApi = server.PetProfileApi(_dio!, server.standardSerializers);
  }

  /// 更新认证Token
  void _updateAuthToken() {
    if (_dio == null) return;

    // 从UserAuthService获取当前Token
    final currentUser = _authService.currentUser;
    if (currentUser != null) {
      // 这里需要从UserAuthService获取实际的access token
      // 暂时使用一个占位符，实际应该从认证服务获取
      final token = _getAuthToken();
      if (token.isNotEmpty) {
        _dio!.options.headers['Authorization'] = 'Bearer $token';
        debugPrint('PetService认证头已设置: Bearer ${token.substring(0, 20)}...');
      } else {
        debugPrint('PetService: 无法获取认证Token');
      }
    } else {
      debugPrint('PetService: 当前用户未登录');
    }
  }

  /// 获取认证Token
  String _getAuthToken() {
    try {
      // 从UserAuthService获取实际的access token
      final token = _authService.getAccessToken();
      if (token != null && token.isNotEmpty) {
        debugPrint('PetService: 成功获取认证Token: ${token.substring(0, 20)}...');
        return token;
      } else {
        debugPrint('PetService: 认证Token为空或未设置');
        return "";
      }
    } catch (e) {
      debugPrint('获取认证Token失败: $e');
      return "";
    }
  }

  /// 设置认证Token（公共方法）
  void setAuthToken(String token) {
    if (_dio != null) {
      _dio!.options.headers['Authorization'] = 'Bearer $token';
      debugPrint('PetService认证Token已设置: Bearer ${token.substring(0, 20)}...');
    } else {
      debugPrint('PetService: Dio未初始化，无法设置Token');
    }
  }

  /// 刷新认证Token
  void _refreshAuthToken() {
    if (_dio == null) return;

    final token = _getAuthToken();
    if (token.isNotEmpty) {
      _dio!.options.headers['Authorization'] = 'Bearer $token';
      debugPrint('PetService认证Token已刷新: Bearer ${token.substring(0, 20)}...');
    } else {
      debugPrint('PetService: 无法刷新认证Token，用户可能未登录');
    }
  }

  /// 检查并更新认证Token
  void _ensureValidAuthToken() {
    if (_dio == null) return;

    // 检查当前Token是否有效
    final currentToken = _dio!.options.headers['Authorization'] as String?;
    if (currentToken == null || !currentToken.startsWith('Bearer ')) {
      debugPrint('PetService: 当前Token无效，尝试刷新...');
      _refreshAuthToken();
    }
  }

  /// 获取用户的所有宠物
  Future<List<models.Pet>> getUserPets(String userId) async {
    try {
      // 优先从后端API获取
      return await _getPetsFromApi();
    } catch (e) {
      debugPrint('从API获取宠物列表失败，使用本地数据: $e');
      // 如果API失败，回退到本地数据库
      return await _getPetsFromLocal(userId);
    }
  }

  /// 从后端API获取宠物列表
  Future<List<models.Pet>> _getPetsFromApi() async {
    _initializeApiClient();
    _ensureValidAuthToken(); // 在API调用前检查Token

    try {
      final response = await _petApi!.readPetsApiPetProfileGet();
      final code = response.data?.code ?? response.statusCode ?? 500;

      if (code != 200) {
        throw Exception('获取宠物列表失败($code): ${response.data?.msg}');
      }

      final petListResponse = response.data?.data;
      if (petListResponse == null ||
          petListResponse.pets == null ||
          petListResponse.pets!.isEmpty) {
        debugPrint('API返回的宠物列表为空');
        return [];
      }

      debugPrint('从API获取到 ${petListResponse.pets!.length} 个宠物');

      // 转换后端数据模型到前端模型
      return petListResponse.pets!
          .map((petResponse) => _convertPetResponseToModel(petResponse))
          .toList();
    } on DioException catch (e) {
      debugPrint('API请求失败: ${e.message}');
      throw Exception('网络请求失败: ${e.message}');
    } catch (e) {
      debugPrint('API数据处理失败: $e');
      throw Exception('数据处理失败: $e');
    }
  }

  /// 从本地数据库获取宠物列表
  Future<List<models.Pet>> _getPetsFromLocal(String userId) async {
    try {
      final db = await _databaseService.database;
      final List<Map<String, dynamic>> maps = await db.query(
        'pets',
        where: 'user_id = ?',
        whereArgs: [userId],
        orderBy: 'created_time DESC',
      );

      return List.generate(maps.length, (i) {
        return _mapToPet(maps[i]);
      });
    } catch (e) {
      throw Exception('获取本地宠物列表失败: $e');
    }
  }

  /// 转换后端PetResponse到前端Pet模型
  models.Pet _convertPetResponseToModel(server.PetResponse petResponse) {
    return models.Pet(
      id: petResponse.id.toString(),
      name: petResponse.name ?? '未命名',
      type: petResponse.species ?? '未知',
      breed: petResponse.breed ?? '未知',
      avatar:
          (petResponse.avatar != null && petResponse.avatar!.trim().isNotEmpty)
          ? petResponse.avatar!.trim()
          : _getPetAvatar(petResponse.species ?? ''),
      color: _getPetColor(petResponse.species ?? ''),
      birthDate: petResponse.birthday?.toDateTime() ?? DateTime.now(),
      weight: (petResponse.weight ?? 0.0).toDouble(),
      gender: petResponse.gender ?? '雄',
      identityCode: petResponse.chipId ?? 'PET${petResponse.id}',
    );
  }

  /// 根据宠物类型获取头像
  String _getPetAvatar(String species) {
    switch (species.toLowerCase()) {
      case 'dog':
      case '狗狗':
      case '狗':
        return '🐕';
      case 'cat':
      case '猫咪':
      case '猫':
        return '🐱';
      case 'bird':
      case '鸟类':
      case '鸟':
        return '🐦';
      case 'fish':
      case '鱼类':
      case '鱼':
        return '🐠';
      case 'rabbit':
      case '兔子':
        return '🐰';
      case 'hamster':
      case '仓鼠':
        return '🐹';
      default:
        return '🐾';
    }
  }

  /// 根据宠物类型获取颜色
  Color _getPetColor(String species) {
    switch (species.toLowerCase()) {
      case 'dog':
      case '狗狗':
      case '狗':
        return Colors.orange;
      case 'cat':
      case '猫咪':
      case '猫':
        return Colors.blue;
      case 'bird':
      case '鸟类':
      case '鸟':
        return Colors.green;
      case 'fish':
      case '鱼类':
      case '鱼':
        return Colors.cyan;
      case 'rabbit':
      case '兔子':
        return Colors.pink;
      case 'hamster':
      case '仓鼠':
        return Colors.brown;
      default:
        return Colors.grey;
    }
  }

  /// 根据ID获取宠物
  Future<models.Pet?> getPetById(String petId) async {
    try {
      final db = await _databaseService.database;
      final List<Map<String, dynamic>> maps = await db.query(
        'pets',
        where: 'id = ?',
        whereArgs: [petId],
        limit: 1,
      );

      if (maps.isNotEmpty) {
        return _mapToPet(maps.first);
      }
      return null;
    } catch (e) {
      throw Exception('获取宠物信息失败: $e');
    }
  }

  /// 保存宠物信息（新增或更新）
  Future<models.Pet> savePet(models.Pet pet) async {
    try {
      final db = await _databaseService.database;

      // 检查是否已存在
      final existingPet = await getPetById(pet.id);

      if (existingPet != null) {
        // 更新现有宠物
        await db.update(
          'pets',
          _petToMap(pet),
          where: 'id = ?',
          whereArgs: [pet.id],
        );
      } else {
        // 新增宠物
        await db.insert('pets', _petToMap(pet));
      }

      return pet;
    } catch (e) {
      throw Exception('保存宠物信息失败: $e');
    }
  }

  /// 删除宠物
  Future<void> deletePet(String petId) async {
    try {
      final db = await _databaseService.database;
      await db.delete('pets', where: 'id = ?', whereArgs: [petId]);
    } catch (e) {
      throw Exception('删除宠物失败: $e');
    }
  }

  /// 获取宠物的健康记录数量
  Future<Map<String, int>> getPetRecordCounts(String petId) async {
    try {
      // 优先从API获取
      return await _getRecordCountsFromApi(int.parse(petId));
    } catch (e) {
      debugPrint('从API获取记录数量失败，使用本地数据: $e');
      // 如果API失败，回退到本地数据库
      return await _getRecordCountsFromLocal(petId);
    }
  }

  /// 从API获取宠物健康记录数量（优化版本 - 按需请求）
  Future<Map<String, int>> _getRecordCountsFromApi(int petId) async {
    _initializeApiClient();
    _ensureValidAuthToken(); // 在API调用前检查Token

    try {
      final Map<String, int> counts = {};

      // 使用缓存机制，避免重复请求
      final String cacheKey = 'record_counts_$petId';
      final cachedCounts = _getCachedRecordCounts(cacheKey);
      if (cachedCounts.isNotEmpty) {
        debugPrint('使用缓存的记录数量: $cachedCounts');
        return cachedCounts;
      }

      // 只请求用户当前需要的记录类型数量
      // 默认只获取疫苗接种和驱虫记录数量（最常用的）
      final priorityTypes = ['vaccination', 'deworming'];

      for (final type in priorityTypes) {
        try {
          final count = await _getRecordCountByType(petId, type);
          counts[type] = count;
        } catch (e) {
          debugPrint('获取$type记录数量失败: $e');
          counts[type] = 0;
        }
      }

      // 缓存结果
      _cacheRecordCounts(cacheKey, counts);

      debugPrint('从API获取到记录数量: $counts');
      return counts;
    } catch (e) {
      debugPrint('获取记录数量失败: $e');
      throw Exception('获取记录数量失败: $e');
    }
  }

  /// 根据类型获取记录数量（按需请求）
  Future<int> _getRecordCountByType(int petId, String type) async {
    try {
      switch (type) {
        case 'vaccination':
          final response = await _petApi!
              .getVaccinationRecordsByPetApiPetGetVaccinationRecordsByPetPetIdGet(
                petId: petId,
                skip: 0,
                size: 1,
              );
          if (response.data?.code == 200) {
            final data = response.data?.data;
            return data?.total ?? 0;
          }
          break;

        case 'deworming':
          final response = await _petApi!
              .getDewormingRecordsByPetApiPetGetDewormingRecordsByPetPetIdGet(
                petId: petId,
                skip: 0,
                size: 1,
              );
          if (response.data?.code == 200) {
            final data = response.data?.data;
            return data?.total ?? 0;
          }
          break;

        case 'vetVisit':
          final response = await _petApi!
              .getExaminationRecordsByPetApiPetGetExaminationRecordsByPetPetIdGet(
                petId: petId,
                skip: 0,
                size: 1,
              );
          if (response.data?.code == 200) {
            final data = response.data?.data;
            return data?.total ?? 0;
          }
          break;

        case 'weight':
          final response = await _petApi!
              .getWeightRecordsByPetApiPetGetWeightRecordsByPetPetIdGet(
                petId: petId,
                skip: 0,
                size: 1,
              );
          if (response.data?.code == 200) {
            final data = response.data?.data;
            return data?.total ?? 0;
          }
          break;

        case 'grooming':
          final response = await _petApi!
              .getGroomingRecordsByPetApiPetGetGroomingRecordsByPetPetIdGet(
                petId: petId,
                skip: 0,
                size: 1,
              );
          if (response.data?.code == 200) {
            final data = response.data?.data;
            return data?.total ?? 0;
          }
          break;
      }
      return 0;
    } catch (e) {
      debugPrint('获取$type记录数量失败: $e');
      return 0;
    }
  }

  /// 获取完整的记录数量（当用户需要查看所有类型时调用）
  Future<Map<String, int>> getFullRecordCounts(String petId) async {
    try {
      final Map<String, int> counts = {};
      final allTypes = [
        'vaccination',
        'deworming',
        'vetVisit',
        'weight',
        'grooming',
      ];

      // 并行请求所有类型的记录数量，但限制并发数
      final semaphore = _Semaphore(3); // 最多3个并发请求
      final futures = allTypes.map((type) async {
        await semaphore.acquire();
        try {
          final count = await _getRecordCountByType(int.parse(petId), type);
          return MapEntry(type, count);
        } finally {
          semaphore.release();
        }
      });

      final results = await Future.wait(futures);
      for (final entry in results) {
        counts[entry.key] = entry.value;
      }

      // 缓存完整结果
      final String cacheKey = 'full_record_counts_$petId';
      _cacheRecordCounts(cacheKey, counts);

      return counts;
    } catch (e) {
      debugPrint('获取完整记录数量失败: $e');
      return {};
    }
  }

  // 简单的内存缓存
  static final Map<String, Map<String, int>> _recordCountsCache = {};
  static final Map<String, DateTime> _cacheTimestamps = {};
  static const Duration _cacheExpiry = Duration(minutes: 5); // 5分钟缓存过期

  /// 获取缓存的记录数量
  Map<String, int> _getCachedRecordCounts(String cacheKey) {
    final timestamp = _cacheTimestamps[cacheKey];
    if (timestamp != null &&
        DateTime.now().difference(timestamp) < _cacheExpiry) {
      return _recordCountsCache[cacheKey] ?? {};
    }
    return {};
  }

  /// 缓存记录数量
  void _cacheRecordCounts(String cacheKey, Map<String, int> counts) {
    _recordCountsCache[cacheKey] = counts;
    _cacheTimestamps[cacheKey] = DateTime.now();
  }

  /// 清除缓存
  void clearRecordCountsCache() {
    _recordCountsCache.clear();
    _cacheTimestamps.clear();
    debugPrint('记录数量缓存已清除');
  }

  /// 从本地数据库获取宠物健康记录数量
  Future<Map<String, int>> _getRecordCountsFromLocal(String petId) async {
    try {
      final db = await _databaseService.database;
      final List<Map<String, dynamic>> maps = await db.rawQuery(
        '''
        SELECT type, COUNT(*) as count
        FROM health_records
        WHERE pet_id = ?
        GROUP BY type
      ''',
        [petId],
      );

      final Map<String, int> counts = {};
      for (final map in maps) {
        final type = map['type'] as String;
        final count = map['count'] as int;
        counts[type] = count;
      }

      return counts;
    } catch (e) {
      throw Exception('获取本地记录数量失败: $e');
    }
  }

  /// 生成唯一的宠物ID
  String generatePetId() {
    final timestamp = DateTime.now().millisecondsSinceEpoch;
    final random = (timestamp % 10000).toString().padLeft(4, '0');
    return 'PET$timestamp$random';
  }

  /// 生成身份码
  String generateIdentityCode() {
    final timestamp = DateTime.now().millisecondsSinceEpoch;
    final random = (timestamp % 100000).toString().padLeft(5, '0');
    return 'LD-PET-$random';
  }

  /// 将数据库记录转换为Pet对象
  models.Pet _mapToPet(Map<String, dynamic> map) {
    return models.Pet(
      id: map['id'] as String,
      name: map['name'] as String,
      type: map['type'] as String,
      breed: map['breed'] as String? ?? '',
      avatar: map['avatar'] as String? ?? '🐕',
      identityCode: map['identity_code'] as String? ?? generateIdentityCode(),
      color: _parseColor(map['color'] as String?),
      birthDate: DateTime.parse(map['birth_date'] as String),
      weight: (map['weight'] as num?)?.toDouble() ?? 0.0,
      gender: map['gender'] as String? ?? '雄',
    );
  }

  /// 将Pet对象转换为数据库记录
  Map<String, dynamic> _petToMap(models.Pet pet) {
    return {
      'id': pet.id,
      'user_id': 'current_user', // TODO: 从用户服务获取当前用户ID
      'name': pet.name,
      'type': pet.type,
      'breed': pet.breed,
      'avatar': pet.avatar,
      'identity_code': pet.identityCode,
      'color': _colorToString(pet.color),
      'birth_date': pet.birthDate.toIso8601String(),
      'weight': pet.weight,
      'gender': pet.gender,
      'created_time': DateTime.now().toIso8601String(),
      'updated_time': DateTime.now().toIso8601String(),
    };
  }

  /// 解析颜色字符串为Color对象
  Color _parseColor(String? colorString) {
    if (colorString == null) return const Color(0xFF2196F3);

    try {
      // 移除 'Color(' 和 ')' 并解析
      final colorValue = int.parse(
        colorString.replaceAll(RegExp(r'[^\d]'), ''),
      );
      return Color(colorValue);
    } catch (e) {
      return const Color(0xFF2196F3); // 默认蓝色
    }
  }

  /// 将Color对象转换为字符串
  String _colorToString(Color color) {
    return color.value.toString();
  }

  /// 获取宠物类型的所有头像选项
  Map<String, List<String>> getTypeAvatars() {
    return {
      '狗狗': ['🐕', '🐶', '🦮', '🐕‍🦺'],
      '猫咪': ['🐱', '🐈', '🐈‍⬛', '😺'],
      '兔子': ['🐰', '🐇', '🐰', '🐰'],
      '仓鼠': ['🐹', '🐹', '🐹', '🐹'],
      '鸟类': ['🦜', '🦅', '🦆', '🦉'],
      '鱼类': ['🐠', '🐟', '🐡', '🦈'],
      '其他': ['🐾', '🦊', '🐻', '🐼'],
    };
  }

  /// 获取颜色选项
  List<Color> getColorOptions() {
    return [
      const Color(0xFF2196F3), // 蓝色
      const Color(0xFF4ECDC4), // 青色
      const Color(0xFFFF9800), // 橙色
      const Color(0xFFF44336), // 红色
      const Color(0xFF4CAF50), // 绿色
      const Color(0xFF9C27B0), // 紫色
      const Color(0xFFE91E63), // 粉色
      const Color(0xFF3F51B5), // 靛蓝
      const Color(0xFF009688), // 蓝绿
      const Color(0xFFFF5722), // 深橙
      const Color(0xFF795548), // 棕色
      const Color(0xFF607D8B), // 蓝灰
    ];
  }

  /// 测试宠物API功能
  Future<void> testPetApi() async {
    try {
      debugPrint('开始测试宠物API功能...');

      // 测试获取宠物列表
      final pets = await _getPetsFromApi();
      debugPrint('获取宠物列表成功: ${pets.length} 个宠物');

      for (final pet in pets) {
        debugPrint('宠物: ${pet.name} (${pet.type})');

        // 测试获取记录数量
        try {
          final counts = await _getRecordCountsFromApi(int.parse(pet.id));
          debugPrint('  - 记录数量: $counts');
        } catch (e) {
          debugPrint('  - 获取记录数量失败: $e');
        }
      }

      debugPrint('宠物API测试完成');
    } catch (e) {
      debugPrint('宠物API测试失败: $e');
      rethrow;
    }
  }

  /// 刷新宠物数据
  Future<List<models.Pet>> refreshPets(String userId) async {
    try {
      debugPrint('刷新宠物数据...');
      final pets = await _getPetsFromApi();
      debugPrint('刷新成功，获取到 ${pets.length} 个宠物');
      return pets;
    } catch (e) {
      debugPrint('刷新宠物数据失败: $e');
      throw Exception('刷新宠物数据失败: $e');
    }
  }
}

/// 简单的信号量实现，用于限制并发请求数量
class _Semaphore {
  int _currentCount;
  final List<Completer<void>> _waiters = [];

  _Semaphore(int maxCount) : _currentCount = maxCount;

  Future<void> acquire() async {
    if (_currentCount > 0) {
      _currentCount--;
      return;
    }

    final completer = Completer<void>();
    _waiters.add(completer);
    await completer.future;
  }

  void release() {
    if (_waiters.isNotEmpty) {
      final completer = _waiters.removeAt(0);
      completer.complete();
    } else {
      _currentCount++;
    }
  }
}
