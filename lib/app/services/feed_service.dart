import 'dart:math';
import 'package:sqflite/sqflite.dart';
import 'database_service.dart';
import '../services/user_auth_service.dart';

class PostStats {
  final int likes;
  final int favorites;
  final int comments;
  final int shares;
  final bool likedByCurrentUser;
  final bool favoritedByCurrentUser;

  const PostStats({
    required this.likes,
    required this.favorites,
    required this.comments,
    required this.shares,
    required this.likedByCurrentUser,
    required this.favoritedByCurrentUser,
  });
}

class FeedService {
  static final FeedService _instance = FeedService._internal();
  factory FeedService() => _instance;
  FeedService._internal();

  final DatabaseService _dbService = DatabaseService();

  // 评论数据结构
  Future<List<FeedComment>> getComments(String postId) async {
    final db = await _dbService.database;
    final rows = await db.query(
      'post_comments',
      where: 'post_id = ?'
      , whereArgs: [postId], orderBy: 'created_at DESC');
    return rows
        .map((r) => FeedComment(
              id: r['id'] as String,
              postId: r['post_id'] as String,
              userId: r['user_id'] as String,
              content: r['content'] as String,
              createdAt: DateTime.parse(r['created_at'] as String),
            ))
        .toList();
  }

  Future<PostStats> getPostStats(String postId) async {
    final db = await _dbService.database;
    final currentUser = UserAuthService().currentUser;
    
    final statsRows = await db.query(
      'post_stats',
      where: 'post_id = ?',
      whereArgs: [postId],
      limit: 1,
    );
    int likes = 0, favorites = 0, comments = 0, shares = 0;
    if (statsRows.isNotEmpty) {
      final row = statsRows.first;
      likes = row['likes'] as int? ?? 0;
      favorites = row['favorites'] as int? ?? 0;
      comments = row['comments'] as int? ?? 0;
      shares = row['shares'] as int? ?? 0;
    }

    bool liked = false;
    bool favorited = false;
    if (currentUser != null) {
      final likeRows = await db.query(
        'post_likes',
        where: 'post_id = ? AND user_id = ?',
        whereArgs: [postId, currentUser.userId],
        limit: 1,
      );
      liked = likeRows.isNotEmpty;

      final favoriteRows = await db.query(
        'post_favorites',
        where: 'post_id = ? AND user_id = ?',
        whereArgs: [postId, currentUser.userId],
        limit: 1,
      );
      favorited = favoriteRows.isNotEmpty;
    }

    return PostStats(
      likes: likes,
      favorites: favorites,
      comments: comments,
      shares: shares,
      likedByCurrentUser: liked,
      favoritedByCurrentUser: favorited,
    );
  }

  Future<PostStats> toggleLike(String postId) async {
    final db = await _dbService.database;
    final currentUser = UserAuthService().currentUser;
    if (currentUser == null) {
      throw Exception('请先登录');
    }

    return await db.transaction<PostStats>((txn) async {
      final existing = await txn.query(
        'post_likes',
        where: 'post_id = ? AND user_id = ?',
        whereArgs: [postId, currentUser.userId],
        limit: 1,
      );
      bool willLike = existing.isEmpty;
      if (willLike) {
        await txn.insert('post_likes', {
          'post_id': postId,
          'user_id': currentUser.userId,
        });
        await _incrementStat(txn, postId, 'likes', 1);
      } else {
        await txn.delete('post_likes', where: 'post_id = ? AND user_id = ?', whereArgs: [postId, currentUser.userId]);
        await _incrementStat(txn, postId, 'likes', -1);
      }
      return await _readStatsAfter(txn, postId, currentUser.userId);
    });
  }

  Future<PostStats> toggleFavorite(String postId) async {
    final db = await _dbService.database;
    final currentUser = UserAuthService().currentUser;
    if (currentUser == null) {
      throw Exception('请先登录');
    }

    return await db.transaction<PostStats>((txn) async {
      final existing = await txn.query(
        'post_favorites',
        where: 'post_id = ? AND user_id = ?',
        whereArgs: [postId, currentUser.userId],
        limit: 1,
      );
      bool willFavorite = existing.isEmpty;
      if (willFavorite) {
        await txn.insert('post_favorites', {
          'post_id': postId,
          'user_id': currentUser.userId,
        });
        await _incrementStat(txn, postId, 'favorites', 1);
      } else {
        await txn.delete('post_favorites', where: 'post_id = ? AND user_id = ?', whereArgs: [postId, currentUser.userId]);
        await _incrementStat(txn, postId, 'favorites', -1);
      }
      return await _readStatsAfter(txn, postId, currentUser.userId);
    });
  }

  Future<PostStats> addComment(String postId, String content) async {
    final db = await _dbService.database;
    final currentUser = UserAuthService().currentUser;
    if (currentUser == null) {
      throw Exception('请先登录');
    }
    final commentId = _genId();
    return await db.transaction<PostStats>((txn) async {
      await txn.insert('post_comments', {
        'id': commentId,
        'post_id': postId,
        'user_id': currentUser.userId,
        'content': content,
        'created_at': DateTime.now().toIso8601String(),
      });
      await _incrementStat(txn, postId, 'comments', 1);
      return await _readStatsAfter(txn, postId, currentUser.userId);
    });
  }

  Future<PostStats> incrementShare(String postId) async {
    final db = await _dbService.database;
    final currentUser = UserAuthService().currentUser;
    final userId = currentUser?.userId ?? '';
    return await db.transaction<PostStats>((txn) async {
      await _incrementStat(txn, postId, 'shares', 1);
      return await _readStatsAfter(txn, postId, userId);
    });
  }

  Future<void> _incrementStat(Transaction txn, String postId, String field, int delta) async {
    // 确保存在一条 post_stats 记录
    await txn.insert('post_stats', {
      'post_id': postId,
      'likes': 0,
      'favorites': 0,
      'comments': 0,
      'shares': 0,
    }, conflictAlgorithm: ConflictAlgorithm.ignore);

    // 更新对应计数
    await txn.rawUpdate('UPDATE post_stats SET $field = MAX(0, $field + ?) WHERE post_id = ?', [delta, postId]);
  }

  Future<PostStats> _readStatsAfter(Transaction txn, String postId, String userId) async {
    final statsRows = await txn.query('post_stats', where: 'post_id = ?', whereArgs: [postId], limit: 1);
    final row = statsRows.isNotEmpty ? statsRows.first : <String, Object?>{};
    final likes = row['likes'] as int? ?? 0;
    final favorites = row['favorites'] as int? ?? 0;
    final comments = row['comments'] as int? ?? 0;
    final shares = row['shares'] as int? ?? 0;

    final liked = (await txn.query('post_likes', where: 'post_id = ? AND user_id = ?', whereArgs: [postId, userId], limit: 1)).isNotEmpty;
    final favorited = (await txn.query('post_favorites', where: 'post_id = ? AND user_id = ?', whereArgs: [postId, userId], limit: 1)).isNotEmpty;

    return PostStats(
      likes: likes,
      favorites: favorites,
      comments: comments,
      shares: shares,
      likedByCurrentUser: liked,
      favoritedByCurrentUser: favorited,
    );
  }

  String _genId() {
    const chars = 'abcdefghijklmnopqrstuvwxyz0123456789';
    final random = Random();
    return String.fromCharCodes(
      Iterable.generate(16, (_) => chars.codeUnitAt(random.nextInt(chars.length))),
    );
  }
}

class FeedComment {
  final String id;
  final String postId;
  final String userId;
  final String content;
  final DateTime createdAt;

  const FeedComment({
    required this.id,
    required this.postId,
    required this.userId,
    required this.content,
    required this.createdAt,
  });
}


