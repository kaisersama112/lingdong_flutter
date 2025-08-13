import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../theme/app_components.dart';
import '../services/user_auth_service.dart';
import '../modules/auth/login_page.dart';
import 'tools/tools_entry.dart';

class ArchiveProfilePage extends StatefulWidget {
  const ArchiveProfilePage({super.key});

  @override
  State<ArchiveProfilePage> createState() => _ArchiveProfilePageState();
}

class _ArchiveProfilePageState extends State<ArchiveProfilePage> {
  int _selectedPetIndex = 0;
  final _authService = UserAuthService();

  // 模拟宠物数据
  final List<Pet> _pets = [
    Pet(
      id: '1',
      name: '小白',
      type: '猫咪',
      breed: '英短',
      avatar: '🐱',
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
      color: AppTheme.warningColor,
      birthDate: DateTime(2023, 1, 10),
      weight: 3.8,
      gender: '母',
    ),
  ];

  // 模拟用户数据
  final UserProfile _userProfile = UserProfile(
    name: '张三',
    phone: '138****8888',
    email: 'zhangsan@example.com',
    avatar: '👤',
    joinDate: DateTime(2020, 6, 1),
    address: '北京市朝阳区',
  );

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: AppTheme.sunsetGradient,
        ),
        child: SafeArea(
          child: Column(
            children: [
              // 头部区域
              _buildHeader(),
              
              // 内容区域
              Expanded(
                child: Container(
                  decoration: const BoxDecoration(
                    color: AppTheme.backgroundColor,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(AppTheme.borderRadiusXLarge),
                      topRight: Radius.circular(AppTheme.borderRadiusXLarge),
                    ),
                  ),
                  child: Column(
                    children: [
                      // 宠物选择器
                      _buildPetSelector(),

                      // 内容区域（以宠物为中心）
                      Expanded(child: _buildPetArchiveList()),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    final pet = _pets[_selectedPetIndex];
    return Container(
      padding: const EdgeInsets.all(AppTheme.spacingL),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(AppTheme.spacingS),
            decoration: AppTheme.glassmorphismDecoration,
            child: const Icon(
              Icons.pets,
              color: Colors.white,
              size: 24,
            ),
          ),
          const SizedBox(width: AppTheme.spacingM),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${pet.name} · ${pet.breed}',
                  style: AppTheme.headingStyle.copyWith(
                    color: Colors.white,
                    fontSize: AppTheme.fontSizeXXL,
                  ),
                ),
                Text(
                  '宠物档案管理',
                  style: AppTheme.captionStyle.copyWith(
                    color: Colors.white.withOpacity(0.8),
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(AppTheme.spacingS),
            decoration: AppTheme.glassmorphismDecoration,
            child: IconButton(
              icon: CircleAvatar(
                radius: 16,
                backgroundColor: Colors.white.withOpacity(0.2),
                child: Text(
                  _userProfile.avatar,
                  style: const TextStyle(fontSize: 16, color: Colors.white),
                ),
              ),
              onPressed: () => _showUserProfile(),
            ),
          ),
          const SizedBox(width: AppTheme.spacingS),
          Container(
            padding: const EdgeInsets.all(AppTheme.spacingS),
            decoration: AppTheme.glassmorphismDecoration,
            child: IconButton(
              icon: const Icon(Icons.construction, color: Colors.white),
              onPressed: () {
                Navigator.of(
                  context,
                ).push(MaterialPageRoute(builder: (_) => const ToolsEntry()));
              },
            ),
          ),
          const SizedBox(width: AppTheme.spacingS),
          Container(
            padding: const EdgeInsets.all(AppTheme.spacingS),
            decoration: AppTheme.glassmorphismDecoration,
            child: IconButton(
              icon: const Icon(Icons.logout, color: Colors.white),
              onPressed: () => _handleLogout(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPetSelector() {
    return Container(
      margin: const EdgeInsets.all(AppTheme.spacingM),
      decoration: AppTheme.glassmorphismDecoration,
      child: Padding(
        padding: const EdgeInsets.all(AppTheme.spacingM),
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  '我的宠物',
                  style: AppTheme.subheadingStyle.copyWith(
                    color: AppTheme.textPrimaryColor,
                  ),
                ),
                const Spacer(),
                IconButton(
                  icon: const Icon(Icons.add_circle_outline),
                  onPressed: () {
                    _showAddPetDialog();
                  },
                  tooltip: '添加宠物',
                ),
              ],
            ),
            const SizedBox(height: AppTheme.spacingM),
            SizedBox(
              height: 100,
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
                    child: AnimatedContainer(
                      duration: AppTheme.mediumAnimation,
                      width: 80,
                      margin: const EdgeInsets.only(right: AppTheme.spacingM),
                      decoration: isSelected
                          ? BoxDecoration(
                              gradient: LinearGradient(
                                colors: [
                                  pet.color,
                                  pet.color.withOpacity(0.8),
                                ],
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                              ),
                              borderRadius: BorderRadius.circular(AppTheme.borderRadiusLarge),
                              boxShadow: AppTheme.cardShadow,
                            )
                          : BoxDecoration(
                              color: AppTheme.surfaceColor,
                              borderRadius: BorderRadius.circular(AppTheme.borderRadiusLarge),
                              border: Border.all(color: AppTheme.dividerColor),
                            ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(pet.avatar, style: const TextStyle(fontSize: 32)),
                          const SizedBox(height: AppTheme.spacingXS),
                          Text(
                            pet.name,
                            style: TextStyle(
                              fontSize: AppTheme.fontSizeS,
                              fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
                              color: isSelected ? Colors.white : AppTheme.textSecondaryColor,
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

  Widget _buildPetArchiveList() {
    final selectedPet = _pets[_selectedPetIndex];
    return ListView(
      padding: const EdgeInsets.all(AppTheme.spacingM),
      children: [
        // 更紧凑的基本信息
        _buildPetInfoCompactCard(selectedPet),

        const SizedBox(height: AppTheme.spacingM),

        // 健康记录卡片
        _buildHealthRecordCard(selectedPet),

        const SizedBox(height: AppTheme.spacingM),

        // 体重记录卡片
        _buildWeightRecordCard(selectedPet),

        const SizedBox(height: AppTheme.spacingM),

        // 疫苗记录卡片
        _buildVaccineRecordCard(selectedPet),

        const SizedBox(height: AppTheme.spacingM),

        // 驱虫记录卡片
        _buildDewormingRecordCard(selectedPet),

        const SizedBox(height: AppTheme.spacingM),

        // 就诊记录卡片
        _buildMedicalRecordCard(selectedPet),

        const SizedBox(height: AppTheme.spacingM),

        // 美容养护记录卡片
        _buildGroomingRecordCard(selectedPet),

        const SizedBox(height: AppTheme.spacingM),

        // 体检记录卡片
        _buildCheckupRecordCard(selectedPet),

        const SizedBox(height: AppTheme.spacingM),

        // 其他健康记录卡片
        _buildOtherHealthRecordCard(selectedPet),
      ],
    );
  }

  Widget _buildPetInfoCompactCard(Pet pet) {
    return Container(
      decoration: AppTheme.cardDecoration,
      child: Padding(
        padding: const EdgeInsets.all(AppTheme.spacingM),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 64,
              height: 64,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    pet.color.withOpacity(0.2),
                    pet.color.withOpacity(0.1),
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(AppTheme.borderRadiusMedium),
                border: Border.all(
                  color: pet.color.withOpacity(0.3),
                  width: 1,
                ),
              ),
              child: Center(
                child: Text(pet.avatar, style: const TextStyle(fontSize: 36)),
              ),
            ),
            const SizedBox(width: AppTheme.spacingM),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        pet.name,
                        style: AppTheme.subheadingStyle.copyWith(
                          fontSize: AppTheme.fontSizeL,
                        ),
                      ),
                      const SizedBox(width: AppTheme.spacingS),
                      AppComponents.tag(
                        text: pet.type,
                        backgroundColor: pet.color.withOpacity(0.1),
                        textColor: pet.color,
                      ),
                    ],
                  ),
                  const SizedBox(height: AppTheme.spacingM),
                  Wrap(
                    spacing: AppTheme.spacingS,
                    runSpacing: AppTheme.spacingS,
                    children: [
                      _miniChip('品种: ${pet.breed}'),
                      _miniChip('性别: ${pet.gender}'),
                      _miniChip(
                        '出生: ${pet.birthDate.year}-${pet.birthDate.month.toString().padLeft(2, '0')}',
                      ),
                      _miniChip('体重: ${pet.weight} kg'),
                      _miniChip(
                        '年龄: ${DateTime.now().difference(pet.birthDate).inDays ~/ 365} 岁',
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _miniChip(String text) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AppTheme.spacingS,
        vertical: AppTheme.spacingXS,
      ),
      decoration: BoxDecoration(
        color: AppTheme.primaryLightColor,
        borderRadius: BorderRadius.circular(AppTheme.borderRadiusSmall),
        border: Border.all(color: AppTheme.primaryColor.withOpacity(0.3)),
      ),
      child: Text(
        text,
        style: AppTheme.captionStyle.copyWith(
          color: AppTheme.primaryColor,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }

  Widget _buildHealthRecordCard(Pet pet) {
    return _buildRecordCard(
      title: '健康状态',
      icon: Icons.favorite,
      color: AppTheme.errorColor,
      child: Row(
        children: [
          Expanded(child: _buildHealthIndicator('体重', '正常', AppTheme.successColor)),
          Expanded(child: _buildHealthIndicator('疫苗', '已接种', AppTheme.primaryColor)),
          Expanded(child: _buildHealthIndicator('驱虫', '已驱虫', AppTheme.warningColor)),
        ],
      ),
    );
  }

  Widget _buildWeightRecordCard(Pet pet) {
    return _buildRecordCard(
      title: '体重记录',
      icon: Icons.monitor_weight,
      color: AppTheme.successColor,
      child: Column(
        children: [
          _buildRecordItem('2024-01-15', '4.2 kg', '正常'),
          _buildRecordItem('2024-01-01', '4.0 kg', '正常'),
          _buildRecordItem('2023-12-15', '3.9 kg', '偏轻'),
          _buildAddButton('添加体重记录'),
        ],
      ),
    );
  }

  Widget _buildVaccineRecordCard(Pet pet) {
    return _buildRecordCard(
      title: '疫苗记录',
      icon: Icons.vaccines,
      color: AppTheme.primaryColor,
      child: Column(
        children: [
          _buildRecordItem('三联疫苗', '2024-01-10', '已接种'),
          _buildRecordItem('狂犬疫苗', '2023-12-20', '已接种'),
          _buildRecordItem('三联疫苗', '2023-06-15', '已接种'),
          _buildAddButton('添加疫苗记录'),
        ],
      ),
    );
  }

  Widget _buildDewormingRecordCard(Pet pet) {
    return _buildRecordCard(
      title: '驱虫记录',
      icon: Icons.bug_report,
      color: AppTheme.warningColor,
      child: Column(
        children: [
          _buildRecordItem('体内驱虫', '2024-01-05', '已驱虫'),
          _buildRecordItem('体外驱虫', '2024-01-05', '已驱虫'),
          _buildRecordItem('体内驱虫', '2023-12-05', '已驱虫'),
          _buildAddButton('添加驱虫记录'),
        ],
      ),
    );
  }

  Widget _buildMedicalRecordCard(Pet pet) {
    return _buildRecordCard(
      title: '就诊记录',
      icon: Icons.medical_services,
      color: AppTheme.errorColor,
      child: Column(
        children: [
          _buildRecordItem('感冒治疗', '2024-01-08', '已康复'),
          _buildRecordItem('年度体检', '2023-12-25', '正常'),
          _buildRecordItem('疫苗接种', '2023-06-15', '正常'),
          _buildAddButton('添加就诊记录'),
        ],
      ),
    );
  }

  Widget _buildGroomingRecordCard(Pet pet) {
    return _buildRecordCard(
      title: '美容养护',
      icon: Icons.content_cut,
      color: AppTheme.secondaryColor,
      child: Column(
        children: [
          _buildRecordItem('洗澡美容', '2024-01-12', '已完成'),
          _buildRecordItem('指甲修剪', '2024-01-12', '已完成'),
          _buildRecordItem('洗澡美容', '2023-12-28', '已完成'),
          _buildAddButton('添加美容记录'),
        ],
      ),
    );
  }

  Widget _buildCheckupRecordCard(Pet pet) {
    return _buildRecordCard(
      title: '体检记录',
      icon: Icons.health_and_safety,
      color: AppTheme.successColor,
      child: Column(
        children: [
          _buildRecordItem('年度体检', '2023-12-25', '各项指标正常'),
          _buildRecordItem('疫苗接种前体检', '2023-06-10', '适合接种'),
          _buildRecordItem('年度体检', '2022-12-20', '各项指标正常'),
          _buildAddButton('添加体检记录'),
        ],
      ),
    );
  }

  Widget _buildOtherHealthRecordCard(Pet pet) {
    return _buildRecordCard(
      title: '其他健康记录',
      icon: Icons.medical_information,
      color: AppTheme.primaryColor,
      child: Column(
        children: [
          _buildRecordItem('牙齿检查', '2024-01-10', '牙齿健康'),
          _buildRecordItem('耳道清洁', '2024-01-05', '已完成'),
          _buildRecordItem('皮肤检查', '2023-12-30', '皮肤健康'),
          _buildAddButton('添加健康记录'),
        ],
      ),
    );
  }

  Widget _buildRecordCard({
    required String title,
    required IconData icon,
    required Color color,
    required Widget child,
  }) {
    return Container(
      decoration: AppTheme.cardDecoration,
      child: Padding(
        padding: const EdgeInsets.all(AppTheme.spacingM),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(AppTheme.spacingS),
                  decoration: BoxDecoration(
                    color: color.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(AppTheme.borderRadiusSmall),
                  ),
                  child: Icon(icon, color: color, size: 20),
                ),
                const SizedBox(width: AppTheme.spacingM),
                Text(
                  title,
                  style: AppTheme.subheadingStyle.copyWith(
                    fontSize: AppTheme.fontSizeL,
                  ),
                ),
              ],
            ),
            const SizedBox(height: AppTheme.spacingM),
            child,
          ],
        ),
      ),
    );
  }

  Widget _buildHealthIndicator(String label, String status, Color color) {
    return Column(
      children: [
        Container(
          width: 12,
          height: 12,
          decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: color.withOpacity(0.3),
                blurRadius: 4,
                spreadRadius: 1,
              ),
            ],
          ),
        ),
        const SizedBox(height: AppTheme.spacingXS),
        Text(
          label,
          style: AppTheme.captionStyle.copyWith(
            color: AppTheme.textSecondaryColor,
          ),
        ),
        Text(
          status,
          style: AppTheme.captionStyle.copyWith(
            color: color,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }

  Widget _buildRecordItem(String title, String date, String status) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: AppTheme.spacingS),
      child: Row(
        children: [
          Expanded(
            child: Text(
              title,
              style: AppTheme.bodyStyle.copyWith(
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Text(
            date,
            style: AppTheme.captionStyle.copyWith(
              color: AppTheme.textSecondaryColor,
            ),
          ),
          const SizedBox(width: AppTheme.spacingS),
          AppComponents.statusTag(
            text: status,
            isActive: status == '正常' || status == '已接种' || status == '已驱虫' || status == '已完成',
          ),
        ],
      ),
    );
  }

  Widget _buildAddButton(String text) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: AppTheme.spacingM),
      decoration: BoxDecoration(
        color: AppTheme.primaryLightColor,
        borderRadius: BorderRadius.circular(AppTheme.borderRadiusMedium),
        border: Border.all(
          color: AppTheme.primaryColor.withOpacity(0.3),
          width: 1,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.add,
            size: 16,
            color: AppTheme.primaryColor,
          ),
          const SizedBox(width: AppTheme.spacingXS),
          Text(
            text,
            style: AppTheme.captionStyle.copyWith(
              color: AppTheme.primaryColor,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  void _showUserProfile() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(AppTheme.borderRadiusXLarge),
        ),
      ),
      builder: (context) => Container(
        padding: const EdgeInsets.all(AppTheme.spacingL),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // 用户头像和信息
            Row(
              children: [
                Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    gradient: AppTheme.primaryGradient,
                    borderRadius: BorderRadius.circular(AppTheme.borderRadiusLarge),
                  ),
                  child: Center(
                    child: Text(
                      _userProfile.avatar,
                      style: const TextStyle(fontSize: 28, color: Colors.white),
                    ),
                  ),
                ),
                const SizedBox(width: AppTheme.spacingM),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        _userProfile.name,
                        style: AppTheme.headingStyle.copyWith(
                          fontSize: AppTheme.fontSizeXL,
                        ),
                      ),
                      const SizedBox(height: AppTheme.spacingXS),
                      Text(
                        _userProfile.email,
                        style: AppTheme.captionStyle,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: AppTheme.spacingL),
            
            // 用户信息列表
            AppComponents.infoRow(
              label: '手机号',
              value: _userProfile.phone,
            ),
            AppComponents.infoRow(
              label: '地址',
              value: _userProfile.address,
            ),
            AppComponents.infoRow(
              label: '注册时间',
              value: '${_userProfile.joinDate.year}-${_userProfile.joinDate.month.toString().padLeft(2, '0')}',
            ),
            
            const SizedBox(height: AppTheme.spacingL),
            
            // 操作按钮
            Row(
              children: [
                Expanded(
                  child: OutlinedButton.icon(
                    onPressed: () {},
                    icon: const Icon(Icons.settings),
                    label: const Text('设置'),
                    style: AppTheme.secondaryButtonStyle,
                  ),
                ),
                const SizedBox(width: AppTheme.spacingM),
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: () {},
                    icon: const Icon(Icons.edit),
                    label: const Text('编辑'),
                    style: AppTheme.primaryButtonStyle,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _showAddPetDialog() {
    _showSnackBar('添加宠物功能开发中...');
  }

  void _showSnackBar(String message) {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text(message)));
  }

  Future<void> _handleLogout() async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('确认登出'),
        content: const Text('确定要退出登录吗？'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: const Text('取消'),
          ),
          ElevatedButton(
            onPressed: () => Navigator.pop(context, true),
            child: const Text('确认'),
          ),
        ],
      ),
    );

    if (confirmed == true) {
      await _authService.logout();
      if (mounted) {
        Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => const LoginPage()),
          (route) => false,
        );
      }
    }
  }
}

// 宠物数据模型
class Pet {
  final String id;
  final String name;
  final String type;
  final String breed;
  final String avatar;
  final Color color;
  final DateTime birthDate;
  final double weight;
  final String gender;

  Pet({
    required this.id,
    required this.name,
    required this.type,
    required this.breed,
    required this.avatar,
    required this.color,
    required this.birthDate,
    required this.weight,
    required this.gender,
  });
}

// 用户档案数据模型
class UserProfile {
  final String name;
  final String phone;
  final String email;
  final String avatar;
  final DateTime joinDate;
  final String address;

  UserProfile({
    required this.name,
    required this.phone,
    required this.email,
    required this.avatar,
    required this.joinDate,
    required this.address,
  });
}
