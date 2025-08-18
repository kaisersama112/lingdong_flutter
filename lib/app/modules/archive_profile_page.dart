import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../core/error_handler.dart';
import '../core/models.dart';
import '../core/pet_components.dart';
import 'records_page.dart';
import 'records/add_health_record_sheet.dart';
import 'profile/profile_page.dart';
import 'profile/settings_page.dart';
import 'pet_detail_page.dart';
import 'pet_management_page.dart';
import 'package:flutter/services.dart';
import 'package:qr_flutter/qr_flutter.dart';

class ArchiveProfilePage extends StatefulWidget {
  const ArchiveProfilePage({super.key});

  @override
  State<ArchiveProfilePage> createState() => _ArchiveProfilePageState();
}

class _ArchiveProfilePageState extends State<ArchiveProfilePage> {
  int _selectedPetIndex = 0;

  // 简单的用户数据
  final Map<String, String> _userData = {'name': '张三', 'avatar': '👤'};

  // 模拟宠物数据
  final List<Pet> _pets = [
    Pet(
      id: '1',
      name: '小白',
      type: '狗狗',
      breed: '金毛寻回犬',
      avatar: '🐕',
      color: Colors.orange,
      birthDate: DateTime(2020, 3, 15),
      weight: 25.5,
      gender: '公',
      identityCode: 'PET20240315001',
    ),
    Pet(
      id: '2',
      name: '咪咪',
      type: '猫咪',
      breed: '英国短毛猫',
      avatar: '🐱',
      color: Colors.blue,
      birthDate: DateTime(2021, 6, 20),
      weight: 4.2,
      gender: '母',
      identityCode: 'PET20240620002',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.getBackgroundColor(context),
      body: SafeArea(
        child: Column(
          children: [
            // 简化的页面头部 - 只显示标题和用户头像
            _buildSimpleHeader(),

            // 内容区域
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: AppTheme.getBackgroundColor(context),
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(AppTheme.borderRadiusLarge),
                    topRight: Radius.circular(AppTheme.borderRadiusLarge),
                  ),
                ),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      // 顶部已包含宠物切换，不再在内容区重复选择器
                      const SizedBox(height: AppTheme.spacingM),

                      // 宠物信息头部
                      PetInfoHeader(
                        pet: _pets[_selectedPetIndex],
                        onCopyIdentity: () => _copyIdentityCode(
                          _pets[_selectedPetIndex].identityCode,
                        ),
                        onShowQr: () => _showIdentityQrDialog(
                          _pets[_selectedPetIndex].identityCode,
                        ),
                        onEditPet: _editPet,
                      ),
                      const SizedBox(height: AppTheme.spacingM),

                      // 健康记录快捷入口
                      HealthQuickAccess(
                        pet: _pets[_selectedPetIndex],
                        onViewRecords: (type) =>
                            _navigateToRecords(filterType: type),
                        onAddRecord: () =>
                            _navigateToRecords(openAddSheet: true),
                        recordCounts: _getRecordCounts(),
                      ),
                      const SizedBox(height: AppTheme.spacingL),

                      // 快捷操作区域
                      _buildQuickActions(),
                      const SizedBox(height: AppTheme.spacingL),

                      // 宠物详情入口
                      _buildPetDetailEntry(),
                      const SizedBox(height: AppTheme.spacingL),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // 美化的页面头部 - 显示标题、用户头像和设置按钮
  Widget _buildSimpleHeader() {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AppTheme.spacingL,
        vertical: AppTheme.spacingM,
      ),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            AppTheme.primaryColor.withValues(alpha: 0.1),
            AppTheme.primaryLightColor.withValues(alpha: 0.05),
          ],
        ),
        border: Border(
          bottom: BorderSide(
            color: AppTheme.getDividerColor(context),
            width: 1,
          ),
        ),
      ),
      child: Row(
        children: [
          _buildUserAvatarButton(),
          const SizedBox(width: AppTheme.spacingM),
          Expanded(child: _buildPetSwitcher()),
          const SizedBox(width: AppTheme.spacingS),
          _buildAddPetButton(),
          const SizedBox(width: AppTheme.spacingS),
          _buildSettingsButton(),
        ],
      ),
    );
  }

  // 快捷操作区域 - 单宠家庭重点功能
  Widget _buildQuickActions() {
    final pet = _pets[_selectedPetIndex];

    return Container(
      margin: EdgeInsets.zero,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '快捷操作',
            style: TextStyle(
              color: AppTheme.getTextSecondaryColor(context),
              fontSize: AppTheme.fontSizeS,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: AppTheme.spacingM),
          Row(
            children: [
              Expanded(
                child: _buildQuickActionCard(
                  icon: Icons.photo_library,
                  label: '相册',
                  subtitle: '查看${pet.name}的照片',
                  color: pet.color,
                  onTap: () => _viewPhotoAlbum(),
                ),
              ),
              const SizedBox(width: AppTheme.spacingM),
              Expanded(
                child: _buildQuickActionCard(
                  icon: Icons.trending_up,
                  label: '成长轨迹',
                  subtitle: '记录${pet.name}的成长',
                  color: pet.color,
                  onTap: () => _viewGrowthTrack(),
                ),
              ),
            ],
          ),
          const SizedBox(height: AppTheme.spacingM),
          Row(
            children: [
              Expanded(
                child: _buildQuickActionCard(
                  icon: Icons.add_circle,
                  label: '新增记录',
                  subtitle: '直接添加一条健康记录',
                  color: pet.color,
                  onTap: () => _quickAddHealthRecord(),
                ),
              ),
              const SizedBox(width: AppTheme.spacingM),
              Expanded(
                child: _buildQuickActionCard(
                  icon: Icons.print,
                  label: '打印档案',
                  subtitle: '打印${pet.name}的档案',
                  color: pet.color,
                  onTap: () => _printPetProfile(),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // 顶部新增宠物按钮
  Widget _buildAddPetButton() {
    return Tooltip(
      message: '新增宠物',
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () async {
            final result = await Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const PetManagementPage(),
              ),
            );
            if (result != null && result is Pet) {
              setState(() {
                _pets.add(result);
                _selectedPetIndex = _pets.length - 1;
              });
            }
          },
          borderRadius: BorderRadius.circular(20),
          child: Container(
            height: 40,
            width: 40,
            decoration: BoxDecoration(
              color: AppTheme.getSurfaceColor(context),
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                color: AppTheme.getDividerColor(context),
                width: 1,
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.06),
                  blurRadius: 8,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            alignment: Alignment.center,
            child: Icon(
              Icons.add,
              size: 20,
              color: AppTheme.getTextPrimaryColor(context),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildQuickActionCard({
    required IconData icon,
    required String label,
    required String subtitle,
    required Color color,
    required VoidCallback onTap,
  }) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(AppTheme.borderRadiusMedium),
        child: Container(
          padding: const EdgeInsets.all(AppTheme.spacingS), // 减少内边距
          decoration: BoxDecoration(
            color: AppTheme.getSurfaceColor(context),
            borderRadius: BorderRadius.circular(AppTheme.borderRadiusMedium),
            border: Border.all(color: color.withValues(alpha: 0.2)),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.04),
                blurRadius: 8,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min, // 添加这个属性
            children: [
              Container(
                padding: const EdgeInsets.all(8), // 减少图标容器内边距
                decoration: BoxDecoration(
                  color: color.withValues(alpha: 0.1),
                  shape: BoxShape.circle,
                ),
                child: Icon(icon, color: color, size: 20), // 减少图标大小
              ),
              const SizedBox(height: AppTheme.spacingS), // 减少间距
              Text(
                label,
                style: TextStyle(
                  color: color,
                  fontSize: AppTheme.fontSizeXS, // 减少字体大小
                  fontWeight: FontWeight.w600,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 2), // 减少间距
              Text(
                subtitle,
                style: TextStyle(
                  color: AppTheme.getTextSecondaryColor(context),
                  fontSize: AppTheme.fontSizeXS,
                ),
                textAlign: TextAlign.center,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ),
    );
  }

  // 宠物详情入口 - 单宠家庭重点功能
  Widget _buildPetDetailEntry() {
    final pet = _pets[_selectedPetIndex];

    return Container(
      margin: EdgeInsets.zero,
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () => _viewPetDetail(pet),
          borderRadius: BorderRadius.circular(AppTheme.borderRadiusLarge),
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.all(AppTheme.spacingM), // 减少内边距
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  pet.color.withValues(alpha: 0.1),
                  pet.color.withValues(alpha: 0.05),
                ],
              ),
              borderRadius: BorderRadius.circular(AppTheme.borderRadiusLarge),
              border: Border.all(color: pet.color.withValues(alpha: 0.2)),
            ),
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(12), // 减少头像内边距
                  decoration: BoxDecoration(
                    color: pet.color.withValues(alpha: 0.15),
                    shape: BoxShape.circle,
                  ),
                  child: PetAvatar(
                    avatar: pet.avatar,
                    size: 24,
                    brokenIconColor: pet.color,
                  ),
                ),
                const SizedBox(width: AppTheme.spacingM), // 减少间距
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min, // 添加这个属性
                    children: [
                      Text(
                        '查看${pet.name}的完整档案',
                        style: TextStyle(
                          color: pet.color,
                          fontSize: AppTheme.fontSizeM, // 减少字体大小
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 4), // 减少间距
                      Text(
                        '包含详细信息、健康记录、成长轨迹等',
                        style: TextStyle(
                          color: pet.color.withValues(alpha: 0.7),
                          fontSize: AppTheme.fontSizeXS, // 减少字体大小
                        ),
                      ),
                    ],
                  ),
                ),
                Icon(
                  Icons.arrow_forward_ios,
                  color: pet.color,
                  size: 18, // 减少图标大小
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildUserAvatarButton() {
    return GestureDetector(
      onTap: _navigateToProfile,
      child: Container(
        height: 40,
        padding: const EdgeInsets.symmetric(horizontal: 12),
        decoration: BoxDecoration(
          color: AppTheme.getSurfaceColor(context),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: AppTheme.primaryColor.withValues(alpha: 0.2),
            width: 1.5,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.08),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 28,
              height: 28,
              decoration: BoxDecoration(
                color: AppTheme.primaryColor,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: AppTheme.primaryColor.withValues(alpha: 0.25),
                    blurRadius: 4,
                    offset: const Offset(0, 1),
                  ),
                ],
              ),
              alignment: Alignment.center,
              child: Text(
                _userData['avatar']!,
                style: const TextStyle(fontSize: 16, color: Colors.white),
              ),
            ),
            const SizedBox(width: 8),
            Flexible(
              child: Text(
                _userData['name']!,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: AppTheme.fontSizeS,
                  fontWeight: FontWeight.w600,
                  color: AppTheme.getTextPrimaryColor(context),
                ),
              ),
            ),
            const SizedBox(width: 6),
            Icon(
              Icons.arrow_forward_ios,
              color: AppTheme.primaryColor,
              size: 14,
            ),
          ],
        ),
      ),
    );
  }

  // 设置按钮
  Widget _buildSettingsButton() {
    return Tooltip(
      message: '设置',
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: _openSettings,
          borderRadius: BorderRadius.circular(20),
          child: Container(
            height: 40,
            width: 40,
            decoration: BoxDecoration(
              color: AppTheme.primaryColor,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: AppTheme.primaryColor.withValues(alpha: 0.3),
                  blurRadius: 8,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            alignment: Alignment.center,
            child: const Icon(Icons.settings, color: Colors.white, size: 18),
          ),
        ),
      ),
    );
  }

  // 获取记录数量统计
  Map<String, int> _getRecordCounts() {
    return {
      'vaccination': 3,
      'weight': 8,
      'vetVisit': 2,
      'medication': 1,
      'deworming': 4,
      'grooming': 2,
    };
  }

  // 导航到个人资料页面
  void _navigateToProfile() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => const ProfilePage()),
    );
  }

  // 打开设置页面
  void _openSettings() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const SettingsPage()),
    );
  }

  // 顶部已有宠物切换器，新增宠物入口移至其他页面
  // 原 _addPet 方法已移除

  // 顶部宠物切换器（下拉样式）
  Widget _buildPetSwitcher() {
    return Container(
      height: 40,
      padding: const EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(
        color: AppTheme.getSurfaceColor(context),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: AppTheme.getDividerColor(context), width: 1),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          isDense: true,
          isExpanded: true,
          value: _pets[_selectedPetIndex].id,
          icon: const Icon(Icons.keyboard_arrow_down_rounded, size: 18),
          selectedItemBuilder: (context) => _pets
              .map(
                (p) => Align(
                  alignment: Alignment.centerLeft,
                  child: PetAvatar(
                    avatar: p.avatar,
                    size: 16,
                    brokenIconColor: p.color,
                  ),
                ),
              )
              .toList(),
          items: _pets
              .map(
                (p) => DropdownMenuItem<String>(
                  value: p.id,
                  child: Row(
                    children: [
                      PetAvatar(
                        avatar: p.avatar,
                        size: 16,
                        brokenIconColor: p.color,
                      ),
                      const SizedBox(width: 8),
                      Flexible(
                        child: Text(
                          p.name,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            color: AppTheme.getTextPrimaryColor(context),
                            fontSize: AppTheme.fontSizeM,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              )
              .toList(),
          onChanged: (value) {
            if (value == null) return;
            setState(() {
              _selectedPetIndex = _pets.indexWhere((p) => p.id == value);
            });
          },
        ),
      ),
    );
  }

  void _editPet() async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => PetManagementPage(pet: _pets[_selectedPetIndex]),
      ),
    );

    if (result != null) {
      if (result == 'deleted') {
        // 宠物被删除
        setState(() {
          _pets.removeAt(_selectedPetIndex);
          if (_pets.isEmpty) {
            // 如果没有宠物了，可以添加一个默认宠物或显示空状态
            _selectedPetIndex = 0;
          } else if (_selectedPetIndex >= _pets.length) {
            _selectedPetIndex = _pets.length - 1;
          }
        });
      } else if (result is Pet) {
        // 宠物信息被更新
        setState(() {
          _pets[_selectedPetIndex] = result;
        });
      }
    }
  }

  // 健康记录导航
  void _navigateToRecords({
    bool openAddSheet = false,
    HealthRecordType? filterType,
  }) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => RecordsPage(
          initialPetId: _pets[_selectedPetIndex].id,
          openAddSheet: openAddSheet,
          initialFilterType: filterType,
        ),
      ),
    );
  }

  // 查看宠物详情
  void _viewPetDetail(Pet pet) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => PetDetailPage(pet: pet)),
    );
  }

  // 快捷操作方法
  void _viewPhotoAlbum() {
    AppErrorHandler.handleError(context, '相册功能开发中...');
  }

  void _viewGrowthTrack() {
    AppErrorHandler.handleError(context, '成长轨迹功能开发中...');
  }

  Future<void> _quickAddHealthRecord() async {
    final pet = _pets[_selectedPetIndex];
    final rec = await showAddHealthRecordSheet(
      context,
      pets: _pets,
      presetPetId: pet.id,
    );
    if (rec == null) return;
    if (!mounted) return;
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(const SnackBar(content: Text('已创建健康记录')));
  }

  void _printPetProfile() {
    AppErrorHandler.handleError(context, '打印功能开发中...');
  }

  // 复制身份码
  void _copyIdentityCode(String code) async {
    await Clipboard.setData(ClipboardData(text: code));
    if (mounted) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('已复制身份码')));
    }
  }

  // 显示身份码二维码
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
}
