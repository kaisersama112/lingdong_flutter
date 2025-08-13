import 'package:flutter/material.dart';
import '../modules/home_page.dart';
import '../modules/social_page.dart';
import '../modules/publish_page.dart';
import '../modules/message_page.dart';
import '../modules/archive_profile_page.dart';
import '../theme/app_theme.dart';
import '../services/user_auth_service.dart';
import '../modules/auth/login_page.dart';

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
      ),
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
