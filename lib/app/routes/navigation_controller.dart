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

class _NavigationControllerState extends State<NavigationController> {
  int _currentIndex = 0;
  final _authService = UserAuthService();

  final List<Widget> _pages = <Widget>[
    const HomePage(),
    const SocialPage(),
    const PublishPage(),
    const MessagePage(),
    const ArchiveProfilePage(),
  ];

  final List<_NavigationItem> _items = <_NavigationItem>[
    _NavigationItem(
      icon: Icons.home_outlined,
      activeIcon: Icons.home,
      label: '小窝',
      color: Color(0xFFF59E0B), // 温暖的橙色
    ),
    _NavigationItem(
      icon: Icons.explore_outlined,
      activeIcon: Icons.explore,
      label: '遛弯',
      color: Color(0xFF10B981), // 清新的绿色
    ),
    _NavigationItem(
      icon: Icons.add_circle_outline,
      activeIcon: Icons.add_circle,
      label: '分享',
      color: Color(0xFFEF4444), // 热情的红色
    ),
    _NavigationItem(
      icon: Icons.favorite_outline,
      activeIcon: Icons.favorite,
      label: '伙伴',
      color: Color(0xFF8B5CF6), // 温馨的紫色
    ),
    _NavigationItem(
      icon: Icons.pets_outlined,
      activeIcon: Icons.pets,
      label: '我的',
      color: Color(0xFF6366F1), // 温暖的蓝色
    ),
  ];

  void _onItemTapped(int index) {
    if (index == _currentIndex) return;

    setState(() {
      _currentIndex = index;
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
        bottomNavigationBar: _buildDogCommunityNavigationBar(),
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

  Widget _buildDogCommunityNavigationBar() {
    final bool isDark = Theme.of(context).brightness == Brightness.dark;
    final Color unselectedColor = isDark
        ? Color(0xFFCBD5E1)
        : Color(0xFF6B7280);

    return Container(
      decoration: BoxDecoration(
        color: isDark ? Color(0xFF1E293B) : Colors.white,
        border: Border(
          top: BorderSide(
            color: isDark ? Color(0xFF334155) : Color(0xFFE5E7EB),
            width: 0.5,
          ),
        ),
      ),
      child: SafeArea(
        minimum: const EdgeInsets.only(top: 0),
        child: SizedBox(
          height: 60,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: _items.asMap().entries.map((entry) {
              final index = entry.key;
              final item = entry.value;
              final isSelected = index == _currentIndex;

              return Expanded(
                child: _buildDogNavigationItem(
                  index: index,
                  item: item,
                  isSelected: isSelected,
                  unselectedColor: unselectedColor,
                ),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }

  Widget _buildDogNavigationItem({
    required int index,
    required _NavigationItem item,
    required bool isSelected,
    required Color unselectedColor,
  }) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () => _onItemTapped(index),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          // 图标容器（使用Stack让脚印悬浮在上方）
          Stack(
            alignment: Alignment.center,
            children: [
              // 图标容器
              Container(
                width: isSelected ? 44 : 40,
                height: isSelected ? 44 : 40,
                child: Icon(
                  isSelected ? item.activeIcon : item.icon,
                  color: isSelected ? item.color : unselectedColor,
                  size: isSelected ? 26 : 24,
                ),
              ),

              // 悬浮的爪子指示器
              Positioned(
                top: 15,
                child: AnimatedOpacity(
                  opacity: isSelected ? 1.0 : 0.0,
                  duration: const Duration(milliseconds: 200),
                  curve: Curves.easeOut,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('🐾', style: TextStyle(fontSize: 16)),
                      const SizedBox(width: 2),
                      Text('🐾', style: TextStyle(fontSize: 16)),
                    ],
                  ),
                ),
              ),
            ],
          ),
          // 标签
          Text(
            item.label,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: isSelected ? item.color : unselectedColor,
              fontSize: 11,
              fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500,
              height: 1.2,
            ),
          ),
        ],
      ),
    );
  }
}

class _NavigationItem {
  final IconData icon;
  final IconData activeIcon;
  final String label;
  final Color color;

  const _NavigationItem({
    required this.icon,
    required this.activeIcon,
    required this.label,
    required this.color,
  });
}
