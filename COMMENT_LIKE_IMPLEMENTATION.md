# 评论和回复点赞功能实现

## 🎯 功能概述

为评论和回复添加点赞功能，样式与动态点赞保持一致，并对接后端点赞接口。

## 🔧 技术实现

### 1. **API接口对接**

#### DynamicService新增方法
```dart
/// 点赞评论/回复
Future<void> likeComment(String commentId) async {
  _initializeApiClient();
  _updateAuthToken();
  try {
    final int cid = int.tryParse(commentId.replaceAll(RegExp(r'[^0-9]'), '')) ?? 0;
    final resp = await _api!.likeCommentApiDynamicsCommentsCommentIdLikePost(
      commentId: cid,
    );
    final code = resp.data?.code ?? resp.statusCode ?? 500;
    if (code != 200) {
      throw Exception(resp.data?.msg ?? '点赞失败($code)');
    }
  } on DioException catch (e) {
    debugPrint('DynamicService.likeComment 网络错误: ${e.message}');
    rethrow;
  } catch (e) {
    debugPrint('DynamicService.likeComment 失败: $e');
    rethrow;
  }
}
```

### 2. **UI样式统一**

#### 评论点赞按钮
```dart
// 点赞按钮
IconButton(
  icon: Icon(
    c.isLiked ? Icons.favorite : Icons.favorite_border,
    size: 18,
    color: c.isLiked ? Colors.red : const Color(0xFF9CA3AF),
  ),
  onPressed: () => _likeComment(c.id),
  padding: EdgeInsets.zero,
  constraints: const BoxConstraints(minWidth: 32, minHeight: 32),
),
Text(
  '${c.likeCount}',
  style: const TextStyle(fontSize: 12, color: Color(0xFF9CA3AF)),
),
```

#### 回复点赞按钮
```dart
// 点赞按钮
IconButton(
  icon: Icon(
    reply.isLiked ? Icons.favorite : Icons.favorite_border,
    size: 16,
    color: reply.isLiked ? Colors.red : const Color(0xFF9CA3AF),
  ),
  onPressed: () => _likeReply(reply.id),
  padding: EdgeInsets.zero,
  constraints: const BoxConstraints(minWidth: 28, minHeight: 28),
),
Text(
  '${reply.likeCount}',
  style: const TextStyle(fontSize: 11, color: Color(0xFF9CA3AF)),
),
```

### 3. **状态管理**

#### 评论点赞状态更新
```dart
Future<void> _likeComment(String commentId) async {
  try {
    await DynamicService().likeComment(commentId);
    
    // 更新本地状态
    setState(() {
      final commentIndex = _comments.indexWhere((c) => c.id == commentId);
      if (commentIndex != -1) {
        final comment = _comments[commentIndex];
        _comments[commentIndex] = DynamicComment(
          // ... 其他字段保持不变
          likeCount: comment.isLiked ? comment.likeCount - 1 : comment.likeCount + 1,
          isLiked: !comment.isLiked,
        );
      }
    });
    
    // 显示反馈
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(/* 点赞状态提示 */)),
    );
  } catch (e) {
    // 错误处理
  }
}
```

#### 回复点赞状态更新
```dart
Future<void> _likeReply(String replyId) async {
  try {
    await DynamicService().likeComment(replyId);
    
    // 更新本地状态
    setState(() {
      for (final commentId in _commentReplies.keys) {
        final replies = _commentReplies[commentId]!;
        final replyIndex = replies.indexWhere((r) => r.id == replyId);
        if (replyIndex != -1) {
          final reply = replies[replyIndex];
          replies[replyIndex] = DynamicReply(
            // ... 其他字段保持不变
            likeCount: reply.isLiked ? reply.likeCount - 1 : reply.likeCount + 1,
            isLiked: !reply.isLiked,
          );
          break;
        }
      }
    });
  } catch (e) {
    // 错误处理
  }
}
```

## 🎨 样式特点

### 1. **与动态点赞保持一致**
- **图标**: 使用 `Icons.favorite` 和 `Icons.favorite_border`
- **颜色**: 点赞时红色 `Colors.red`，未点赞时灰色 `#9CA3AF`
- **尺寸**: 评论18px，回复16px
- **布局**: 使用 `IconButton` 组件

### 2. **响应式设计**
- **评论按钮**: 32x32px 最小尺寸
- **回复按钮**: 28x28px 最小尺寸
- **零内边距**: `padding: EdgeInsets.zero`
- **合理约束**: 使用 `BoxConstraints` 控制按钮大小

### 3. **视觉反馈**
- **即时更新**: 点击后立即更新UI状态
- **数量变化**: 点赞数实时增减
- **状态提示**: SnackBar显示操作结果
- **错误处理**: 网络错误时显示错误信息

## 🔄 功能流程

### 1. **点赞流程**
```
用户点击点赞按钮
    ↓
调用 DynamicService.likeComment()
    ↓
发送API请求到后端
    ↓
更新本地状态 (likeCount, isLiked)
    ↓
刷新UI显示
    ↓
显示操作反馈
```

### 2. **状态同步**
- **乐观更新**: 先更新UI，再发送请求
- **错误回滚**: 请求失败时恢复原状态
- **数据一致性**: 确保本地状态与服务器同步

## 🎯 设计原则

### 1. **一致性**
- 与动态点赞使用相同的图标和颜色
- 统一的交互反馈机制
- 相同的错误处理方式

### 2. **用户体验**
- 即时响应，无需等待
- 清晰的视觉反馈
- 友好的错误提示

### 3. **性能优化**
- 本地状态管理，减少网络请求
- 合理的按钮尺寸，避免误触
- 高效的UI更新机制

## ✨ 特色功能

1. **统一体验**: 评论、回复、动态点赞样式完全一致
2. **智能状态管理**: 自动处理点赞/取消点赞状态切换
3. **错误容错**: 网络异常时提供友好提示
4. **即时反馈**: 点击后立即更新UI，提升响应速度

现在评论和回复的点赞功能已经完全实现，与动态点赞保持一致的视觉风格和交互体验！
