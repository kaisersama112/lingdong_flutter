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
import '../modules/tools/tools_hub_page.dart';

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
  Animation<double>? _bounceAnimation;
  Animation<double>? _pawAnimation;
  Animation<double>? _glowAnimation;
  bool _animationsInitialized = false;

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
      color: Color(0xFFFF6B6B),
      meaning: '温暖的小窝，狗狗的避风港',
    ),
    _NavigationItem(
      icon: Icons.explore_rounded,
      label: '冒险',
      color: Color(0xFF4ECDC4),
      meaning: '探索世界，发现美好',
    ),
    _NavigationItem(
      icon: Icons.add_circle_rounded,
      label: '分享',
      color: Color(0xFF4CAF50),
      meaning: '分享快乐，传递温暖',
    ),
    _NavigationItem(
      icon: Icons.favorite_rounded,
      label: '伙伴',
      color: Color(0xFF9C27B0),
      meaning: '爱心伙伴，彼此陪伴',
    ),
    _NavigationItem(
      icon: Icons.pets_rounded,
      label: '成长',
      color: Color(0xFF2196F3),
      meaning: '成长记录，珍贵回忆',
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
      
      _bounceAnimation = Tween<double>(begin: 1.0, end: 1.15).animate(
        CurvedAnimation(parent: _bounceController!, curve: Curves.elasticOut),
      );
      _pawAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
        CurvedAnimation(parent: _pawController!, curve: Curves.easeOut),
      );
      _glowAnimation = Tween<double>(begin: 0.6, end: 1.0).animate(
        CurvedAnimation(parent: _glowController!, curve: Curves.easeInOut),
      );
      
      _animationsInitialized = true;
      
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
    return AppBar(
      backgroundColor: Colors.orange.withValues(alpha: 0.9),
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
            onPressed: () => Navigator.pop(context, true),
            child: const Text('确认'),
          ),
        ],
      ),
    );
  }

  void _navigateToUpgrade() {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => const GuestUpgradePage()),
    );
  }

  Widget _buildBottomNavigationBar() {
    if (!_animationsInitialized) {
      return _buildSimpleNavigationBar();
    }

    return Container(
      height: 100,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(24),
          topRight: Radius.circular(24),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.08),
            blurRadius: 24,
            offset: const Offset(0, -8),
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

  Widget _buildSimpleNavigationBar() {
    return Container(
      height: 100,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(24),
          topRight: Radius.circular(24),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.08),
            blurRadius: 24,
            offset: const Offset(0, -8),
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
              
              return _buildSimpleNavigationItem(index, item, isSelected);
            }).toList(),
          ),
        ),
      ),
    );
  }

  Widget _buildSimpleNavigationItem(int index, _NavigationItem item, bool isSelected) {
    return GestureDetector(
      onTap: () => _onItemTapped(index),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected ? item.color.withValues(alpha: 0.1) : Colors.transparent,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              item.icon,
              color: isSelected ? item.color : Colors.grey[400],
              size: 26,
            ),
            const SizedBox(height: 4),
            Text(
              item.label,
              style: TextStyle(
                color: isSelected ? item.color : Colors.grey[400],
                fontSize: 11,
                fontWeight: isSelected ? FontWeight.w700 : FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNavigationItem(int index, _NavigationItem item, bool isSelected) {
    return GestureDetector(
      onTap: () => _onItemTapped(index),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          gradient: isSelected ? LinearGradient(
            colors: [
              item.color.withValues(alpha: 0.15),
              item.color.withValues(alpha: 0.08),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ) : null,
          color: isSelected ? null : Colors.transparent,
          borderRadius: BorderRadius.circular(20),
          border: isSelected ? Border.all(
            color: item.color.withValues(alpha: 0.3),
            width: 1.5,
          ) : null,
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            // 爪印背景装饰
            if (isSelected) ...[
              Positioned.fill(
                child: IgnorePointer(
                  child: AnimatedBuilder(
                    animation: _pawAnimation!,
                    builder: (context, child) {
                      return Transform.scale(
                        scale: 0.9 + _pawAnimation!.value * 0.15,
                        child: Align(
                          alignment: const Alignment(0.5, -0.3),
                          child: Icon(
                            Icons.pets,
                            size: 45,
                            color: item.color.withValues(alpha: 0.08),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
            // 发光效果
            if (isSelected) ...[
              Positioned.fill(
                child: IgnorePointer(
                  child: AnimatedBuilder(
                    animation: _glowAnimation!,
                    builder: (context, child) {
                      return Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                              color: item.color.withValues(alpha: 0.06 * _glowAnimation!.value),
                              blurRadius: 15,
                              spreadRadius: 1,
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
            // 主要内容
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // 主图标
                AnimatedBuilder(
                  animation: _bounceAnimation!,
                  builder: (context, child) {
                    return Transform.scale(
                      scale: isSelected ? _bounceAnimation!.value : 1.0,
                      child: Icon(
                        item.icon,
                        color: isSelected ? item.color : Colors.grey[400],
                        size: 26,
                      ),
                    );
                  },
                ),
                const SizedBox(height: 4),
                // 标签文字
                Text(
                  item.label,
                  style: TextStyle(
                    color: isSelected ? item.color : Colors.grey[400],
                    fontSize: 11,
                    fontWeight: isSelected ? FontWeight.w700 : FontWeight.w500,
                  ),
                ),
                // 选中指示器
                if (isSelected) ...[
                  const SizedBox(height: 2),
                  AnimatedBuilder(
                    animation: _glowAnimation!,
                    builder: (context, child) {
                      return Container(
                        width: 4,
                        height: 4,
                        decoration: BoxDecoration(
                          color: item.color,
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color: item.color.withValues(alpha: 0.5 * _glowAnimation!.value),
                              blurRadius: 4,
                              spreadRadius: 0,
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ],
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _NavigationItem {
  final IconData icon;
  final String label;
  final Color color;
  final String meaning;
  
  const _NavigationItem({
    required IconData icon,
    required String label,
    required Color color,
    required this.meaning,
  }) : icon = icon,
       label = label,
       color = color;
}
