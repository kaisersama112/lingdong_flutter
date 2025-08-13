import 'package:flutter/material.dart';
import 'dart:async';
import '../../theme/app_theme.dart';
import 'content_detail_page.dart';

class RecommendTab extends StatefulWidget {
  const RecommendTab({super.key});

  @override
  State<RecommendTab> createState() => _RecommendTabState();
}

class _RecommendTabState extends State<RecommendTab> {
  late PageController _heroController;
  int _currentHeroIndex = 0;
  Timer? _heroTimer;
  bool _userInteractingCarousel = false;
  late int _initialHeroPage;

  final List<_HeroCard> _heroCards = const [
    _HeroCard(
      title: '周末和Ta去公园',
      subtitle: '附近遛狗路线推荐',
      emoji: '🐕',
      gradient: LinearGradient(
        colors: [Color(0xFF4ECDC4), Color(0xFF26D0CE)],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ),
    ),
    _HeroCard(
      title: '宠物健康小测',
      subtitle: '3分钟评估健康状况',
      emoji: '🏥',
      gradient: LinearGradient(
        colors: [Color(0xFFFF6B35), Color(0xFFFF8A65)],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ),
    ),
    _HeroCard(
      title: '萌宠摄影挑战',
      subtitle: '参与话题赢好礼',
      emoji: '📸',
      gradient: LinearGradient(
        colors: [Color(0xFFFF9FF3), Color(0xFFAB47BC)],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ),
    ),
  ];

  final List<String> _petCategories = ['全部', '医疗', '美容', '训练', '救助'];
  String _selectedPetCategory = '全部';
  
  final List<_QuickAction> _quickActions = const [
    _QuickAction(
      icon: Icons.park,
      label: '附近公园',
      color: AppTheme.successColor,
      gradient: LinearGradient(
        colors: [Color(0xFF66BB6A), Color(0xFF4CAF50)],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ),
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
  }

  @override
  void dispose() {
    _heroTimer?.cancel();
    _heroController.dispose();
    super.dispose();
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
    return ListView(
      padding: const EdgeInsets.all(20),
      children: [
        _buildHeroCarousel(),
        const SizedBox(height: 24),
        _buildPetCategoryChips(),
        const SizedBox(height: 24),
        _buildQuickActionsRow(),
        const SizedBox(height: 24),
        _buildDailyTipCard(),
        const SizedBox(height: 24),
        _buildContentSection(),
      ],
    );
  }

  Widget _buildHeroCarousel() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          '今日推荐',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: AppTheme.textPrimaryColor,
          ),
        ),
        const SizedBox(height: 16),
        SizedBox(
          height: 180,
          child: Listener(
            onPointerDown: (_) => setState(() => _userInteractingCarousel = true),
            onPointerUp: (_) => setState(() => _userInteractingCarousel = false),
            onPointerCancel: (_) => setState(() => _userInteractingCarousel = false),
            child: PageView.builder(
              controller: _heroController,
              onPageChanged: (index) {
                setState(() => _currentHeroIndex = index % _heroCards.length);
              },
              itemBuilder: (context, index) {
                final card = _heroCards[index % _heroCards.length];
                return _buildHeroCard(card, index);
              },
            ),
          ),
        ),
        const SizedBox(height: 16),
        _buildPageIndicator(),
      ],
    );
  }

  Widget _buildHeroCard(_HeroCard card, int index) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(
        gradient: card.gradient,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: card.gradient.colors.first.withValues(alpha: 0.3),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(20),
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (_) => ContentDetailPage(
                  postId: 'hero_$index',
                  title: card.title,
                  content: card.subtitle,
                  author: '系统推荐',
                  images: const [],
                  videoThumb: null,
                ),
              ),
            );
          },
          child: Padding(
            padding: const EdgeInsets.all(24),
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
                      const SizedBox(height: 8),
                      Text(
                        card.subtitle,
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.white.withValues(alpha: 0.9),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 16),
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white.withValues(alpha: 0.2),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Text(
                    card.emoji,
                    style: const TextStyle(fontSize: 32),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildPageIndicator() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(_heroCards.length, (index) {
        return AnimatedContainer(
          duration: AppTheme.shortAnimation,
          margin: const EdgeInsets.symmetric(horizontal: 4),
          width: index == _currentHeroIndex ? 24 : 8,
          height: 8,
          decoration: BoxDecoration(
            color: index == _currentHeroIndex 
                ? AppTheme.primaryColor 
                : AppTheme.textLightColor,
            borderRadius: BorderRadius.circular(4),
          ),
        );
      }),
    );
  }

  Widget _buildPetCategoryChips() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          '分类浏览',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: AppTheme.textPrimaryColor,
          ),
        ),
        const SizedBox(height: 12),
        SizedBox(
          height: 40,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: _petCategories.length,
            itemBuilder: (context, index) {
              final category = _petCategories[index];
              final isSelected = category == _selectedPetCategory;
              
              return Container(
                margin: const EdgeInsets.only(right: 12),
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    borderRadius: BorderRadius.circular(20),
                    onTap: () {
                      setState(() => _selectedPetCategory = category);
                    },
                    child: AnimatedContainer(
                      duration: AppTheme.shortAnimation,
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      decoration: BoxDecoration(
                        gradient: isSelected ? AppTheme.primaryGradient : null,
                        color: isSelected ? null : Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        border: isSelected ? null : Border.all(
                          color: AppTheme.dividerColor,
                          width: 1,
                        ),
                        boxShadow: isSelected ? [
                          BoxShadow(
                            color: AppTheme.primaryColor.withValues(alpha: 0.3),
                            blurRadius: 8,
                            offset: const Offset(0, 4),
                          ),
                        ] : null,
                      ),
                      child: Text(
                        category,
                        style: TextStyle(
                          color: isSelected ? Colors.white : AppTheme.textSecondaryColor,
                          fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500,
                          fontSize: 14,
                        ),
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

  Widget _buildQuickActionsRow() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          '快速服务',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: AppTheme.textPrimaryColor,
          ),
        ),
        const SizedBox(height: 16),
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
            childAspectRatio: 0.8,
          ),
          itemCount: _quickActions.length,
          itemBuilder: (context, index) {
            final action = _quickActions[index];
            return _buildQuickActionCard(action);
          },
        ),
      ],
    );
  }

  Widget _buildQuickActionCard(_QuickAction action) {
    return Container(
      decoration: AppTheme.cardDecoration,
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(AppTheme.borderRadiusLarge),
          onTap: () {
            // 处理点击事件
          },
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    gradient: action.gradient,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: action.color.withValues(alpha: 0.3),
                        blurRadius: 8,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Icon(
                    action.icon,
                    color: Colors.white,
                    size: 24,
                  ),
                ),
                const SizedBox(height: 12),
                Text(
                  action.label,
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: AppTheme.textPrimaryColor,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildDailyTipCard() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: AppTheme.glassmorphismDecoration,
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              gradient: AppTheme.warmGradient,
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Icon(
              Icons.lightbulb_outline,
              color: Colors.white,
              size: 24,
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  '今日小贴士',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: AppTheme.textPrimaryColor,
                  ),
                ),
                const SizedBox(height: 4),
                const Text(
                  '定期为宠物梳毛不仅能保持毛发健康，还能增进感情哦！',
                  style: TextStyle(
                    fontSize: 14,
                    color: AppTheme.textSecondaryColor,
                    height: 1.4,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildContentSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          '推荐内容',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: AppTheme.textPrimaryColor,
          ),
        ),
        const SizedBox(height: 16),
        ...List.generate(5, (index) {
          return Container(
            margin: const EdgeInsets.only(bottom: 16),
            child: _buildContentCard(
              title: '推荐内容 ${index + 1}',
              content: '这是一个有趣的推荐内容，包含了用户可能感兴趣的信息...',
              author: '宠物达人${index + 1}',
              likes: (index + 1) * 123,
              comments: (index + 1) * 45,
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (_) => ContentDetailPage(
                      postId: 'recommend_$index',
                      title: '推荐内容 ${index + 1}',
                      content: '这是一个有趣的推荐内容，包含了用户可能感兴趣的信息...',
                      author: '宠物达人${index + 1}',
                      images: const [],
                    ),
                  ),
                );
              },
            ),
          );
        }),
      ],
    );
  }

  Widget _buildContentCard({
    required String title,
    required String content,
    required String author,
    required int likes,
    required int comments,
    VoidCallback? onTap,
  }) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(AppTheme.borderRadiusLarge),
        onTap: onTap,
        child: Container(
      decoration: AppTheme.cardDecoration,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    gradient: AppTheme.primaryGradient,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Icon(
                    Icons.pets,
                    color: Colors.white,
                    size: 20,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        author,
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: AppTheme.textPrimaryColor,
                        ),
                      ),
                      Text(
                        '2小时前',
                        style: TextStyle(
                          fontSize: 12,
                          color: AppTheme.textLightColor,
                        ),
                      ),
                    ],
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.more_horiz),
                  onPressed: () {},
                  color: AppTheme.textSecondaryColor,
                ),
              ],
            ),
            const SizedBox(height: 12),
            Text(
              title,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: AppTheme.textPrimaryColor,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              content,
              style: const TextStyle(
                fontSize: 14,
                color: AppTheme.textSecondaryColor,
                height: 1.4,
              ),
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                _buildActionButton(Icons.favorite_border, '$likes'),
                const SizedBox(width: 16),
                _buildActionButton(Icons.chat_bubble_outline, '$comments'),
                const SizedBox(width: 16),
                _buildActionButton(Icons.share, '分享'),
              ],
            ),
          ],
        ),
      ),
    ),
      ),
    );
  }

  Widget _buildActionButton(IconData icon, String label) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: AppTheme.dividerColor),
        boxShadow: const [
          BoxShadow(color: Colors.black12, blurRadius: 6, offset: Offset(0, 2)),
        ],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 16, color: AppTheme.textSecondaryColor),
          const SizedBox(width: 6),
          Text(label, style: const TextStyle(fontSize: 12, color: AppTheme.textSecondaryColor, fontWeight: FontWeight.w600)),
        ],
      ),
    );
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



