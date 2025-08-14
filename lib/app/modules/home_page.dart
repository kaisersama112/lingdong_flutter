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
      body: Column(
        children: [
          // 使用新的简洁头部组件
          BeautifulPageHeader(
            title: '灵宠',
            subtitle: '让爱宠生活更美好',
            icon: Icons.pets,
            height: 120,
            // 工具功能已集成到底部导航栏
          ),
          
          // 使用新的简洁标签栏组件
          BeautifulTabBar(
            controller: _tabController,
            tabs: [
              BeautifulTab(
                label: '推荐',
                icon: Icons.home_outlined,
                content: const RecommendTab(),
              ),
              BeautifulTab(
                label: '关注',
                icon: Icons.favorite_outline,
                content: const FollowTab(),
              ),
              BeautifulTab(
                label: '百科',
                icon: Icons.auto_stories_outlined,
                content: const WikiTab(),
              ),
            ],
          ),
          
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
    );
  }
}
