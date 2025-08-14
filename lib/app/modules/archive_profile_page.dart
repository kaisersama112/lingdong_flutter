import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../theme/app_components.dart';
import '../core/components.dart';
import '../core/error_handler.dart';
import '../core/models.dart' as models;
import '../core/pet_components.dart';
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

  // 模拟用户数据
  final models.UserProfile _userProfile = models.UserProfile(
    name: '张三',
    phone: '138****8888',
    email: 'zhangsan@example.com',
    avatar: '👤',
    joinDate: DateTime(2020, 6, 1),
    address: '北京市朝阳区',
    bio: '热爱宠物，家有两只猫咪和一只狗狗',
  );

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
                  PetSelector(
                    pets: _pets,
                    selectedPetId: _pets[_selectedPetIndex].id,
                    onPetSelected: (petId) {
                      setState(() {
                        _selectedPetIndex = _pets.indexWhere((p) => p.id == petId);
                      });
                    },
                    onAddPet: _addPet,
                  ),
                  const SizedBox(height: AppTheme.spacingM),
                  
                  // 宠物信息头部
                  PetInfoHeader(
                    pet: _pets[_selectedPetIndex],
                    onCopyIdentity: () => _copyIdentityCode(_pets[_selectedPetIndex].identityCode),
                    onShowQr: () => _showIdentityQrDialog(_pets[_selectedPetIndex].identityCode),
                  ),
                  const SizedBox(height: AppTheme.spacingM),
                  
                  // 健康记录快捷入口
                  Expanded(
                    child: SingleChildScrollView(
                      padding: const EdgeInsets.symmetric(horizontal: AppTheme.spacingL),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '健康管理',
                            style: const TextStyle(
                              fontSize: AppTheme.fontSizeL,
                              fontWeight: FontWeight.bold,
                              color: AppTheme.textPrimaryColor,
                            ),
                          ),
                          const SizedBox(height: AppTheme.spacingM),
                          
                          HealthQuickAccess(
                            pet: _pets[_selectedPetIndex],
                            onViewRecords: () => _navigateToRecords(),
                            onAddRecord: () => _navigateToRecords(openAddSheet: true),
                          ),
                          const SizedBox(height: AppTheme.spacingL),
                          
                          // 引导说明
                          Container(
                            padding: const EdgeInsets.all(AppTheme.spacingM),
                            decoration: BoxDecoration(
                              color: AppTheme.primaryColor.withValues(alpha: 0.05),
                              borderRadius: BorderRadius.circular(AppTheme.borderRadiusMedium),
                              border: Border.all(
                                color: AppTheme.primaryColor.withValues(alpha: 0.1),
                              ),
                            ),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.info_outline,
                                  color: AppTheme.primaryColor,
                                  size: 20,
                                ),
                                const SizedBox(width: AppTheme.spacingS),
                                Expanded(
                                  child: Text(
                                    '在健康记录页可按宠物、类型、日期、关键词筛选，并支持时间线视图与二维码/复制身份码',
                                    style: TextStyle(
                                      color: AppTheme.textSecondaryColor,
                                      fontSize: AppTheme.fontSizeS,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
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
          onTap: _navigateToProfile,
          child: Container(
            padding: const EdgeInsets.all(8),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
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
                Text(
                  _userProfile.name,
                  style: const TextStyle(
                    fontSize: AppTheme.fontSizeS,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(width: 4),
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

  // 健康记录导航
  void _navigateToRecords({bool openAddSheet = false}) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => RecordsPage(
          initialPetId: _pets[_selectedPetIndex].id,
          openAddSheet: openAddSheet,
        ),
      ),
    );
  }

  // 复制身份码
  void _copyIdentityCode(String code) async {
    await Clipboard.setData(ClipboardData(text: code));
    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('已复制身份码')),
      );
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
