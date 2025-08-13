import 'package:flutter/material.dart';
import '../modules/home_page.dart';
import '../modules/social_page.dart';
import '../modules/publish_page.dart';
import '../modules/message_page.dart';
import '../modules/archive_profile_page.dart';
import '../modules/auth/login_page.dart';
import '../theme/app_theme.dart';
import '../services/user_auth_service.dart';
import '../modules/auth/guest_upgrade_page.dart';

class NavigationController extends StatefulWidget {
  const NavigationController({super.key});

  @override
  State<NavigationController> createState() => _NavigationControllerState();
}

class _NavigationControllerState extends State<NavigationController> {
  int _currentIndex = 0;
  final _authService = UserAuthService();

  final List<Widget> _pages = [
    const HomePage(),
    const SocialPage(),
    PublishPage(),
    const MessagePage(),
    const ArchiveProfilePage(),
  ];

  final List<_NavigationItem> _items = const [
    _NavigationItem(
      icon: Icons.home_outlined,
      activeIcon: Icons.home_rounded,
      label: '首页',
    ),
    _NavigationItem(
      icon: Icons.people_alt_outlined,
      activeIcon: Icons.people_alt_rounded,
      label: '社交',
    ),
    _NavigationItem(
      icon: Icons.add_circle_outline,
      activeIcon: Icons.add_circle_rounded,
      label: '发布',
    ),
    _NavigationItem(
      icon: Icons.chat_bubble_outline,
      activeIcon: Icons.chat_bubble_rounded,
      label: '消息',
    ),
    _NavigationItem(
      icon: Icons.person_outline,
      activeIcon: Icons.person_rounded,
      label: '档案',
    ),
  ];

  void _onItemTapped(int index) {
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
        bottomNavigationBar: _buildBottomNavigationBar(),
        // 如果是游客模式，在顶部显示游客标识
        appBar: _authService.isGuestUser ? _buildGuestAppBar() : null,
      ),
    );
  }

  PreferredSizeWidget? _buildGuestAppBar() {
    return AppBar(
      backgroundColor: Colors.orange.withOpacity(0.9),
      elevation: 0,
      title: Row(
        children: [
          const Icon(Icons.person_outline, color: Colors.white, size: 20),
          const SizedBox(width: 8),
          Text(
            '游客模式',
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: _showUpgradeDialog,
          style: TextButton.styleFrom(
            backgroundColor: Colors.white.withOpacity(0.2),
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
          icon: const Icon(
            Icons.logout,
            color: Colors.white,
            size: 20,
          ),
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
            onPressed: () {
              Navigator.pop(context);
              _navigateToUpgrade();
            },
            child: const Text('立即升级'),
          ),
        ],
      ),
    );
  }

  void _navigateToUpgrade() {
    // 这里可以导航到升级页面
    Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => const GuestUpgradePage()),
    );
  }

  Widget _buildBottomNavigationBar() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.08),
            blurRadius: 20,
            offset: const Offset(0, -5),
            spreadRadius: 0,
          ),
        ],
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: _items.asMap().entries.map((entry) {
              final index = entry.key;
              final item = entry.value;
              final isSelected = index == _currentIndex;
              
              return _buildNavigationItem(index, item, isSelected);
            }).toList(),
          ),
        ),
      ),
    );
  }

  Widget _buildNavigationItem(int index, _NavigationItem item, bool isSelected) {
    return GestureDetector(
      onTap: () => _onItemTapped(index),
      child: AnimatedContainer(
        duration: AppTheme.mediumAnimation,
        curve: Curves.easeInOut,
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
          gradient: isSelected ? AppTheme.primaryGradient : null,
          borderRadius: BorderRadius.circular(16),
          boxShadow: isSelected ? [
            BoxShadow(
              color: AppTheme.primaryColor.withValues(alpha: 0.3),
              blurRadius: 12,
              offset: const Offset(0, 4),
            ),
          ] : null,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              isSelected ? item.activeIcon : item.icon,
              color: isSelected ? Colors.white : AppTheme.textSecondaryColor,
              size: 24,
            ),
            const SizedBox(height: 4),
            Text(
              item.label,
              style: TextStyle(
                color: isSelected ? Colors.white : AppTheme.textSecondaryColor,
                fontSize: 12,
                fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _NavigationItem {
  final IconData icon;
  final IconData activeIcon;
  final String label;
  
  const _NavigationItem({
    required this.icon,
    required this.activeIcon,
    required this.label,
  });
}
