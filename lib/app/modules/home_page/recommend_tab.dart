import 'package:flutter/material.dart';
import 'dart:async';
import '../../theme/app_theme.dart';
import '../../routes/app_router.dart';
import '../user_profile_page.dart';
import '../../services/dynamic_service.dart';
import '../../services/user_auth_service.dart';
import '../../core/components/optimized_image.dart';

class RecommendTab extends StatefulWidget {
  const RecommendTab({super.key});

  @override
  State<RecommendTab> createState() => _RecommendTabState();
}

class _RecommendTabState extends State<RecommendTab> {
  late PageController _heroController;
  Timer? _heroTimer;
  bool _userInteractingCarousel = false;
  late int _initialHeroPage;

  // 推荐动态数据
  List<DynamicPost> _recommendedPosts = [];
  bool _loadingRecommended = false;
  int _currentPage = 0;
  final ScrollController _scrollController = ScrollController();

  // 本地交互状态（推荐列表）
  final Map<String, bool> _liked = {};
  final Map<String, bool> _favorited = {};
  final Map<String, int> _likeCounts = {};
  final Map<String, int> _commentCounts = {};
  final Map<String, int> _favoriteCounts = {};

  // 用户头像缓存
  final Map<String, String?> _userAvatars = {};

  void _ensureRecStatsInitialized(String postId, DynamicPost post) {
    _liked.putIfAbsent(postId, () => post.likedByCurrentUser);
    _favorited.putIfAbsent(postId, () => post.favoritedByCurrentUser);
    _likeCounts.putIfAbsent(postId, () => post.likes);
    _commentCounts.putIfAbsent(postId, () => post.comments);
    _favoriteCounts.putIfAbsent(postId, () => post.favorites);
  }

  Future<void> _toggleRecLike(String postId) async {
    if (UserAuthService().currentUser == null) {
      if (mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(const SnackBar(content: Text('请先登录后再进行操作')));
      }
      return;
    }
    // 乐观更新
    final current = _liked[postId] ?? false;
    final count = _likeCounts[postId] ?? 0;
    setState(() {
      _liked[postId] = !current;
      _likeCounts[postId] = count + (current ? -1 : 1);
    });
    // 同步服务端状态
    final stats = await DynamicService().toggleLike(postId);
    // 若服务端返回与点击前相同，保留乐观状态，避免回滚体验
    if (stats.likedByCurrentUser != current) {
      setState(() {
        _liked[postId] = stats.likedByCurrentUser;
        _likeCounts[postId] = stats.likes;
        _commentCounts[postId] = stats.comments;
        _favoriteCounts[postId] = stats.favorites;
      });
    }
  }

  Future<void> _toggleRecFavorite(String postId) async {
    if (UserAuthService().currentUser == null) {
      if (mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(const SnackBar(content: Text('请先登录后再进行操作')));
      }
      return;
    }
    // 乐观更新
    final current = _favorited[postId] ?? false;
    final optimistic = !current;
    setState(() {
      _favorited[postId] = optimistic;
      final curFav = _favoriteCounts[postId] ?? 0;
      _favoriteCounts[postId] = curFav + (optimistic ? 1 : -1);
    });
    // 同步服务端状态
    final stats = await DynamicService().toggleFavorite(postId);
    // 若服务端返回与点击前相同，保留乐观状态；否则以服务端为准
    if (stats.favoritedByCurrentUser != current) {
      setState(() {
        _favorited[postId] = stats.favoritedByCurrentUser;
        _favoriteCounts[postId] = stats.favorites;
        _likeCounts[postId] = stats.likes;
        _commentCounts[postId] = stats.comments;
      });
    }
  }

  void _showRecMoreActions(String postId) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (_) => SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: const Icon(Icons.flag, color: Color(0xFFEF4444)),
              title: const Text('举报'),
              onTap: () {
                Navigator.pop(context);
                ScaffoldMessenger.of(
                  context,
                ).showSnackBar(const SnackBar(content: Text('已提交举报，我们会尽快审核')));
              },
            ),
            ListTile(
              leading: const Icon(Icons.link, color: Color(0xFF8B5CF6)),
              title: const Text('复制链接'),
              onTap: () {
                Navigator.pop(context);
                ScaffoldMessenger.of(
                  context,
                ).showSnackBar(const SnackBar(content: Text('链接已复制')));
              },
            ),
          ],
        ),
      ),
    );
  }

  void _openImagePreview(List<String> images, int initialIndex) {
    final PageController controller = PageController(initialPage: initialIndex);
    showDialog(
      context: context,
      barrierColor: Colors.black.withValues(alpha: 0.9),
      builder: (context) => Stack(
        children: [
          PageView.builder(
            controller: controller,
            itemCount: images.length,
            itemBuilder: (_, i) => Center(
              child: InteractiveViewer(
                minScale: 0.8,
                maxScale: 4.0,
                child: Image.network(
                  images[i],
                  fit: BoxFit.contain,
                  errorBuilder: (_, __, ___) => Container(
                    width: double.infinity,
                    height: double.infinity,
                    color: const Color(0xFF111827),
                    alignment: Alignment.center,
                    child: const Icon(
                      Icons.broken_image,
                      color: Colors.white70,
                      size: 48,
                    ),
                  ),
                  loadingBuilder: (context, child, progress) {
                    if (progress == null) return child;
                    return const Center(
                      child: CircularProgressIndicator(strokeWidth: 2),
                    );
                  },
                ),
              ),
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).padding.top + 8,
            right: 12,
            child: IconButton(
              icon: const Icon(Icons.close, color: Colors.white),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ),
        ],
      ),
    );
  }

  // 需要多图时可复用的网格构建（目前未使用，先移除避免告警）
  // _buildActionButton 已移除，统一使用纯图标布局

  final List<_HeroCard> _heroCards = const [
    _HeroCard(
      title: '周末和Ta去公园',
      subtitle: '附近遛狗路线推荐',
      emoji: '🐕',
      gradient: AppTheme.accentGradient,
    ),
    _HeroCard(
      title: '宠物健康小测',
      subtitle: '3分钟评估健康状况',
      emoji: '🏥',
      gradient: AppTheme.warmGradient,
    ),
    _HeroCard(
      title: '萌宠摄影挑战',
      subtitle: '参与话题赢好礼',
      emoji: '📸',
      gradient: AppTheme.primaryGradient,
    ),
  ];

  final List<String> _petCategories = ['全部', '医疗', '美容', '训练', '救助'];
  String _selectedPetCategory = '全部';

  final List<_QuickAction> _quickActions = const [
    _QuickAction(
      icon: Icons.park,
      label: '附近公园',
      color: AppTheme.successColor,
      gradient: AppTheme.accentGradient,
    ),
    _QuickAction(
      icon: Icons.local_hospital,
      label: '宠物医院',
      color: AppTheme.primaryColor,
      gradient: AppTheme.primaryGradient,
    ),
    _QuickAction(
      icon: Icons.content_cut,
      label: '美容护理',
      color: AppTheme.secondaryColor,
      gradient: AppTheme.secondaryGradient,
    ),
    _QuickAction(
      icon: Icons.volunteer_activism,
      label: '领养救助',
      color: AppTheme.warningColor,
      gradient: AppTheme.warmGradient,
    ),
  ];

  @override
  void initState() {
    super.initState();
    _initialHeroPage = _heroCards.length * 1000;
    _heroController = PageController(
      viewportFraction: 0.9,
      initialPage: _initialHeroPage,
    );
    _startHeroAutoPlay();
    _loadRecommendedPosts();
    _scrollController.addListener(_onScroll);
  }

  Future<String?> _getUserAvatar(String authorId) async {
    if (_userAvatars.containsKey(authorId)) {
      return _userAvatars[authorId];
    }

    try {
      final userInfo = await DynamicService().getOtherUserInfo(authorId);
      final avatar = userInfo?.avatar;
      _userAvatars[authorId] = avatar;
      return avatar;
    } catch (e) {
      debugPrint('获取用户头像失败: $e');
      _userAvatars[authorId] = null;
      return null;
    }
  }

  @override
  void dispose() {
    _heroTimer?.cancel();
    _heroController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_scrollController.position.pixels >=
        _scrollController.position.maxScrollExtent - 200) {
      _loadMoreRecommendedPosts();
    }
  }

  Future<void> _loadRecommendedPosts() async {
    if (_loadingRecommended) return;
    if (mounted) {
      setState(() => _loadingRecommended = true);
    }
    try {
      // 测试API连接
      await DynamicService().testApiConnection();
      final posts = await DynamicService().getRecommendedDynamics(
        page: 0,
        limit: 10,
      );
      if (mounted) {
        setState(() {
          _recommendedPosts = posts;
          _currentPage = 0;
        });
      }
      debugPrint('成功加载 ${posts.length} 条推荐动态');
    } catch (e) {
      debugPrint('加载推荐动态失败: $e');
    } finally {
      if (mounted) {
        setState(() => _loadingRecommended = false);
      }
    }
  }

  Future<void> _loadMoreRecommendedPosts() async {
    if (_loadingRecommended) return;
    if (mounted) {
      setState(() => _loadingRecommended = true);
    }
    try {
      final posts = await DynamicService().getRecommendedDynamics(
        page: _currentPage + 1,
        limit: 10,
      );
      if (mounted) {
        setState(() {
          _recommendedPosts.addAll(posts);
          _currentPage++;
        });
      }
    } catch (e) {
      debugPrint('加载更多推荐动态失败: $e');
    } finally {
      if (mounted) {
        setState(() => _loadingRecommended = false);
      }
    }
  }

  // 处理英雄卡片点击
  void _handleHeroCardTap(int index) {
    switch (index) {
      case 0: // 周末和Ta去公园
        _navigateToNearbyParks();
        break;
      case 1: // 宠物健康小测
        _navigateToHealthTest();
        break;
      case 2: // 萌宠摄影挑战
        _navigateToPhotoChallenge();
        break;
    }
  }

  // 处理快捷服务点击
  void _handleQuickActionTap(int index) {
    switch (index) {
      case 0: // 附近公园
        _navigateToNearbyParks();
        break;
      case 1: // 宠物医院
        _navigateToPetHospitals();
        break;
      case 2: // 宠物商店
        _navigateToPetStores();
        break;
      case 3: // 紧急求助
        _navigateToEmergencyHelp();
        break;
    }
  }

  // 处理内容卡片点击
  void _handleContentCardTap(DynamicPost post) {
    Navigator.of(context).pushNamed(
      AppRouter.contentDetailRoute,
      arguments: ContentDetailArgs(
        postId: post.id,
        title: post.title,
        content: post.content,
        author: post.author,
        images: post.images,
        videoThumb: null,
      ),
    );
  }

  // 导航到附近公园
  void _navigateToNearbyParks() {
    // 切换到遛弯页面并筛选公园
    Navigator.of(context).pushNamed(AppRouter.socialRoute);
  }

  // 导航到宠物医院
  void _navigateToPetHospitals() {
    Navigator.of(context).pushNamed(AppRouter.socialRoute);
  }

  // 导航到宠物商店
  void _navigateToPetStores() {
    Navigator.of(context).pushNamed(AppRouter.socialRoute);
  }

  // 导航到紧急求助
  void _navigateToEmergencyHelp() {
    Navigator.of(context).pushNamed(AppRouter.lostPetRoute);
  }

  // 导航到健康测试
  void _navigateToHealthTest() {
    _showComingSoonDialog('宠物健康测试功能即将上线！');
  }

  // 导航到摄影挑战
  void _navigateToPhotoChallenge() {
    _showComingSoonDialog('萌宠摄影挑战功能即将上线！');
  }

  // 显示即将上线对话框
  void _showComingSoonDialog(String message) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('功能预告'),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('知道了'),
          ),
        ],
      ),
    );
  }

  void _startHeroAutoPlay() {
    _heroTimer?.cancel();
    _heroTimer = Timer.periodic(const Duration(seconds: 4), (_) {
      if (!mounted) return;
      if (!_heroController.hasClients) return;
      if (_userInteractingCarousel) return;
      _heroController.nextPage(
        duration: const Duration(milliseconds: 450),
        curve: Curves.easeOut,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: _loadRecommendedPosts,
      child: ListView(
        controller: _scrollController,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        children: [
          // 英雄轮播区域
          _buildHeroSection(),

          const SizedBox(height: 20),

          // 快速操作区域
          _buildQuickActionsSection(),

          const SizedBox(height: 20),

          // 分类筛选区域
          _buildCategoryFilterSection(),

          const SizedBox(height: 16),

          // 推荐内容区域
          _buildRecommendContentSection(),
        ],
      ),
    );
  }

  Widget _buildHeroSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          '今日推荐',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: Color(0xFF1F2937),
          ),
        ),
        const SizedBox(height: 12),
        SizedBox(
          height: 160,
          child: PageView.builder(
            controller: _heroController,
            onPageChanged: (index) {
              // 页面切换处理
            },
            itemBuilder: (context, index) {
              final card = _heroCards[index % _heroCards.length];
              return GestureDetector(
                onTap: () => _handleHeroCardTap(index % _heroCards.length),
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 4),
                  decoration: BoxDecoration(
                    gradient: card.gradient,
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: 0.1),
                        blurRadius: 8,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                card.title,
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                              const SizedBox(height: 6),
                              Text(
                                card.subtitle,
                                style: TextStyle(
                                  fontSize: 13,
                                  color: Colors.white.withValues(alpha: 0.9),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Text(card.emoji, style: const TextStyle(fontSize: 48)),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildQuickActionsSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          '快捷服务',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: Color(0xFF1F2937),
          ),
        ),
        const SizedBox(height: 12),
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
            childAspectRatio: 0.8,
          ),
          itemCount: _quickActions.length,
          itemBuilder: (context, index) {
            final action = _quickActions[index];
            return GestureDetector(
              onTap: () => _handleQuickActionTap(index),
              child: Container(
                decoration: BoxDecoration(
                  gradient: action.gradient,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: action.color.withValues(alpha: 0.2),
                      blurRadius: 6,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(action.icon, color: Colors.white, size: 24),
                    const SizedBox(height: 6),
                    Text(
                      action.label,
                      style: const TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ],
    );
  }

  Widget _buildCategoryFilterSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          '内容分类',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: Color(0xFF1F2937),
          ),
        ),
        const SizedBox(height: 12),
        SizedBox(
          height: 36,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: _petCategories.length,
            itemBuilder: (context, index) {
              final category = _petCategories[index];
              final isSelected = category == _selectedPetCategory;
              return Container(
                margin: const EdgeInsets.only(right: 8),
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      _selectedPetCategory = category;
                    });
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 8,
                    ),
                    decoration: BoxDecoration(
                      color: isSelected ? Color(0xFF8B5CF6) : Colors.white,
                      borderRadius: BorderRadius.circular(18),
                      border: Border.all(
                        color: isSelected
                            ? Color(0xFF8B5CF6)
                            : Color(0xFFE5E7EB),
                        width: 1,
                      ),
                    ),
                    child: Text(
                      category,
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: isSelected
                            ? FontWeight.w600
                            : FontWeight.w500,
                        color: isSelected ? Colors.white : Color(0xFF6B7280),
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildRecommendContentSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          '推荐内容',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: Color(0xFF1F2937),
          ),
        ),
        const SizedBox(height: 12),
        if (_loadingRecommended && _recommendedPosts.isEmpty)
          const Center(
            child: Padding(
              padding: EdgeInsets.all(20),
              child: CircularProgressIndicator(),
            ),
          )
        else if (_recommendedPosts.isEmpty)
          const Center(
            child: Padding(
              padding: EdgeInsets.all(20),
              child: Text('暂无推荐内容', style: TextStyle(color: Color(0xFF9CA3AF))),
            ),
          )
        else
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: _recommendedPosts.length + (_loadingRecommended ? 1 : 0),
            itemBuilder: (context, index) {
              if (index >= _recommendedPosts.length) {
                return const Center(
                  child: Padding(
                    padding: EdgeInsets.all(16),
                    child: CircularProgressIndicator(),
                  ),
                );
              }
              final post = _recommendedPosts[index];
              return GestureDetector(
                onTap: () => _handleContentCardTap(post),
                child: Container(
                  margin: const EdgeInsets.only(bottom: 12),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: Color(0xFFE5E7EB), width: 0.5),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // 头部
                      Padding(
                        padding: const EdgeInsets.all(12),
                        child: Row(
                          children: [
                            GestureDetector(
                              onTap: () => Navigator.of(context).pushNamed(
                                AppRouter.userProfileRoute,
                                arguments: UserProfileArgs(
                                  userId: post.authorId,
                                  displayName: post.author,
                                ),
                              ),
                              child: FutureBuilder<String?>(
                                future: _getUserAvatar(post.authorId),
                                builder: (context, snapshot) {
                                  final avatarUrl = snapshot.data;
                                  if (avatarUrl != null &&
                                      avatarUrl.isNotEmpty) {
                                    return OptimizedAvatar(
                                      imageUrl: avatarUrl,
                                      size: 32,
                                      backgroundColor: const Color(
                                        0xFF8B5CF6,
                                      ).withValues(alpha: 0.1),
                                      fallback: Text(
                                        post.author.isNotEmpty
                                            ? post.author[0].toUpperCase()
                                            : 'U',
                                        style: const TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600,
                                          color: Color(0xFF8B5CF6),
                                        ),
                                      ),
                                    );
                                  } else {
                                    return CircleAvatar(
                                      radius: 16,
                                      backgroundColor: const Color(
                                        0xFF8B5CF6,
                                      ).withValues(alpha: 0.1),
                                      child: Text(
                                        post.author.isNotEmpty
                                            ? post.author[0].toUpperCase()
                                            : 'U',
                                        style: const TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600,
                                          color: Color(0xFF8B5CF6),
                                        ),
                                      ),
                                    );
                                  }
                                },
                              ),
                            ),
                            const SizedBox(width: 8),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    post.author,
                                    style: const TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w600,
                                      color: Color(0xFF1F2937),
                                    ),
                                  ),
                                  Text(
                                    _timeAgo(post.createdAt),
                                    style: const TextStyle(
                                      fontSize: 11,
                                      color: Color(0xFF9CA3AF),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      const Divider(
                        height: 1,
                        thickness: 0.5,
                        color: Color(0xFFE5E7EB),
                      ),
                      // 正文
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 12,
                        ),
                        child: Text(
                          post.content,
                          style: const TextStyle(
                            fontSize: 13,
                            color: Color(0xFF374151),
                            height: 1.4,
                          ),
                        ),
                      ),
                      // 媒体
                      if (post.images.isNotEmpty) ...[
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 12),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: AspectRatio(
                              aspectRatio: 16 / 9,
                              child: GestureDetector(
                                onTap: () => _openImagePreview(post.images, 0),
                                child: Image.network(
                                  post.images.first,
                                  fit: BoxFit.cover,
                                  errorBuilder: (_, __, ___) => Container(
                                    color: const Color(0xFFF3F4F6),
                                    alignment: Alignment.center,
                                    child: const Icon(
                                      Icons.broken_image,
                                      color: Color(0xFF9CA3AF),
                                    ),
                                  ),
                                  loadingBuilder: (context, child, progress) {
                                    if (progress == null) return child;
                                    return const Center(
                                      child: CircularProgressIndicator(
                                        strokeWidth: 2,
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 8),
                      ],
                      const Divider(
                        height: 1,
                        thickness: 0.5,
                        color: Color(0xFFE5E7EB),
                      ),
                      // 操作栏
                      Builder(
                        builder: (_) {
                          _ensureRecStatsInitialized(post.id, post);
                          return Padding(
                            padding: const EdgeInsets.all(12),
                            child: Row(
                              children: [
                                const Spacer(),
                                // 点赞
                                IconButton(
                                  icon: Icon(
                                    (_liked[post.id] ?? post.likedByCurrentUser)
                                        ? Icons.favorite
                                        : Icons.favorite_border,
                                    size: 18,
                                    color:
                                        (_liked[post.id] ??
                                            post.likedByCurrentUser)
                                        ? Colors.red
                                        : const Color(0xFF9CA3AF),
                                  ),
                                  onPressed: () => _toggleRecLike(post.id),
                                ),
                                Text(
                                  '${_likeCounts[post.id] ?? post.likes}',
                                  style: const TextStyle(
                                    fontSize: 12,
                                    color: Color(0xFF9CA3AF),
                                  ),
                                ),
                                const SizedBox(width: 8),
                                // 评论
                                Row(
                                  children: [
                                    const Icon(
                                      Icons.chat_bubble_outline,
                                      size: 18,
                                      color: Color(0xFF9CA3AF),
                                    ),
                                    const SizedBox(width: 4),
                                    Text(
                                      '${_commentCounts[post.id] ?? post.comments}',
                                      style: const TextStyle(
                                        fontSize: 12,
                                        color: Color(0xFF9CA3AF),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(width: 8),
                                // 收藏
                                IconButton(
                                  icon: Icon(
                                    (_favorited[post.id] ??
                                            post.favoritedByCurrentUser)
                                        ? Icons.bookmark
                                        : Icons.bookmark_border,
                                    size: 18,
                                    color:
                                        (_favorited[post.id] ??
                                            post.favoritedByCurrentUser)
                                        ? const Color(0xFF8B5CF6)
                                        : const Color(0xFF9CA3AF),
                                  ),
                                  onPressed: () => _toggleRecFavorite(post.id),
                                ),
                                Text(
                                  '${_favoriteCounts[post.id] ?? post.favorites}',
                                  style: const TextStyle(
                                    fontSize: 12,
                                    color: Color(0xFF9CA3AF),
                                  ),
                                ),
                                const SizedBox(width: 8),
                                // 更多
                                IconButton(
                                  icon: const Icon(
                                    Icons.more_horiz,
                                    size: 18,
                                    color: Color(0xFF9CA3AF),
                                  ),
                                  onPressed: () => _showRecMoreActions(post.id),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
      ],
    );
  }

  String _timeAgo(DateTime time) {
    final diff = DateTime.now().difference(time);
    if (diff.inMinutes < 1) return '刚刚';
    if (diff.inHours < 1) return '${diff.inMinutes} 分钟前';
    if (diff.inDays < 1) return '${diff.inHours} 小时前';
    return '${diff.inDays} 天前';
  }
}

class _HeroCard {
  final String title;
  final String subtitle;
  final String emoji;
  final LinearGradient gradient;

  const _HeroCard({
    required this.title,
    required this.subtitle,
    required this.emoji,
    required this.gradient,
  });
}

class _QuickAction {
  final IconData icon;
  final String label;
  final Color color;
  final LinearGradient gradient;

  const _QuickAction({
    required this.icon,
    required this.label,
    required this.color,
    required this.gradient,
  });
}
