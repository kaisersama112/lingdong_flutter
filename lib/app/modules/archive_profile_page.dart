import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../theme/app_components.dart';
import '../core/components.dart';
import '../core/error_handler.dart';
// import '../services/user_auth_service.dart';
// import '../modules/auth/login_page.dart';
import 'records_page.dart';
import 'profile/profile_page.dart';
import 'package:flutter/services.dart';
import 'package:qr_flutter/qr_flutter.dart';

class ArchiveProfilePage extends StatefulWidget {
  const ArchiveProfilePage({super.key});

  @override
  State<ArchiveProfilePage> createState() => _ArchiveProfilePageState();
}

class _ArchiveProfilePageState extends State<ArchiveProfilePage> {
  int _selectedPetIndex = 0;
  // final _authService = UserAuthService();

  // 模拟用户数据
  final UserProfile _userProfile = UserProfile(
    name: '张三',
    phone: '138****8888',
    email: 'zhangsan@example.com',
    avatar: '👤',
    joinDate: DateTime(2020, 6, 1),
    address: '北京市朝阳区',
    bio: '热爱宠物，家有两只猫咪和一只狗狗',
  );

  // 模拟宠物数据
  final List<Pet> _pets = [
    Pet(
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
    Pet(
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
    Pet(
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.backgroundColor,
      body: Column(
        children: [
          // 页面头部
          BeautifulPageHeader(
            title: '宠物档案',
            subtitle: '管理你的宠物信息',
            icon: Icons.pets,
            height: 120,
            actions: [
              // 优化的用户头像按钮 - 点击跳转到个人资料页面
              _buildUserAvatarButton(),
            ],
          ),
          
          // 内容区域
          Expanded(
            child: Container(
              decoration: const BoxDecoration(
                color: AppTheme.backgroundColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(AppTheme.borderRadiusLarge),
                  topRight: Radius.circular(AppTheme.borderRadiusLarge),
                ),
              ),
              child: Column(
                children: [
                  // 宠物选择器
                  _buildPetSelector(),
                  const SizedBox(height: AppTheme.spacingM),
                  // 紧凑的宠物信息条（上方展示）
                  _buildCompactInfoHeader(),
                  const SizedBox(height: AppTheme.spacingM),
                  // 健康主区块（更突出）
                  Expanded(child: _buildHealthSection()),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildUserAvatarButton() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.2),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: Colors.white.withValues(alpha: 0.3),
          width: 1,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.1),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(16),
          onTap: () => _navigateToProfile(),
          child: Container(
            padding: const EdgeInsets.all(8),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                // 用户头像
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: 0.1),
                        blurRadius: 4,
                        offset: const Offset(0, 1),
                      ),
                    ],
                  ),
                  child: CircleAvatar(
                    radius: 16,
                    backgroundColor: AppTheme.primaryLightColor,
                    child: Text(
                      _userProfile.avatar,
                      style: const TextStyle(fontSize: 16, color: Colors.white),
                    ),
                  ),
                ),
                const SizedBox(width: 6),
                // 用户名称
                Text(
                  _userProfile.name,
                  style: const TextStyle(
                    fontSize: AppTheme.fontSizeS,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(width: 4),
                // 箭头图标
                const Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.white,
                  size: 12,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildPetSelector() {
    return Container(
      margin: const EdgeInsets.all(AppTheme.spacingM),
      decoration: BoxDecoration(
        color: AppTheme.surfaceColor,
        borderRadius: BorderRadius.circular(AppTheme.borderRadiusMedium),
        boxShadow: AppTheme.cardShadow,
      ),
      child: Padding(
        padding: const EdgeInsets.all(AppTheme.spacingM),
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  '我的宠物',
                  style: const TextStyle(
                    fontSize: AppTheme.fontSizeL,
                    fontWeight: FontWeight.bold,
                    color: AppTheme.textPrimaryColor,
                  ),
                ),
                const Spacer(),
                IconButton(
                  icon: const Icon(Icons.add_circle_outline),
                  onPressed: () => _addPet(),
                  color: AppTheme.primaryColor,
                ),
              ],
            ),
            const SizedBox(height: AppTheme.spacingM),
            SizedBox(
              height: 80,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: _pets.length,
                itemBuilder: (context, index) {
                  final pet = _pets[index];
                  final isSelected = index == _selectedPetIndex;
                  
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        _selectedPetIndex = index;
                      });
                    },
                    child: Container(
                      width: 80,
                      margin: const EdgeInsets.only(right: AppTheme.spacingM),
                      decoration: BoxDecoration(
                        color: isSelected ? pet.color.withValues(alpha: 0.1) : AppTheme.backgroundColor,
                        borderRadius: BorderRadius.circular(AppTheme.borderRadiusMedium),
                        border: Border.all(
                          color: isSelected ? pet.color : AppTheme.dividerColor,
                          width: isSelected ? 2 : 1,
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            pet.avatar,
                            style: const TextStyle(fontSize: 24),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            pet.name,
                            style: TextStyle(
                              fontSize: AppTheme.fontSizeS,
                              fontWeight: FontWeight.w600,
                              color: isSelected ? pet.color : AppTheme.textPrimaryColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPetDetails() {
    final pet = _pets[_selectedPetIndex];
    
    return SingleChildScrollView(
      padding: const EdgeInsets.all(AppTheme.spacingL),
      child: Column(
        children: [
          // 宠物基本信息
          PetAppComponents.buildCard(
            child: Column(
              children: [
                // 宠物头像
                CircleAvatar(
                  radius: 60,
                  backgroundColor: pet.color.withValues(alpha: 0.1),
                  child: Text(
                    pet.avatar,
                    style: const TextStyle(fontSize: 48),
                  ),
                ),
                const SizedBox(height: AppTheme.spacingM),
                
                // 宠物名称
                Text(
                  pet.name,
                  style: const TextStyle(
                    fontSize: AppTheme.fontSizeXL,
                    fontWeight: FontWeight.bold,
                    color: AppTheme.textPrimaryColor,
                  ),
                ),
                const SizedBox(height: AppTheme.spacingS),
                
                // 宠物品种
                Text(
                  '${pet.breed} · ${pet.gender}',
                  style: TextStyle(
                    fontSize: AppTheme.fontSizeM,
                    color: AppTheme.textSecondaryColor,
                  ),
                ),
                const SizedBox(height: AppTheme.spacingS),
                _buildIdentityBar(pet.identityCode),
                const SizedBox(height: AppTheme.spacingL),
                
                // 操作按钮
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton.icon(
                        onPressed: () => _editPet(pet),
                        icon: const Icon(Icons.edit),
                        label: const Text('编辑'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppTheme.primaryColor,
                          foregroundColor: Colors.white,
                        ),
                      ),
                    ),
                    const SizedBox(width: AppTheme.spacingM),
                    Expanded(
                      child: OutlinedButton.icon(
                        onPressed: () => _deletePet(pet),
                        icon: const Icon(Icons.delete),
                        label: const Text('删除'),
                        style: OutlinedButton.styleFrom(
                          foregroundColor: AppTheme.errorColor,
                          side: BorderSide(color: AppTheme.errorColor),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          
          const SizedBox(height: AppTheme.spacingL),
          
          // 宠物详细信息
          PetAppComponents.buildCard(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '详细信息',
                  style: const TextStyle(
                    fontSize: AppTheme.fontSizeL,
                    fontWeight: FontWeight.bold,
                    color: AppTheme.textPrimaryColor,
                  ),
                ),
                const SizedBox(height: AppTheme.spacingM),
                
                PetAppComponents.buildInfoRow(
                  label: '品种',
                  value: pet.breed,
                  icon: Icons.pets,
                ),
                PetAppComponents.buildInfoRow(
                  label: '性别',
                  value: pet.gender,
                  icon: Icons.wc,
                ),
                PetAppComponents.buildInfoRow(
                  label: '出生日期',
                  value: '${pet.birthDate.year}年${pet.birthDate.month}月${pet.birthDate.day}日',
                  icon: Icons.cake,
                ),
                PetAppComponents.buildInfoRow(
                  label: '体重',
                  value: '${pet.weight}kg',
                  icon: Icons.monitor_weight,
                  showDivider: false,
                ),
                const SizedBox(height: AppTheme.spacingM),
                // 身份码信息区
                PetAppComponents.buildInfoRow(
                  label: '身份码',
                  value: pet.identityCode,
                  icon: Icons.qr_code_2,
                ),
              ],
            ),
          ),
          
          const SizedBox(height: AppTheme.spacingL),
          
          // 健康记录
          PetAppComponents.buildCard(
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
                
                _buildHealthRecordItem(
                  icon: Icons.vaccines,
                  title: '疫苗记录',
                  subtitle: '最近接种：2024-01-10',
                  color: AppTheme.primaryColor,
                  onTap: () => _viewVaccineRecords(pet),
                ),
                _buildHealthRecordItem(
                  icon: Icons.monitor_weight,
                  title: '体重记录',
                  subtitle: '当前体重：${pet.weight}kg',
                  color: AppTheme.secondaryColor,
                  onTap: () => _viewWeightRecords(pet),
                ),
                _buildHealthRecordItem(
                  icon: Icons.medical_services,
                  title: '就诊记录',
                  subtitle: '最近就诊：2023-12-25',
                  color: AppTheme.warningColor,
                  onTap: () => _viewMedicalRecords(pet),
                ),
                _buildHealthRecordItem(
                  icon: Icons.content_cut,
                  title: '美容记录',
                  subtitle: '最近美容：2024-01-12',
                  color: AppTheme.successColor,
                  onTap: () => _viewGroomingRecords(pet),
                  showDivider: false,
                ),
              ],
            ),
          ),
          
          const SizedBox(height: AppTheme.spacingL),
          
          // 快速操作
          PetAppComponents.buildCard(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '快速操作',
                  style: const TextStyle(
                    fontSize: AppTheme.fontSizeL,
                    fontWeight: FontWeight.bold,
                    color: AppTheme.textPrimaryColor,
                  ),
                ),
                const SizedBox(height: AppTheme.spacingM),
                
                Row(
                  children: [
                    Expanded(
                      child: _buildQuickActionButton(
                        icon: Icons.add,
                        label: '添加记录',
                        color: AppTheme.primaryColor,
                        onTap: () => _addRecord(pet),
                      ),
                    ),
                    const SizedBox(width: AppTheme.spacingM),
                    Expanded(
                      child: _buildQuickActionButton(
                        icon: Icons.calendar_today,
                        label: '设置提醒',
                        color: AppTheme.secondaryColor,
                        onTap: () => _setReminder(pet),
                      ),
                    ),
                    const SizedBox(width: AppTheme.spacingM),
                    Expanded(
                      child: _buildQuickActionButton(
                        icon: Icons.share,
                        label: '分享档案',
                        color: AppTheme.warningColor,
                        onTap: () => _shareProfile(pet),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHealthRecordItem({
    required IconData icon,
    required String title,
    required String subtitle,
    required Color color,
    required VoidCallback onTap,
    bool showDivider = true,
  }) {
    return Column(
      children: [
        ListTile(
          leading: Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: color.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(
              icon,
              color: color,
              size: 20,
            ),
          ),
          title: Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.w600,
              color: AppTheme.textPrimaryColor,
            ),
          ),
          subtitle: Text(
            subtitle,
            style: TextStyle(
              color: AppTheme.textSecondaryColor,
              fontSize: AppTheme.fontSizeS,
            ),
          ),
          trailing: const Icon(
            Icons.chevron_right,
            color: AppTheme.textSecondaryColor,
          ),
          onTap: onTap,
        ),
        if (showDivider)
          Divider(
            color: AppTheme.dividerColor,
            height: 1,
            indent: 56,
          ),
      ],
    );
  }

  // 健康页签：将健康记录提升为一级标签
  Widget _buildHealthTab() {
    final pet = _pets[_selectedPetIndex];
    return SingleChildScrollView(
      padding: const EdgeInsets.all(AppTheme.spacingL),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 顶部身份码条与快速新增
          Row(
            children: [
              Expanded(child: _buildIdentityBar(pet.identityCode)),
              const SizedBox(width: AppTheme.spacingM),
              ElevatedButton.icon(
                onPressed: () => _addRecord(pet),
                icon: const Icon(Icons.add),
                label: const Text('新增记录'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppTheme.primaryColor,
                  foregroundColor: Colors.white,
                ),
              ),
            ],
          ),
          const SizedBox(height: AppTheme.spacingL),

          // 快捷入口到 RecordsPage 的不同筛选
          Wrap(
            spacing: AppTheme.spacingM,
            runSpacing: AppTheme.spacingM,
            children: [
              _quickHealthChip(
                icon: Icons.vaccines,
                label: '疫苗记录',
                color: AppTheme.primaryColor,
                onTap: () => _viewVaccineRecords(pet),
              ),
              _quickHealthChip(
                icon: Icons.monitor_weight,
                label: '体重记录',
                color: AppTheme.secondaryColor,
                onTap: () => _viewWeightRecords(pet),
              ),
              _quickHealthChip(
                icon: Icons.medical_services,
                label: '就诊记录',
                color: AppTheme.warningColor,
                onTap: () => _viewMedicalRecords(pet),
              ),
            ],
          ),
          const SizedBox(height: AppTheme.spacingL),

          // 引导说明
          Text(
            '在健康记录页可按宠物、类型、日期、关键词筛选，并支持时间线视图与二维码/复制身份码',
            style: TextStyle(color: AppTheme.textSecondaryColor),
          ),
        ],
      ),
    );
  }

  Widget _quickHealthChip({required IconData icon, required String label, required Color color, required VoidCallback onTap}) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(24),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
        decoration: BoxDecoration(
          color: color.withValues(alpha: 0.08),
          borderRadius: BorderRadius.circular(24),
          border: Border.all(color: color.withValues(alpha: 0.25)),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, color: color, size: 18),
            const SizedBox(width: 6),
            Text(label, style: TextStyle(color: color, fontWeight: FontWeight.w600)),
          ],
        ),
      ),
    );
  }

  // 通用身份码条
  Widget _buildIdentityBar(String code) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: AppTheme.dividerColor),
        boxShadow: AppTheme.cardShadow,
      ),
      child: Row(
        children: [
          const Icon(Icons.qr_code_2, size: 18, color: Colors.grey),
          const SizedBox(width: 8),
          Expanded(
            child: SelectableText(
              code,
              style: const TextStyle(fontWeight: FontWeight.w700, letterSpacing: 0.5),
            ),
          ),
          IconButton(
            tooltip: '复制',
            icon: const Icon(Icons.copy, size: 18, color: Colors.grey),
            onPressed: () async {
              await Clipboard.setData(ClipboardData(text: code));
              if (!mounted) return;
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('已复制身份码')));
            },
          ),
          IconButton(
            tooltip: '二维码',
            icon: const Icon(Icons.qr_code, size: 18, color: Colors.grey),
            onPressed: () => _showIdentityQrDialog(code),
          ),
        ],
      ),
    );
  }

  // 顶部紧凑信息条：头像 + 名称 + 基础信息（单行可读）
  Widget _buildCompactInfoHeader() {
    final pet = _pets[_selectedPetIndex];
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: AppTheme.spacingM),
      padding: const EdgeInsets.all(AppTheme.spacingM),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(AppTheme.borderRadiusMedium),
        border: Border.all(color: AppTheme.dividerColor),
        boxShadow: AppTheme.cardShadow,
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: 24,
            backgroundColor: pet.color.withValues(alpha: 0.12),
            child: Text(pet.avatar, style: const TextStyle(fontSize: 22)),
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
                        pet.name,
                        style: const TextStyle(fontWeight: FontWeight.w700, color: AppTheme.textPrimaryColor),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        color: pet.color.withValues(alpha: 0.1),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        pet.breed,
                        style: TextStyle(color: pet.color, fontSize: AppTheme.fontSizeXS, fontWeight: FontWeight.w700),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 6),
                Row(
                  children: [
                    Icon(Icons.cake, size: 14, color: AppTheme.textSecondaryColor),
                    const SizedBox(width: 4),
                    Text('${pet.birthDate.year}-${pet.birthDate.month}-${pet.birthDate.day}', style: TextStyle(color: AppTheme.textSecondaryColor, fontSize: AppTheme.fontSizeS)),
                    const SizedBox(width: 12),
                    Icon(Icons.monitor_weight, size: 14, color: AppTheme.textSecondaryColor),
                    const SizedBox(width: 4),
                    Text('${pet.weight}kg', style: TextStyle(color: AppTheme.textSecondaryColor, fontSize: AppTheme.fontSizeS)),
                    const SizedBox(width: 12),
                    Icon(Icons.qr_code_2, size: 14, color: AppTheme.textSecondaryColor),
                    const SizedBox(width: 4),
                    Flexible(
                      child: Text(pet.identityCode, style: TextStyle(color: AppTheme.textSecondaryColor, fontSize: AppTheme.fontSizeS), overflow: TextOverflow.ellipsis),
                    ),
                    IconButton(
                      padding: EdgeInsets.zero,
                      constraints: const BoxConstraints(minWidth: 24, minHeight: 24),
                      icon: const Icon(Icons.copy, size: 16, color: Colors.grey),
                      onPressed: () async {
                        await Clipboard.setData(ClipboardData(text: pet.identityCode));
                        if (!mounted) return;
                        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('已复制身份码')));
                      },
                    ),
                    IconButton(
                      padding: EdgeInsets.zero,
                      constraints: const BoxConstraints(minWidth: 24, minHeight: 24),
                      icon: const Icon(Icons.qr_code, size: 16, color: Colors.grey),
                      onPressed: () => _showIdentityQrDialog(pet.identityCode),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // 健康主区块：组合健康页签内容为主视图
  Widget _buildHealthSection() {
    final pet = _pets[_selectedPetIndex];
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: AppTheme.spacingL),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 快捷入口
          Wrap(
            spacing: AppTheme.spacingM,
            runSpacing: AppTheme.spacingM,
            children: [
              _quickHealthChip(
                icon: Icons.vaccines,
                label: '疫苗记录',
                color: AppTheme.primaryColor,
                onTap: () => _viewVaccineRecords(pet),
              ),
              _quickHealthChip(
                icon: Icons.monitor_weight,
                label: '体重记录',
                color: AppTheme.secondaryColor,
                onTap: () => _viewWeightRecords(pet),
              ),
              _quickHealthChip(
                icon: Icons.medical_services,
                label: '就诊记录',
                color: AppTheme.warningColor,
                onTap: () => _viewMedicalRecords(pet),
              ),
              _quickHealthChip(
                icon: Icons.library_add,
                label: '新增记录',
                color: AppTheme.successColor,
                onTap: () => _addRecord(pet),
              ),
            ],
          ),
          const SizedBox(height: AppTheme.spacingL),
          // 引导
          Text(
            '前往健康记录页可进行详细筛选、时间线浏览、身份码复制/二维码等操作',
            style: TextStyle(color: AppTheme.textSecondaryColor),
          ),
        ],
      ),
    );
  }
  Widget _buildQuickActionButton({
    required IconData icon,
    required String label,
    required Color color,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: AppTheme.spacingM),
        decoration: BoxDecoration(
          color: color.withValues(alpha: 0.1),
          borderRadius: BorderRadius.circular(AppTheme.borderRadiusMedium),
          border: Border.all(
            color: color.withValues(alpha: 0.3),
            width: 1,
          ),
        ),
        child: Column(
          children: [
            Icon(
              icon,
              color: color,
              size: 24,
            ),
            const SizedBox(height: 4),
            Text(
              label,
              style: TextStyle(
                color: color,
                fontSize: AppTheme.fontSizeS,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }

  // 导航到个人资料页面
  void _navigateToProfile() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => const ProfilePage()),
    );
  }

  // 宠物管理方法
  void _addPet() {
    AppErrorHandler.handleError(context, '添加宠物功能开发中...');
  }

  void _editPet(Pet pet) {
    AppErrorHandler.handleError(context, '编辑宠物功能开发中...');
  }

  void _deletePet(Pet pet) {
    AppErrorHandler.showConfirmDialog(
      context,
      title: '删除宠物',
      content: '确定要删除宠物"${pet.name}"吗？此操作不可撤销。',
      confirmText: '删除',
      cancelText: '取消',
    ).then((confirmed) {
      if (confirmed) {
        AppErrorHandler.handleError(context, '删除宠物功能开发中...');
      }
    });
  }

  // 健康记录方法
  void _viewVaccineRecords(Pet pet) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => RecordsPage(
          initialPetId: pet.id,
          initialFilterType: HealthRecordType.vaccination,
        ),
      ),
    );
  }

  void _viewWeightRecords(Pet pet) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => RecordsPage(
          initialPetId: pet.id,
          initialFilterType: HealthRecordType.weight,
        ),
      ),
    );
  }

  void _viewMedicalRecords(Pet pet) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => RecordsPage(
          initialPetId: pet.id,
          initialFilterType: HealthRecordType.vetVisit,
        ),
      ),
    );
  }

  void _viewGroomingRecords(Pet pet) {
    AppErrorHandler.handleError(context, '美容记录功能开发中...');
  }

  // 快速操作方法
  void _addRecord(Pet pet) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => const RecordsPage(openAddSheet: true),
      ),
    );
  }

  void _setReminder(Pet pet) {
    AppErrorHandler.handleError(context, '设置提醒功能开发中...');
  }

  void _shareProfile(Pet pet) {
    AppErrorHandler.handleError(context, '分享档案功能开发中...');
  }
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
                QrImageView(
                  data: code,
                  size: 200,
                  version: QrVersions.auto,
                ),
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

// 数据模型
class UserProfile {
  final String name;
  final String phone;
  final String email;
  final String avatar;
  final DateTime joinDate;
  final String address;
  final String bio;

  const UserProfile({
    required this.name,
    required this.phone,
    required this.email,
    required this.avatar,
    required this.joinDate,
    required this.address,
    required this.bio,
  });
}

class Pet {
  final String id;
  final String name;
  final String type;
  final String breed;
  final String avatar;
  final String identityCode; // 唯一身份码
  final Color color;
  final DateTime birthDate;
  final double weight;
  final String gender;

  const Pet({
    required this.id,
    required this.name,
    required this.type,
    required this.breed,
    required this.avatar,
    required this.identityCode,
    required this.color,
    required this.birthDate,
    required this.weight,
    required this.gender,
  });
}
