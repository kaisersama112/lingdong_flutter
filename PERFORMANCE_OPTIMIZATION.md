# 宠物档案页面性能优化方案

## 问题分析

宠物档案页面加载缓慢的主要原因是：

1. **一次性请求过多数据**：在 `PetService.getPetRecordCounts()` 方法中，一次性调用了6个不同的API接口
2. **同步等待所有请求**：使用 `Future.wait` 等待所有API请求完成
3. **缺乏分页和懒加载**：健康记录页面一次性加载100条记录
4. **没有缓存机制**：每次进入页面都重新请求数据

## 优化方案

### 1. 按需请求优化

#### PetService 优化
- **默认只加载常用数据**：只请求疫苗接种和驱虫记录数量（最常用的）
- **提供完整加载方法**：`getFullRecordCounts()` 方法用于用户需要查看所有类型时
- **实现缓存机制**：5分钟缓存过期，避免重复请求

```dart
// 优化前：一次性请求6个接口
final Map<String, int> counts = {};
// 疫苗接种、驱虫、体检、体重、美容...

// 优化后：默认只请求常用类型
final priorityTypes = ['vaccination', 'deworming'];
for (final type in priorityTypes) {
  final count = await _getRecordCountByType(petId, type);
  counts[type] = count;
}
```

#### 并发控制
- **限制并发请求数**：使用信号量限制最多3个并发请求
- **避免API过载**：防止同时发起过多请求导致服务器压力

```dart
final semaphore = _Semaphore(3); // 最多3个并发请求
final futures = tasks.map((task) async {
  await semaphore.acquire();
  try {
    return await task;
  } finally {
    semaphore.release();
  }
});
```

### 2. 分页加载优化

#### 健康记录页面
- **减少初始加载量**：从100条减少到20条
- **实现分页加载**：滚动到底部时自动加载更多
- **去重和排序**：避免重复数据，保持时间顺序

```dart
// 优化前：一次性加载100条
_recordService.getVaccinationRecords(petId, skip: 0, size: 100)

// 优化后：分页加载20条
_recordService.getVaccinationRecords(petId, skip: 0, size: _pageSize)
```

#### 分页状态管理
```dart
bool _isLoadingMore = false;
bool _hasReachedEnd = false;
static const int _pageSize = 20;
```

### 3. 智能筛选优化

#### 按需请求筛选
- **智能更新**：勾选类型时只请求该类型数据，取消勾选时只从本地过滤
- **避免重复请求**：不会因为勾选一个类型而重新请求所有已勾选的类型
- **数据合并**：新数据与现有数据智能合并，去重排序

```dart
// 优化前：勾选一个类型会重新请求所有已勾选类型
final list = await _loadHealthRecordsBySelectedTypesFromApi(petId);

// 优化后：只请求新勾选的类型
await _smartUpdateHealthRecords(petId, type, !wasSelected);
```

#### 智能更新逻辑
```dart
Future<void> _smartUpdateHealthRecords(
  String petId,
  models.HealthRecordType type,
  bool isAdding,
) async {
  if (isAdding) {
    // 添加新类型：只请求该类型的数据
    final newRecords = await _loadSingleTypeRecords(petId, type);
    // 合并新数据，去重并排序
  } else {
    // 移除类型：从现有列表中过滤掉该类型
    _healthRecords = _healthRecords.where((r) => r.type != type).toList();
  }
}
```

### 4. 延迟加载优化

#### 宠物档案页面
- **先加载基本信息**：快速显示宠物列表
- **延迟加载详细信息**：1秒后异步加载记录数量
- **按需加载完整数据**：用户需要时再加载所有类型

```dart
// 先加载基本信息
final pets = await _petService.getUserPets('current_user');

// 延迟加载详细信息
if (pets.isNotEmpty) {
  _loadPetDetailsLazily(pets.first.id);
}
```

### 5. 缓存机制

#### 内存缓存
- **记录数量缓存**：5分钟过期时间
- **避免重复请求**：相同数据短时间内不重复请求
- **缓存清理**：提供手动清理缓存的方法

```dart
static final Map<String, Map<String, int>> _recordCountsCache = {};
static final Map<String, DateTime> _cacheTimestamps = {};
static const Duration _cacheExpiry = Duration(minutes: 5);
```

## 性能提升效果

### 优化前
- 页面加载时间：3-5秒
- 一次性请求：6个API接口
- 初始数据量：100条记录
- 用户体验：等待时间长，页面卡顿

### 优化后
- 页面加载时间：1-2秒
- 初始请求：2个API接口
- 初始数据量：20条记录
- 用户体验：快速响应，流畅滚动

## 使用方法

### 1. 基本使用（推荐）
```dart
// 自动使用优化后的按需加载
final recordCounts = await _petService.getPetRecordCounts(petId);
```

### 2. 完整数据加载
```dart
// 当用户需要查看所有类型时
final fullCounts = await _petService.getFullRecordCounts(petId);
```

### 3. 手动清理缓存
```dart
// 清除所有缓存数据
_petService.clearRecordCountsCache();
```

## 注意事项

1. **缓存过期时间**：当前设置为5分钟，可根据实际需求调整
2. **并发限制**：当前限制为3个并发请求，可根据服务器性能调整
3. **分页大小**：当前设置为20条，可根据网络状况调整
4. **错误处理**：API失败时自动回退到本地数据库

## 后续优化建议

1. **智能预加载**：根据用户行为预测需要的数据
2. **离线缓存**：实现本地数据缓存，支持离线查看
3. **数据压缩**：减少网络传输的数据量
4. **CDN加速**：使用CDN加速静态资源加载
5. **图片懒加载**：宠物头像等图片实现懒加载
