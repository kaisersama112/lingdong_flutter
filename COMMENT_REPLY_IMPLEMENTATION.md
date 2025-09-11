# 评论和回复功能实现说明

## 功能概述

已成功实现三种评论/回复情况：

### 1. 创建顶级评论
- **接口**: `createParentComment`
- **参数**: 
  - `postId`: 动态ID
  - `content`: 评论内容
- **用途**: 用户对动态进行评论

### 2. 对顶级评论的回复
- **接口**: `createReply`
- **参数**:
  - `parentCommentId`: 顶级评论ID
  - `content`: 回复内容
  - `replyToReplyId`: null
- **用途**: 用户直接回复某个评论

### 3. 对回复的回复
- **接口**: `createReply`
- **参数**:
  - `parentCommentId`: 顶级评论ID
  - `content`: 回复内容
  - `replyToReplyId`: 被回复的回复ID
- **用途**: 用户回复某个回复

## 技术实现

### DynamicService 更新

1. **createReply 方法增强**
   ```dart
   Future<void> createReply({
     required String parentCommentId,  // 顶级评论ID（必需）
     required String content,          // 回复内容（必需）
     String? replyToReplyId,          // 可选：被回复的回复ID
   })
   ```

2. **DynamicReply 模型扩展**
   ```dart
   class DynamicReply {
     // ... 其他字段
     final String? parentCommentId;    // 顶级评论ID
     final String? replyToUserId;      // 被回复用户ID
     final String? replyToUsername;    // 被回复用户名
   }
   ```

### UI 交互设计

1. **回复对话框智能显示**
   - 对评论回复：显示 "回复 用户名"
   - 对回复回复：显示 "回复 被回复用户名" 并显示上下文

2. **层次化显示**
   - 顶级评论：正常显示
   - 回复：缩进显示，包含回复目标信息
   - 多级回复：支持无限层级

3. **状态管理**
   - 展开/收起回复列表
   - 加载状态指示
   - 错误处理和用户提示

## API 对接

### 后端接口映射

1. **创建顶级评论**
   ```
   POST /api/dynamics/posts/replies
   Body: ParentCommentCreate
   ```

2. **创建回复**
   ```
   POST /api/dynamics/comments/replies
   Body: ReplyCreate
   ```

3. **获取回复列表**
   ```
   GET /api/dynamics/comments/{parent_comment_id}/replies
   ```

### 数据流

```
动态 → 顶级评论 → 回复 → 回复的回复 → ...
```

每个回复都包含：
- `parent_comment_id`: 指向顶级评论
- `reply_to_reply_id`: 指向被回复的回复（如果是对回复的回复）

## 用户体验

1. **直观的交互**
   - 点击评论的"回复"按钮 → 对评论回复
   - 点击回复的"回复"按钮 → 对回复回复

2. **清晰的上下文**
   - 显示回复目标用户
   - 保持对话的连续性

3. **实时更新**
   - 发送后立即刷新列表
   - 状态同步更新

## 使用示例

```dart
// 1. 创建顶级评论
await DynamicService().createParentComment(
  postId: "123",
  content: "这个动态很有趣！"
);

// 2. 对评论回复
await DynamicService().createReply(
  parentCommentId: "456",
  content: "我也这么觉得！"
);

// 3. 对回复回复
await DynamicService().createReply(
  parentCommentId: "456",
  content: "哈哈，确实！",
  replyToReplyId: "789"
);
```

## 注意事项

1. **数据一致性**: 所有回复都通过 `parent_comment_id` 关联到顶级评论
2. **权限控制**: 需要用户登录才能进行评论和回复
3. **错误处理**: 网络错误和认证错误的友好提示
4. **性能优化**: 按需加载回复列表，避免一次性加载过多数据
