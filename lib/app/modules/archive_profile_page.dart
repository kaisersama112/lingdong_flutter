import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class ArchiveProfilePage extends StatefulWidget {
  const ArchiveProfilePage({super.key});

  @override
  State<ArchiveProfilePage> createState() => _ArchiveProfilePageState();
}

class _ArchiveProfilePageState extends State<ArchiveProfilePage> with TickerProviderStateMixin {
  late TabController _tabController;
  int _selectedPetIndex = 0;
  
  // 模拟宠物数据
  final List<Pet> _pets = [
    Pet(
      id: '1',
      name: '小白',
      type: '猫咪',
      breed: '英短',
      avatar: '🐱',
      color: Colors.orange,
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
      color: Colors.amber,
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
      color: Colors.grey,
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
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.backgroundColor,
      body: Column(
        children: [
          // 宠物选择器
          _buildPetSelector(),
          
          // 标签页
          _buildTabBar(),
          
          // 内容区域
          Expanded(
            child: _buildTabBarView(),
          ),
        ],
      ),
    );
  }

  Widget _buildPetSelector() {
    return Container(
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            children: [
              Text(
                '我的宠物',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Colors.grey[800],
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
          const SizedBox(height: 12),
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
                  child: Container(
                    width: 80,
                    margin: const EdgeInsets.only(right: 12),
                    decoration: BoxDecoration(
                      color: isSelected ? pet.color.withOpacity(0.1) : Colors.grey[100],
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: isSelected ? pet.color : Colors.transparent,
                        width: 2,
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          pet.avatar,
                          style: const TextStyle(fontSize: 32),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          pet.name,
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
                            color: isSelected ? pet.color : Colors.grey[600],
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
    );
  }

  Widget _buildTabBar() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: TabBar(
        controller: _tabController,
        indicator: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: _pets[_selectedPetIndex].color.withOpacity(0.2),
        ),
        labelColor: _pets[_selectedPetIndex].color,
        unselectedLabelColor: Colors.grey[600],
        labelStyle: const TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
        unselectedLabelStyle: const TextStyle(fontWeight: FontWeight.normal, fontSize: 16),
        tabs: const [
          Tab(text: '宠物档案'),
          Tab(text: '个人信息'),
        ],
      ),
    );
  }

  Widget _buildTabBarView() {
    return TabBarView(
      controller: _tabController,
      children: [
        _buildPetArchiveTab(),
        _buildUserProfileTab(),
      ],
    );
  }

  Widget _buildPetArchiveTab() {
    final selectedPet = _pets[_selectedPetIndex];
    
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        // 宠物基本信息卡片
        _buildPetInfoCard(selectedPet),
        
        const SizedBox(height: 16),
        
        // 健康记录卡片
        _buildHealthRecordCard(selectedPet),
        
        const SizedBox(height: 16),
        
        // 体重记录卡片
        _buildWeightRecordCard(selectedPet),
        
        const SizedBox(height: 16),
        
        // 疫苗记录卡片
        _buildVaccineRecordCard(selectedPet),
        
        const SizedBox(height: 16),
        
        // 驱虫记录卡片
        _buildDewormingRecordCard(selectedPet),
        
        const SizedBox(height: 16),
        
        // 就诊记录卡片
        _buildMedicalRecordCard(selectedPet),
        
        const SizedBox(height: 16),
        
        // 美容养护记录卡片
        _buildGroomingRecordCard(selectedPet),
        
        const SizedBox(height: 16),
        
        // 体检记录卡片
        _buildCheckupRecordCard(selectedPet),
        
        const SizedBox(height: 16),
        
        // 其他健康记录卡片
        _buildOtherHealthRecordCard(selectedPet),
      ],
    );
  }

  Widget _buildPetInfoCard(Pet pet) {
    return _buildRecordCard(
      title: '基本信息',
      icon: Icons.pets,
      color: pet.color,
      child: Column(
        children: [
          _buildInfoRow('姓名', pet.name),
          _buildInfoRow('类型', pet.type),
          _buildInfoRow('品种', pet.breed),
          _buildInfoRow('性别', pet.gender),
          _buildInfoRow('出生日期', '${pet.birthDate.year}-${pet.birthDate.month.toString().padLeft(2, '0')}-${pet.birthDate.day.toString().padLeft(2, '0')}'),
          _buildInfoRow('当前体重', '${pet.weight} kg'),
          _buildInfoRow('年龄', '${DateTime.now().difference(pet.birthDate).inDays ~/ 365}岁'),
        ],
      ),
    );
  }

  Widget _buildHealthRecordCard(Pet pet) {
    return _buildRecordCard(
      title: '健康状态',
      icon: Icons.favorite,
      color: Colors.red,
      child: Row(
        children: [
          Expanded(
            child: _buildHealthIndicator('体重', '正常', Colors.green),
          ),
          Expanded(
            child: _buildHealthIndicator('疫苗', '已接种', Colors.blue),
          ),
          Expanded(
            child: _buildHealthIndicator('驱虫', '已驱虫', Colors.orange),
          ),
        ],
      ),
    );
  }

  Widget _buildWeightRecordCard(Pet pet) {
    return _buildRecordCard(
      title: '体重记录',
      icon: Icons.monitor_weight,
      color: Colors.green,
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
      color: Colors.blue,
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
      color: Colors.orange,
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
      color: Colors.red,
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
      color: Colors.purple,
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
      color: Colors.teal,
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
      color: Colors.indigo,
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

  Widget _buildUserProfileTab() {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        // 用户头像和基本信息
        _buildUserInfoCard(),
        
        const SizedBox(height: 16),
        
        // 账户信息
        _buildAccountInfoCard(),
        
        const SizedBox(height: 16),
        
        // 设置选项
        _buildSettingsCard(),
      ],
    );
  }

  Widget _buildUserInfoCard() {
    return _buildRecordCard(
      title: '个人信息',
      icon: Icons.person,
      color: Colors.blue,
      child: Column(
        children: [
          Row(
            children: [
              Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                  color: Colors.blue[100],
                  borderRadius: BorderRadius.circular(40),
                ),
                child: Center(
                  child: Text(
                    _userProfile.avatar,
                    style: const TextStyle(fontSize: 40),
                  ),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      _userProfile.name,
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      '加入时间: ${_userProfile.joinDate.year}-${_userProfile.joinDate.month.toString().padLeft(2, '0')}-${_userProfile.joinDate.day.toString().padLeft(2, '0')}',
                      style: TextStyle(
                        color: Colors.grey[600],
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildAccountInfoCard() {
    return _buildRecordCard(
      title: '账户信息',
      icon: Icons.account_circle,
      color: Colors.green,
      child: Column(
        children: [
          _buildInfoRow('手机号码', _userProfile.phone),
          _buildInfoRow('邮箱地址', _userProfile.email),
          _buildInfoRow('所在地区', _userProfile.address),
        ],
      ),
    );
  }

  Widget _buildSettingsCard() {
    return _buildRecordCard(
      title: '设置',
      icon: Icons.settings,
      color: Colors.grey,
      child: Column(
        children: [
          _buildSettingItem(Icons.notifications, '消息通知', '已开启'),
          _buildSettingItem(Icons.privacy_tip, '隐私设置', '已设置'),
          _buildSettingItem(Icons.security, '账户安全', '已保护'),
          _buildSettingItem(Icons.help_outline, '帮助与反馈', ''),
          _buildSettingItem(Icons.info_outline, '关于我们', 'v1.0.0'),
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
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(icon, color: color, size: 24),
                const SizedBox(width: 8),
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Colors.grey[800],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            child,
          ],
        ),
      ),
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          SizedBox(
            width: 80,
            child: Text(
              label,
              style: TextStyle(
                color: Colors.grey[600],
                fontSize: 14,
              ),
            ),
          ),
          Expanded(
            child: Text(
              value,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
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
          ),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: TextStyle(
            fontSize: 12,
            color: Colors.grey[600],
          ),
        ),
        Text(
          status,
          style: TextStyle(
            fontSize: 12,
            color: color,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }

  Widget _buildRecordItem(String title, String date, String status) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          Expanded(
            child: Text(
              title,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Text(
            date,
            style: TextStyle(
              fontSize: 12,
              color: Colors.grey[600],
            ),
          ),
          const SizedBox(width: 8),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
            decoration: BoxDecoration(
              color: Colors.green[100],
              borderRadius: BorderRadius.circular(12),
            ),
            child: Text(
              status,
              style: TextStyle(
                fontSize: 10,
                color: Colors.green[700],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAddButton(String text) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 12),
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey[300]!, width: 1),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.add, size: 16, color: Colors.grey[600]),
          const SizedBox(width: 4),
          Text(
            text,
            style: TextStyle(
              color: Colors.grey[600],
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSettingItem(IconData icon, String title, String value) {
    return ListTile(
      leading: Icon(icon, color: Colors.grey[600]),
      title: Text(title),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (value.isNotEmpty)
            Text(
              value,
              style: TextStyle(
                color: Colors.grey[600],
                fontSize: 12,
              ),
            ),
          const SizedBox(width: 4),
          Icon(Icons.chevron_right, color: Colors.grey[400]),
        ],
      ),
      onTap: () {
        _showSettingDialog(title);
      },
    );
  }

  void _showAddPetDialog() {
    _showSnackBar('添加宠物功能开发中...');
  }

  void _showSettingDialog(String setting) {
    _showSnackBar('$setting 功能开发中...');
  }

  void _showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
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