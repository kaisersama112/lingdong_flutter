import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import 'home_tab/recommend_tab.dart';
import 'home_tab/follow_tab.dart';
import 'home_tab/wiki_tab.dart';
import 'tools/tools_hub_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.backgroundColor,
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFFFFF8F5), // 非常浅的橙色
              Color(0xFFFEFEFE), // 几乎纯白
            ],
            stops: [0.0, 0.8],
          ),
        ),
        child: Column(
          children: [
            _buildHeader(),
            _buildTabBar(),
            Expanded(child: _buildTabBarView()),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      padding: const EdgeInsets.fromLTRB(20, 60, 20, 20),
      child: Row(
        children: [
          // 左侧：欢迎信息和宠物图标
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        gradient: AppTheme.primaryGradient,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Icon(
                        Icons.pets,
                        color: Colors.white,
                        size: 20,
                      ),
                    ),
                    const SizedBox(width: 12),
                    const Text(
                      '灵宠',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: AppTheme.textPrimaryColor,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                const Text(
                  '让爱宠生活更美好',
                  style: TextStyle(
                    fontSize: 14,
                    color: AppTheme.textSecondaryColor,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
          // 右侧：工具按钮
          Container(
            decoration: AppTheme.glassmorphismDecoration,
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                borderRadius: BorderRadius.circular(16),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const ToolsHubPage()),
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.tune,
                        color: AppTheme.primaryColor,
                        size: 20,
                      ),
                      const SizedBox(width: 6),
                      Text(
                        '工具',
                        style: TextStyle(
                          color: AppTheme.primaryColor,
                          fontWeight: FontWeight.w600,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTabBar() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      decoration: AppTheme.glassmorphismDecoration,
      child: TabBar(
        controller: _tabController,
        indicator: BoxDecoration(
          gradient: AppTheme.primaryGradient,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: AppTheme.primaryColor.withValues(alpha: 0.3),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        labelColor: Colors.white,
        unselectedLabelColor: AppTheme.textSecondaryColor,
        labelStyle: const TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 15,
        ),
        unselectedLabelStyle: const TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 15,
        ),
        indicatorSize: TabBarIndicatorSize.tab,
        dividerColor: Colors.transparent,
        tabs: [
          _buildTab('推荐', Icons.home_outlined),
          _buildTab('关注', Icons.favorite_outline),
          _buildTab('百科', Icons.auto_stories_outlined),
        ],
      ),
    );
  }

  Widget _buildTab(String text, IconData icon) {
    return Tab(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 18),
          const SizedBox(width: 6),
          Text(text),
        ],
      ),
    );
  }

  Widget _buildTabBarView() {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(24),
          topRight: Radius.circular(24),
        ),
      ),
      child: TabBarView(
        controller: _tabController,
        children: const [
          RecommendTab(),
          FollowTab(),
          WikiTab(),
        ],
      ),
    );
  }
}
