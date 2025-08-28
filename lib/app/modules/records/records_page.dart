import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';
import 'package:flutter/services.dart';
import 'package:qr_flutter/qr_flutter.dart';
import '../../core/components.dart';
import '../../core/models.dart' as models;
import '../../services/pet_service.dart';
import '../../services/database_service.dart';
import '../../services/record_service.dart';
import '../pet/pet_components.dart';
import 'add_health_record_sheet.dart';

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
  DateTimeRange? _dateRange;
  final TextEditingController _searchController = TextEditingController();

  // 服务实例
  final PetService _petService = PetService();
  final DatabaseService _databaseService = DatabaseService();
  final RecordService _recordService = RecordService();

  // 动态数据
  List<models.Pet> _pets = [];
  List<models.HealthRecord> _healthRecords = [];
  bool _isLoading = true;
  String? _errorMessage;

  // 健康记录：状态与筛选
  String? _selectedPetIdForHealth;
  final Set<models.HealthRecordType> _activeTypeFilters = {};

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

  /// 从数据库加载健康记录
  Future<List<models.HealthRecord>> _loadHealthRecords() async {
    try {
      final db = await _databaseService.database;
      final List<Map<String, dynamic>> maps = await db.query(
        'health_records',
        orderBy: 'date DESC',
      );

      return List.generate(maps.length, (i) {
        final map = maps[i];
        return models.HealthRecord(
          id: map['id'] as String,
          petId: map['pet_id'] as String,
          date: DateTime.parse(map['date'] as String),
          type: models.HealthRecordType.values.firstWhere(
            (e) => e.toString().split('.').last == map['type'],
            orElse: () => models.HealthRecordType.vetVisit,
          ),
          title: map['title'] as String,
          notes: map['notes'] as String?,
          weight: (map['weight'] as num?)?.toDouble(),
          clinic: map['clinic'] as String?,
        );
      });
    } catch (e) {
      debugPrint('加载健康记录失败: $e');
      return [];
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
              models.HealthRecordType.medication,
            }
          : _activeTypeFilters;

      final List<Future<List<models.HealthRecord>>> tasks = [];
      for (final t in selected) {
        switch (t) {
          case models.HealthRecordType.vaccination:
            tasks.add(
              _recordService.getVaccinationRecords(petId, skip: 0, size: 100),
            );
            break;
          case models.HealthRecordType.deworming:
            tasks.add(
              _recordService.getDewormingRecords(petId, skip: 0, size: 100),
            );
            break;
          case models.HealthRecordType.vetVisit:
            tasks.add(
              _recordService.getExaminationRecords(petId, skip: 0, size: 100),
            );
            break;
          case models.HealthRecordType.weight:
            tasks.add(
              _recordService.getWeightRecords(petId, skip: 0, size: 100),
            );
            break;
          case models.HealthRecordType.grooming:
            tasks.add(
              _recordService.getGroomingRecords(petId, skip: 0, size: 100),
            );
            break;
          case models.HealthRecordType.medication:
            tasks.add(
              _recordService.getOtherHealthRecords(petId, skip: 0, size: 100),
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
      // 接口失败时退回本地
      debugPrint('接口失败: $e');
      return _loadHealthRecords();
    }
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.backgroundColor,
      appBar: AppBar(
        title: const Text(
          '健康档案',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: AppTheme.fontSizeXL,
          ),
        ),
        backgroundColor: Colors.transparent,
        foregroundColor: AppTheme.textPrimaryColor,
        elevation: 0,
        actions: [
          IconButton(
            tooltip: _isTimelineView ? '列表视图' : '时间线视图',
            onPressed: () => setState(() => _isTimelineView = !_isTimelineView),
            icon: Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: _isTimelineView
                    ? AppTheme.primaryColor.withValues(alpha: 0.1)
                    : Colors.transparent,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Icon(
                _isTimelineView ? Icons.view_list : Icons.timeline,
                color: _isTimelineView
                    ? AppTheme.primaryColor
                    : AppTheme.textSecondaryColor,
                size: 20,
              ),
            ),
          ),
          IconButton(
            tooltip: '排序',
            onPressed: () => setState(() => _sortDesc = !_sortDesc),
            icon: Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: AppTheme.primaryColor.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Icon(
                _sortDesc ? Icons.south : Icons.north,
                color: AppTheme.primaryColor,
                size: 20,
              ),
            ),
          ),
          IconButton(
            tooltip: '新增记录',
            onPressed: _openAddHealthRecordSheet,
            icon: Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    AppTheme.primaryColor,
                    AppTheme.primaryColor.withValues(alpha: 0.8),
                  ],
                ),
                borderRadius: BorderRadius.circular(8),
                boxShadow: [
                  BoxShadow(
                    color: AppTheme.primaryColor.withValues(alpha: 0.3),
                    blurRadius: 8,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: const Icon(Icons.add, color: Colors.white, size: 20),
            ),
          ),
        ],
      ),
      body: _isLoading
          ? const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircularProgressIndicator(),
                  SizedBox(height: AppTheme.spacingM),
                  Text('加载中...'),
                ],
              ),
            )
          : _errorMessage != null
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.error_outline,
                    size: 48,
                    color: AppTheme.errorColor,
                  ),
                  const SizedBox(height: AppTheme.spacingM),
                  Text(
                    _errorMessage!,
                    style: TextStyle(color: AppTheme.errorColor),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: AppTheme.spacingM),
                  ElevatedButton(onPressed: _loadData, child: const Text('重试')),
                ],
              ),
            )
          : _pets.isEmpty
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.pets_outlined,
                    size: 48,
                    color: AppTheme.textSecondaryColor,
                  ),
                  const SizedBox(height: AppTheme.spacingM),
                  Text(
                    '还没有添加宠物',
                    style: TextStyle(
                      color: AppTheme.textSecondaryColor,
                      fontSize: AppTheme.fontSizeL,
                    ),
                  ),
                  const SizedBox(height: AppTheme.spacingS),
                  Text(
                    '请先添加宠物后再查看健康记录',
                    style: TextStyle(
                      color: AppTheme.textSecondaryColor,
                      fontSize: AppTheme.fontSizeS,
                    ),
                  ),
                ],
              ),
            )
          : Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [AppTheme.backgroundColor, Colors.white],
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
                      child: _buildCompactTopBar(),
                    ),
                  ),

                  // 搜索和筛选区域
                  SliverToBoxAdapter(
                    child: Container(
                      margin: const EdgeInsets.symmetric(
                        horizontal: AppTheme.spacingM,
                        vertical: AppTheme.spacingS,
                      ),
                      child: _buildQuickFilters(),
                    ),
                  ),

                  // 统计信息
                  SliverToBoxAdapter(
                    child: Container(
                      margin: const EdgeInsets.symmetric(
                        horizontal: AppTheme.spacingM,
                        vertical: AppTheme.spacingS,
                      ),
                      child: _buildStatisticsCard(),
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
      floatingActionButton: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              AppTheme.primaryColor,
              AppTheme.primaryColor.withValues(alpha: 0.8),
            ],
          ),
          borderRadius: BorderRadius.circular(28),
          boxShadow: [
            BoxShadow(
              color: AppTheme.primaryColor.withValues(alpha: 0.3),
              blurRadius: 12,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: FloatingActionButton(
          onPressed: _openAddHealthRecordSheet,
          backgroundColor: Colors.transparent,
          elevation: 0,
          child: const Icon(Icons.add, color: Colors.white, size: 28),
        ),
      ),
    );
  }

  // 顶部紧凑栏：左侧宠物选择器，下方为轻量搜索框
  Widget _buildCompactTopBar() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        // 宠物选择器（保持紧凑卡片样式）
        PetSelector(
          pets: _pets,
          selectedPetId: _selectedPetIdForHealth ?? '',
          onPetSelected: (petId) =>
              setState(() => _selectedPetIdForHealth = petId),
          showAddButton: false,
        ),
        const SizedBox(height: AppTheme.spacingS),
        // 轻量搜索框（比原来更扁平）
        _buildModernSearchBar(),
      ],
    );
  }

  Widget _buildModernSearchBar() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 8,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: '搜索健康记录...',
                hintStyle: TextStyle(
                  color: AppTheme.textSecondaryColor.withValues(alpha: 0.6),
                ),
                prefixIcon: Icon(
                  Icons.search,
                  color: AppTheme.textSecondaryColor,
                  size: 20,
                ),
                border: InputBorder.none,
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 14,
                  vertical: 12,
                ),
              ),
              onChanged: (_) => setState(() {}),
            ),
          ),
          if (_searchController.text.isNotEmpty)
            IconButton(
              icon: Icon(
                Icons.clear,
                color: AppTheme.textSecondaryColor,
                size: 20,
              ),
              onPressed: () => setState(() => _searchController.clear()),
            ),
          IconButton(
            padding: const EdgeInsets.only(right: 8),
            icon: Icon(
              Icons.date_range,
              color: AppTheme.primaryColor,
              size: 20,
            ),
            onPressed: _pickDateRange,
          ),
        ],
      ),
    );
  }

  Widget _buildQuickFilters() {
    final all = _applySearchAndDateFilters(_filteredHealthRecords());
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AppTheme.spacingM,
        vertical: AppTheme.spacingS,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 8,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.filter_list, color: AppTheme.primaryColor, size: 16),
              const SizedBox(width: 6),
              Text(
                '快速筛选',
                style: TextStyle(
                  color: AppTheme.textPrimaryColor,
                  fontWeight: FontWeight.w600,
                  fontSize: AppTheme.fontSizeM,
                ),
              ),
              const Spacer(),
              if (_activeTypeFilters.isNotEmpty || _dateRange != null)
                TextButton(
                  onPressed: () {
                    setState(() {
                      _activeTypeFilters.clear();
                      _dateRange = null;
                    });
                  },
                  child: Text(
                    '清空',
                    style: TextStyle(
                      color: AppTheme.warningColor,
                      fontSize: AppTheme.fontSizeS,
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
              return GestureDetector(
                onTap: () async {
                  setState(() {
                    if (isSelected) {
                      _activeTypeFilters.remove(type);
                    } else {
                      _activeTypeFilters.add(type);
                    }
                  });
                  final String? petId = _selectedPetIdForHealth;
                  if (petId != null) {
                    final list = await _loadHealthRecordsBySelectedTypesFromApi(
                      petId,
                    );
                    if (mounted) setState(() => _healthRecords = list);
                  }
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 5,
                  ),
                  decoration: BoxDecoration(
                    color: isSelected
                        ? color.withValues(alpha: 0.15)
                        : Colors.grey.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      color: isSelected
                          ? color.withValues(alpha: 0.3)
                          : Colors.transparent,
                    ),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        models.HealthRecordUtils.getTypeIcon(type),
                        size: 14,
                        color: isSelected ? color : AppTheme.textSecondaryColor,
                      ),
                      const SizedBox(width: 3),
                      Text(
                        models.HealthRecordUtils.getTypeLabel(type),
                        style: TextStyle(
                          color: isSelected
                              ? color
                              : AppTheme.textSecondaryColor,
                          fontSize: AppTheme.fontSizeS,
                          fontWeight: isSelected
                              ? FontWeight.w600
                              : FontWeight.normal,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }

  Widget _buildStatisticsCard() {
    final all = _applySearchAndDateFilters(_filteredHealthRecords());
    final currentPet = _currentPet();

    return Container(
      padding: const EdgeInsets.all(AppTheme.spacingM),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            AppTheme.primaryColor.withValues(alpha: 0.1),
            AppTheme.primaryColor.withValues(alpha: 0.05),
          ],
        ),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: AppTheme.primaryColor.withValues(alpha: 0.2)),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: AppTheme.primaryColor.withValues(alpha: 0.15),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(
                  Icons.analytics,
                  color: AppTheme.primaryColor,
                  size: 20,
                ),
              ),
              const SizedBox(width: AppTheme.spacingS),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${currentPet?.name ?? '宠物'}的健康档案',
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
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 4,
                ),
                decoration: BoxDecoration(
                  color: AppTheme.successColor.withValues(alpha: 0.15),
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
                      size: 14,
                    ),
                    const SizedBox(width: 3),
                    Text(
                      '健康',
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
          ),
          if (all.isNotEmpty) ...[
            const SizedBox(height: AppTheme.spacingS),
            Row(
              children: [
                Expanded(
                  child: _buildStatItem(
                    '本月',
                    '${all.where((r) => r.date.month == DateTime.now().month).length}',
                    Icons.calendar_today,
                  ),
                ),
                Expanded(
                  child: _buildStatItem(
                    '疫苗',
                    '${all.where((r) => r.type == models.HealthRecordType.vaccination).length}',
                    Icons.vaccines,
                  ),
                ),
                Expanded(
                  child: _buildStatItem(
                    '体检',
                    '${all.where((r) => r.type == models.HealthRecordType.vetVisit).length}',
                    Icons.medical_services,
                  ),
                ),
              ],
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildStatItem(String label, String value, IconData icon) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AppTheme.spacingM,
        vertical: AppTheme.spacingS,
      ),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.7),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          Icon(icon, color: AppTheme.primaryColor, size: 18),
          const SizedBox(height: 2),
          Text(
            value,
            style: const TextStyle(
              fontSize: AppTheme.fontSizeL,
              fontWeight: FontWeight.bold,
              color: AppTheme.textPrimaryColor,
            ),
          ),
          Text(
            label,
            style: TextStyle(
              fontSize: AppTheme.fontSizeXS,
              color: AppTheme.textSecondaryColor,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRecordsHeader() {
    final all = _applySearchAndDateFilters(_filteredHealthRecords());
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
              const SizedBox(width: AppTheme.spacingM),
              OutlinedButton.icon(
                style: OutlinedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 10,
                  ),
                  visualDensity: VisualDensity.compact,
                ),
                onPressed: _pickDateRange,
                icon: const Icon(Icons.date_range, size: 18),
                label: Text(
                  _dateRange == null
                      ? '选择日期'
                      : '${_formatDate(_dateRange!.start)} ~ ${_formatDate(_dateRange!.end)}',
                ),
              ),
            ],
          ),
          if (_dateRange != null)
            Padding(
              padding: const EdgeInsets.only(top: AppTheme.spacingS),
              child: Align(
                alignment: Alignment.centerRight,
                child: TextButton.icon(
                  icon: const Icon(Icons.close, size: 16),
                  label: const Text('清除日期'),
                  onPressed: () => setState(() => _dateRange = null),
                ),
              ),
            ),
        ],
      ),
    );
  }

  Future<void> _pickDateRange() async {
    final now = DateTime.now();
    final picked = await showDateRangePicker(
      context: context,
      firstDate: DateTime(now.year - 10),
      lastDate: DateTime(now.year + 10),
      initialDateRange: _dateRange,
    );
    if (picked != null) {
      setState(() => _dateRange = picked);
    }
  }

  Widget _buildHealthRecordsList() {
    final list = _applySearchAndDateFilters(_filteredHealthRecords());

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
    final list = _applySearchAndDateFilters(_filteredHealthRecords());

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
            child: _healthRecordTile(list[0]),
          );
        }
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppTheme.spacingL),
          child: Column(
            children: [
              const SizedBox(height: AppTheme.spacingS),
              _healthRecordTile(list[index]),
            ],
          ),
        );
      }, childCount: list.length),
    );
  }

  Widget _buildHealthRecordsTimeline() {
    final list = _applySearchAndDateFilters(_filteredHealthRecords());
    if (list.isEmpty) {
      return _buildHealthRecordsList();
    }

    final Map<String, List<models.HealthRecord>> grouped = {};
    for (final r in list) {
      final key = '${r.date.year}-${r.date.month.toString().padLeft(2, '0')}';
      grouped.putIfAbsent(key, () => []).add(r);
    }

    final keys = grouped.keys.toList()
      ..sort((a, b) => _sortDesc ? b.compareTo(a) : a.compareTo(b));

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        for (final k in keys) ...[
          Padding(
            padding: const EdgeInsets.only(bottom: AppTheme.spacingS),
            child: Text(
              k,
              style: const TextStyle(
                fontWeight: FontWeight.w700,
                color: AppTheme.textPrimaryColor,
              ),
            ),
          ),
          ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: grouped[k]!.length,
            separatorBuilder: (_, __) =>
                const SizedBox(height: AppTheme.spacingS),
            itemBuilder: (_, i) => _healthRecordTile(grouped[k]![i]),
          ),
          const SizedBox(height: AppTheme.spacingM),
        ],
      ],
    );
  }

  Widget _buildHealthRecordsTimelineSliver() {
    final list = _applySearchAndDateFilters(_filteredHealthRecords());
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

  Widget _buildBottomSummaryBar() {
    final all = _applySearchAndDateFilters(_filteredHealthRecords());
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

  List<models.HealthRecord> _applySearchAndDateFilters(
    List<models.HealthRecord> list,
  ) {
    Iterable<models.HealthRecord> it = list;
    final q = _searchController.text.trim();
    if (q.isNotEmpty) {
      it = it.where((r) => r.title.contains(q) || (r.notes ?? '').contains(q));
    }
    if (_dateRange != null) {
      it = it.where(
        (r) =>
            !r.date.isBefore(_dateRange!.start) &&
            !r.date.isAfter(_dateRange!.end),
      );
    }
    return it.toList();
  }

  Widget _healthRecordTile(models.HealthRecord record) {
    final color = models.HealthRecordUtils.getTypeColor(record.type);
    final icon = models.HealthRecordUtils.getTypeIcon(record.type);
    final daysAgo = DateTime.now().difference(record.date).inDays;

    return Container(
      margin: const EdgeInsets.only(bottom: AppTheme.spacingS),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.06),
            blurRadius: 12,
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
                        horizontal: 10,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            color.withValues(alpha: 0.15),
                            color.withValues(alpha: 0.1),
                          ],
                        ),
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(color: color.withValues(alpha: 0.3)),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(icon, color: color, size: 14),
                          const SizedBox(width: 4),
                          Text(
                            models.HealthRecordUtils.getTypeLabel(record.type),
                            style: TextStyle(
                              color: color,
                              fontSize: AppTheme.fontSizeXS,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Spacer(),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 6,
                        vertical: 3,
                      ),
                      decoration: BoxDecoration(
                        color: daysAgo <= 7
                            ? AppTheme.successColor.withValues(alpha: 0.1)
                            : AppTheme.textSecondaryColor.withValues(
                                alpha: 0.1,
                              ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text(
                        daysAgo == 0
                            ? '今天'
                            : daysAgo == 1
                            ? '昨天'
                            : '$daysAgo天前',
                        style: TextStyle(
                          color: daysAgo <= 7
                              ? AppTheme.successColor
                              : AppTheme.textSecondaryColor,
                          fontSize: AppTheme.fontSizeXS,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: AppTheme.spacingS),

                // 标题
                Text(
                  record.title,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: AppTheme.fontSizeM,
                    color: AppTheme.textPrimaryColor,
                  ),
                ),

                const SizedBox(height: 6),

                // 日期和详细信息
                Row(
                  children: [
                    Icon(
                      Icons.event,
                      size: 12,
                      color: AppTheme.textSecondaryColor,
                    ),
                    const SizedBox(width: 3),
                    Text(
                      _formatDate(record.date),
                      style: TextStyle(
                        color: AppTheme.textSecondaryColor,
                        fontSize: AppTheme.fontSizeXS,
                      ),
                    ),
                    if (record.weight != null) ...[
                      const SizedBox(width: AppTheme.spacingS),
                      Icon(
                        Icons.monitor_weight,
                        size: 12,
                        color: AppTheme.textSecondaryColor,
                      ),
                      const SizedBox(width: 3),
                      Text(
                        '${record.weight} kg',
                        style: TextStyle(
                          color: AppTheme.textSecondaryColor,
                          fontSize: AppTheme.fontSizeXS,
                        ),
                      ),
                    ],
                    if ((record.clinic ?? '').isNotEmpty) ...[
                      const SizedBox(width: AppTheme.spacingS),
                      Icon(
                        Icons.local_hospital,
                        size: 12,
                        color: AppTheme.textSecondaryColor,
                      ),
                      const SizedBox(width: 3),
                      Expanded(
                        child: Text(
                          record.clinic!,
                          style: TextStyle(
                            color: AppTheme.textSecondaryColor,
                            fontSize: AppTheme.fontSizeXS,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ],
                ),

                // 类型差异化详细信息
                const SizedBox(height: 6),
                _buildTypeSpecificDetails(record),

                // 备注信息
                if ((record.notes ?? '').isNotEmpty) ...[
                  const SizedBox(height: AppTheme.spacingS),
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(
                      horizontal: AppTheme.spacingM,
                      vertical: AppTheme.spacingS,
                    ),
                    decoration: BoxDecoration(
                      color: AppTheme.backgroundColor,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: AppTheme.dividerColor.withValues(alpha: 0.2),
                      ),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(
                          Icons.note,
                          size: 14,
                          color: AppTheme.textSecondaryColor,
                        ),
                        const SizedBox(width: 6),
                        Expanded(
                          child: Text(
                            record.notes!,
                            style: TextStyle(
                              color: AppTheme.textSecondaryColor,
                              fontSize: AppTheme.fontSizeXS,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],

                // 无底部二维码/身份码区域
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTypeSpecificDetails(models.HealthRecord record) {
    switch (record.type) {
      case models.HealthRecordType.vaccination:
        return _detailGroup([
          _infoRow(Icons.vaccines, '疫苗', record.title),
          if ((record.clinic ?? '').isNotEmpty)
            _infoRow(Icons.place, '地点', record.clinic!),
        ]);
      case models.HealthRecordType.deworming:
        return _detailGroup([
          _infoRow(Icons.pets, '驱虫', record.title),
          if ((record.clinic ?? '').isNotEmpty)
            _infoRow(Icons.place, '地点', record.clinic!),
          if ((record.notes ?? '').isNotEmpty)
            _infoRow(Icons.medication, '药品', record.notes!),
        ]);
      case models.HealthRecordType.vetVisit:
        return _detailGroup([
          _infoRow(Icons.assignment, '项目', record.title),
          if ((record.clinic ?? '').isNotEmpty)
            _infoRow(Icons.local_hospital, '机构', record.clinic!),
          if ((record.notes ?? '').isNotEmpty)
            _infoRow(Icons.comment, '医嘱', record.notes!),
        ]);
      case models.HealthRecordType.weight:
        return _detailGroup([
          _infoRow(
            Icons.monitor_weight,
            '体重',
            record.weight != null ? '${record.weight} kg' : '-',
          ),
        ]);
      case models.HealthRecordType.grooming:
        return _detailGroup([
          _infoRow(Icons.brush, '美容', record.title),
          if ((record.clinic ?? '').isNotEmpty)
            _infoRow(Icons.store, '机构', record.clinic!),
          if ((record.notes ?? '').isNotEmpty)
            _infoRow(Icons.notes, '备注', record.notes!),
        ]);
      case models.HealthRecordType.medication:
        return _detailGroup([
          _infoRow(Icons.healing, '类型', record.title),
          if ((record.notes ?? '').isNotEmpty)
            _infoRow(Icons.list_alt, '详情', record.notes!),
        ]);
    }
  }

  Widget _detailGroup(List<Widget> rows) {
    if (rows.isEmpty) return const SizedBox.shrink();
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(
        horizontal: AppTheme.spacingM,
        vertical: AppTheme.spacingS,
      ),
      decoration: BoxDecoration(
        color: AppTheme.backgroundColor,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: AppTheme.dividerColor.withValues(alpha: 0.2)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          for (int i = 0; i < rows.length; i++) ...[
            if (i > 0) const SizedBox(height: 6),
            rows[i],
          ],
        ],
      ),
    );
  }

  Widget _infoRow(IconData icon, String label, String value) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon, size: 12, color: AppTheme.textSecondaryColor),
        const SizedBox(width: 6),
        Text(
          '$label：',
          style: TextStyle(
            color: AppTheme.textSecondaryColor,
            fontSize: AppTheme.fontSizeXS,
            fontWeight: FontWeight.w600,
          ),
        ),
        Expanded(
          child: Text(
            value,
            style: TextStyle(
              color: AppTheme.textPrimaryColor,
              fontSize: AppTheme.fontSizeXS,
            ),
          ),
        ),
      ],
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
    final rec = await showAddHealthRecordSheet(
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
