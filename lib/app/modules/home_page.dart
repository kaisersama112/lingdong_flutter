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
      body: Column(
        children: [
          _buildTabBar(),
          Expanded(child: _buildTabBarView()),
        ],
      ),
    );
  }

  Widget _buildTabBar() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: TabBar(
        controller: _tabController,
        indicator: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Colors.blue[100],
        ),
        labelColor: Colors.blue[700],
        unselectedLabelColor: Colors.grey[600],
        labelStyle: const TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
        unselectedLabelStyle: const TextStyle(
          fontWeight: FontWeight.normal,
          fontSize: 16,
        ),
        tabs:
            [
                  const Tab(text: '推荐'),
                  const Tab(text: '关注'),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(Icons.pets, size: 16),
                      SizedBox(width: 6),
                      Text('百科'),
                    ],
                  ),
                ]
                .map(
                  (w) => Tab(
                    child: w is Widget ? w : null,
                    text: w is String ? w as String : null,
                  ),
                )
                .toList(),
      ),
    );
  }

  Widget _buildTabBarView() {
    return TabBarView(
      controller: _tabController,
      children: const [RecommendTab(), FollowTab(), WikiTab()],
    );
  }
}
