import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../theme/app_theme.dart';
import '../../core/models.dart' as models;
import '../pet/pet_components.dart';
import '../../services/pet_service.dart';

Future<models.HealthRecord?> navigateToAddHealthRecordPage(
  BuildContext context, {
  List<models.Pet>? pets,
  String? presetPetId,
  models.HealthRecordType? presetType,
}) async {
  return Navigator.push<models.HealthRecord>(
    context,
    MaterialPageRoute(
      builder: (_) => AddHealthRecordPage(
        pets: pets,
        presetPetId: presetPetId,
        presetType: presetType,
      ),
      fullscreenDialog: true,
    ),
  );
}

class AddHealthRecordPage extends StatefulWidget {
  final List<models.Pet>? pets;
  final String? presetPetId;
  final models.HealthRecordType? presetType;

  const AddHealthRecordPage({
    Key? key,
    this.pets,
    this.presetPetId,
    this.presetType,
  }) : super(key: key);

  @override
  State<AddHealthRecordPage> createState() => _AddHealthRecordPageState();
}

class _AddHealthRecordPageState extends State<AddHealthRecordPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final PetService _petService = PetService();

  late models.HealthRecordType type;
  DateTime date = DateTime.now();
  DateTime? nextDate;
  String title = '';
  String notes = '';
  late String petId;
  double? weight;
  String clinic = '';

  String location = '';
  String vaccineType = '';
  String medicineName = '';
  String dosage = '';
  String institution = '';
  String doctorComments = '';
  String services = '';
  String otherDetails = '';

  List<models.Pet> _pets = const [];
  bool _loadingPets = false;
  String? _loadError;
  late final TextEditingController _titleController;
  late final TextEditingController _nlController;
  bool _showMore = false;
  bool _showNL = false;
  bool _editTitle = false;

  // 自然语言解析预览状态
  models.HealthRecordType? _nlType;
  DateTime? _nlDate;
  String? _nlClinic;
  String? _nlTitlePreview;

  @override
  void initState() {
    super.initState();
    type = widget.presetType ?? models.HealthRecordType.vaccination;
    _titleController = TextEditingController(text: title)
      ..addListener(() {
        title = _titleController.text.trim();
      });
    _nlController = TextEditingController()
      ..addListener(() {
        _parseNaturalInput(_nlController.text);
        setState(() {});
      });
    if ((widget.pets ?? const []).isEmpty) {
      _loadingPets = true;
      petId = widget.presetPetId ?? '';
      _loadPets();
    } else {
      _pets = widget.pets!;
      petId = widget.presetPetId ?? (_pets.isNotEmpty ? _pets.first.id : '');
    }
  }

  @override
  void dispose() {
    _titleController.dispose();
    _nlController.dispose();
    super.dispose();
  }

  Future<void> _loadPets() async {
    try {
      final pets = await _petService.getUserPets('current_user');
      if (!mounted) return;
      setState(() {
        _pets = pets;
        if (petId.isEmpty) {
          petId = pets.isNotEmpty ? pets.first.id : '';
        }
        _loadingPets = false;
        _loadError = null;
      });
    } catch (e) {
      if (!mounted) return;
      setState(() {
        _loadingPets = false;
        _loadError = '加载宠物失败: $e';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.getBackgroundColor(context),
      appBar: _buildModernAppBar(),
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          behavior: HitTestBehavior.translucent,
          child: _loadingPets
              ? _buildLoadingState()
              : (_loadError != null ? _buildErrorState() : _buildFormContent()),
        ),
      ),
      bottomNavigationBar: _buildBottomBar(),
    );
  }

  /// 构建现代化应用栏（简约版）
  PreferredSizeWidget _buildModernAppBar() {
    final canPop = Navigator.of(context).canPop();
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      scrolledUnderElevation: 0,
      leadingWidth: 48,
      leading: canPop
          ? Padding(
              padding: const EdgeInsets.all(AppTheme.spacingS),
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  onTap: () => Navigator.of(context).maybePop(),
                  borderRadius: BorderRadius.circular(
                    AppTheme.borderRadiusMedium,
                  ),
                  child: Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: AppTheme.getSurfaceColor(context),
                      borderRadius: BorderRadius.circular(
                        AppTheme.borderRadiusMedium,
                      ),
                      border: Border.all(
                        color: AppTheme.getDividerColor(context),
                        width: 0.8,
                      ),
                    ),
                    child: Icon(
                      Icons.arrow_back_rounded,
                      color: AppTheme.getTextPrimaryColor(context),
                      size: 18,
                    ),
                  ),
                ),
              ),
            )
          : null,
      title: Text(
        '新增健康记录',
        style: TextStyle(
          color: AppTheme.getTextPrimaryColor(context),
          fontSize: AppTheme.fontSizeL,
          fontWeight: FontWeight.w700,
        ),
      ),
      centerTitle: true,
      actions: [
        Padding(
          padding: const EdgeInsets.all(AppTheme.spacingS),
          child: ElevatedButton(
            onPressed: (!_loadingPets && petId.isNotEmpty) ? _onSubmit : null,
            style: ElevatedButton.styleFrom(
              elevation: 0,
              backgroundColor: AppTheme.primaryColor,
              padding: const EdgeInsets.symmetric(
                horizontal: AppTheme.spacingM,
                vertical: AppTheme.spacingS,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(
                  AppTheme.borderRadiusMedium,
                ),
              ),
            ),
            child: const Text(
              '保存',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
      ],
    );
  }

  /// 构建加载状态
  Widget _buildLoadingState() {
    return Center(
      child: Container(
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
    );
  }

  /// 构建错误状态
  Widget _buildErrorState() {
    return Center(
      child: Container(
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
            Icon(Icons.error_outline, color: AppTheme.errorColor, size: 48),
            const SizedBox(height: AppTheme.spacingM),
            Text(
              _loadError!,
              style: TextStyle(
                color: AppTheme.errorColor,
                fontSize: AppTheme.fontSizeM,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: AppTheme.spacingM),
            Container(
              decoration: BoxDecoration(
                gradient: AppTheme.primaryGradient,
                borderRadius: BorderRadius.circular(
                  AppTheme.borderRadiusMedium,
                ),
              ),
              child: ElevatedButton(
                onPressed: _loadPets,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.transparent,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                      AppTheme.borderRadiusMedium,
                    ),
                  ),
                ),
                child: const Text('重试', style: TextStyle(color: Colors.white)),
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// 构建表单内容（去除大面积渐变，收紧边距）
  Widget _buildFormContent() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(AppTheme.spacingM),
      child: Form(
        key: _formKey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildModernSection(
              title: '选择宠物与类型',
              icon: Icons.pets_rounded,
              subtitle: '先选择宠物和记录类型，再补充关键信息',
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildModernPetSelector(),
                  const SizedBox(height: AppTheme.spacingM),
                  _TypeChips(
                    value: type,
                    onChanged: (t) {
                      setState(() {
                        type = t;
                        if (!_editTitle &&
                            _titleController.text.trim().isEmpty) {
                          title = _defaultTitleForType(t);
                          _titleController.text = title;
                        }
                      });
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(height: AppTheme.spacingM),
            _buildModernSection(
              title: '关键信息',
              icon: Icons.event_available_rounded,
              subtitle: '日期 + 本次记录的核心字段',
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildModernDateSelector(),
                  const SizedBox(height: AppTheme.spacingM),
                  _buildCoreFieldsForType(),
                  const SizedBox(height: AppTheme.spacingS),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: TextButton.icon(
                      onPressed: () => setState(() => _editTitle = !_editTitle),
                      icon: const Icon(Icons.edit_rounded),
                      label: Text(_editTitle ? '隐藏标题' : '编辑标题'),
                    ),
                  ),
                  if (_editTitle) ...[
                    _buildModernTitleField(),
                    const SizedBox(height: AppTheme.spacingS),
                    _TitleSuggestionChips(
                      type: type,
                      onSelected: (s) {
                        _titleController.text = s;
                        title = s;
                        setState(() {});
                      },
                    ),
                  ],
                ],
              ),
            ),
            const SizedBox(height: AppTheme.spacingM),
            _buildModernSection(
              title: '更多详情（可选）',
              icon: Icons.tune_rounded,
              subtitle: '补充信息与提醒，仅在需要时填写',
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SwitchListTile(
                    contentPadding: EdgeInsets.zero,
                    title: const Text('展开更多详情'),
                    value: _showMore,
                    onChanged: (v) => setState(() => _showMore = v),
                  ),
                  AnimatedCrossFade(
                    duration: const Duration(milliseconds: 180),
                    crossFadeState: _showMore
                        ? CrossFadeState.showFirst
                        : CrossFadeState.showSecond,
                    firstChild: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildModernNotesField(),
                        const SizedBox(height: AppTheme.spacingS),
                        _buildTypeSpecificFields(
                          context,
                          type: type,
                          onClinicChanged: (v) => clinic = v.trim(),
                          onLocationChanged: (v) => location = v.trim(),
                          onVaccineTypeChanged: (v) => vaccineType = v.trim(),
                          onNextDateChanged: (d) =>
                              setState(() => nextDate = d),
                          onMedicineNameChanged: (v) => medicineName = v.trim(),
                          onDosageChanged: (v) => dosage = v.trim(),
                          onInstitutionChanged: (v) => institution = v.trim(),
                          onDoctorCommentsChanged: (v) =>
                              doctorComments = v.trim(),
                          onServicesChanged: (v) => services = v.trim(),
                          onOtherDetailsChanged: (v) => otherDetails = v.trim(),
                          onWeightChanged: (v) => weight = double.tryParse(v),
                        ),
                      ],
                    ),
                    secondChild: const SizedBox.shrink(),
                  ),
                ],
              ),
            ),
            const SizedBox(height: AppTheme.spacingM),
            _buildModernSection(
              title: '快速输入（可选）',
              icon: Icons.bolt_rounded,
              subtitle: '一句话识别并自动填写',
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SwitchListTile(
                    contentPadding: EdgeInsets.zero,
                    title: const Text('启用自然语言快速输入'),
                    value: _showNL,
                    onChanged: (v) => setState(() => _showNL = v),
                  ),
                  if (_showNL) _buildNaturalLanguageBar(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// 针对不同类型的核心字段（最少输入，聚焦一件事）
  Widget _buildCoreFieldsForType() {
    switch (type) {
      case models.HealthRecordType.weight:
        return TextFormField(
          decoration: _inputDecoration(label: '本次体重 (kg)'),
          keyboardType: const TextInputType.numberWithOptions(decimal: true),
          validator: (v) {
            final parsed = double.tryParse(v ?? '');
            if (parsed == null) return '请输入有效体重';
            return null;
          },
          onChanged: (v) => weight = double.tryParse(v),
        );
      case models.HealthRecordType.vaccination:
        return _TwoColumn(
          children: [
            TextFormField(
              decoration: _inputDecoration(label: '疫苗类型'),
              onChanged: (v) => vaccineType = v.trim(),
              validator: (v) => (v == null || v.trim().isEmpty) ? '必填' : null,
            ),
            TextFormField(
              decoration: _inputDecoration(label: '接种地点（可选）'),
              onChanged: (v) => location = v.trim(),
            ),
          ],
        );
      case models.HealthRecordType.deworming:
        return _TwoColumn(
          children: [
            TextFormField(
              decoration: _inputDecoration(label: '驱虫类型/药品'),
              onChanged: (v) => medicineName = v.trim(),
              validator: (v) => (v == null || v.trim().isEmpty) ? '必填' : null,
            ),
            TextFormField(
              decoration: _inputDecoration(label: '剂量（可选）'),
              onChanged: (v) => dosage = v.trim(),
            ),
          ],
        );
      case models.HealthRecordType.vetVisit:
        return _TwoColumn(
          children: [
            TextFormField(
              decoration: _inputDecoration(label: '机构/医院（可选）'),
              onChanged: (v) => institution = v.trim(),
            ),
            TextFormField(
              decoration: _inputDecoration(label: '医嘱摘要（可选）'),
              onChanged: (v) => doctorComments = v.trim(),
            ),
          ],
        );
      case models.HealthRecordType.grooming:
        return _TwoColumn(
          children: [
            TextFormField(
              decoration: _inputDecoration(label: '服务项目（必填）'),
              onChanged: (v) => services = v.trim(),
              validator: (v) => (v == null || v.trim().isEmpty) ? '必填' : null,
            ),
            TextFormField(
              decoration: _inputDecoration(label: '机构（可选）'),
              onChanged: (v) => institution = v.trim(),
            ),
          ],
        );
    }
  }

  // 早期快捷行已移除，改为更聚焦的"关键信息"与类型 Chips

  // 已移除：_onQuickTypeTap（使用类型 Chips 直接切换并填充默认标题）

  String _defaultTitleForType(models.HealthRecordType t) {
    switch (t) {
      case models.HealthRecordType.vaccination:
        return '疫苗接种';
      case models.HealthRecordType.deworming:
        return '体内/体外驱虫';
      case models.HealthRecordType.vetVisit:
        return '体检/复诊';
      case models.HealthRecordType.weight:
        return '体重记录';
      case models.HealthRecordType.grooming:
        return '美容服务';
    }
  }

  // 已移除：_promptWeightAndSave（聚焦路径由"关键信息"承担）

  /// 自然语言快速栏：解析一句话并预览，回车直接创建
  Widget _buildNaturalLanguageBar() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextField(
          controller: _nlController,
          decoration: InputDecoration(
            hintText: '快速输入（示例：明天体检 牙齿清洁 @幸福宠物医院 9/1）',
            prefixIcon: const Icon(Icons.bolt_rounded),
            border: const OutlineInputBorder(),
            isDense: true,
            suffixIcon: (_nlController.text.isNotEmpty)
                ? IconButton(
                    icon: const Icon(Icons.clear_rounded),
                    tooltip: '清空',
                    onPressed: () {
                      _nlController.clear();
                      _parseNaturalInput('');
                      setState(() {});
                    },
                  )
                : null,
          ),
          onSubmitted: (_) => _applyParsedAndSave(),
        ),
        const SizedBox(height: 4),
        Text(
          '支持关键词：今天/明天/后天/下周X，日期(YYYY-MM-DD、M/D)，@机构',
          style: TextStyle(
            color: AppTheme.getTextSecondaryColor(context),
            fontSize: AppTheme.fontSizeXS,
          ),
        ),
        if (_nlType != null ||
            _nlDate != null ||
            (_nlClinic ?? '').isNotEmpty ||
            (_nlTitlePreview ?? '').isNotEmpty)
          Padding(
            padding: const EdgeInsets.only(top: 6),
            child: Row(
              children: [
                if (_nlType != null)
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: models.HealthRecordUtils.getTypeColor(
                        _nlType!,
                      ).withValues(alpha: 0.12),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          models.HealthRecordUtils.getTypeIcon(_nlType!),
                          size: 14,
                          color: models.HealthRecordUtils.getTypeColor(
                            _nlType!,
                          ),
                        ),
                        const SizedBox(width: 4),
                        Text(
                          models.HealthRecordUtils.getTypeLabel(_nlType!),
                          style: const TextStyle(fontSize: 12),
                        ),
                      ],
                    ),
                  ),
                if (_nlDate != null) ...[
                  const SizedBox(width: 6),
                  Row(
                    children: [
                      const Icon(Icons.event_rounded, size: 14),
                      const SizedBox(width: 2),
                      Text(
                        _formatDate(_nlDate!),
                        style: const TextStyle(fontSize: 12),
                      ),
                    ],
                  ),
                ],
                if ((_nlClinic ?? '').isNotEmpty) ...[
                  const SizedBox(width: 6),
                  Row(
                    children: [
                      const Icon(Icons.location_on_rounded, size: 14),
                      const SizedBox(width: 2),
                      Text(_nlClinic!, style: const TextStyle(fontSize: 12)),
                    ],
                  ),
                ],
                if ((_nlTitlePreview ?? '').isNotEmpty) ...[
                  const SizedBox(width: 6),
                  Expanded(
                    child: Text(
                      _nlTitlePreview!,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(fontSize: 12),
                    ),
                  ),
                ],
              ],
            ),
          ),
      ],
    );
  }

  void _parseNaturalInput(String input) {
    // 极简中文规则解析（可后续接入NLP服务）
    final s = input.trim();
    if (s.isEmpty) {
      _nlType = null;
      _nlDate = null;
      _nlClinic = null;
      _nlTitlePreview = null;
      return;
    }
    // 类型关键词
    if (s.contains('疫苗') || s.contains('八联') || s.contains('三联')) {
      _nlType = models.HealthRecordType.vaccination;
    } else if (s.contains('驱虫')) {
      _nlType = models.HealthRecordType.deworming;
    } else if (s.contains('体检') || s.contains('复诊')) {
      _nlType = models.HealthRecordType.vetVisit;
    } else if (s.contains('体重') || s.contains('称重')) {
      _nlType = models.HealthRecordType.weight;
    } else if (s.contains('美容') || s.contains('洗澡') || s.contains('修毛')) {
      _nlType = models.HealthRecordType.grooming;
    }

    // 日期关键词
    _nlDate = null;
    final now = DateTime.now();
    if (RegExp(r'今天').hasMatch(s)) {
      _nlDate = DateTime(now.year, now.month, now.day);
    } else if (RegExp(r'明天').hasMatch(s)) {
      final d = now.add(const Duration(days: 1));
      _nlDate = DateTime(d.year, d.month, d.day);
    } else if (RegExp(r'后天').hasMatch(s)) {
      final d = now.add(const Duration(days: 2));
      _nlDate = DateTime(d.year, d.month, d.day);
    } else {
      final w = RegExp(r'下周([一二三四五六日天])').firstMatch(s);
      if (w != null) {
        const map = {
          '一': DateTime.monday,
          '二': DateTime.tuesday,
          '三': DateTime.wednesday,
          '四': DateTime.thursday,
          '五': DateTime.friday,
          '六': DateTime.saturday,
          '日': DateTime.sunday,
          '天': DateTime.sunday,
        };
        final int? wd = map[w.group(1)!];
        if (wd != null) {
          _nlDate = _nextWeekday(now, wd);
        }
      } else {
        // 显式日期 2024-09-01 或 9/1
        final dateMatch = RegExp(
          r'((20\d{2})[-/.](\d{1,2})[-/.](\d{1,2}))|(\d{1,2})[/.](\d{1,2})',
        ).firstMatch(s);
        if (dateMatch != null) {
          try {
            if (dateMatch.group(2) != null) {
              final y = int.parse(dateMatch.group(2)!);
              final m = int.parse(dateMatch.group(3)!);
              final d = int.parse(dateMatch.group(4)!);
              _nlDate = DateTime(y, m, d);
            } else {
              final m = int.parse(dateMatch.group(6)!);
              final d = int.parse(dateMatch.group(7)!);
              _nlDate = DateTime(now.year, m, d);
            }
          } catch (_) {}
        }
      }
    }

    // 机构：用 @标注 或 “医院/宠物店”关键词后取尾段
    final atIdx = s.indexOf('@');
    if (atIdx >= 0 && atIdx + 1 < s.length) {
      _nlClinic = s.substring(atIdx + 1).trim();
    } else {
      final hosIdx = s.indexOf('医院');
      final shopIdx = s.indexOf('宠物店');
      int idx = hosIdx >= 0 ? hosIdx : shopIdx;
      if (idx >= 0) {
        // 取前后若干字
        final start = (idx - 6).clamp(0, s.length);
        final end = (idx + 3).clamp(0, s.length);
        _nlClinic = s
            .substring(start, end)
            .replaceAll(RegExp(r'[^\u4e00-\u9fa5A-Za-z0-9]'), '')
            .trim();
      }
    }

    // 标题预览：去掉已识别片段后的剩余词
    _nlTitlePreview = s
        .replaceAll(RegExp(r'今天|明天|后天|下周[一二三四五六日天]'), '')
        .replaceAll(RegExp(r'疫苗|八联|三联|驱虫|体检|复诊|体重|称重|美容|洗澡|修毛'), '')
        .replaceAll(RegExp(r'@.*'), '')
        .trim();
  }

  /// 底部摘要与主操作栏
  Widget _buildBottomBar() {
    final models.HealthRecordType t = type;
    final String petName = (() {
      try {
        return _pets.firstWhere((p) => p.id == petId).name;
      } catch (_) {
        return '未选择';
      }
    })();
    final String left = [
      petName,
      models.HealthRecordUtils.getTypeLabel(t),
      _formatDate(date),
    ].where((e) => e.isNotEmpty).join(' · ');

    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AppTheme.spacingM,
        vertical: AppTheme.spacingS,
      ),
      decoration: BoxDecoration(
        color: AppTheme.getSurfaceColor(context),
        border: Border(
          top: BorderSide(color: AppTheme.getDividerColor(context), width: 0.8),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.04),
            blurRadius: 10,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: SafeArea(
        top: false,
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    left,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: AppTheme.getTextPrimaryColor(context),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  if ((title).trim().isNotEmpty)
                    Text(
                      title,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: AppTheme.getTextSecondaryColor(context),
                        fontSize: AppTheme.fontSizeS,
                      ),
                    ),
                ],
              ),
            ),
            const SizedBox(width: AppTheme.spacingS),
            OutlinedButton(
              onPressed: (!_loadingPets && petId.isNotEmpty)
                  ? () => _onSubmit(addAnother: true)
                  : null,
              style: OutlinedButton.styleFrom(
                foregroundColor: AppTheme.primaryColor,
                side: BorderSide(color: AppTheme.primaryColor),
                padding: const EdgeInsets.symmetric(
                  horizontal: AppTheme.spacingM,
                  vertical: AppTheme.spacingS,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(
                    AppTheme.borderRadiusMedium,
                  ),
                ),
              ),
              child: const Text('保存并继续'),
            ),
            const SizedBox(width: AppTheme.spacingS),
            ElevatedButton.icon(
              onPressed: (!_loadingPets && petId.isNotEmpty) ? _onSubmit : null,
              style: ElevatedButton.styleFrom(
                backgroundColor: AppTheme.primaryColor,
                foregroundColor: Colors.white,
                elevation: 0,
                padding: const EdgeInsets.symmetric(
                  horizontal: AppTheme.spacingM,
                  vertical: AppTheme.spacingS,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(
                    AppTheme.borderRadiusMedium,
                  ),
                ),
              ),
              icon: const Icon(Icons.check_rounded),
              label: const Text('保存'),
            ),
          ],
        ),
      ),
    );
  }

  DateTime _nextWeekday(DateTime from, int weekday) {
    int add = (weekday - from.weekday) % 7;
    if (add <= 0) add += 7;
    return from.add(Duration(days: add));
  }

  void _applyParsedAndSave() {
    if (_nlType == null &&
        _nlDate == null &&
        (_nlClinic ?? '').isEmpty &&
        (_nlTitlePreview ?? '').isEmpty)
      return;
    setState(() {
      if (_nlType != null) type = _nlType!;
      if (_nlDate != null) date = _nlDate!;
      if ((_nlTitlePreview ?? '').isNotEmpty) {
        title = _nlTitlePreview!;
        _titleController.text = title;
      }
      if ((_nlClinic ?? '').isNotEmpty) clinic = _nlClinic!;
    });
    _onSubmit();
  }

  /// 构建现代化区块（降低阴影与内边距，统一标题行）
  Widget _buildModernSection({
    required String title,
    required IconData icon,
    required String subtitle,
    required Widget child,
  }) {
    return Container(
      padding: const EdgeInsets.all(AppTheme.spacingM),
      decoration: BoxDecoration(
        color: AppTheme.getSurfaceColor(context),
        borderRadius: BorderRadius.circular(AppTheme.borderRadiusLarge),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.03),
            blurRadius: 10,
            offset: const Offset(0, 3),
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
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(6),
                decoration: BoxDecoration(
                  color: AppTheme.primaryColor.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Icon(icon, color: AppTheme.primaryColor, size: 16),
              ),
              const SizedBox(width: AppTheme.spacingM),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        color: AppTheme.getTextPrimaryColor(context),
                        fontSize: AppTheme.fontSizeM,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Text(
                      subtitle,
                      style: TextStyle(
                        color: AppTheme.getTextSecondaryColor(context),
                        fontSize: AppTheme.fontSizeS,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: AppTheme.spacingM),
          child,
        ],
      ),
    );
  }

  /// 构建现代化宠物选择器
  Widget _buildModernPetSelector() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '选择宠物',
          style: TextStyle(
            color: AppTheme.getTextPrimaryColor(context),
            fontSize: AppTheme.fontSizeM,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: AppTheme.spacingS),
        Container(
          decoration: BoxDecoration(
            color: AppTheme.getBackgroundColor(context),
            borderRadius: BorderRadius.circular(AppTheme.borderRadiusMedium),
            border: Border.all(
              color: AppTheme.getDividerColor(context),
              width: 1,
            ),
          ),
          child: DropdownButtonFormField<String>(
            value: petId.isNotEmpty ? petId : null,
            decoration: const InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.symmetric(
                horizontal: AppTheme.spacingM,
                vertical: AppTheme.spacingM,
              ),
            ),
            hint: Text(
              '请选择宠物',
              style: TextStyle(
                color: AppTheme.getTextSecondaryColor(context),
                fontSize: AppTheme.fontSizeM,
              ),
            ),
            items: _pets.map((pet) {
              return DropdownMenuItem<String>(
                value: pet.id,
                child: Row(
                  children: [
                    PetAvatar(
                      avatar: pet.avatar,
                      size: 24,
                      brokenIconColor: pet.color,
                    ),
                    const SizedBox(width: AppTheme.spacingS),
                    Text(
                      pet.name,
                      style: TextStyle(
                        color: AppTheme.getTextPrimaryColor(context),
                        fontSize: AppTheme.fontSizeM,
                      ),
                    ),
                  ],
                ),
              );
            }).toList(),
            onChanged: (value) {
              if (value != null) {
                setState(() {
                  petId = value;
                });
              }
            },
            validator: (value) {
              if (value == null || value.isEmpty) {
                return '请选择宠物';
              }
              return null;
            },
            dropdownColor: AppTheme.getSurfaceColor(context),
            icon: Icon(
              Icons.expand_more_rounded,
              color: AppTheme.getTextSecondaryColor(context),
            ),
          ),
        ),
      ],
    );
  }

  /// 构建现代化日期选择器
  Widget _buildModernDateSelector() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '记录日期',
          style: TextStyle(
            color: AppTheme.getTextPrimaryColor(context),
            fontSize: AppTheme.fontSizeM,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: AppTheme.spacingS),
        _CompactDateField(
          label: '选择日期',
          value: date,
          onChanged: (value) {
            setState(() {
              date = value;
            });
          },
        ),
        const SizedBox(height: 8),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: [
            ActionChip(
              label: const Text('今天'),
              onPressed: () {
                final now = DateTime.now();
                setState(() {
                  date = DateTime(now.year, now.month, now.day);
                });
              },
            ),
            ActionChip(
              label: const Text('明天'),
              onPressed: () {
                final d = DateTime.now().add(const Duration(days: 1));
                setState(() {
                  date = DateTime(d.year, d.month, d.day);
                });
              },
            ),
            ActionChip(
              label: const Text('后天'),
              onPressed: () {
                final d = DateTime.now().add(const Duration(days: 2));
                setState(() {
                  date = DateTime(d.year, d.month, d.day);
                });
              },
            ),
            ActionChip(
              label: const Text('下周一'),
              onPressed: () {
                setState(() {
                  date = _nextWeekday(DateTime.now(), DateTime.monday);
                });
              },
            ),
          ],
        ),
      ],
    );
  }

  /// 构建现代化标题字段（紧凑 + 美化输入样式）
  Widget _buildModernTitleField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '标题',
          style: TextStyle(
            color: AppTheme.getTextPrimaryColor(context),
            fontSize: AppTheme.fontSizeM,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: AppTheme.spacingS),
        TextFormField(
          controller: _titleController,
          decoration: _inputDecoration(
            label: '标题',
            hint: _titleHintByType(type),
          ),
          style: TextStyle(
            color: AppTheme.getTextPrimaryColor(context),
            fontSize: AppTheme.fontSizeM,
          ),
          validator: (value) {
            if (value == null || value.trim().isEmpty) {
              return '请输入标题';
            }
            return null;
          },
        ),
      ],
    );
  }

  /// 构建现代化备注字段（紧凑 + 美化输入样式）
  Widget _buildModernNotesField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '备注',
          style: TextStyle(
            color: AppTheme.getTextPrimaryColor(context),
            fontSize: AppTheme.fontSizeM,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: AppTheme.spacingS),
        TextFormField(
          maxLines: 3,
          decoration: _inputDecoration(label: '备注', hint: '添加备注信息（可选）'),
          style: TextStyle(
            color: AppTheme.getTextPrimaryColor(context),
            fontSize: AppTheme.fontSizeM,
          ),
          onChanged: (value) {
            notes = value;
          },
        ),
      ],
    );
  }

  void _onSubmit({bool addAnother = false}) {
    if (_formKey.currentState?.validate() != true) return;
    final List<String> noteParts = [];
    if (notes.trim().isNotEmpty) noteParts.add(notes.trim());
    switch (type) {
      case models.HealthRecordType.vaccination:
        if (vaccineType.isNotEmpty) noteParts.add('类型:$vaccineType');
        if (location.isNotEmpty) noteParts.add('地点:$location');
        if (nextDate != null) noteParts.add('下次:${_formatDate(nextDate!)}');
        break;
      case models.HealthRecordType.deworming:
        if (medicineName.isNotEmpty) noteParts.add('药品:$medicineName');
        if (dosage.isNotEmpty) noteParts.add('剂量:$dosage');
        if (location.isNotEmpty) noteParts.add('地点:$location');
        if (nextDate != null) noteParts.add('下次:${_formatDate(nextDate!)}');
        break;
      case models.HealthRecordType.vetVisit:
        if (institution.isNotEmpty) clinic = institution;
        if (doctorComments.isNotEmpty) noteParts.add('医嘱:$doctorComments');
        break;
      case models.HealthRecordType.weight:
        break;
      case models.HealthRecordType.grooming:
        if (institution.isNotEmpty) clinic = institution;
        if (services.isNotEmpty)
          noteParts.add('服务:${services.replaceAll('，', ', ')}');
        break;
    }
    final packedNotes = noteParts.isEmpty ? null : noteParts.join(' | ');
    final rec = models.HealthRecord(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      petId: petId,
      date: date,
      type: type,
      title: title,
      notes: packedNotes,
      weight: weight,
      clinic: clinic.isEmpty ? null : clinic,
    );
    if (addAnother) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('已保存一条健康记录')));
      setState(() {
        // 重置除宠物以外的字段，便于继续创建
        type = models.HealthRecordType.vaccination;
        date = DateTime.now();
        nextDate = null;
        title = '';
        notes = '';
        weight = null;
        clinic = '';
        location = '';
        vaccineType = '';
        medicineName = '';
        dosage = '';
        institution = '';
        doctorComments = '';
        services = '';
        otherDetails = '';
        _titleController.text = '';
      });
    } else {
      Navigator.pop(context, rec);
    }
  }
}

String _formatDate(DateTime d) {
  return '${d.year}-${d.month.toString().padLeft(2, '0')}-${d.day.toString().padLeft(2, '0')}';
}

class _CompactDateField extends StatelessWidget {
  final String label;
  final DateTime? value;
  final ValueChanged<DateTime> onChanged;

  const _CompactDateField({
    Key? key,
    required this.label,
    this.value,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(AppTheme.borderRadiusMedium),
        onTap: () async {
          final picked = await showDatePicker(
            context: context,
            initialDate: value ?? DateTime.now(),
            firstDate: DateTime(2018),
            lastDate: DateTime(2100),
          );
          if (picked != null) onChanged(picked);
        },
        child: InputDecorator(
          decoration: InputDecoration(
            labelText: label,
            suffixIcon: const Icon(Icons.calendar_today),
          ),
          child: Text(
            value == null ? '请选择' : _formatDate(value!),
            style: const TextStyle(color: AppTheme.textPrimaryColor),
          ),
        ),
      ),
    );
  }
}

class _TypeChips extends StatelessWidget {
  final models.HealthRecordType value;
  final ValueChanged<models.HealthRecordType> onChanged;

  const _TypeChips({Key? key, required this.value, required this.onChanged})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: models.HealthRecordType.values.map((t) {
        final selected = t == value;
        return ChoiceChip(
          label: Text(models.HealthRecordUtils.getTypeLabel(t)),
          selected: selected,
          onSelected: (_) => onChanged(t),
          selectedColor: isDark
              ? AppTheme.primaryDarkColor
              : AppTheme.primaryLightColor,
          backgroundColor: isDark ? AppTheme.darkSurfaceColor : Colors.white,
          side: BorderSide(
            color: selected ? AppTheme.primaryColor : AppTheme.dividerColor,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppTheme.borderRadiusMedium),
          ),
          labelStyle: TextStyle(
            color: selected
                ? (isDark ? Colors.white : AppTheme.primaryDarkColor)
                : AppTheme.textPrimaryColor,
            fontWeight: selected ? FontWeight.w600 : FontWeight.w500,
          ),
        );
      }).toList(),
    );
  }
}

// 标题提示
String _titleHintByType(models.HealthRecordType type) {
  switch (type) {
    case models.HealthRecordType.vaccination:
      return '如：狂犬、八联、猫三联…';
    case models.HealthRecordType.deworming:
      return '如：体外滴剂、体内驱虫…';
    case models.HealthRecordType.vetVisit:
      return '如：年度体检、洗牙…';
    case models.HealthRecordType.weight:
      return '请输入称重记录标题';
    case models.HealthRecordType.grooming:
      return '如：洗澡、美甲、修毛…';
  }
}

class _TitleSuggestionChips extends StatelessWidget {
  final models.HealthRecordType type;
  final ValueChanged<String> onSelected;
  const _TitleSuggestionChips({required this.type, required this.onSelected});

  @override
  Widget build(BuildContext context) {
    final list = _suggestions(type);
    if (list.isEmpty) return const SizedBox.shrink();
    return Wrap(
      spacing: 8,
      children: list
          .map(
            (s) => ActionChip(
              label: Text(s),
              onPressed: () => onSelected(s),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(AppTheme.borderRadiusSmall),
              ),
              side: BorderSide(color: AppTheme.getDividerColor(context)),
              backgroundColor: AppTheme.getSurfaceColor(context),
            ),
          )
          .toList(),
    );
  }

  List<String> _suggestions(models.HealthRecordType t) {
    switch (t) {
      case models.HealthRecordType.vaccination:
        return ['狂犬', '八联', '猫三联'];
      case models.HealthRecordType.deworming:
        return ['体内驱虫', '体外滴剂'];
      case models.HealthRecordType.vetVisit:
        return ['年度体检', '洗牙'];
      case models.HealthRecordType.weight:
        return [];
      case models.HealthRecordType.grooming:
        return ['洗澡', '修毛', '美甲'];
    }
  }
}

InputDecoration _inputDecoration({required String label, String? hint}) {
  return InputDecoration(
    labelText: label,
    hintText: hint,
    isDense: true,
    filled: true,
    fillColor: AppTheme.backgroundColor,
    contentPadding: const EdgeInsets.symmetric(
      horizontal: AppTheme.spacingM,
      vertical: AppTheme.spacingS,
    ),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(AppTheme.borderRadiusMedium),
      borderSide: BorderSide(color: AppTheme.dividerColor),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(AppTheme.borderRadiusMedium),
      borderSide: BorderSide(color: AppTheme.dividerColor),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(AppTheme.borderRadiusMedium),
      borderSide: const BorderSide(color: AppTheme.primaryColor, width: 1.5),
    ),
  );
}

// 已弃用旧版区块组件 _Section

class _TwoColumn extends StatelessWidget {
  final List<Widget> children;

  const _TwoColumn({Key? key, required this.children}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final double spacing = AppTheme.spacingM;
        final bool singleColumn = constraints.maxWidth < 360;
        final double itemWidth = singleColumn
            ? constraints.maxWidth
            : (constraints.maxWidth - spacing) / 2;
        return Wrap(
          spacing: spacing,
          runSpacing: spacing,
          children: children
              .map(
                (w) => ConstrainedBox(
                  constraints: BoxConstraints(
                    minWidth: itemWidth,
                    maxWidth: itemWidth,
                  ),
                  child: w,
                ),
              )
              .toList(),
        );
      },
    );
  }
}

Widget _buildTypeSpecificFields(
  BuildContext context, {
  required models.HealthRecordType type,
  required ValueChanged<String> onClinicChanged,
  required ValueChanged<String> onLocationChanged,
  required ValueChanged<String> onVaccineTypeChanged,
  required ValueChanged<DateTime> onNextDateChanged,
  required ValueChanged<String> onMedicineNameChanged,
  required ValueChanged<String> onDosageChanged,
  required ValueChanged<String> onInstitutionChanged,
  required ValueChanged<String> onDoctorCommentsChanged,
  required ValueChanged<String> onServicesChanged,
  required ValueChanged<String> onOtherDetailsChanged,
  required ValueChanged<String> onWeightChanged,
}) {
  switch (type) {
    case models.HealthRecordType.vaccination:
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _TwoColumn(
            children: [
              TextFormField(
                decoration: _inputDecoration(label: '疫苗类型（可选）'),
                onChanged: onVaccineTypeChanged,
              ),
              TextFormField(
                decoration: _inputDecoration(label: '接种地点（可选）'),
                onChanged: onLocationChanged,
              ),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              Expanded(
                child: _CompactDateField(
                  label: '下次提醒日期（可选）',
                  value: null,
                  onChanged: onNextDateChanged,
                ),
              ),
              const SizedBox(width: 8),
              Wrap(
                spacing: 8,
                children: [
                  ActionChip(
                    label: const Text('+1月'),
                    onPressed: () {
                      final d = DateTime.now();
                      onNextDateChanged(DateTime(d.year, d.month + 1, d.day));
                    },
                  ),
                  ActionChip(
                    label: const Text('+3月'),
                    onPressed: () {
                      final d = DateTime.now();
                      onNextDateChanged(DateTime(d.year, d.month + 3, d.day));
                    },
                  ),
                  ActionChip(
                    label: const Text('+1年'),
                    onPressed: () {
                      final d = DateTime.now();
                      onNextDateChanged(DateTime(d.year + 1, d.month, d.day));
                    },
                  ),
                ],
              ),
            ],
          ),
        ],
      );
    case models.HealthRecordType.deworming:
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _TwoColumn(
            children: [
              TextFormField(
                decoration: _inputDecoration(label: '药品名称（可选）'),
                onChanged: onMedicineNameChanged,
              ),
              TextFormField(
                decoration: _inputDecoration(label: '剂量（可选）'),
                onChanged: onDosageChanged,
              ),
              TextFormField(
                decoration: _inputDecoration(label: '地点（可选）'),
                onChanged: onLocationChanged,
              ),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              Expanded(
                child: _CompactDateField(
                  label: '下次提醒日期（可选）',
                  value: null,
                  onChanged: onNextDateChanged,
                ),
              ),
              const SizedBox(width: 8),
              Wrap(
                spacing: 8,
                children: [
                  ActionChip(
                    label: const Text('+1月'),
                    onPressed: () {
                      final d = DateTime.now();
                      onNextDateChanged(DateTime(d.year, d.month + 1, d.day));
                    },
                  ),
                  ActionChip(
                    label: const Text('+3月'),
                    onPressed: () {
                      final d = DateTime.now();
                      onNextDateChanged(DateTime(d.year, d.month + 3, d.day));
                    },
                  ),
                  ActionChip(
                    label: const Text('+6月'),
                    onPressed: () {
                      final d = DateTime.now();
                      onNextDateChanged(DateTime(d.year, d.month + 6, d.day));
                    },
                  ),
                ],
              ),
            ],
          ),
        ],
      );
    case models.HealthRecordType.vetVisit:
      return _TwoColumn(
        children: [
          TextFormField(
            decoration: const InputDecoration(labelText: '机构（可选）'),
            onChanged: onInstitutionChanged,
          ),
          TextFormField(
            decoration: const InputDecoration(labelText: '医嘱（可选）'),
            maxLines: 2,
            onChanged: onDoctorCommentsChanged,
          ),
        ],
      );
    case models.HealthRecordType.weight:
      return TextFormField(
        decoration: const InputDecoration(labelText: '体重 kg'),
        keyboardType: const TextInputType.numberWithOptions(decimal: true),
        validator: (v) {
          final parsed = double.tryParse(v ?? '');
          if (parsed == null) return '请输入有效体重';
          return null;
        },
        onChanged: onWeightChanged,
      );
    case models.HealthRecordType.grooming:
      return _TwoColumn(
        children: [
          TextFormField(
            decoration: const InputDecoration(labelText: '机构（可选）'),
            onChanged: onInstitutionChanged,
          ),
          TextFormField(
            decoration: const InputDecoration(labelText: '服务项目（逗号分隔，可选）'),
            onChanged: onServicesChanged,
          ),
        ],
      );
  }
}
