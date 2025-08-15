import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../theme/app_components.dart';
import 'home_page/recommend_tab.dart';
import 'home_page/follow_tab.dart';
import 'home_page/wiki_tab.dart';
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
      body: SafeArea(
        child: Column(
          children: [
            // 简洁的页面头部
            _buildSimpleHeader(),
            
            // 简洁的标签栏
            _buildSimpleTabBar(),
            
            // 标签页内容
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: [
                  const RecommendTab(),
                  const FollowTab(),
                  const WikiTab(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // 简洁的页面头部
  Widget _buildSimpleHeader() {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AppTheme.spacingL,
        vertical: AppTheme.spacingM,
      ),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            AppTheme.primaryColor,
            AppTheme.primaryColor.withValues(alpha: 0.8),
          ],
        ),
        boxShadow: [
          BoxShadow(
            color: AppTheme.primaryColor.withValues(alpha: 0.3),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          // 应用图标和标题
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: 0.2),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Icon(
                  Icons.pets,
                  color: Colors.white,
                  size: 24,
                ),
              ),
              const SizedBox(width: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    '灵宠',
                    style: TextStyle(
                      fontSize: AppTheme.fontSizeXL,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    '让爱宠生活更美好',
                    style: TextStyle(
                      fontSize: AppTheme.fontSizeS,
                      color: Colors.white.withValues(alpha: 0.8),
                    ),
                  ),
                ],
              ),
            ],
          ),
          
          const Spacer(),
          
          // 快捷工具按钮
          Container(
            decoration: BoxDecoration(
              color: Colors.white.withValues(alpha: 0.2),
              borderRadius: BorderRadius.circular(12),
            ),
            child: IconButton(
              icon: const Icon(
                Icons.psychology,
                color: Colors.white,
                size: 20,
              ),
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const ToolsHubPage(),
                  ),
                );
              },
              tooltip: '实用工具',
            ),
          ),
        ],
      ),
    );
  }

  // 简洁的标签栏
  Widget _buildSimpleTabBar() {
    return Container(
      color: Colors.white,
      child: TabBar(
        controller: _tabController,
        labelColor: AppTheme.primaryColor,
        unselectedLabelColor: AppTheme.textSecondaryColor,
        indicatorColor: AppTheme.primaryColor,
        indicatorWeight: 3,
        tabs: const [
          Tab(
            icon: Icon(Icons.home_outlined),
            text: '推荐',
          ),
          Tab(
            icon: Icon(Icons.favorite_outline),
            text: '关注',
          ),
          Tab(
            icon: Icon(Icons.auto_stories_outlined),
            text: '百科',
          ),
        ],
      ),
    );
  }
}
