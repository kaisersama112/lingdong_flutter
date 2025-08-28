import 'package:flutter/material.dart';
import '../modules/home_page.dart';
import '../modules/social_page.dart';
import '../modules/publish_page.dart';
import '../modules/message_page.dart';
import '../modules/profile/archive_profile_page.dart';
import '../modules/auth/login_page.dart';
import '../theme/app_theme.dart';
import '../services/user_auth_service.dart';

class NavigationController extends StatefulWidget {
  const NavigationController({super.key});

  @override
  State<NavigationController> createState() => _NavigationControllerState();
}

class _NavigationControllerState extends State<NavigationController>
    with TickerProviderStateMixin {
  int _currentIndex = 0;
  final _authService = UserAuthService();
  AnimationController? _bounceController;

  AnimationController? _pawController;
  AnimationController? _glowController;

  final List<Widget> _pages = <Widget>[
    const HomePage(),
    const SocialPage(),
    const PublishPage(),
    const MessagePage(),
    const ArchiveProfilePage(),
  ];

  final List<_NavigationItem> _items = <_NavigationItem>[
    _NavigationItem(
      icon: Icons.home_rounded,
      label: '小窝',
      color: AppTheme.primaryColor,
    ),
    _NavigationItem(
      icon: Icons.explore_rounded,
      label: '冒险',
      color: AppTheme.accentColor,
    ),
    _NavigationItem(
      icon: Icons.add_circle_rounded,
      label: '分享',
      color: AppTheme.successColor,
    ),
    _NavigationItem(
      icon: Icons.favorite_rounded,
      label: '伙伴',
      color: AppTheme.secondaryColor,
    ),
    _NavigationItem(
      icon: Icons.pets_rounded,
      label: '成长',
      color: AppTheme.primaryLightColor,
    ),
  ];

  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      if (mounted) {
        _initializeAnimations();
      }
    });
  }

  void _initializeAnimations() {
    if (!mounted) return;

    setState(() {
      _bounceController = AnimationController(
        duration: const Duration(milliseconds: 400),
        vsync: this,
      );
      _pawController = AnimationController(
        duration: const Duration(milliseconds: 600),
        vsync: this,
      );
      _glowController = AnimationController(
        duration: const Duration(milliseconds: 2000),
        vsync: this,
      );

      // 启动发光动画循环
      _glowController!.repeat(reverse: true);
    });
  }

  @override
  void dispose() {
    _bounceController?.dispose();
    _pawController?.dispose();
    _glowController?.dispose();
    super.dispose();
  }

  void _onItemTapped(int index) {
    if (index == _currentIndex) return;

    setState(() {
      _currentIndex = index;
    });

    // 触发动画
    _bounceController?.forward().then((_) {
      _bounceController?.reverse();
    });
    _pawController?.forward().then((_) {
      _pawController?.reverse();
    });
  }

  bool _handlePopIntent() {
    if (_currentIndex != 0) {
      setState(() => _currentIndex = 0);
      return false;
    }
    return true;
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

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: _currentIndex == 0,
      onPopInvokedWithResult: (didPop, result) {
        if (didPop) return;
        _handlePopIntent();
      },
      child: Scaffold(
        body: _pages[_currentIndex],
        bottomNavigationBar: _buildBottomNavigationBar(),
        appBar: _authService.isGuestUser ? _buildGuestAppBar() : null,
      ),
    );
  }

  PreferredSizeWidget? _buildGuestAppBar() {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return AppBar(
      backgroundColor: AppTheme.secondaryColor.withValues(
        alpha: isDark ? 0.35 : 0.9,
      ),
      elevation: 0,
      title: null,
      actions: [
        TextButton(
          onPressed: _showUpgradeDialog,
          style: TextButton.styleFrom(
            backgroundColor: Colors.white.withValues(alpha: 0.2),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          ),
          child: const Text(
            '升级账号',
            style: TextStyle(
              color: Colors.white,
              fontSize: 12,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        const SizedBox(width: 8),
        IconButton(
          onPressed: _handleLogout,
          icon: const Icon(Icons.logout, color: Colors.white, size: 20),
          tooltip: '退出登录',
        ),
        const SizedBox(width: 16),
      ],
    );
  }

  void _showUpgradeDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('升级为正式账号'),
        content: const Text(
          '升级为正式账号后，您可以：\n'
          '• 保存所有数据\n'
          '• 使用手机号登录\n'
          '• 享受完整功能\n'
          '• 数据永久保存',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('稍后再说'),
          ),
          ElevatedButton(
            onPressed: () => Navigator.pop(context, true),
            child: const Text('确认'),
          ),
        ],
      ),
    );
  }

  Widget _buildBottomNavigationBar() {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      currentIndex: _currentIndex,
      onTap: _onItemTapped,
      backgroundColor: AppTheme.getSurfaceColor(
        context,
      ).withValues(alpha: 0.96),
      elevation: 0,
      selectedItemColor: AppTheme.primaryColor,
      unselectedItemColor: AppTheme.textSecondaryColor,
      showUnselectedLabels: true,
      selectedFontSize: 12,
      unselectedFontSize: 12,
      selectedLabelStyle: const TextStyle(fontWeight: FontWeight.w700),
      unselectedLabelStyle: const TextStyle(fontWeight: FontWeight.w500),
      items: _items.map((item) {
        return BottomNavigationBarItem(
          label: item.label,
          icon: Icon(item.icon, color: AppTheme.textSecondaryColor, size: 24),
          activeIcon: Stack(
            alignment: Alignment.center,
            children: [
              // 渐变柔光圆（提升选中聚焦感）
              Positioned(
                child: Container(
                  width: 36,
                  height: 36,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        item.color.withValues(alpha: 0.14),
                        item.color.withValues(alpha: 0.06),
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    shape: BoxShape.circle,
                  ),
                ),
              ),
              // 背景爪印水印（增强可见性）
              Positioned(
                child: Transform.rotate(
                  angle: -0.2,
                  child: Icon(
                    Icons.pets,
                    size: 30,
                    color: item.color.withValues(alpha: 0.12),
                  ),
                ),
              ),
              // 主图标（略放大 + 主题色）
              Transform.scale(
                scale: 1.12,
                child: Icon(item.icon, color: item.color, size: 26),
              ),
            ],
          ),
        );
      }).toList(),
    );
  }

  // 已移除 _buildSimpleNavigationItem
}

class _NavigationItem {
  final IconData icon;
  final String label;
  final Color color;

  const _NavigationItem({
    required IconData icon,
    required String label,
    required Color color,
  }) : icon = icon,
       label = label,
       color = color;
}
