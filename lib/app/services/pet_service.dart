import 'package:flutter/material.dart';
import '../core/models.dart' as models;
import 'database_service.dart';

class PetService {
  static final PetService _instance = PetService._internal();
  factory PetService() => _instance;
  PetService._internal();

  final DatabaseService _databaseService = DatabaseService();

  /// 获取用户的所有宠物
  Future<List<models.Pet>> getUserPets(String userId) async {
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
      throw Exception('获取宠物列表失败: $e');
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
      await db.delete(
        'pets',
        where: 'id = ?',
        whereArgs: [petId],
      );
    } catch (e) {
      throw Exception('删除宠物失败: $e');
    }
  }

  /// 获取宠物的健康记录数量
  Future<Map<String, int>> getPetRecordCounts(String petId) async {
    try {
      final db = await _databaseService.database;
      final List<Map<String, dynamic>> maps = await db.rawQuery('''
        SELECT type, COUNT(*) as count
        FROM health_records
        WHERE pet_id = ?
        GROUP BY type
      ''', [petId]);

      final Map<String, int> counts = {};
      for (final map in maps) {
        counts[map['type'] as String] = map['count'] as int;
      }

      return counts;
    } catch (e) {
      throw Exception('获取记录数量失败: $e');
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
      gender: map['gender'] as String? ?? '公',
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
      final colorValue = int.parse(colorString.replaceAll(RegExp(r'[^\d]'), ''));
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
}
