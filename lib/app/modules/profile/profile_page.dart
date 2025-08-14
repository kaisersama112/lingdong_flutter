import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';
import '../../core/components.dart';
import '../../core/error_handler.dart';
import 'package:flutter/services.dart';
import 'package:qr_flutter/qr_flutter.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  // 模拟用户数据
  final UserProfile _userProfile = UserProfile(
    name: '张三',
    phone: '138****8888',
    email: 'zhangsan@example.com',
    avatar: '👤',
    joinDate: DateTime(2020, 6, 1),
    address: '北京市朝阳区',
    bio: '热爱宠物，家有两只猫咪和一只狗狗',
    level: 'Lv.8',
    points: 1280,
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            // 页面头部
            _buildHeader(),
            
            // 内容区域
            Padding(
              padding: const EdgeInsets.all(AppTheme.spacingL),
              child: Column(
                children: [
                  // 统计信息卡片
                  _buildStatsCard(),
                  
                  const SizedBox(height: AppTheme.spacingL),
                  
                  // 基本信息
                  _buildBasicInfoCard(),
                  
                  const SizedBox(height: AppTheme.spacingL),
                  
                  // 我的宠物
                  _buildPetsCard(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      decoration: BoxDecoration(
        gradient: AppTheme.primaryGradient,
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(AppTheme.borderRadiusLarge),
          bottomRight: Radius.circular(AppTheme.borderRadiusLarge),
        ),
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(AppTheme.spacingL),
          child: Column(
            children: [
              // 顶部操作栏
              Row(
                children: [
                  // 返回按钮
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white.withValues(alpha: 0.2),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: IconButton(
                      icon: const Icon(Icons.arrow_back, color: Colors.white, size: 20),
                      onPressed: () => Navigator.pop(context),
                    ),
                  ),
                  const Spacer(),
                  // 编辑按钮
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white.withValues(alpha: 0.2),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: IconButton(
                      icon: const Icon(Icons.edit, color: Colors.white, size: 20),
                      onPressed: () => _editProfile(),
                    ),
                  ),
                ],
              ),
              
              const SizedBox(height: AppTheme.spacingL),
              
              // 用户信息卡片
              Container(
                padding: const EdgeInsets.all(AppTheme.spacingL),
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: 0.15),
                  borderRadius: BorderRadius.circular(AppTheme.borderRadiusLarge),
                  border: Border.all(
                    color: Colors.white.withValues(alpha: 0.3),
                    width: 1,
                  ),
                ),
                child: Row(
                  children: [
                    // 头像
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(50),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withValues(alpha: 0.1),
                            blurRadius: 10,
                            offset: const Offset(0, 4),
                          ),
                        ],
                      ),
                      child: CircleAvatar(
                        radius: 40,
                        backgroundColor: AppTheme.primaryLightColor,
                        child: Text(
                          _userProfile.avatar,
                          style: const TextStyle(fontSize: 32),
                        ),
                      ),
                    ),
                    
                    const SizedBox(width: AppTheme.spacingL),
                    
                    // 用户信息
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                                _userProfile.name,
                                style: const TextStyle(
                                  fontSize: AppTheme.fontSizeXL,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                              const SizedBox(width: AppTheme.spacingS),
                              Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: AppTheme.spacingS,
                                  vertical: 2,
                                ),
                                decoration: BoxDecoration(
                                  color: Colors.amber,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Text(
                                  _userProfile.level,
                                  style: const TextStyle(
                                    fontSize: AppTheme.fontSizeS,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: AppTheme.spacingS),
                          Text(
                            _userProfile.bio,
                            style: TextStyle(
                              fontSize: AppTheme.fontSizeM,
                              color: Colors.white.withValues(alpha: 0.9),
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                          const SizedBox(height: AppTheme.spacingM),
                          Row(
                            children: [
                              Icon(
                                Icons.star,
                                color: Colors.amber,
                                size: 16,
                              ),
                              const SizedBox(width: 4),
                              Text(
                                '${_userProfile.points} 积分',
                                style: const TextStyle(
                                  fontSize: AppTheme.fontSizeS,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildStatsCard() {
    return PetAppComponents.buildCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '我的统计',
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
                child: _buildStatItem(
                  icon: Icons.pets,
                  label: '宠物数量',
                  value: _pets.length.toString(),
                  color: AppTheme.primaryColor,
                ),
              ),
              Expanded(
                child: _buildStatItem(
                  icon: Icons.favorite,
                  label: '关注数',
                  value: '128',
                  color: AppTheme.secondaryColor,
                ),
              ),
              Expanded(
                child: _buildStatItem(
                  icon: Icons.people,
                  label: '粉丝数',
                  value: '256',
                  color: AppTheme.warningColor,
                ),
              ),
              Expanded(
                child: _buildStatItem(
                  icon: Icons.thumb_up,
                  label: '获赞数',
                  value: '1.2k',
                  color: AppTheme.successColor,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildBasicInfoCard() {
    return PetAppComponents.buildCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(
                Icons.info_outline,
                color: AppTheme.primaryColor,
              ),
              const SizedBox(width: AppTheme.spacingS),
              Text(
                '基本信息',
                style: const TextStyle(
                  fontSize: AppTheme.fontSizeL,
                  fontWeight: FontWeight.bold,
                  color: AppTheme.textPrimaryColor,
                ),
              ),
            ],
          ),
          const SizedBox(height: AppTheme.spacingM),
          
          _buildInfoItem(
            icon: Icons.phone,
            label: '手机号',
            value: _userProfile.phone,
            onTap: () => _editPhone(),
          ),
          _buildInfoItem(
            icon: Icons.email,
            label: '邮箱',
            value: _userProfile.email,
            onTap: () => _editEmail(),
          ),
          _buildInfoItem(
            icon: Icons.location_on,
            label: '地址',
            value: _userProfile.address,
            onTap: () => _editAddress(),
          ),
          _buildInfoItem(
            icon: Icons.calendar_today,
            label: '注册时间',
            value: '${_userProfile.joinDate.year}年${_userProfile.joinDate.month}月${_userProfile.joinDate.day}日',
            onTap: null,
            showDivider: false,
          ),
        ],
      ),
    );
  }

  Widget _buildPetsCard() {
    return PetAppComponents.buildCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(
                Icons.pets,
                color: AppTheme.primaryColor,
              ),
              const SizedBox(width: AppTheme.spacingS),
              Text(
                '我的宠物',
                style: const TextStyle(
                  fontSize: AppTheme.fontSizeL,
                  fontWeight: FontWeight.bold,
                  color: AppTheme.textPrimaryColor,
                ),
              ),
              const Spacer(),
              TextButton.icon(
                onPressed: () => _viewAllPets(),
                icon: const Icon(Icons.arrow_forward_ios, size: 12),
                label: const Text('查看全部'),
                style: TextButton.styleFrom(
                  foregroundColor: AppTheme.primaryColor,
                ),
              ),
            ],
          ),
          const SizedBox(height: AppTheme.spacingM),
          
          SizedBox(
            height: 80,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: _pets.length > 3 ? 3 : _pets.length,
              itemBuilder: (context, index) {
                final pet = _pets[index];
                return Container(
                  width: 100,
                  margin: const EdgeInsets.only(right: AppTheme.spacingM),
                  decoration: BoxDecoration(
                    color: pet.color.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(AppTheme.borderRadiusMedium),
                    border: Border.all(
                      color: pet.color.withValues(alpha: 0.3),
                      width: 1,
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
                          color: pet.color,
                        ),
                      ),
                      const SizedBox(height: 2),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(Icons.qr_code_2, size: 12, color: Colors.grey),
                          const SizedBox(width: 2),
                          Flexible(
                            child: Text(
                              pet.identityCode,
                              style: TextStyle(
                                fontSize: AppTheme.fontSizeXS,
                                color: AppTheme.textSecondaryColor,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          IconButton(
                            padding: EdgeInsets.zero,
                            constraints: const BoxConstraints(minWidth: 24, minHeight: 24),
                            icon: const Icon(Icons.copy, size: 14, color: Colors.grey),
                            onPressed: () async {
                              await Clipboard.setData(ClipboardData(text: pet.identityCode));
                              if (!mounted) return;
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(content: Text('已复制身份码')),
                              );
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  void _showIdentityQrDialog(String code) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text('宠物身份码二维码'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            QrImageView(
              data: code,
              size: 180,
              version: QrVersions.auto,
            ),
            const SizedBox(height: 12),
            Text(code, style: const TextStyle(fontWeight: FontWeight.w600)),
          ],
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

  Widget _buildStatItem({
    required IconData icon,
    required String label,
    required String value,
    required Color color,
  }) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(AppTheme.spacingM),
          decoration: BoxDecoration(
            color: color.withValues(alpha: 0.1),
            borderRadius: BorderRadius.circular(AppTheme.borderRadiusMedium),
          ),
          child: Icon(
            icon,
            color: color,
            size: 24,
          ),
        ),
        const SizedBox(height: AppTheme.spacingS),
        Text(
          value,
          style: TextStyle(
            fontSize: AppTheme.fontSizeL,
            fontWeight: FontWeight.bold,
            color: color,
          ),
        ),
        Text(
          label,
          style: TextStyle(
            fontSize: AppTheme.fontSizeS,
            color: AppTheme.textSecondaryColor,
          ),
        ),
      ],
    );
  }

  Widget _buildInfoItem({
    required IconData icon,
    required String label,
    required String value,
    required VoidCallback? onTap,
    bool showDivider = true,
  }) {
    return Column(
      children: [
        ListTile(
          leading: Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: AppTheme.primaryColor.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(
              icon,
              color: AppTheme.primaryColor,
              size: 20,
            ),
          ),
          title: Text(
            label,
            style: const TextStyle(
              fontWeight: FontWeight.w600,
              color: AppTheme.textPrimaryColor,
            ),
          ),
          subtitle: Text(
            value,
            style: TextStyle(
              color: AppTheme.textSecondaryColor,
              fontSize: AppTheme.fontSizeM,
            ),
          ),
          trailing: onTap != null
              ? const Icon(
                  Icons.edit,
                  color: AppTheme.primaryColor,
                  size: 20,
                )
              : null,
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

  // 各种操作方法
  void _editProfile() {
    AppErrorHandler.handleError(context, '编辑资料功能开发中...');
  }

  void _editPhone() {
    AppErrorHandler.handleError(context, '编辑手机号功能开发中...');
  }

  void _editEmail() {
    AppErrorHandler.handleError(context, '编辑邮箱功能开发中...');
  }

  void _editAddress() {
    AppErrorHandler.handleError(context, '编辑地址功能开发中...');
  }

  void _viewAllPets() {
    AppErrorHandler.handleError(context, '查看全部宠物功能开发中...');
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
  final String level;
  final int points;

  const UserProfile({
    required this.name,
    required this.phone,
    required this.email,
    required this.avatar,
    required this.joinDate,
    required this.address,
    required this.bio,
    required this.level,
    required this.points,
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
