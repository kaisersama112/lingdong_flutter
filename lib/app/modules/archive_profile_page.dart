import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import 'tools/tools_entry.dart';

class ArchiveProfilePage extends StatefulWidget {
  const ArchiveProfilePage({super.key});

  @override
  State<ArchiveProfilePage> createState() => _ArchiveProfilePageState();
}

class _ArchiveProfilePageState extends State<ArchiveProfilePage> {
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
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      endDrawer: _buildEndDrawer(),
      backgroundColor: AppTheme.backgroundColor,
      body: Column(
        children: [
          // 宠物选择器
          _buildPetSelector(),

          // 内容区域（以宠物为中心）
          Expanded(child: _buildPetArchiveList()),
        ],
      ),
    );
  }

  AppBar _buildAppBar() {
    final pet = _pets[_selectedPetIndex];
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0.5,
      title: Row(
        children: [
          const Icon(Icons.pets, color: Colors.black87),
          const SizedBox(width: 6),
          Text(
            '${pet.name} · ${pet.breed}',
            style: const TextStyle(
              color: Colors.black87,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
      actions: [
        Builder(
          builder: (context) {
            return IconButton(
              tooltip: '个人中心',
              icon: CircleAvatar(
                radius: 16,
                backgroundColor: Colors.blue[100],
                child: Text(
                  _userProfile.avatar,
                  style: const TextStyle(fontSize: 16),
                ),
              ),
              onPressed: () => Scaffold.of(context).openEndDrawer(),
            );
          },
        ),
        IconButton(
          tooltip: '实用工具',
          icon: const Icon(Icons.construction, color: Colors.black87),
          onPressed: () {
            Navigator.of(
              context,
            ).push(MaterialPageRoute(builder: (_) => const ToolsEntry()));
          },
        ),
        const SizedBox(width: 6),
      ],
      iconTheme: const IconThemeData(color: Colors.black87),
    );
  }

  Widget _buildEndDrawer() {
    return Drawer(
      width: 300,
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 28,
                    backgroundColor: Colors.blue[100],
                    child: Text(
                      _userProfile.avatar,
                      style: const TextStyle(fontSize: 28),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          _userProfile.name,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          _userProfile.email,
                          style: TextStyle(
                            color: Colors.grey[600],
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const Divider(height: 1),
            Expanded(
              child: ListView(
                children: [
                  ListTile(
                    leading: const Icon(Icons.badge_outlined),
                    title: const Text('账户信息'),
                    subtitle: Text(
                      '${_userProfile.phone} · ${_userProfile.address}',
                    ),
                  ),
                  ListTile(
                    leading: const Icon(Icons.notifications_outlined),
                    title: const Text('消息通知'),
                    trailing: const Icon(Icons.chevron_right),
                    onTap: () {},
                  ),
                  ListTile(
                    leading: const Icon(Icons.privacy_tip_outlined),
                    title: const Text('隐私设置'),
                    trailing: const Icon(Icons.chevron_right),
                    onTap: () {},
                  ),
                  ListTile(
                    leading: const Icon(Icons.help_outline),
                    title: const Text('帮助与反馈'),
                    trailing: const Icon(Icons.chevron_right),
                    onTap: () {},
                  ),
                  ListTile(
                    leading: const Icon(Icons.info_outline),
                    title: const Text('关于应用'),
                    trailing: const Icon(Icons.chevron_right),
                    onTap: () {},
                  ),
                ],
              ),
            ),
          ],
        ),
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
                      color: isSelected
                          ? pet.color.withOpacity(0.1)
                          : Colors.grey[100],
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: isSelected ? pet.color : Colors.transparent,
                        width: 2,
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(pet.avatar, style: const TextStyle(fontSize: 32)),
                        const SizedBox(height: 4),
                        Text(
                          pet.name,
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: isSelected
                                ? FontWeight.w600
                                : FontWeight.normal,
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

  Widget _buildPetArchiveList() {
    final selectedPet = _pets[_selectedPetIndex];
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        // 更紧凑的基本信息
        _buildPetInfoCompactCard(selectedPet),

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

  Widget _buildPetInfoCompactCard(Pet pet) {
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
        padding: const EdgeInsets.all(14),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 64,
              height: 64,
              decoration: BoxDecoration(
                color: pet.color.withOpacity(0.15),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Center(
                child: Text(pet.avatar, style: const TextStyle(fontSize: 36)),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        pet.name,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const SizedBox(width: 8),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color: pet.color.withOpacity(0.12),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Text(
                          pet.type,
                          style: TextStyle(
                            color: pet.color,
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
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
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(
        text,
        style: const TextStyle(fontSize: 12, color: Colors.black87),
      ),
    );
  }

  // Widget _buildPetInfoCard(Pet pet) { /* 旧版：已由紧凑卡片替代 */ }

  Widget _buildHealthRecordCard(Pet pet) {
    return _buildRecordCard(
      title: '健康状态',
      icon: Icons.favorite,
      color: Colors.red,
      child: Row(
        children: [
          Expanded(child: _buildHealthIndicator('体重', '正常', Colors.green)),
          Expanded(child: _buildHealthIndicator('疫苗', '已接种', Colors.blue)),
          Expanded(child: _buildHealthIndicator('驱虫', '已驱虫', Colors.orange)),
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

  // Widget _buildInfoRow(String label, String value) { /* 旧版：未使用 */ }

  Widget _buildHealthIndicator(String label, String status, Color color) {
    return Column(
      children: [
        Container(
          width: 12,
          height: 12,
          decoration: BoxDecoration(color: color, shape: BoxShape.circle),
        ),
        const SizedBox(height: 4),
        Text(label, style: TextStyle(fontSize: 12, color: Colors.grey[600])),
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
              style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
            ),
          ),
          Text(date, style: TextStyle(fontSize: 12, color: Colors.grey[600])),
          const SizedBox(width: 8),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
            decoration: BoxDecoration(
              color: Colors.green[100],
              borderRadius: BorderRadius.circular(12),
            ),
            child: Text(
              status,
              style: TextStyle(fontSize: 10, color: Colors.green[700]),
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
          Text(text, style: TextStyle(color: Colors.grey[600], fontSize: 14)),
        ],
      ),
    );
  }

  // Widget _buildSettingItem(IconData icon, String title, String value) { /* 旧版：未使用 */ }

  void _showAddPetDialog() {
    _showSnackBar('添加宠物功能开发中...');
  }

  // void _showSettingDialog(String setting) { /* 旧版：未使用 */ }

  void _showSnackBar(String message) {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text(message)));
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
