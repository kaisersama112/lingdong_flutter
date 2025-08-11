import 'package:flutter/material.dart';
import 'dart:async';
import '../theme/app_theme.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  late TabController _tabController;
  final TextEditingController _searchController = TextEditingController();
  String _searchQuery = '';

  // 英雄轮播
  final PageController _heroController = PageController(viewportFraction: 0.9);
  int _currentHeroIndex = 0;
  Timer? _heroTimer;

  // 宠物分类
  final List<String> _petCategories = ['全部', '狗狗', '猫咪', '小宠', '医疗', '美容', '训练', '救助'];
  String _selectedPetCategory = '全部';

  // 快捷功能
  final List<_QuickAction> _quickActions = const [
    _QuickAction(icon: Icons.park, label: '附近公园', color: AppTheme.successColor),
    _QuickAction(icon: Icons.local_hospital, label: '宠物医院', color: AppTheme.primaryColor),
    _QuickAction(icon: Icons.content_cut, label: '美容护理', color: AppTheme.secondaryColor),
    _QuickAction(icon: Icons.volunteer_activism, label: '领养救助', color: AppTheme.warningColor),
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    _startHeroAutoPlay();
  }

  @override
  void dispose() {
    _tabController.dispose();
    _searchController.dispose();
    _heroController.dispose();
    _heroTimer?.cancel();
    super.dispose();
  }

  void _startHeroAutoPlay() {
    _heroTimer?.cancel();
    _heroTimer = Timer.periodic(const Duration(seconds: 4), (_) {
      if (!mounted) return;
      final next = (_currentHeroIndex + 1) % 3;
      _heroController.animateToPage(
        next,
        duration: const Duration(milliseconds: 450),
        curve: Curves.easeOut,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.backgroundColor,
      body: Column(
        children: [
          // 顶部搜索栏
          _buildSearchBar(),
          
          // 标签页
          _buildTabBar(),
          
          // 内容区域
          Expanded(
            child: _buildTabBarView(),
          ),
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
            color: Colors.black.withOpacity(0.05),
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
      children: [
        _buildRecommendTab(),
        _buildFollowTab(),
        _buildWikiTab(),
      ],
    );
  }

  // 推荐页：加入顶部吸引内容
  Widget _buildRecommendTab() {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        _buildHeroCarousel(),
        const SizedBox(height: 12),
        _buildPetCategoryChips(),
        const SizedBox(height: 12),
        _buildQuickActionsRow(),
        const SizedBox(height: 12),
        _buildDailyTipCard(),
        const SizedBox(height: 16),
        ...List.generate(10, (index) {
          return _buildContentCard(
            title: '推荐内容 ${index + 1}',
            content: '这是一个有趣的推荐内容，包含了用户可能感兴趣的信息...（宠物主题强化版）',
            author: index % 2 == 0 ? '训宠师Kris' : '兽医Lily',
            likes: (index + 1) * 12,
            comments: (index + 1) * 4,
            isLiked: index % 3 == 0,
          );
        }),
      ],
    );
  }

  Widget _buildHeroCarousel() {
    final List<_HeroCard> cards = const [
      _HeroCard(title: '周末和Ta去公园', subtitle: '附近遛狗路线推荐', emoji: '🐕', start: Color(0xFF8EC5FC), end: Color(0xFFE0C3FC)),
      _HeroCard(title: '宠物健康小测', subtitle: '3分钟评估健康状况', emoji: '🏥', start: Color(0xFFFFF1A1), end: Color(0xFFFFC8A5)),
      _HeroCard(title: '萌宠摄影挑战', subtitle: '参与话题赢好礼', emoji: '📸', start: Color(0xFFA1FFCE), end: Color(0xFFFAD0C4)),
    ];

    return SizedBox(
      height: 170,
      child: Stack(
        children: [
          PageView.builder(
            controller: _heroController,
            itemCount: cards.length,
            onPageChanged: (i) => setState(() => _currentHeroIndex = i),
            itemBuilder: (context, index) {
              final c = cards[index];
              return AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                margin: const EdgeInsets.symmetric(horizontal: 6),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [c.start, c.end],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: AppTheme.elevatedShadow,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(c.title, style: const TextStyle(color: Colors.black87, fontSize: 18, fontWeight: FontWeight.w700)),
                            const SizedBox(height: 6),
                            Text(c.subtitle, style: const TextStyle(color: Colors.black54, fontSize: 14)),
                            const SizedBox(height: 10),
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                              decoration: BoxDecoration(
                                color: Colors.white.withOpacity(0.85),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: const Text('了解更多', style: TextStyle(color: Colors.black87, fontSize: 12, fontWeight: FontWeight.w600)),
                            ),
                          ],
                        ),
                      ),
                      Text(c.emoji, style: const TextStyle(fontSize: 64)),
                    ],
                  ),
                ),
              );
            },
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 8,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(3, (i) => _buildDot(i == _currentHeroIndex)),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildDot(bool active) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 250),
      margin: const EdgeInsets.symmetric(horizontal: 3),
      width: active ? 18 : 6,
      height: 6,
      decoration: BoxDecoration(
        color: active ? AppTheme.primaryColor : AppTheme.textLightColor,
        borderRadius: BorderRadius.circular(3),
      ),
    );
  }

  Widget _buildPetCategoryChips() {
    return SizedBox(
      height: 38,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: _petCategories.length,
        itemBuilder: (context, index) {
          final c = _petCategories[index];
          final selected = c == _selectedPetCategory;
          return GestureDetector(
            onTap: () => setState(() => _selectedPetCategory = c),
            child: Container(
              margin: EdgeInsets.only(right: index == _petCategories.length - 1 ? 0 : 8),
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              decoration: BoxDecoration(
                color: selected ? AppTheme.primaryColor : Colors.white,
                borderRadius: BorderRadius.circular(18),
                border: Border.all(color: selected ? AppTheme.primaryColor : AppTheme.dividerColor),
                boxShadow: selected ? AppTheme.subtleShadow : null,
              ),
              child: Text(
                c,
                style: TextStyle(color: selected ? Colors.white : AppTheme.textPrimaryColor, fontSize: 12, fontWeight: FontWeight.w600),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildQuickActionsRow() {
    return Row(
      children: _quickActions.map((qa) {
        return Expanded(
          child: Container(
            margin: EdgeInsets.only(right: qa == _quickActions.last ? 0 : 12),
            decoration: AppTheme.cardDecoration,
            child: InkWell(
              borderRadius: BorderRadius.circular(AppTheme.borderRadiusLarge),
              onTap: () => _showSnackBar('${qa.label} 功能开发中...'),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 14),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: qa.color.withOpacity(0.12),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Icon(qa.icon, color: qa.color, size: 22),
                    ),
                    const SizedBox(height: 8),
                    Text(qa.label, style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w600)),
                  ],
                ),
              ),
            ),
          ),
        );
      }).toList(),
    );
  }

  Widget _buildDailyTipCard() {
    return Container(
      decoration: AppTheme.cardDecoration.copyWith(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(14),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: AppTheme.secondaryLightColor,
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Text('💡', style: TextStyle(fontSize: 22)),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('今日小知识', style: AppTheme.subheadingStyle.copyWith(fontSize: 16)),
                  const SizedBox(height: 4),
                  Text('夏季遛狗尽量避开正午时段，随身携带饮水，注意地面温度，避免烫伤肉垫。',
                      style: AppTheme.captionStyle.copyWith(color: AppTheme.textPrimaryColor)),
                ],
              ),
            ),
            TextButton(
              onPressed: () => _showSnackBar('查看更多小知识'),
              child: const Text('更多'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFollowTab() {
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: 8,
      itemBuilder: (context, index) {
        return _buildContentCard(
          title: '关注内容 ${index + 1}',
          content: '这是你关注的人发布的内容，保持关注获取最新动态...',
          author: '关注用户',
          likes: (index + 1) * 15,
          comments: (index + 1) * 5,
          isLiked: index % 3 == 0,
        );
      },
    );
  }

  Widget _buildWikiTab() {
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: 6,
      itemBuilder: (context, index) {
        return _buildWikiCard(
          title: '百科知识 ${index + 1}',
          description: '这是一个有趣的百科知识，帮助你了解更多信息...',
          category: '知识分类',
          views: (index + 1) * 100,
        );
      },
    );
  }

  Widget _buildContentCard({
    required String title,
    required String content,
    required String author,
    required int likes,
    required int comments,
    required bool isLiked,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 作者信息
            Row(
              children: [
                CircleAvatar(
                  radius: 20,
                  backgroundColor: Colors.blue[100],
                  child: Icon(Icons.person, color: Colors.blue[700]),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        author,
                        style: const TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                        ),
                      ),
                      Text(
                        '刚刚',
                        style: TextStyle(
                          color: Colors.grey[500],
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.more_horiz),
                  onPressed: () {
                    _showContentOptions();
                  },
                ),
              ],
            ),
            
            const SizedBox(height: 12),
            
            // 内容标题
            Text(
              title,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
            
            const SizedBox(height: 8),
            
            // 内容描述
            Text(
              content,
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey[700],
                height: 1.4,
              ),
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
            ),
            
            const SizedBox(height: 16),
            
            // 操作按钮
            Row(
              children: [
                _buildActionButton(
                  icon: isLiked ? Icons.favorite : Icons.favorite_border,
                  label: '$likes',
                  color: isLiked ? Colors.red : Colors.grey,
                  onTap: () {
                    setState(() {
                      // 这里可以添加点赞逻辑
                    });
                  },
                ),
                const SizedBox(width: 24),
                _buildActionButton(
                  icon: Icons.comment_outlined,
                  label: '$comments',
                  color: Colors.grey,
                  onTap: () {
                    _showCommentDialog();
                  },
                ),
                const SizedBox(width: 24),
                _buildActionButton(
                  icon: Icons.share_outlined,
                  label: '分享',
                  color: Colors.grey,
                  onTap: () {
                    _showShareDialog();
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildWikiCard({
    required String title,
    required String description,
    required String category,
    required int views,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    color: Colors.green[100],
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    category,
                    style: TextStyle(
                      color: Colors.green[700],
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                const Spacer(),
                Icon(Icons.visibility, size: 16, color: Colors.grey[500]),
                const SizedBox(width: 4),
                Text(
                  '$views',
                  style: TextStyle(
                    color: Colors.grey[500],
                    fontSize: 12,
                  ),
                ),
              ],
            ),
            
            const SizedBox(height: 12),
            
            Text(
              title,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
            
            const SizedBox(height: 8),
            
            Text(
              description,
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey[700],
                height: 1.4,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            
            const SizedBox(height: 12),
            
            Row(
              children: [
                Icon(Icons.info_outline, size: 16, color: Colors.blue[500]),
                const SizedBox(width: 4),
                Text(
                  '点击了解更多',
                  style: TextStyle(
                    color: Colors.blue[500],
                    fontSize: 12,
                  ),
                ),
                const Spacer(),
                Icon(Icons.arrow_forward_ios, size: 14, color: Colors.grey[400]),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildActionButton({
    required IconData icon,
    required String label,
    required Color color,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        children: [
          Icon(icon, size: 20, color: color),
          const SizedBox(width: 6),
          Text(
            label,
            style: TextStyle(
              color: color,
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }

  void _showContentOptions() {
    showModalBottomSheet(
      context: context,
      builder: (context) => Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: const Icon(Icons.report),
              title: const Text('举报'),
              onTap: () {
                Navigator.of(context).pop();
                _showSnackBar('举报功能开发中...');
              },
            ),
            ListTile(
              leading: const Icon(Icons.block),
              title: const Text('屏蔽'),
              onTap: () {
                Navigator.of(context).pop();
                _showSnackBar('屏蔽功能开发中...');
              },
            ),
          ],
        ),
      ),
    );
  }

  void _showCommentDialog() {
    _showSnackBar('评论功能开发中...');
  }

  void _showShareDialog() {
    _showSnackBar('分享功能开发中...');
  }

  void _showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }
}

class _HeroCard {
  final String title;
  final String subtitle;
  final String emoji;
  final Color start;
  final Color end;
  const _HeroCard({
    required this.title,
    required this.subtitle,
    required this.emoji,
    required this.start,
    required this.end,
  });
}

class _QuickAction {
  final IconData icon;
  final String label;
  final Color color;
  const _QuickAction({required this.icon, required this.label, required this.color});
}