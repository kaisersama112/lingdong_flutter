import 'dart:async';
import 'dart:convert';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import '../model/user.dart';

/// 数据库服务
class DatabaseService {
  static final DatabaseService _instance = DatabaseService._internal();
  factory DatabaseService() => _instance;
  DatabaseService._internal();

  static Database? _database;

  /// 获取数据库实例
  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  /// 初始化数据库
  Future<Database> _initDatabase() async {
    final databasesPath = await getDatabasesPath();
    final path = join(databasesPath, 'lingdong_pet.db');

    return await openDatabase(
      path,
      version: 2,
      onCreate: _onCreate,
      onUpgrade: _onUpgrade,
    );
  }

  /// 创建数据库表
  Future<void> _onCreate(Database db, int version) async {
    // 用户表
    await db.execute('''
      CREATE TABLE users (
        id TEXT PRIMARY KEY,
        phone TEXT UNIQUE,
        email TEXT,
        username TEXT NOT NULL,
        avatar TEXT,
        register_time DATETIME NOT NULL,
        last_login_time DATETIME NOT NULL,
        status TEXT NOT NULL,
        role TEXT NOT NULL,
        privacy_settings TEXT,
        preferences TEXT
      )
    ''');

    // 密码表
    await db.execute('''
      CREATE TABLE passwords (
        user_id TEXT PRIMARY KEY,
        password TEXT NOT NULL,
        FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE
      )
    ''');

    // 宠物表
    await db.execute('''
      CREATE TABLE pets (
        id TEXT PRIMARY KEY,
        user_id TEXT NOT NULL,
        name TEXT NOT NULL,
        type TEXT NOT NULL,
        breed TEXT,
        birth_date DATE,
        gender TEXT,
        weight REAL,
        color TEXT,
        avatar TEXT,
        health_record TEXT,
        created_time DATETIME NOT NULL,
        updated_time DATETIME NOT NULL,
        FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE
      )
    ''');

    // 宠物事件表
    await db.execute('''
      CREATE TABLE pet_events (
        id TEXT PRIMARY KEY,
        pet_id TEXT NOT NULL,
        type TEXT NOT NULL,
        title TEXT NOT NULL,
        description TEXT,
        event_date DATETIME NOT NULL,
        created_time DATETIME NOT NULL,
        FOREIGN KEY (pet_id) REFERENCES pets(id) ON DELETE CASCADE
      )
    ''');

    // 当前登录用户表
    await db.execute('''
      CREATE TABLE current_user (
        id INTEGER PRIMARY KEY,
        user_id TEXT NOT NULL,
        login_time DATETIME NOT NULL,
        FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE
      )
    ''');

    // 帖子统计表
    await db.execute('''
      CREATE TABLE IF NOT EXISTS post_stats (
        post_id TEXT PRIMARY KEY,
        likes INTEGER NOT NULL DEFAULT 0,
        favorites INTEGER NOT NULL DEFAULT 0,
        comments INTEGER NOT NULL DEFAULT 0,
        shares INTEGER NOT NULL DEFAULT 0
      )
    ''');

    // 点赞表
    await db.execute('''
      CREATE TABLE IF NOT EXISTS post_likes (
        post_id TEXT NOT NULL,
        user_id TEXT NOT NULL,
        PRIMARY KEY (post_id, user_id),
        FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE
      )
    ''');

    // 收藏表
    await db.execute('''
      CREATE TABLE IF NOT EXISTS post_favorites (
        post_id TEXT NOT NULL,
        user_id TEXT NOT NULL,
        PRIMARY KEY (post_id, user_id),
        FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE
      )
    ''');

    // 评论表
    await db.execute('''
      CREATE TABLE IF NOT EXISTS post_comments (
        id TEXT PRIMARY KEY,
        post_id TEXT NOT NULL,
        user_id TEXT NOT NULL,
        content TEXT NOT NULL,
        created_at DATETIME NOT NULL,
        FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE
      )
    ''');
  }

  /// 数据库升级
  Future<void> _onUpgrade(Database db, int oldVersion, int newVersion) async {
    // 版本升级：添加互动相关表
    if (oldVersion < 2) {
      await db.execute('''
        CREATE TABLE IF NOT EXISTS post_stats (
          post_id TEXT PRIMARY KEY,
          likes INTEGER NOT NULL DEFAULT 0,
          favorites INTEGER NOT NULL DEFAULT 0,
          comments INTEGER NOT NULL DEFAULT 0,
          shares INTEGER NOT NULL DEFAULT 0
        )
      ''');

      await db.execute('''
        CREATE TABLE IF NOT EXISTS post_likes (
          post_id TEXT NOT NULL,
          user_id TEXT NOT NULL,
          PRIMARY KEY (post_id, user_id)
        )
      ''');

      await db.execute('''
        CREATE TABLE IF NOT EXISTS post_favorites (
          post_id TEXT NOT NULL,
          user_id TEXT NOT NULL,
          PRIMARY KEY (post_id, user_id)
        )
      ''');

      await db.execute('''
        CREATE TABLE IF NOT EXISTS post_comments (
          id TEXT PRIMARY KEY,
          post_id TEXT NOT NULL,
          user_id TEXT NOT NULL,
          content TEXT NOT NULL,
          created_at DATETIME NOT NULL
        )
      ''');
    }
  }

  /// 保存用户
  Future<void> saveUser(User user) async {
    final db = await database;
    await db.insert('users', {
      'id': user.userId,
      'phone': user.phone,
      'email': user.email,
      'username': user.username,
      'avatar': user.avatar,
      'register_time': user.registerTime.toIso8601String(),
      'last_login_time': user.lastLoginTime.toIso8601String(),
      'status': user.status.name,
      'role': user.role.name,
      'privacy_settings': json.encode(user.privacySettings.toJson()),
      'preferences': json.encode(user.preferences.toJson()),
    }, conflictAlgorithm: ConflictAlgorithm.replace);
  }

  /// 保存用户密码
  Future<void> savePassword(String userId, String password) async {
    final db = await database;
    await db.insert('passwords', {
      'user_id': userId,
      'password': password,
    }, conflictAlgorithm: ConflictAlgorithm.replace);
  }

  /// 获取用户
  Future<User?> getUser(String userId) async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query(
      'users',
      where: 'id = ?',
      whereArgs: [userId],
    );

    if (maps.isEmpty) return null;

    return _mapToUser(maps.first);
  }

  /// 根据手机号获取用户
  Future<User?> getUserByPhone(String phone) async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query(
      'users',
      where: 'phone = ?',
      whereArgs: [phone],
    );

    if (maps.isEmpty) return null;

    return _mapToUser(maps.first);
  }

  /// 获取用户密码
  Future<String?> getUserPassword(String userId) async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query(
      'passwords',
      where: 'user_id = ?',
      whereArgs: [userId],
    );

    if (maps.isEmpty) return null;

    return maps.first['password'] as String;
  }

  /// 检查手机号是否已注册
  Future<bool> isPhoneRegistered(String phone) async {
    final db = await database;
    final result = await db.query(
      'users',
      where: 'phone = ?',
      whereArgs: [phone],
    );
    return result.isNotEmpty;
  }

  /// 检查邮箱是否已注册
  Future<bool> isEmailRegistered(String email) async {
    final db = await database;
    final result = await db.query(
      'users',
      where: 'email = ?',
      whereArgs: [email],
    );
    return result.isNotEmpty;
  }

  /// 获取当前登录用户
  Future<User?> getCurrentUser() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query(
      'current_user',
      orderBy: 'login_time DESC',
      limit: 1,
    );

    if (maps.isEmpty) return null;

    final userId = maps.first['user_id'] as String;
    return await getUser(userId);
  }

  /// 设置当前登录用户
  Future<void> setCurrentUser(String userId) async {
    final db = await database;

    // 清除旧的当前用户记录
    await db.delete('current_user');

    // 插入新的当前用户记录
    await db.insert('current_user', {
      'user_id': userId,
      'login_time': DateTime.now().toIso8601String(),
    });
  }

  /// 清除当前登录用户
  Future<void> clearCurrentUser() async {
    final db = await database;
    await db.delete('current_user');
  }

  /// 更新用户最后登录时间
  Future<void> updateLastLoginTime(String userId) async {
    final db = await database;
    await db.update(
      'users',
      {'last_login_time': DateTime.now().toIso8601String()},
      where: 'id = ?',
      whereArgs: [userId],
    );
  }

  /// 删除用户
  Future<void> deleteUser(String userId) async {
    final db = await database;
    await db.delete('users', where: 'id = ?', whereArgs: [userId]);
  }

  /// 获取所有用户
  Future<List<User>> getAllUsers() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query('users');
    return maps.map((map) => _mapToUser(map)).toList();
  }

  /// 清除所有数据
  Future<void> clearAllData() async {
    final db = await database;
    await db.delete('current_user');
    await db.delete('passwords');
    await db.delete('pet_events');
    await db.delete('pets');
    await db.delete('users');
  }

  /// 将数据库记录映射为用户对象
  User _mapToUser(Map<String, dynamic> map) {
    final String id = map['id'] as String;
    final String? usernameFromDb = map['username'] as String?;
    final String resolvedUsername =
        usernameFromDb ??
        '用户${id.substring(0, (id.length >= 6 ? 6 : id.length))}';

    return User(
      userId: map['id'] as String,
      phone: map['phone'] as String? ?? '',
      email: map['email'] as String?,
      username: resolvedUsername,
      avatar: map['avatar'] as String?,
      registerTime: DateTime.parse(map['register_time'] as String),
      lastLoginTime: DateTime.parse(map['last_login_time'] as String),
      status: UserStatus.values.firstWhere(
        (e) => e.name == map['status'],
        orElse: () => UserStatus.active,
      ),
      role: UserRole.values.firstWhere(
        (e) => e.name == map['role'],
        orElse: () => UserRole.user,
      ),
      privacySettings: map['privacy_settings'] != null
          ? PrivacySettings.fromJson(
              json.decode(map['privacy_settings'] as String),
            )
          : const PrivacySettings(),
      preferences: map['preferences'] != null
          ? UserPreferences.fromJson(json.decode(map['preferences'] as String))
          : const UserPreferences(),
      petIds: [], // 暂时为空，后续可以从宠物表查询
    );
  }

  /// 关闭数据库
  Future<void> close() async {
    final db = await database;
    await db.close();
    _database = null;
  }
}
