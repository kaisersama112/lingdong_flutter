import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';
import '../../core/error_handler.dart';
import 'components/user_header.dart';
import 'components/stats_card.dart';
import 'components/basic_info_card.dart';
import 'components/pets_card.dart';
import 'services/mock_data_service.dart';
import '../../core/models.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  late UserProfile _userProfile;
  late List<Pet> _pets;
  late Map<String, String> _stats;

  @override
  void initState() {
    super.initState();
    _userProfile = MockDataService.getUserProfile();
    _pets = MockDataService.getPets();
    _stats = MockDataService.getDefaultStats();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.backgroundColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            // 用户头部信息
            UserHeader(userProfile: _userProfile, onEditProfile: _showEditHint),

            // 内容区域
            Padding(
              padding: const EdgeInsets.all(AppTheme.spacingL),
              child: Column(
                children: [
                  // 统计信息卡片
                  StatsCard(
                    petCount: _pets.length,
                    followingCount: _stats['following']!,
                    followersCount: _stats['followers']!,
                    likesCount: _stats['likes']!,
                  ),

                  const SizedBox(height: AppTheme.spacingL),

                  // 基本信息
                  BasicInfoCard(
                    userProfile: _userProfile,
                    onEditPhone: _showEditHint,
                    onEditEmail: _showEditHint,
                    onEditAddress: _showEditHint,
                  ),

                  const SizedBox(height: AppTheme.spacingL),

                  // 我的宠物
                  PetsCard(pets: _pets, onViewAllPets: _viewAllPets),

                  const SizedBox(height: AppTheme.spacingL),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _viewAllPets() {
    AppErrorHandler.handleError(context, '查看全部宠物功能开发中...');
  }

  // 显示编辑提示
  void _showEditHint() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('请到设置页面编辑个人信息'),
        backgroundColor: Colors.blue,
        behavior: SnackBarBehavior.floating,
      ),
    );
  }
}
