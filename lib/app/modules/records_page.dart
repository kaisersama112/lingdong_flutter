import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import 'package:flutter/services.dart';
import 'package:qr_flutter/qr_flutter.dart';
import '../core/components.dart';
import '../core/models.dart' as models;
import '../core/pet_components.dart';
import 'records/add_health_record_sheet.dart';

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

  // 模拟宠物数据
  final List<models.Pet> _pets = [
    models.Pet(
      id: '1',
      name: '小白',
      type: '猫咪',
      breed: '英短',
      avatar: '🐱',
      identityCode: 'LD-PET-7Q2M8A',
      color: AppTheme.primaryColor,
      birthDate: DateTime(2022, 3, 15),
      weight: 4.2,
      gender: '公',
    ),
    models.Pet(
      id: '2',
      name: '旺财',
      type: '狗狗',
      breed: '金毛',
      avatar: '🐕',
      identityCode: 'LD-PET-9K5D1C',
      color: AppTheme.secondaryColor,
      birthDate: DateTime(2021, 8, 20),
      weight: 25.5,
      gender: '公',
    ),
    models.Pet(
      id: '3',
      name: '咪咪',
      type: '猫咪',
      breed: '美短',
      avatar: '🐈',
      identityCode: 'LD-PET-4R6B0T',
      color: AppTheme.warningColor,
      birthDate: DateTime(2023, 1, 10),
      weight: 3.8,
      gender: '母',
    ),
  ];

  // 健康记录：状态与筛选
  late String _selectedPetIdForHealth;
  final List<models.HealthRecord> _healthRecords = [];
  final Set<models.HealthRecordType> _activeTypeFilters = {};

  @override
  void initState() {
    super.initState();
    // 初始化健康记录示例数据与默认选择的宠物
    _selectedPetIdForHealth = widget.initialPetId ?? _pets.first.id;
    _seedHealthRecords();

    // 初始筛选
    if (widget.initialFilterType != null) {
      _activeTypeFilters.clear(); // 清除所有筛选器
      _activeTypeFilters.add(widget.initialFilterType!); // 只添加传入的类型
    }

    // 可选：首次进入直接打开新增
    if (widget.openAddSheet) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _openAddHealthRecordSheet(presetType: widget.initialFilterType);
      });
    }
  }

  // 根据记录类型自动勾选筛选器
  void _autoSelectFilterByType(models.HealthRecordType type) {
    setState(() {
      // 清除其他筛选器，只保留当前类型
      _activeTypeFilters.clear();
      _activeTypeFilters.add(type);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.backgroundColor,
      appBar: AppBar(
        title: const Text('健康记录'),
        backgroundColor: Colors.white,
        foregroundColor: AppTheme.textPrimaryColor,
        elevation: 0,
        actions: [
          IconButton(
            tooltip: _isTimelineView ? '切换为列表' : '切换为时间线',
            onPressed: () => setState(() => _isTimelineView = !_isTimelineView),
            icon: Icon(_isTimelineView ? Icons.view_list : Icons.timeline),
          ),
          IconButton(
            tooltip: _sortDesc ? '按时间升序' : '按时间降序',
            onPressed: () => setState(() => _sortDesc = !_sortDesc),
            icon: Icon(_sortDesc ? Icons.south : Icons.north),
          ),
          PopupMenuButton<String>(
            onSelected: (v) {
              switch (v) {
                case 'add':
                  _openAddHealthRecordSheet();
                  break;
                case 'clear':
                  setState(() {
                    _activeTypeFilters.clear();
                    _dateRange = null;
                    _searchController.clear();
                  });
                  break;
              }
            },
            itemBuilder: (ctx) => [
              const PopupMenuItem(value: 'add', child: Text('新增记录')),
              const PopupMenuItem(value: 'clear', child: Text('清空筛选')),
            ],
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(AppTheme.spacingL),
        child: Column(
          children: [
            // 宠物选择器
            PetSelector(
              pets: _pets,
              selectedPetId: _selectedPetIdForHealth,
              onPetSelected: (petId) =>
                  setState(() => _selectedPetIdForHealth = petId),
              showAddButton: false,
            ),

            const SizedBox(height: AppTheme.spacingL),

            // 搜索与日期范围
            _buildSearchAndDateBar(),

            const SizedBox(height: AppTheme.spacingM),

            // 类型筛选
            _buildTypeFilters(),

            const SizedBox(height: AppTheme.spacingL),

            // 健康记录列表
            _isTimelineView
                ? _buildHealthRecordsTimeline()
                : _buildHealthRecordsList(),

            const SizedBox(height: AppTheme.spacingL),

            // 底部统计与快速清空
            _buildBottomSummaryBar(),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _openAddHealthRecordSheet,
        backgroundColor: AppTheme.primaryColor,
        child: const Icon(Icons.add, color: Colors.white),
      ),
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
                    hintText: '搜索标题/备注',
                    prefixIcon: const Icon(Icons.search),
                    suffixIcon: _searchController.text.isNotEmpty
                        ? IconButton(
                            icon: const Icon(Icons.clear),
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
                onPressed: _pickDateRange,
                icon: const Icon(Icons.date_range),
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
  void _seedHealthRecords() {
    // 为每只示例宠物添加若干记录，便于展示
    if (_pets.isEmpty) return;
    final now = DateTime.now();
    _healthRecords.addAll([
      models.HealthRecord(
        id: 'r1',
        petId: _pets[1].id, // 狗狗 旺财
        date: now.subtract(const Duration(days: 12)),
        type: models.HealthRecordType.vaccination,
        title: '八联疫苗 第2针',
        notes: '状态良好，无不良反应',
      ),
      models.HealthRecord(
        id: 'r2',
        petId: _pets[1].id,
        date: now.subtract(const Duration(days: 35)),
        type: models.HealthRecordType.deworming,
        title: '体内驱虫',
        notes: '使用拜耳，按体重25kg剂量',
      ),
      models.HealthRecord(
        id: 'r3',
        petId: _pets[0].id, // 猫咪 小白
        date: now.subtract(const Duration(days: 5)),
        type: models.HealthRecordType.weight,
        title: '称重 4.3kg',
        notes: '体重较稳定，食欲正常',
        weight: 4.3,
      ),
      models.HealthRecord(
        id: 'r4',
        petId: _pets[2].id, // 猫咪 咪咪
        date: now.subtract(const Duration(days: 3)),
        type: models.HealthRecordType.vetVisit,
        title: '年度体检',
        notes: '常规体检正常，建议继续控制体重',
        clinic: '星辰宠物医院',
      ),
    ]);
  }

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
    return Container(
      padding: const EdgeInsets.all(AppTheme.spacingM),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(AppTheme.borderRadiusMedium),
        border: Border.all(color: AppTheme.dividerColor),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: color.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(icon, color: color, size: 20),
          ),
          const SizedBox(width: AppTheme.spacingM),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        record.title,
                        style: const TextStyle(
                          fontWeight: FontWeight.w600,
                          color: AppTheme.textPrimaryColor,
                        ),
                      ),
                    ),
                    Text(
                      _formatDate(record.date),
                      style: TextStyle(
                        color: AppTheme.textSecondaryColor,
                        fontSize: AppTheme.fontSizeS,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                // 身份码与快捷操作（复制/二维码）
                Row(
                  children: [
                    const Icon(Icons.qr_code_2, size: 14, color: Colors.grey),
                    const SizedBox(width: 4),
                    Text(
                      _currentPet()?.identityCode ?? '-',
                      style: TextStyle(
                        color: AppTheme.textSecondaryColor,
                        fontSize: AppTheme.fontSizeS,
                      ),
                    ),
                    const SizedBox(width: 6),
                    InkWell(
                      onTap: () async {
                        final code = _currentPet()?.identityCode;
                        if (code == null) return;
                        await Clipboard.setData(ClipboardData(text: code));
                        if (!mounted) return;
                        ScaffoldMessenger.of(
                          context,
                        ).showSnackBar(const SnackBar(content: Text('已复制身份码')));
                      },
                      child: const Icon(
                        Icons.copy,
                        size: 16,
                        color: Colors.grey,
                      ),
                    ),
                    const SizedBox(width: 4),
                    InkWell(
                      onTap: () {
                        final code = _currentPet()?.identityCode;
                        if (code == null) return;
                        _showIdentityQrDialog(code);
                      },
                      child: const Icon(
                        Icons.qr_code,
                        size: 16,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
                if ((record.notes ?? '').isNotEmpty) ...[
                  const SizedBox(height: 4),
                  Text(
                    record.notes!,
                    style: TextStyle(color: AppTheme.textSecondaryColor),
                  ),
                ],
                const SizedBox(height: 6),
                Wrap(
                  spacing: 8,
                  runSpacing: 6,
                  children: [
                    _miniBadge(
                      models.HealthRecordUtils.getTypeLabel(record.type),
                      color,
                    ),
                    if (record.weight != null)
                      _miniBadge('${record.weight} kg', Colors.teal),
                    if ((record.clinic ?? '').isNotEmpty)
                      _miniBadge(record.clinic!, Colors.indigo),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  models.Pet? _currentPet() => _pets.firstWhere(
    (p) => p.id == _selectedPetIdForHealth,
    orElse: () => _pets.first,
  );

  void _showIdentityQrDialog(String code) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text('宠物身份码二维码'),
        content: SizedBox(
          width: 240,
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                QrImageView(data: code, size: 200, version: QrVersions.auto),
                const SizedBox(height: 12),
                SelectableText(
                  code,
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('关闭'),
          ),
        ],
      ),
    );
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
    setState(() {
      _healthRecords.add(rec);
    });
    _autoSelectFilterByType(rec.type);
  }

  String _formatDate(DateTime d) {
    return '${d.year}-${d.month.toString().padLeft(2, '0')}-${d.day.toString().padLeft(2, '0')}';
  }
}
