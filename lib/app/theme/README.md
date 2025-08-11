# 应用主题系统

这个目录包含了整个应用的统一主题系统，确保所有页面的UI风格一致和美观。

## 文件结构

- `app_theme.dart` - 主题定义文件，包含颜色、字体、间距、阴影等样式规范
- `app_components.dart` - 通用组件库，提供常用的UI组件
- `README.md` - 本说明文件

## 使用方法

### 1. 导入主题

```dart
import '../theme/app_theme.dart';
import '../theme/app_components.dart';
```

### 2. 使用主题颜色

```dart
// 主色调
AppTheme.primaryColor
AppTheme.secondaryColor

// 状态颜色
AppTheme.successColor
AppTheme.warningColor
AppTheme.errorColor

// 中性色
AppTheme.backgroundColor
AppTheme.surfaceColor
AppTheme.textPrimaryColor
AppTheme.textSecondaryColor
```

### 3. 使用主题样式

```dart
// 字体样式
AppTheme.headingStyle
AppTheme.subheadingStyle
AppTheme.bodyStyle
AppTheme.captionStyle

// 按钮样式
AppTheme.primaryButtonStyle
AppTheme.secondaryButtonStyle

// 输入框样式
AppTheme.searchInputDecoration
```

### 4. 使用通用组件

```dart
// 卡片组件
AppComponents.card(
  child: YourContent(),
  margin: EdgeInsets.all(16),
  borderRadius: 12,
)

// 文本组件
AppComponents.heading(text: '标题')
AppComponents.subheading(text: '副标题')
AppComponents.bodyText(text: '正文内容')
AppComponents.caption(text: '说明文字')

// 标签组件
AppComponents.tag(text: '标签')
AppComponents.statusTag(text: '状态', isActive: true)

// 状态组件
AppComponents.emptyState(
  icon: Icons.inbox,
  title: '暂无数据',
  subtitle: '当有新内容时会在这里显示',
)
```

## 设计规范

### 颜色系统

- **主色调**: 蓝色系 (#2196F3)
- **辅助色**: 橙色系 (#FF9800)
- **成功色**: 绿色系 (#4CAF50)
- **警告色**: 黄色系 (#FFC107)
- **错误色**: 红色系 (#F44336)

### 字体系统

- **标题**: 24px, 粗体
- **副标题**: 18px, 半粗体
- **正文**: 14px, 常规
- **说明**: 12px, 常规

### 间距系统

- **XS**: 4px
- **S**: 8px
- **M**: 16px
- **L**: 24px
- **XL**: 32px

### 圆角系统

- **小**: 8px
- **中**: 12px
- **大**: 16px
- **超大**: 24px

### 阴影系统

- **卡片阴影**: 轻微阴影，用于普通卡片
- **提升阴影**: 中等阴影，用于重要元素
- **微妙阴影**: 很轻的阴影，用于细节

## 最佳实践

1. **始终使用主题系统**: 不要硬编码颜色、字体大小等样式
2. **保持一致性**: 使用相同的组件和样式规范
3. **响应式设计**: 使用主题中定义的间距和尺寸
4. **可访问性**: 确保颜色对比度符合标准
5. **性能优化**: 复用组件，避免重复创建

## 扩展主题

如果需要添加新的主题元素：

1. 在 `app_theme.dart` 中添加新的常量或getter
2. 在 `app_components.dart` 中添加相应的组件
3. 更新本README文档
4. 确保新元素与现有主题保持一致

## 示例

查看各个页面模块，了解如何正确使用主题系统：

- `home_page.dart` - 首页示例
- `message_page.dart` - 消息页面示例
- `social_page.dart` - 社交页面示例
- `publish_page.dart` - 发布页面示例
- `archive_profile_page.dart` - 个人档案页面示例
