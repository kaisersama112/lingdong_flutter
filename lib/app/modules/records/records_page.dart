import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';
import 'package:flutter/services.dart';
import 'dart:async';
import '../../core/components.dart';
import '../../core/models.dart' as models;
import '../../services/pet_service.dart';

import '../../services/record_service.dart';
import '../pet/pet_components.dart';
import 'add_health_record_page.dart';
import 'dart:io' show Platform;

class RecordsPage extends StatefulWidget {
  final String? initialPetId;
  final models.HealthRecordType? initialFilterType;
  final bool openAddSheet;

  const RecordsPage({
    super.key,
    this.initialPetId,
    this.initialFilterType,
    this.openAddSheet = false,
  });

  @override
  State<RecordsPage> createState() => _RecordsPageState();
}

class _RecordsPageState extends State<RecordsPage> {
  // 视图与筛选控制
  bool _isTimelineView = false;
  bool _sortDesc = true;
  final TextEditingController _searchController = TextEditingController();

  // 服务实例
  final PetService _petService = PetService();
  final RecordService _recordService = RecordService();

  // 动态数据
  List<models.Pet> _pets = [];
  List<models.HealthRecord> _healthRecords = [];
  bool _isLoading = true;
  String? _errorMessage;

  // 健康记录：状态与筛选
  String? _selectedPetIdForHealth;
  final Set<models.HealthRecordType> _activeTypeFilters = {};

  // 分页加载相关
  bool _isLoadingMore = false;
  bool _hasReachedEnd = false;
  static const int _pageSize = 20;

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  /// 加载宠物和健康记录数据
  Future<void> _loadData() async {
    setState(() {
      _isLoading = true;
      _errorMessage = null;
    });

    try {
      // 加载宠物列表
      final pets = await _petService.getUserPets('current_user');

      // 选中宠物
      final String? chosenPetId =
          widget.initialPetId ?? (pets.isNotEmpty ? pets.first.id : null);

      // 优先从接口加载健康记录（按当前筛选）
      final records = chosenPetId == null
          ? <models.HealthRecord>[]
          : await _loadHealthRecordsBySelectedTypesFromApi(chosenPetId);

      setState(() {
        _pets = pets;
        _healthRecords = records;
        _selectedPetIdForHealth = chosenPetId;
        _isLoading = false;
      });

      // 初始筛选
      if (widget.initialFilterType != null) {
        _activeTypeFilters.clear();
        _activeTypeFilters.add(widget.initialFilterType!);
      }

      // 可选：首次进入直接打开新增
      if (widget.openAddSheet && pets.isNotEmpty) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          _openAddHealthRecordSheet(presetType: widget.initialFilterType);
        });
      }
    } catch (e) {
      setState(() {
        _errorMessage = '加载数据失败: $e';
        _isLoading = false;
      });
    }
  }

  /// 从接口加载健康记录（按勾选类型请求）
  Future<List<models.HealthRecord>> _loadHealthRecordsBySelectedTypesFromApi(
    String petId,
  ) async {
    try {
      final Set<models.HealthRecordType> selected = _activeTypeFilters.isEmpty
          ? {
              models.HealthRecordType.vaccination,
              models.HealthRecordType.deworming,
              models.HealthRecordType.vetVisit,
              models.HealthRecordType.weight,
              models.HealthRecordType.grooming,
            }
          : _activeTypeFilters;

      final List<Future<List<models.HealthRecord>>> tasks = [];
      for (final t in selected) {
        switch (t) {
          case models.HealthRecordType.vaccination:
            tasks.add(
              _recordService.getVaccinationRecords(
                petId,
                skip: 0,
                size: _pageSize,
              ),
            );
            break;
          case models.HealthRecordType.deworming:
            tasks.add(
              _recordService.getDewormingRecords(
                petId,
                skip: 0,
                size: _pageSize,
              ),
            );
            break;
          case models.HealthRecordType.vetVisit:
            tasks.add(
              _recordService.getExaminationRecords(
                petId,
                skip: 0,
                size: _pageSize,
              ),
            );
            break;
          case models.HealthRecordType.weight:
            tasks.add(
              _recordService.getWeightRecords(petId, skip: 0, size: _pageSize),
            );
            break;
          case models.HealthRecordType.grooming:
            tasks.add(
              _recordService.getGroomingRecords(
                petId,
                skip: 0,
                size: _pageSize,
              ),
            );
            break;
        }
      }

      final lists = await Future.wait(tasks);
      final List<models.HealthRecord> merged = [for (final l in lists) ...l]
        ..sort((a, b) => b.date.compareTo(a.date));
      debugPrint('merged: $merged');
      return merged;
    } catch (e) {
      // 接口失败时返回空列表
      debugPrint('接口失败: $e');
      return <models.HealthRecord>[];
    }
  }

  /// 加载更多健康记录（分页加载）
  Future<void> _loadMoreHealthRecords() async {
    if (_isLoadingMore || _hasReachedEnd) return;

    setState(() {
      _isLoadingMore = true;
    });

    try {
      final String? petId = _selectedPetIdForHealth;
      if (petId == null) return;

      final Set<models.HealthRecordType> selected = _activeTypeFilters.isEmpty
          ? {
              models.HealthRecordType.vaccination,
              models.HealthRecordType.deworming,
              models.HealthRecordType.vetVisit,
              models.HealthRecordType.weight,
              models.HealthRecordType.grooming,
            }
          : _activeTypeFilters;

      final int currentSkip = _healthRecords.length;

      final List<Future<List<models.HealthRecord>>> tasks = [];
      for (final t in selected) {
        switch (t) {
          case models.HealthRecordType.vaccination:
            tasks.add(
              _recordService.getVaccinationRecords(
                petId,
                skip: currentSkip,
                size: _pageSize,
              ),
            );
            break;
          case models.HealthRecordType.deworming:
            tasks.add(
              _recordService.getDewormingRecords(
                petId,
                skip: currentSkip,
                size: _pageSize,
              ),
            );
            break;
          case models.HealthRecordType.vetVisit:
            tasks.add(
              _recordService.getExaminationRecords(
                petId,
                skip: currentSkip,
                size: _pageSize,
              ),
            );
            break;
          case models.HealthRecordType.weight:
            tasks.add(
              _recordService.getWeightRecords(
                petId,
                skip: currentSkip,
                size: _pageSize,
              ),
            );
            break;
          case models.HealthRecordType.grooming:
            tasks.add(
              _recordService.getGroomingRecords(
                petId,
                skip: currentSkip,
                size: _pageSize,
              ),
            );
            break;
        }
      }

      // 限制并发请求数量
      final semaphore = _RequestSemaphore(3);
      final futures = tasks.map((task) async {
        await semaphore.acquire();
        try {
          return await task;
        } finally {
          semaphore.release();
        }
      });

      final lists = await Future.wait(futures);
      final List<models.HealthRecord> newRecords = [for (final l in lists) ...l]
        ..sort((a, b) => b.date.compareTo(a.date));

      if (mounted) {
        setState(() {
          if (newRecords.isNotEmpty) {
            _healthRecords.addAll(newRecords);
            // 去重并重新排序
            final uniqueRecords = <String, models.HealthRecord>{};
            for (final record in _healthRecords) {
              uniqueRecords[record.id] = record;
            }
            _healthRecords = uniqueRecords.values.toList()
              ..sort((a, b) => b.date.compareTo(a.date));
          }

          // 检查是否到达末尾
          if (newRecords.length < _pageSize * selected.length) {
            _hasReachedEnd = true;
          }

          _isLoadingMore = false;
        });
      }
    } catch (e) {
      if (mounted) {
        setState(() {
          _isLoadingMore = false;
        });
      }
      debugPrint('加载更多记录失败: $e');
    }
  }

  /// 重置分页状态
  void _resetPagination() {
    _hasReachedEnd = false;
    _isLoadingMore = false;
  }

  // 根据记录类型自动勾选筛选器
  void _autoSelectFilterByType(models.HealthRecordType type) async {
    setState(() {
      _activeTypeFilters.clear();
      _activeTypeFilters.add(type);
    });
    final String? petId = _selectedPetIdForHealth;
    if (petId != null) {
      final list = await _loadHealthRecordsBySelectedTypesFromApi(petId);
      if (mounted) setState(() => _healthRecords = list);
    }
  }

  /// 按需加载单个类型的健康记录
  Future<List<models.HealthRecord>> _loadSingleTypeRecords(
    String petId,
    models.HealthRecordType type,
  ) async {
    try {
      debugPrint('开始请求单个类型数据: ${models.HealthRecordUtils.getTypeLabel(type)}');
      List<models.HealthRecord> records = [];

      switch (type) {
        case models.HealthRecordType.vaccination:
          records = await _recordService.getVaccinationRecords(
            petId,
            skip: 0,
            size: _pageSize,
          );
          break;
        case models.HealthRecordType.deworming:
          records = await _recordService.getDewormingRecords(
            petId,
            skip: 0,
            size: _pageSize,
          );
          break;
        case models.HealthRecordType.vetVisit:
          records = await _recordService.getExaminationRecords(
            petId,
            skip: 0,
            size: _pageSize,
          );
          break;
        case models.HealthRecordType.weight:
          records = await _recordService.getWeightRecords(
            petId,
            skip: 0,
            size: _pageSize,
          );
          break;
        case models.HealthRecordType.grooming:
          records = await _recordService.getGroomingRecords(
            petId,
            skip: 0,
            size: _pageSize,
          );
          break;
      }

      debugPrint(
        '单个类型请求完成: ${models.HealthRecordUtils.getTypeLabel(type)}, 记录数量: ${records.length}',
      );
      return records;
    } catch (e) {
      debugPrint('加载$type记录失败: $e');
      return [];
    }
  }

  /// 智能更新健康记录列表（按需请求）
  Future<void> _smartUpdateHealthRecords(
    String petId,
    models.HealthRecordType type,
    bool isAdding,
  ) async {
    debugPrint(
      '智能更新: ${models.HealthRecordUtils.getTypeLabel(type)}, 是否添加: $isAdding',
    );
    debugPrint('更新前记录数量: ${_healthRecords.length}');

    if (isAdding) {
      // 添加新类型：只请求该类型的数据
      debugPrint('开始请求 ${models.HealthRecordUtils.getTypeLabel(type)} 类型数据');
      final newRecords = await _loadSingleTypeRecords(petId, type);
      debugPrint(
        '获取到 ${models.HealthRecordUtils.getTypeLabel(type)} 类型记录数量: ${newRecords.length}',
      );

      if (mounted) {
        setState(() {
          // 合并新数据，去重并排序
          final existingIds = _healthRecords.map((r) => r.id).toSet();
          final uniqueNewRecords = newRecords
              .where((r) => !existingIds.contains(r.id))
              .toList();

          debugPrint('去重后新增记录数量: ${uniqueNewRecords.length}');
          _healthRecords.addAll(uniqueNewRecords);
          _healthRecords.sort((a, b) => b.date.compareTo(a.date));
          debugPrint('更新后记录数量: ${_healthRecords.length}');
        });
      }
    } else {
      // 移除类型：从现有列表中过滤掉该类型
      debugPrint('移除 ${models.HealthRecordUtils.getTypeLabel(type)} 类型数据');
      if (mounted) {
        setState(() {
          final beforeCount = _healthRecords.length;
          _healthRecords = _healthRecords.where((r) => r.type != type).toList();
          debugPrint(
            '移除前记录数量: $beforeCount, 移除后记录数量: ${_healthRecords.length}',
          );
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.getBackgroundColor(context),
      body: _isLoading
          ? _buildLoadingState()
          : _pets.isEmpty
          ? _buildEmptyState()
          : Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    AppTheme.getBackgroundColor(context),
                    AppTheme.getBackgroundColor(context).withValues(alpha: 0.8),
                    Colors.white.withValues(alpha: 0.9),
                  ],
                  stops: const [0.0, 0.3, 1.0],
                ),
              ),
              child: CustomScrollView(
                slivers: [
                  // 顶部宠物选择区域
                  SliverToBoxAdapter(
                    child: Container(
                      margin: const EdgeInsets.symmetric(
                        horizontal: AppTheme.spacingM,
                        vertical: AppTheme.spacingS,
                      ),
                      child: _buildBeautifulTopBar(),
                    ),
                  ),

                  // 搜索和筛选区域
                  SliverToBoxAdapter(
                    child: Container(
                      margin: const EdgeInsets.symmetric(
                        horizontal: AppTheme.spacingM,
                        vertical: AppTheme.spacingXS,
                      ),
                      child: _buildBeautifulSearchAndFilters(),
                    ),
                  ),

                  // 健康记录列表
                  _isTimelineView
                      ? _buildHealthRecordsTimelineSliver()
                      : _buildHealthRecordsListSliver(),

                  // 底部间距
                  const SliverToBoxAdapter(
                    child: SizedBox(height: AppTheme.spacingM),
                  ),
                ],
              ),
            ),
      floatingActionButton: _buildBeautifulFloatingActionButton(),
    );
  }

  /// 构建美丽的顶部栏
  Widget _buildBeautifulTopBar() {
    return Container(
      padding: const EdgeInsets.all(AppTheme.spacingL),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            AppTheme.primaryColor.withValues(alpha: 0.88),
            AppTheme.primaryColor.withValues(alpha: 0.7),
            AppTheme.primaryColor.withValues(alpha: 0.56),
          ],
          stops: const [0.0, 0.6, 1.0],
        ),
        borderRadius: BorderRadius.circular(AppTheme.borderRadiusLarge),
        boxShadow: [
          BoxShadow(
            color: AppTheme.primaryColor.withValues(alpha: 0.22),
            blurRadius: 16,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 顶部功能栏：左返回 | 中视图切换 | 右排序
          Row(
            children: [
              // 左：返回
              _buildBackButton(context),

              // 中：视图切换
              Expanded(child: Center(child: _buildBeautifulViewToggleButton())),

              // 右：排序
              _buildSortButton(),
            ],
          ),

          const SizedBox(height: AppTheme.spacingM),

          // 宠物选择器
          _buildBeautifulPetSelector(),
        ],
      ),
    );
  }

  /// 构建排序按钮（统一配色与尺寸）
  Widget _buildSortButton() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.14),
        borderRadius: BorderRadius.circular(AppTheme.borderRadiusMedium),
        border: Border.all(color: Colors.white.withValues(alpha: 0.18)),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () => setState(() => _sortDesc = !_sortDesc),
          borderRadius: BorderRadius.circular(AppTheme.borderRadiusMedium),
          child: Padding(
            padding: const EdgeInsets.all(AppTheme.spacingS),
            child: Icon(
              _sortDesc
                  ? Icons.arrow_downward_rounded
                  : Icons.arrow_upward_rounded,
              color: Colors.white,
              size: 18,
            ),
          ),
        ),
      ),
    );
  }

  /// 构建美丽的视图切换按钮（统一配色与尺寸）
  Widget _buildBeautifulViewToggleButton() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.14),
        borderRadius: BorderRadius.circular(AppTheme.borderRadiusMedium),
        border: Border.all(color: Colors.white.withValues(alpha: 0.18)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          _buildBeautifulViewToggleOption(
            icon: Icons.view_list_rounded,
            isSelected: !_isTimelineView,
            onTap: () => setState(() => _isTimelineView = false),
          ),
          _buildBeautifulViewToggleOption(
            icon: Icons.timeline_rounded,
            isSelected: _isTimelineView,
            onTap: () => setState(() => _isTimelineView = true),
          ),
        ],
      ),
    );
  }

  /// 构建美丽的视图切换选项（统一配色与尺寸）
  Widget _buildBeautifulViewToggleOption({
    required IconData icon,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(AppTheme.borderRadiusMedium),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 180),
          padding: const EdgeInsets.all(AppTheme.spacingS),
          decoration: BoxDecoration(
            color: isSelected
                ? Colors.white.withValues(alpha: 0.22)
                : Colors.transparent,
            borderRadius: BorderRadius.circular(AppTheme.borderRadiusMedium),
          ),
          child: Icon(
            icon,
            color: isSelected
                ? Colors.white
                : Colors.white.withValues(alpha: 0.75),
            size: 18,
          ),
        ),
      ),
    );
  }

  /// 构建美丽的宠物选择器
  Widget _buildBeautifulPetSelector() {
    if (_pets.isEmpty) {
      return Container(
        padding: const EdgeInsets.all(AppTheme.spacingM),
        decoration: BoxDecoration(
          color: Colors.white.withValues(alpha: 0.12),
          borderRadius: BorderRadius.circular(AppTheme.borderRadiusMedium),
        ),
        child: Row(
          children: [
            Icon(
              Icons.pets,
              color: Colors.white.withValues(alpha: 0.75),
              size: 18,
            ),
            const SizedBox(width: AppTheme.spacingS),
            Text(
              '暂无宠物',
              style: TextStyle(
                color: Colors.white.withValues(alpha: 0.85),
                fontSize: AppTheme.fontSizeS,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      );
    }

    return SizedBox(
      height: 70,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.zero,
        itemCount: _pets.length,
        itemBuilder: (context, index) {
          final pet = _pets[index];
          final isSelected = pet.id == _selectedPetIdForHealth;

          return GestureDetector(
            onTap: () async {
              setState(() => _selectedPetIdForHealth = pet.id);
              // 切换宠物时，重置分页状态并加载数据
              _resetPagination();
              final list = await _loadHealthRecordsBySelectedTypesFromApi(
                pet.id,
              );
              if (mounted) setState(() => _healthRecords = list);
            },
            child: Container(
              width: 65,
              margin: const EdgeInsets.only(right: AppTheme.spacingM),
              child: Column(
                children: [
                  // 宠物头像
                  Container(
                    width: 45,
                    height: 45,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: isSelected
                          ? LinearGradient(
                              colors: [
                                Colors.white,
                                Colors.white.withValues(alpha: 0.9),
                              ],
                            )
                          : null,
                      color: isSelected
                          ? null
                          : Colors.white.withValues(alpha: 0.08),
                      border: Border.all(
                        color: isSelected
                            ? Colors.white
                            : Colors.white.withValues(alpha: 0.25),
                        width: isSelected ? 2.5 : 1.5,
                      ),
                      boxShadow: isSelected
                          ? [
                              BoxShadow(
                                color: Colors.white.withValues(alpha: 0.3),
                                blurRadius: 8,
                                offset: const Offset(0, 2),
                              ),
                            ]
                          : null,
                    ),
                    child: ClipOval(
                      child: pet.avatar != null && pet.avatar!.isNotEmpty
                          ? Image.network(
                              pet.avatar!,
                              width: 45,
                              height: 45,
                              fit: BoxFit.cover,
                              errorBuilder: (context, error, stackTrace) {
                                return Container(
                                  width: 45,
                                  height: 45,
                                  color: isSelected
                                      ? Colors.white.withValues(alpha: 0.2)
                                      : Colors.white.withValues(alpha: 0.08),
                                  child: Icon(
                                    Icons.pets_rounded,
                                    color: isSelected
                                        ? AppTheme.primaryColor
                                        : Colors.white.withValues(alpha: 0.5),
                                    size: 22,
                                  ),
                                );
                              },
                            )
                          : Container(
                              width: 45,
                              height: 45,
                              color: isSelected
                                  ? Colors.white.withValues(alpha: 0.2)
                                  : Colors.white.withValues(alpha: 0.08),
                              child: Icon(
                                Icons.pets_rounded,
                                color: isSelected
                                    ? AppTheme.primaryColor
                                    : Colors.white.withValues(alpha: 0.5),
                                size: 22,
                              ),
                            ),
                    ),
                  ),
                  const SizedBox(height: 6),
                  // 宠物名称
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 4,
                      vertical: 1,
                    ),
                    decoration: BoxDecoration(
                      color: isSelected
                          ? Colors.white.withValues(alpha: 0.2)
                          : Colors.transparent,
                      borderRadius: BorderRadius.circular(
                        AppTheme.borderRadiusMedium,
                      ),
                    ),
                    child: Text(
                      pet.name,
                      style: TextStyle(
                        color: isSelected
                            ? Colors.white
                            : Colors.white.withValues(alpha: 0.75),
                        fontSize: AppTheme.fontSizeXS,
                        fontWeight: isSelected
                            ? FontWeight.w700
                            : FontWeight.w500,
                      ),
                      textAlign: TextAlign.center,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  /// 构建美丽的搜索和筛选区域
  Widget _buildBeautifulSearchAndFilters() {
    return Container(
      padding: const EdgeInsets.all(AppTheme.spacingM),
      decoration: BoxDecoration(
        color: AppTheme.getSurfaceColor(context),
        borderRadius: BorderRadius.circular(AppTheme.borderRadiusLarge),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.08),
            blurRadius: 20,
            offset: const Offset(0, 8),
          ),
        ],
        border: Border.all(
          color: AppTheme.getDividerColor(context),
          width: 0.5,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 搜索框
          _buildBeautifulSearchBar(),
          const SizedBox(height: AppTheme.spacingM),
          // 类型筛选器
          _buildBeautifulTypeFilters(),
        ],
      ),
    );
  }

  /// 构建美丽的搜索框
  Widget _buildBeautifulSearchBar() {
    return Container(
      decoration: BoxDecoration(
        color: AppTheme.getBackgroundColor(context),
        borderRadius: BorderRadius.circular(AppTheme.borderRadiusLarge),
        border: Border.all(color: AppTheme.getDividerColor(context), width: 1),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.03),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: TextField(
        controller: _searchController,
        decoration: InputDecoration(
          hintText: '搜索健康记录...',
          hintStyle: TextStyle(
            color: AppTheme.getTextSecondaryColor(context),
            fontSize: AppTheme.fontSizeM,
          ),
          prefixIcon: Container(
            margin: const EdgeInsets.all(6),
            padding: const EdgeInsets.all(6),
            decoration: BoxDecoration(
              color: AppTheme.primaryColor.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(AppTheme.borderRadiusMedium),
            ),
            child: Icon(
              Icons.search_rounded,
              color: AppTheme.primaryColor,
              size: 20,
            ),
          ),
          suffixIcon: _searchController.text.isNotEmpty
              ? Container(
                  margin: const EdgeInsets.all(6),
                  decoration: BoxDecoration(
                    color: AppTheme.getTextSecondaryColor(
                      context,
                    ).withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(
                      AppTheme.borderRadiusMedium,
                    ),
                  ),
                  child: IconButton(
                    icon: Icon(
                      Icons.clear_rounded,
                      color: AppTheme.getTextSecondaryColor(context),
                      size: 18,
                    ),
                    onPressed: () {
                      _searchController.clear();
                      setState(() {});
                    },
                  ),
                )
              : null,
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(
            horizontal: AppTheme.spacingM,
            vertical: AppTheme.spacingS,
          ),
        ),
        onChanged: (value) {
          setState(() {});
        },
        style: TextStyle(
          color: AppTheme.getTextPrimaryColor(context),
          fontSize: AppTheme.fontSizeM,
        ),
      ),
    );
  }

  /// 构建美丽的类型筛选器
  Widget _buildBeautifulTypeFilters() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(
              Icons.filter_list_rounded,
              color: AppTheme.getTextSecondaryColor(context),
              size: 16,
            ),
            const SizedBox(width: AppTheme.spacingS),
            Text(
              '记录类型',
              style: TextStyle(
                color: AppTheme.getTextSecondaryColor(context),
                fontSize: AppTheme.fontSizeS,
                fontWeight: FontWeight.w600,
              ),
            ),
            const Spacer(),
            if (_activeTypeFilters.isNotEmpty)
              Container(
                decoration: BoxDecoration(
                  color: AppTheme.warningColor.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(
                    AppTheme.borderRadiusMedium,
                  ),
                  border: Border.all(
                    color: AppTheme.warningColor.withValues(alpha: 0.3),
                  ),
                ),
                child: TextButton(
                  onPressed: () {
                    setState(() {
                      _activeTypeFilters.clear();
                    });
                  },
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.clear_rounded,
                        size: 14,
                        color: AppTheme.warningColor,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        '清除筛选',
                        style: TextStyle(
                          color: AppTheme.warningColor,
                          fontSize: AppTheme.fontSizeXS,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
          ],
        ),
        const SizedBox(height: AppTheme.spacingS),
        Wrap(
          spacing: AppTheme.spacingS,
          runSpacing: AppTheme.spacingS,
          children: models.HealthRecordType.values.map((type) {
            final isSelected = _activeTypeFilters.contains(type);
            final color = models.HealthRecordUtils.getTypeColor(type);
            return Material(
              color: Colors.transparent,
              child: InkWell(
                borderRadius: BorderRadius.circular(20),
                onTap: () async {
                  final bool wasSelected = isSelected;
                  setState(() {
                    if (wasSelected) {
                      _activeTypeFilters.remove(type);
                    } else {
                      _activeTypeFilters.add(type);
                    }
                  });

                  final String? petId = _selectedPetIdForHealth;
                  if (petId != null) {
                    await _smartUpdateHealthRecords(petId, type, !wasSelected);
                  }
                },
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 250),
                  curve: Curves.easeOutCubic,
                  padding: const EdgeInsets.symmetric(
                    horizontal: AppTheme.spacingS,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    color: isSelected
                        ? color.withValues(alpha: 0.15)
                        : AppTheme.getBackgroundColor(context),
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      color: isSelected
                          ? color.withValues(alpha: 0.6)
                          : AppTheme.getDividerColor(context),
                      width: isSelected ? 2 : 1,
                    ),
                    boxShadow: isSelected
                        ? [
                            BoxShadow(
                              color: color.withValues(alpha: 0.25),
                              blurRadius: 12,
                              offset: const Offset(0, 4),
                            ),
                          ]
                        : null,
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(4),
                        decoration: BoxDecoration(
                          color: isSelected
                              ? color.withValues(alpha: 0.2)
                              : AppTheme.getTextSecondaryColor(
                                  context,
                                ).withValues(alpha: 0.1),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Icon(
                          models.HealthRecordUtils.getTypeIcon(type),
                          color: isSelected
                              ? color
                              : AppTheme.getTextSecondaryColor(context),
                          size: 16,
                        ),
                      ),
                      const SizedBox(width: AppTheme.spacingS),
                      Text(
                        models.HealthRecordUtils.getTypeLabel(type),
                        style: TextStyle(
                          color: isSelected
                              ? color
                              : AppTheme.getTextSecondaryColor(context),
                          fontSize: AppTheme.fontSizeS,
                          fontWeight: isSelected
                              ? FontWeight.w700
                              : FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }

  /// 构建美丽的浮动操作按钮
  Widget _buildBeautifulFloatingActionButton() {
    return FloatingActionButton(
      onPressed: _openAddHealthRecordSheet,
      backgroundColor: AppTheme.primaryColor,
      elevation: 8,
      child: const Icon(Icons.add_rounded, color: Colors.white, size: 28),
    );
  }

  /// 构建加载状态
  Widget _buildLoadingState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(AppTheme.spacingL),
            decoration: BoxDecoration(
              color: AppTheme.getSurfaceColor(context),
              borderRadius: BorderRadius.circular(AppTheme.borderRadiusLarge),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.05),
                  blurRadius: 15,
                  offset: const Offset(0, 5),
                ),
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  width: 48,
                  height: 48,
                  child: CircularProgressIndicator(
                    strokeWidth: 3,
                    valueColor: AlwaysStoppedAnimation<Color>(
                      AppTheme.primaryColor,
                    ),
                  ),
                ),
                const SizedBox(height: AppTheme.spacingM),
                Text(
                  '加载中...',
                  style: TextStyle(
                    color: AppTheme.getTextSecondaryColor(context),
                    fontSize: AppTheme.fontSizeM,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  /// 构建空状态
  Widget _buildEmptyState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(AppTheme.spacingL),
            decoration: BoxDecoration(
              color: AppTheme.getSurfaceColor(context),
              borderRadius: BorderRadius.circular(AppTheme.borderRadiusLarge),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.05),
                  blurRadius: 15,
                  offset: const Offset(0, 5),
                ),
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.pets_outlined,
                  size: 48,
                  color: AppTheme.getTextSecondaryColor(context),
                ),
                const SizedBox(height: AppTheme.spacingM),
                Text(
                  '还没有添加宠物',
                  style: TextStyle(
                    color: AppTheme.getTextSecondaryColor(context),
                    fontSize: AppTheme.fontSizeL,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: AppTheme.spacingS),
                Text(
                  '请先添加宠物后再查看健康记录',
                  style: TextStyle(
                    color: AppTheme.getTextSecondaryColor(context),
                    fontSize: AppTheme.fontSizeS,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // 顶部紧凑栏：左侧宠物选择器，下方为轻量搜索框
  Widget _buildCompactTopBar() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        // 宠物切换器
        _buildPetSelector(),
        const SizedBox(height: AppTheme.spacingS),
        // 轻量搜索框（比原来更扁平）
        _buildBeautifulSearchBar(),
      ],
    );
  }

  Widget _buildPetSelector() {
    if (_pets.isEmpty) {
      return Container(
        padding: const EdgeInsets.all(AppTheme.spacingM),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              AppTheme.primaryColor.withValues(alpha: 0.05),
              AppTheme.primaryColor.withValues(alpha: 0.02),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: AppTheme.primaryColor.withValues(alpha: 0.1),
            width: 1,
          ),
        ),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: AppTheme.primaryColor.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(
                Icons.pets_rounded,
                color: AppTheme.primaryColor,
                size: 20,
              ),
            ),
            const SizedBox(width: AppTheme.spacingM),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '暂无宠物',
                    style: TextStyle(
                      color: AppTheme.textPrimaryColor,
                      fontSize: AppTheme.fontSizeM,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    '请先添加宠物',
                    style: TextStyle(
                      color: AppTheme.textSecondaryColor,
                      fontSize: AppTheme.fontSizeS,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    }

    return Container(
      height: 80,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: AppTheme.spacingM),
        itemCount: _pets.length,
        itemBuilder: (context, index) {
          final pet = _pets[index];
          final isSelected = pet.id == _selectedPetIdForHealth;

          return GestureDetector(
            onTap: () async {
              setState(() => _selectedPetIdForHealth = pet.id);
              // 切换宠物时，重置分页状态并加载数据
              _resetPagination();
              final list = await _loadHealthRecordsBySelectedTypesFromApi(
                pet.id,
              );
              if (mounted) setState(() => _healthRecords = list);
            },
            child: Container(
              width: 70,
              margin: const EdgeInsets.only(right: AppTheme.spacingM),
              child: Column(
                children: [
                  // 宠物头像
                  Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: isSelected
                          ? LinearGradient(
                              colors: [
                                AppTheme.primaryColor,
                                AppTheme.primaryColor.withValues(alpha: 0.8),
                              ],
                            )
                          : null,
                      color: isSelected
                          ? null
                          : Colors.white.withValues(alpha: 0.1),
                      border: Border.all(
                        color: isSelected
                            ? AppTheme.primaryColor
                            : Colors.white.withValues(alpha: 0.3),
                        width: isSelected ? 2 : 1,
                      ),
                      boxShadow: isSelected
                          ? [
                              BoxShadow(
                                color: Colors.white.withValues(alpha: 0.5),
                                blurRadius: 12,
                                offset: const Offset(0, 4),
                              ),
                            ]
                          : [
                              BoxShadow(
                                color: Colors.black.withValues(alpha: 0.1),
                                blurRadius: 6,
                                offset: const Offset(0, 2),
                              ),
                            ],
                    ),
                    child: ClipOval(
                      child: pet.avatar != null && pet.avatar!.isNotEmpty
                          ? Image.network(
                              pet.avatar!,
                              width: 50,
                              height: 50,
                              fit: BoxFit.cover,
                              errorBuilder: (context, error, stackTrace) {
                                return Container(
                                  width: 50,
                                  height: 50,
                                  color: isSelected
                                      ? AppTheme.primaryColor.withValues(
                                          alpha: 0.2,
                                        )
                                      : Colors.white.withValues(alpha: 0.1),
                                  child: Icon(
                                    Icons.pets_rounded,
                                    color: isSelected
                                        ? AppTheme.primaryColor
                                        : Colors.white.withValues(alpha: 0.6),
                                    size: 24,
                                  ),
                                );
                              },
                            )
                          : Container(
                              width: 50,
                              height: 50,
                              color: isSelected
                                  ? AppTheme.primaryColor.withValues(alpha: 0.2)
                                  : Colors.white.withValues(alpha: 0.1),
                              child: Icon(
                                Icons.pets_rounded,
                                color: isSelected
                                    ? AppTheme.primaryColor
                                    : Colors.white.withValues(alpha: 0.6),
                                size: 24,
                              ),
                            ),
                    ),
                  ),
                  const SizedBox(height: 6),
                  // 宠物名称
                  Text(
                    pet.name,
                    style: TextStyle(
                      color: isSelected
                          ? AppTheme.primaryColor
                          : AppTheme.textSecondaryColor,
                      fontSize: AppTheme.fontSizeXS,
                      fontWeight: isSelected
                          ? FontWeight.w600
                          : FontWeight.w500,
                    ),
                    textAlign: TextAlign.center,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildQuickFilters() {
    final all = _applySearchFilters(_filteredHealthRecords());
    return Container(
      padding: const EdgeInsets.all(AppTheme.spacingS),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.white, Colors.white.withValues(alpha: 0.95)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(14),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.08),
            blurRadius: 12,
            offset: const Offset(0, 2),
          ),
          BoxShadow(
            color: AppTheme.primaryColor.withValues(alpha: 0.05),
            blurRadius: 20,
            offset: const Offset(0, 4),
          ),
        ],
        border: Border.all(
          color: AppTheme.primaryColor.withValues(alpha: 0.1),
          width: 1,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      AppTheme.primaryColor,
                      AppTheme.primaryColor.withValues(alpha: 0.8),
                    ],
                  ),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Icon(
                  Icons.filter_list_rounded,
                  color: Colors.white,
                  size: 16,
                ),
              ),
              const SizedBox(width: 12),
              Text(
                '快速筛选',
                style: TextStyle(
                  color: AppTheme.textPrimaryColor,
                  fontWeight: FontWeight.w700,
                  fontSize: AppTheme.fontSizeL,
                ),
              ),
              const Spacer(),
              if (_activeTypeFilters.isNotEmpty)
                Container(
                  decoration: BoxDecoration(
                    color: AppTheme.warningColor.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: AppTheme.warningColor.withValues(alpha: 0.3),
                    ),
                  ),
                  child: TextButton(
                    onPressed: () {
                      setState(() {
                        _activeTypeFilters.clear();
                      });
                    },
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.clear_rounded,
                          size: 16,
                          color: AppTheme.warningColor,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          '清除筛选',
                          style: TextStyle(
                            color: AppTheme.warningColor,
                            fontSize: AppTheme.fontSizeS,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
            ],
          ),
          const SizedBox(height: AppTheme.spacingS),
          Wrap(
            spacing: AppTheme.spacingS,
            runSpacing: AppTheme.spacingS,
            children: models.HealthRecordType.values.map((type) {
              final isSelected = _activeTypeFilters.contains(type);
              final color = models.HealthRecordUtils.getTypeColor(type);
              return Material(
                color: Colors.transparent,
                child: InkWell(
                  borderRadius: BorderRadius.circular(16),
                  onTap: () async {
                    final bool wasSelected = isSelected;
                    debugPrint(
                      '筛选器点击: ${models.HealthRecordUtils.getTypeLabel(type)}, 之前状态: $wasSelected',
                    );

                    setState(() {
                      if (wasSelected) {
                        _activeTypeFilters.remove(type);
                      } else {
                        _activeTypeFilters.add(type);
                      }
                    });

                    final String? petId = _selectedPetIdForHealth;
                    if (petId != null) {
                      // 使用智能更新，按需请求
                      debugPrint(
                        '当前已勾选类型: ${_activeTypeFilters.map((t) => models.HealthRecordUtils.getTypeLabel(t)).toList()}',
                      );
                      await _smartUpdateHealthRecords(
                        petId,
                        type,
                        !wasSelected,
                      );
                    }
                  },
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 180),
                    curve: Curves.easeOutCubic,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 8,
                    ),
                    decoration: BoxDecoration(
                      color: isSelected
                          ? color
                          : Colors.grey.withValues(alpha: 0.08),
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(
                        color: isSelected
                            ? color
                            : Colors.grey.withValues(alpha: 0.3),
                        width: 1,
                      ),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          models.HealthRecordUtils.getTypeIcon(type),
                          size: 16,
                          color: isSelected
                              ? Colors.white
                              : Colors.grey.shade600,
                        ),
                        const SizedBox(width: 6),
                        Text(
                          models.HealthRecordUtils.getTypeLabel(type),
                          style: TextStyle(
                            color: isSelected
                                ? Colors.white
                                : Colors.grey.shade700,
                            fontSize: AppTheme.fontSizeS,
                            fontWeight: isSelected
                                ? FontWeight.w600
                                : FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }

  // 统计卡片已移除

  // 统计项已移除

  // 已弃用的头部组件（保留参考，未使用）
  Widget _buildRecordsHeader() {
    final all = _applySearchFilters(_filteredHealthRecords());
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: AppTheme.primaryColor.withValues(alpha: 0.1),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Icon(
            Icons.medical_services,
            color: AppTheme.primaryColor,
            size: 20,
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '健康记录',
                style: const TextStyle(
                  fontSize: AppTheme.fontSizeL,
                  fontWeight: FontWeight.bold,
                  color: AppTheme.textPrimaryColor,
                ),
              ),
              Text(
                '共 ${all.length} 条记录',
                style: TextStyle(
                  color: AppTheme.textSecondaryColor,
                  fontSize: AppTheme.fontSizeS,
                ),
              ),
            ],
          ),
        ),
        if (all.isNotEmpty)
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: AppTheme.successColor.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(16),
              border: Border.all(
                color: AppTheme.successColor.withValues(alpha: 0.3),
              ),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.check_circle,
                  color: AppTheme.successColor,
                  size: 16,
                ),
                const SizedBox(width: 4),
                Text(
                  '正常',
                  style: TextStyle(
                    color: AppTheme.successColor,
                    fontSize: AppTheme.fontSizeXS,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
      ],
    );
  }

  // 已弃用的筛选组件（保留参考，未使用）
  Widget _buildTypeFilters() {
    return PetAppComponents.buildCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '记录类型',
            style: const TextStyle(
              fontSize: AppTheme.fontSizeL,
              fontWeight: FontWeight.bold,
              color: AppTheme.textPrimaryColor,
            ),
          ),
          const SizedBox(height: AppTheme.spacingM),

          Wrap(
            spacing: AppTheme.spacingS,
            runSpacing: AppTheme.spacingS,
            children: models.HealthRecordType.values.map((t) {
              final bool isOn = _activeTypeFilters.contains(t);
              final color = models.HealthRecordUtils.getTypeColor(t);
              return FilterChip(
                label: Text(models.HealthRecordUtils.getTypeLabel(t)),
                selected: isOn,
                onSelected: (v) => setState(() {
                  if (v) {
                    _activeTypeFilters.add(t);
                  } else {
                    _activeTypeFilters.remove(t);
                  }
                }),
                backgroundColor: Colors.grey[100],
                selectedColor: color.withValues(alpha: 0.15),
                checkmarkColor: color,
                labelStyle: TextStyle(
                  color: isOn ? color : AppTheme.textSecondaryColor,
                  fontWeight: isOn ? FontWeight.w700 : FontWeight.w500,
                ),
                side: BorderSide(
                  color: isOn
                      ? color.withValues(alpha: 0.35)
                      : AppTheme.dividerColor,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18),
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }

  // 已弃用的搜索日期组件（保留参考，未使用）
  Widget _buildSearchAndDateBar() {
    return PetAppComponents.buildCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: _searchController,
                  decoration: InputDecoration(
                    isDense: true,
                    contentPadding: const EdgeInsets.symmetric(
                      vertical: 10,
                      horizontal: 12,
                    ),
                    hintText: '搜索标题/备注',
                    prefixIcon: const Icon(Icons.search, size: 18),
                    prefixIconConstraints: const BoxConstraints(
                      minWidth: 36,
                      minHeight: 36,
                    ),
                    suffixIcon: _searchController.text.isNotEmpty
                        ? IconButton(
                            icon: const Icon(Icons.clear, size: 18),
                            onPressed: () =>
                                setState(() => _searchController.clear()),
                          )
                        : null,
                  ),
                  onChanged: (_) => setState(() {}),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildHealthRecordsList() {
    final list = _applySearchFilters(_filteredHealthRecords());

    if (list.isEmpty) {
      return PetAppComponents.buildCard(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: AppTheme.spacingL),
          child: Center(
            child: Column(
              children: [
                Icon(
                  Icons.health_and_safety_outlined,
                  size: 48,
                  color: AppTheme.textSecondaryColor,
                ),
                const SizedBox(height: AppTheme.spacingM),
                Text(
                  '暂无健康记录',
                  style: TextStyle(
                    color: AppTheme.textSecondaryColor,
                    fontSize: AppTheme.fontSizeL,
                  ),
                ),
                const SizedBox(height: AppTheme.spacingS),
                Text(
                  '点击右下角按钮添加第一条记录',
                  style: TextStyle(
                    color: AppTheme.textSecondaryColor,
                    fontSize: AppTheme.fontSizeS,
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '健康记录',
          style: const TextStyle(
            fontSize: AppTheme.fontSizeL,
            fontWeight: FontWeight.bold,
            color: AppTheme.textPrimaryColor,
          ),
        ),
        const SizedBox(height: AppTheme.spacingM),

        ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: list.length,
          separatorBuilder: (_, __) =>
              const SizedBox(height: AppTheme.spacingS),
          itemBuilder: (_, i) => _healthRecordTile(list[i]),
        ),
      ],
    );
  }

  Widget _buildHealthRecordsListSliver() {
    final list = _applySearchFilters(_filteredHealthRecords());

    if (list.isEmpty) {
      return SliverToBoxAdapter(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppTheme.spacingL),
          child: PetAppComponents.buildCard(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: AppTheme.spacingL),
              child: Center(
                child: Column(
                  children: [
                    Icon(
                      Icons.health_and_safety_outlined,
                      size: 48,
                      color: AppTheme.textSecondaryColor,
                    ),
                    const SizedBox(height: AppTheme.spacingM),
                    Text(
                      '暂无健康记录',
                      style: TextStyle(
                        color: AppTheme.textSecondaryColor,
                        fontSize: AppTheme.fontSizeL,
                      ),
                    ),
                    const SizedBox(height: AppTheme.spacingS),
                    Text(
                      '点击右下角按钮添加第一条记录',
                      style: TextStyle(
                        color: AppTheme.textSecondaryColor,
                        fontSize: AppTheme.fontSizeS,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      );
    }

    return SliverList(
      delegate: SliverChildBuilderDelegate((context, index) {
        if (index == 0) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: AppTheme.spacingL),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '健康记录',
                  style: const TextStyle(
                    fontSize: AppTheme.fontSizeL,
                    fontWeight: FontWeight.bold,
                    color: AppTheme.textPrimaryColor,
                  ),
                ),
                const SizedBox(height: AppTheme.spacingM),
              ],
            ),
          );
        }
        final recordIndex = index - 1;
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppTheme.spacingL),
          child: _healthRecordTile(list[recordIndex]),
        );
      }, childCount: list.length + 1),
    );
  }

  Widget _buildHealthRecordsTimeline() {
    final list = _applySearchFilters(_filteredHealthRecords());

    if (list.isEmpty) {
      return PetAppComponents.buildCard(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: AppTheme.spacingL),
          child: Center(
            child: Column(
              children: [
                Icon(
                  Icons.timeline_outlined,
                  size: 48,
                  color: AppTheme.textSecondaryColor,
                ),
                const SizedBox(height: AppTheme.spacingM),
                Text(
                  '暂无健康记录',
                  style: TextStyle(
                    color: AppTheme.textSecondaryColor,
                    fontSize: AppTheme.fontSizeL,
                  ),
                ),
                const SizedBox(height: AppTheme.spacingS),
                Text(
                  '点击右下角按钮添加第一条记录',
                  style: TextStyle(
                    color: AppTheme.textSecondaryColor,
                    fontSize: AppTheme.fontSizeS,
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '健康记录时间线',
          style: const TextStyle(
            fontSize: AppTheme.fontSizeL,
            fontWeight: FontWeight.bold,
            color: AppTheme.textPrimaryColor,
          ),
        ),
        const SizedBox(height: AppTheme.spacingM),
        ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: list.length,
          separatorBuilder: (_, __) =>
              const SizedBox(height: AppTheme.spacingS),
          itemBuilder: (_, i) => _healthRecordTile(list[i]),
        ),
      ],
    );
  }

  Widget _buildHealthRecordsTimelineSliver() {
    final list = _applySearchFilters(_filteredHealthRecords());
    if (list.isEmpty) {
      return _buildHealthRecordsListSliver();
    }

    final Map<String, List<models.HealthRecord>> grouped = {};
    for (final r in list) {
      final key = '${r.date.year}-${r.date.month.toString().padLeft(2, '0')}';
      grouped.putIfAbsent(key, () => []).add(r);
    }

    final keys = grouped.keys.toList()
      ..sort((a, b) => _sortDesc ? b.compareTo(a) : a.compareTo(b));

    return SliverList(
      delegate: SliverChildBuilderDelegate((context, index) {
        final keyIndex = index ~/ 2;
        final isDateHeader = index % 2 == 0;

        if (keyIndex >= keys.length) return null;

        final key = keys[keyIndex];
        final records = grouped[key]!;

        if (isDateHeader) {
          return Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: AppTheme.spacingL,
              vertical: AppTheme.spacingS,
            ),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                color: AppTheme.primaryColor.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(16),
                border: Border.all(
                  color: AppTheme.primaryColor.withValues(alpha: 0.3),
                ),
              ),
              child: Text(
                key,
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  color: AppTheme.primaryColor,
                  fontSize: AppTheme.fontSizeS,
                ),
              ),
            ),
          );
        } else {
          return Column(
            children: [
              for (int i = 0; i < records.length; i++) ...[
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: AppTheme.spacingL,
                  ),
                  child: _healthRecordTile(records[i]),
                ),
                if (i < records.length - 1)
                  const SizedBox(height: AppTheme.spacingS),
              ],
              const SizedBox(height: AppTheme.spacingM),
            ],
          );
        }
      }, childCount: keys.length * 2),
    );
  }

  // 已弃用的底部汇总（保留参考，未使用）
  Widget _buildBottomSummaryBar() {
    final all = _applySearchFilters(_filteredHealthRecords());
    return Align(
      alignment: Alignment.centerLeft,
      child: Text(
        '共 ${all.length} 条记录',
        style: TextStyle(color: AppTheme.textSecondaryColor),
      ),
    );
  }

  // ---------- 健康记录：逻辑与UI ----------

  List<models.HealthRecord> _filteredHealthRecords() {
    List<models.HealthRecord> base = _healthRecords
        .where((r) => r.petId == _selectedPetIdForHealth)
        .toList();
    base.sort(
      (a, b) => _sortDesc ? b.date.compareTo(a.date) : a.date.compareTo(b.date),
    );
    if (_activeTypeFilters.isEmpty) return base;
    return base.where((r) => _activeTypeFilters.contains(r.type)).toList();
  }

  List<models.HealthRecord> _applySearchFilters(
    List<models.HealthRecord> list,
  ) {
    Iterable<models.HealthRecord> it = list;
    final q = _searchController.text.trim();
    if (q.isNotEmpty) {
      it = it.where((r) => r.title.contains(q) || (r.notes ?? '').contains(q));
    }
    return it.toList();
  }

  Widget _healthRecordTile(models.HealthRecord record) {
    final color = models.HealthRecordUtils.getTypeColor(record.type);
    final icon = models.HealthRecordUtils.getTypeIcon(record.type);
    final daysAgo = DateTime.now().difference(record.date).inDays;
    final gradientColors = models.HealthRecordUtils.getTypeGradientColors(
      record.type,
    );
    final lightColor = models.HealthRecordUtils.getTypeLightColor(record.type);

    return Container(
      margin: const EdgeInsets.only(bottom: AppTheme.spacingS),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.white, lightColor.withValues(alpha: 0.3)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: color.withValues(alpha: 0.1), width: 1.5),
        boxShadow: [
          BoxShadow(
            color: color.withValues(alpha: 0.1),
            blurRadius: 16,
            offset: const Offset(0, 4),
          ),
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () {},
          borderRadius: BorderRadius.circular(14),
          child: Padding(
            padding: const EdgeInsets.all(AppTheme.spacingM),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // 头部：类型标签和时间
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors:
                              models.HealthRecordUtils.getTypeGradientColors(
                                record.type,
                              ),
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [
                          BoxShadow(
                            color: color.withValues(alpha: 0.3),
                            blurRadius: 6,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            padding: const EdgeInsets.all(3),
                            decoration: BoxDecoration(
                              color: Colors.white.withValues(alpha: 0.2),
                              borderRadius: BorderRadius.circular(6),
                            ),
                            child: Icon(icon, color: Colors.white, size: 12),
                          ),
                          const SizedBox(width: 6),
                          Text(
                            models.HealthRecordUtils.getTypeLabel(record.type),
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: AppTheme.fontSizeXS,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Spacer(),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        gradient: daysAgo <= 7
                            ? LinearGradient(
                                colors: [
                                  AppTheme.successColor,
                                  AppTheme.successColor.withValues(alpha: 0.8),
                                ],
                              )
                            : LinearGradient(
                                colors: [
                                  AppTheme.textSecondaryColor.withValues(
                                    alpha: 0.1,
                                  ),
                                  AppTheme.textSecondaryColor.withValues(
                                    alpha: 0.05,
                                  ),
                                ],
                              ),
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: daysAgo <= 7
                              ? AppTheme.successColor.withValues(alpha: 0.3)
                              : AppTheme.textSecondaryColor.withValues(
                                  alpha: 0.2,
                                ),
                        ),
                        boxShadow: daysAgo <= 7
                            ? [
                                BoxShadow(
                                  color: AppTheme.successColor.withValues(
                                    alpha: 0.2,
                                  ),
                                  blurRadius: 4,
                                  offset: const Offset(0, 1),
                                ),
                              ]
                            : null,
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            daysAgo <= 7
                                ? Icons.schedule_rounded
                                : Icons.history_rounded,
                            color: daysAgo <= 7
                                ? Colors.white
                                : AppTheme.textSecondaryColor,
                            size: 12,
                          ),
                          const SizedBox(width: 4),
                          Text(
                            daysAgo == 0
                                ? '今天'
                                : daysAgo == 1
                                ? '昨天'
                                : '$daysAgo天前',
                            style: TextStyle(
                              color: daysAgo <= 7
                                  ? Colors.white
                                  : AppTheme.textSecondaryColor,
                              fontSize: AppTheme.fontSizeXS,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: AppTheme.spacingS),

                // 标题
                Text(
                  record.title,
                  style: const TextStyle(
                    fontWeight: FontWeight.w800,
                    fontSize: AppTheme.fontSizeM,
                    color: AppTheme.textPrimaryColor,
                  ),
                ),

                // 类型差异化详细信息（包含时间）
                const SizedBox(height: 6),
                _buildTypeSpecificDetails(record),

                // 无底部二维码/身份码区域
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTypeSpecificDetails(models.HealthRecord record) {
    final color = models.HealthRecordUtils.getTypeColor(record.type);

    switch (record.type) {
      case models.HealthRecordType.vaccination:
        return _buildTypeDetailCard(
          color: color,
          icon: Icons.vaccines_rounded,
          title: '疫苗信息',
          children: [
            _buildDetailRow(
              Icons.event_rounded,
              '接种时间',
              _formatDate(record.date),
            ),
            _buildDetailRow(Icons.vaccines_rounded, '疫苗名称', record.title),
            if ((record.clinic ?? '').isNotEmpty)
              _buildDetailRow(
                Icons.location_on_rounded,
                '接种地点',
                record.clinic!,
              ),
            if ((record.notes ?? '').isNotEmpty)
              _buildDetailRow(Icons.info_rounded, '备注', record.notes!),
          ],
        );

      case models.HealthRecordType.deworming:
        return _buildTypeDetailCard(
          color: color,
          icon: Icons.pets_rounded,
          title: '驱虫信息',
          children: [
            _buildDetailRow(
              Icons.event_rounded,
              '驱虫时间',
              _formatDate(record.date),
            ),
            _buildDetailRow(Icons.medication_rounded, '驱虫类型', record.title),
            if ((record.clinic ?? '').isNotEmpty)
              _buildDetailRow(
                Icons.location_on_rounded,
                '驱虫地点',
                record.clinic!,
              ),
            if ((record.notes ?? '').isNotEmpty)
              _buildDetailRow(Icons.description_rounded, '药品说明', record.notes!),
          ],
        );

      case models.HealthRecordType.vetVisit:
        return _buildTypeDetailCard(
          color: color,
          icon: Icons.medical_services_rounded,
          title: '体检信息',
          children: [
            _buildDetailRow(
              Icons.event_rounded,
              '体检时间',
              _formatDate(record.date),
            ),
            _buildDetailRow(Icons.assignment_rounded, '检查项目', record.title),
            if ((record.clinic ?? '').isNotEmpty)
              _buildDetailRow(
                Icons.local_hospital_rounded,
                '医疗机构',
                record.clinic!,
              ),
            if ((record.notes ?? '').isNotEmpty)
              _buildDetailRow(
                Icons.record_voice_over_rounded,
                '医生建议',
                record.notes!,
              ),
          ],
        );

      case models.HealthRecordType.weight:
        return _buildTypeDetailCard(
          color: color,
          icon: Icons.monitor_weight_rounded,
          title: '体重记录',
          children: [
            _buildDetailRow(
              Icons.event_rounded,
              '记录时间',
              _formatDate(record.date),
            ),
            _buildDetailRow(
              Icons.trending_up_rounded,
              '当前体重',
              record.weight != null ? '${record.weight} kg' : '未记录',
            ),
            if ((record.clinic ?? '').isNotEmpty)
              _buildDetailRow(
                Icons.location_on_rounded,
                '测量地点',
                record.clinic!,
              ),
            if ((record.notes ?? '').isNotEmpty)
              _buildDetailRow(Icons.notes_rounded, '备注', record.notes!),
          ],
        );

      case models.HealthRecordType.grooming:
        return _buildTypeDetailCard(
          color: color,
          icon: Icons.brush_rounded,
          title: '美容信息',
          children: [
            _buildDetailRow(
              Icons.event_rounded,
              '美容时间',
              _formatDate(record.date),
            ),
            _buildDetailRow(Icons.content_cut_rounded, '美容项目', record.title),
            if ((record.clinic ?? '').isNotEmpty)
              _buildDetailRow(Icons.store_rounded, '美容机构', record.clinic!),
            if ((record.notes ?? '').isNotEmpty)
              _buildDetailRow(Icons.notes_rounded, '服务详情', record.notes!),
          ],
        );
    }
  }

  Widget _buildTypeDetailCard({
    required Color color,
    required IconData icon,
    required String title,
    required List<Widget> children,
  }) {
    if (children.isEmpty) return const SizedBox.shrink();

    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(top: AppTheme.spacingS),
      padding: const EdgeInsets.all(AppTheme.spacingM),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            color.withValues(alpha: 0.08),
            color.withValues(alpha: 0.03),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: color.withValues(alpha: 0.2), width: 1),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 标题行
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(6),
                decoration: BoxDecoration(
                  color: color.withValues(alpha: 0.15),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(icon, size: 16, color: color),
              ),
              const SizedBox(width: AppTheme.spacingS),
              Text(
                title,
                style: TextStyle(
                  color: color,
                  fontSize: AppTheme.fontSizeM,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
          const SizedBox(height: AppTheme.spacingS),
          // 详细信息
          ...children,
        ],
      ),
    );
  }

  Widget _buildDetailRow(IconData icon, String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: AppTheme.spacingS),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(4),
            decoration: BoxDecoration(
              color: AppTheme.textSecondaryColor.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(6),
            ),
            child: Icon(icon, size: 14, color: AppTheme.textSecondaryColor),
          ),
          const SizedBox(width: AppTheme.spacingS),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: TextStyle(
                    color: AppTheme.textSecondaryColor,
                    fontSize: AppTheme.fontSizeXS,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  value,
                  style: const TextStyle(
                    color: AppTheme.textPrimaryColor,
                    fontSize: AppTheme.fontSizeS,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  models.Pet? _currentPet() {
    if (_selectedPetIdForHealth == null || _pets.isEmpty) return null;
    try {
      return _pets.firstWhere((p) => p.id == _selectedPetIdForHealth!);
    } catch (e) {
      return _pets.isNotEmpty ? _pets.first : null;
    }
  }

  // 已弃用的小徽标（保留参考，未使用）
  Widget _miniBadge(String text, Color color) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.12),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Text(
        text,
        style: TextStyle(
          color: color,
          fontSize: AppTheme.fontSizeXS,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }

  Future<void> _openAddHealthRecordSheet({
    models.HealthRecordType? presetType,
  }) async {
    final rec = await navigateToAddHealthRecordPage(
      context,
      pets: _pets,
      presetPetId: _selectedPetIdForHealth,
      presetType: presetType,
    );
    if (rec == null) return;

    // 重新加载健康记录数据（优先接口）
    final String? petId =
        _selectedPetIdForHealth ?? (_pets.isNotEmpty ? _pets.first.id : null);
    final records = petId == null
        ? <models.HealthRecord>[]
        : await _loadHealthRecordsBySelectedTypesFromApi(petId);
    setState(() {
      _healthRecords = records;
    });
    _autoSelectFilterByType(rec.type);
  }

  String _formatDate(DateTime d) {
    return '${d.year}-${d.month.toString().padLeft(2, '0')}-${d.day.toString().padLeft(2, '0')}';
  }
}

/// 简单的信号量实现，用于限制并发请求数量
class _RequestSemaphore {
  final int _maxCount;
  int _currentCount;
  final List<Completer<void>> _waiters = [];

  _RequestSemaphore(this._maxCount) : _currentCount = _maxCount;

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

/// 构建返回按钮（自适应平台，仅在可返回时显示）
Widget _buildBackButton(BuildContext context) {
  final canPop = Navigator.of(context).canPop();
  if (!canPop) {
    // 保持布局占位，避免居中组件偏移
    return const SizedBox(width: 40, height: 40);
  }
  final IconData icon = Platform.isIOS
      ? Icons.arrow_back_ios_new_rounded
      : Icons.arrow_back_rounded;
  return Material(
    color: Colors.transparent,
    child: InkWell(
      onTap: () => Navigator.of(context).maybePop(),
      borderRadius: BorderRadius.circular(AppTheme.borderRadiusMedium),
      child: Container(
        width: 40,
        height: 40,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Colors.white.withValues(alpha: 0.14),
          borderRadius: BorderRadius.circular(AppTheme.borderRadiusMedium),
        ),
        child: Icon(icon, color: Colors.white, size: 18, semanticLabel: '返回'),
      ),
    ),
  );
}
