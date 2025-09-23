import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';
import '../../core/error_handler.dart';
import 'components/user_header.dart';
import 'components/stats_card.dart';
import 'components/basic_info_card.dart';
import 'components/pets_card.dart';
import '../../services/user_auth_service.dart';
import '../../services/dynamic_service.dart';
import '../../core/models.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final UserAuthService _auth = UserAuthService();
  final DynamicService _dynamicService = DynamicService();
  late UserProfile _userProfile;
  late List<Pet> _pets;
  late Map<String, String> _stats;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _initDefaults();
    _loadUser();
  }

  void _initDefaults() {
    _userProfile = UserProfile(
      name: '未登录',
      phone: '',
      email: '',
      avatar: '👤',
      joinDate: DateTime.now(),
      address: '',
      bio: '',
      level: 'Lv.1',
      points: 0,
    );
    _pets = const [];
    _stats = const {'following': '0', 'followers': '0', 'likes': '0'};
  }

  Future<void> _loadUser() async {
    setState(() => _isLoading = true);
    try {
      // 优先刷新一次，确保最新
      await _auth.refreshUserInfo();
      final u = _auth.currentUser;
      // 拉取关注/粉丝统计
      final stats = await _dynamicService.getCurrentUserFollowStats();
      setState(() {
        _userProfile = UserProfile(
          name: u?.username ?? '未登录',
          phone: u?.phone ?? '',
          email: u?.email ?? '',
          // 这里沿用 UserProfile.avatar 为 String：既可能是表情/首字母，也可能是 URL
          avatar: u?.avatar ?? '👤',
          joinDate: u?.registerTime ?? DateTime.now(),
          address: '',
          bio: '',
          level: 'Lv.${u != null ? 3 : 1}',
          points: 0,
        );
        _stats = {
          'following': '${stats.followingCount}',
          'followers': '${stats.followersCount}',
          'likes': _stats['likes'] ?? '0',
        };
        _isLoading = false;
      });
    } catch (e) {
      setState(() => _isLoading = false);
      debugPrint('加载用户信息失败: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.backgroundColor,
      body: RefreshIndicator(
        onRefresh: _loadUser,
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: Column(
            children: [
              // 用户头部信息
              UserHeader(
                userProfile: _userProfile,
                onEditProfile: _showEditHint,
              ),

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

                    // 我的宠物（暂保留为空列表，后续接入真实宠物服务）
                    PetsCard(pets: _pets, onViewAllPets: _viewAllPets),

                    const SizedBox(height: AppTheme.spacingL),

                    if (_isLoading)
                      const Padding(
                        padding: EdgeInsets.all(16),
                        child: CircularProgressIndicator(),
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
