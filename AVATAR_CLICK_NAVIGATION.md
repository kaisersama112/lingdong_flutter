# 用户信息点击跳转个人详情页面功能

## 🎯 功能概述

为评论和回复中的用户头像、用户名以及回复目标用户名添加点击跳转功能，用户可以点击任意用户信息查看该用户的个人详情页面。

## 🔧 技术实现

### 1. **路由配置**
- 使用现有的 `AppRouter.userProfileRoute` 路由
- 传递 `UserProfileArgs` 参数包含用户信息

### 2. **用户信息点击事件**

#### 头像点击
```dart
GestureDetector(
  onTap: () => _navigateToUserProfile(userId, username, avatarUrl),
  child: Container(
    decoration: BoxDecoration(
      shape: BoxShape.circle,
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.1),
          blurRadius: 2,
          offset: const Offset(0, 1),
        ),
      ],
    ),
    child: OptimizedAvatar(...),
  ),
)
```

#### 用户名点击
```dart
GestureDetector(
  onTap: () => _navigateToUserProfile(userId, username, avatarUrl),
  child: Text(
    username,
    style: TextStyle(
      color: Color(0xFF1976D2), // 蓝色表示可点击
      fontWeight: FontWeight.w600,
    ),
  ),
)
```

#### 回复目标用户名点击
```dart
GestureDetector(
  onTap: () => _navigateToUserProfile(replyToUserId, replyToUsername, null),
  child: Container(
    decoration: BoxDecoration(
      color: Color(0xFFEFF6FF),
      borderRadius: BorderRadius.circular(3),
    ),
    child: Text('回复 $replyToUsername'),
  ),
)
```

### 3. **导航方法**
```dart
void _navigateToUserProfile(String userId, String username, String? avatarUrl) {
  Navigator.of(context).pushNamed(
    AppRouter.userProfileRoute,
    arguments: UserProfileArgs(
      userId: userId,
      displayName: username,
      avatarUrl: avatarUrl,
    ),
  );
}
```

## 🎨 视觉优化

### 1. **头像阴影效果**
- **评论头像**: 较明显的阴影效果 (opacity: 0.1, blur: 2)
- **回复头像**: 较轻微的阴影效果 (opacity: 0.08, blur: 1)
- 营造可点击的视觉提示

### 2. **交互反馈**
- 使用 `GestureDetector` 提供点击响应
- 阴影效果增强可点击感知
- 保持原有的头像样式和尺寸

## 📱 用户体验

### 1. **数据传递**
- **用户ID**: 用于识别用户
- **用户名**: 显示名称
- **头像URL**: 用户头像图片

### 2. **页面跳转**
- 平滑的页面过渡动画
- 保持用户上下文
- 支持返回操作

### 3. **一致性**
- 评论和回复头像都支持点击
- 统一的视觉风格
- 一致的交互行为

## 🔄 功能覆盖

### 1. **评论区域**
- **头像**: 36px 尺寸，明显阴影，可点击
- **用户名**: 蓝色文字，可点击
- 数据: `c.userId`, `c.username`, `c.userAvatar`

### 2. **回复区域**
- **头像**: 24px 尺寸，轻微阴影，可点击
- **用户名**: 蓝色文字，可点击
- **回复目标用户名**: 蓝色标签，可点击
- 数据: `reply.userId`, `reply.username`, `reply.userAvatar`, `reply.replyToUserId`, `reply.replyToUsername`

## 🎯 设计原则

### 1. **直观性**
- 蓝色文字表示可点击
- 阴影效果增强视觉提示
- 清晰的视觉层次

### 2. **一致性**
- 统一的点击行为
- 相同的数据传递方式
- 一致的视觉反馈
- 所有用户信息都可点击

### 3. **性能**
- 轻量级的点击事件
- 高效的路由导航
- 最小化的视觉开销

## ✨ 特色功能

1. **全面覆盖**: 头像、用户名、回复目标用户名都可点击
2. **智能数据传递**: 自动传递用户ID、用户名和头像
3. **视觉提示**: 蓝色文字和阴影效果增强可点击感知
4. **无缝集成**: 与现有UI完美融合
5. **响应式设计**: 适配不同尺寸的用户信息

现在用户可以通过点击任意评论或回复中的用户信息（头像、用户名、回复目标用户名），快速跳转到该用户的个人详情页面，大大提升了社交互动体验！
