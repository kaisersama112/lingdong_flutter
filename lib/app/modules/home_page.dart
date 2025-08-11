import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import 'home_tab/recommend_tab.dart';
import 'home_tab/follow_tab.dart';
import 'home_tab/wiki_tab.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  late TabController _tabController;
  final TextEditingController _searchController = TextEditingController();
  String _searchQuery = '';

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.backgroundColor,
      body: Column(
        children: [
          _buildSearchBar(),
          _buildTabBar(),
          Expanded(child: _buildTabBarView()),
        ],
      ),
    );
  }

  Widget _buildSearchBar() {
    return Container(
      margin: const EdgeInsets.fromLTRB(16, 16, 16, 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(25),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: TextField(
        controller: _searchController,
        onChanged: (value) {
          setState(() {
            _searchQuery = value;
          });
        },
        decoration: InputDecoration(
          hintText: '搜索内容、用户、话题...',
          hintStyle: TextStyle(color: Colors.grey[500]),
          prefixIcon: const Icon(Icons.search, color: Colors.grey),
          suffixIcon: _searchQuery.isNotEmpty
              ? IconButton(
                  icon: const Icon(Icons.clear, color: Colors.grey),
                  onPressed: () {
                    _searchController.clear();
                    setState(() {
                      _searchQuery = '';
                    });
                  },
                )
              : null,
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        ),
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
        unselectedLabelStyle: const TextStyle(fontWeight: FontWeight.normal, fontSize: 16),
        tabs: const [
          Tab(text: '推荐'),
          Tab(text: '关注'),
          Tab(text: '百科'),
        ],
      ),
    );
  }

  Widget _buildTabBarView() {
    return TabBarView(
      controller: _tabController,
      children: const [
        RecommendTab(),
        FollowTab(),
        WikiTab(),
      ],
    );
  }
}