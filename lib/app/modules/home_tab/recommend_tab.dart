import 'package:flutter/material.dart';
import 'dart:async';
import '../../theme/app_theme.dart';

class RecommendTab extends StatefulWidget {
  const RecommendTab({Key? key}) : super(key: key);

  @override
  State<RecommendTab> createState() => _RecommendTabState();
}

class _RecommendTabState extends State<RecommendTab> {
  final PageController _heroController = PageController(viewportFraction: 0.9);
  int _currentHeroIndex = 0;
  Timer? _heroTimer;
  bool _userInteractingCarousel = false;

  final List<_HeroCard> _heroCards = const [
    _HeroCard(
      title: '周末和Ta去公园',
      subtitle: '附近遛狗路线推荐',
      emoji: '🐕',
      start: Color(0xFF8EC5FC),
      end: Color(0xFFE0C3FC),
    ),
    _HeroCard(
      title: '宠物健康小测',
      subtitle: '3分钟评估健康状况',
      emoji: '🏥',
      start: Color(0xFFFFF1A1),
      end: Color(0xFFFFC8A5),
    ),
    _HeroCard(
      title: '萌宠摄影挑战',
      subtitle: '参与话题赢好礼',
      emoji: '📸',
      start: Color(0xFFA1FFCE),
      end: Color(0xFFFAD0C4),
    ),
  ];

  final List<String> _petCategories = ['全部', '医疗', '美容', '训练', '救助'];
  String _selectedPetCategory = '全部';
  final List<_QuickAction> _quickActions = const [
    _QuickAction(icon: Icons.park, label: '附近公园', color: AppTheme.successColor),
    _QuickAction(icon: Icons.local_hospital, label: '宠物医院', color: AppTheme.primaryColor),
    _QuickAction(icon: Icons.content_cut, label: '美容护理', color: AppTheme.secondaryColor),
    _QuickAction(icon: Icons.volunteer_activism, label: '领养救助', color: AppTheme.warningColor),
  ];

  @override
  void initState() {
    super.initState();
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
      final next = (_currentHeroIndex + 1) % _heroCards.length;
      _heroController.animateToPage(
        next,
        duration: const Duration(milliseconds: 450),
        curve: Curves.easeOut,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
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
          final List<String> images = List.generate(
            (index % 9) + 1,
            (i) => 'https://picsum.photos/seed/${index}_${i}/400/400',
          );
          final bool isVideo = index % 4 == 0;
          return _buildContentCard(
            title: '推荐内容  ${index + 1}',
            content: '这是一个有趣的推荐内容，包含了用户可能感兴趣的信息...（宠物主题强化版）',
            author: index % 2 == 0 ? '训宠师Kris' : '兽医Lily',
            likes: (index + 1) * 12,
            comments: (index + 1) * 4,
            isLiked: index % 3 == 0,
            images: isVideo ? const [] : images,
            videoThumb: isVideo ? 'https://picsum.photos/seed/video_$index/800/450' : null,
          );
        }),
      ],
    );
  }

  Widget _buildHeroCarousel() {
    return SizedBox(
      height: 170,
      child: Stack(
        children: [
          GestureDetector(
            onPanDown: (_) {
              _userInteractingCarousel = true;
              _heroTimer?.cancel();
            },
            onPanEnd: (_) {
              _userInteractingCarousel = false;
              _startHeroAutoPlay();
            },
            child: PageView.builder(
              controller: _heroController,
              itemCount: _heroCards.length,
              onPageChanged: (i) {
                setState(() => _currentHeroIndex = i);
                _heroTimer?.cancel();
                _startHeroAutoPlay();
              },
              itemBuilder: (context, index) {
                final c = _heroCards[index];
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
                              Text(
                                c.title,
                                style: const TextStyle(
                                  color: Colors.black87,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              const SizedBox(height: 6),
                              Text(
                                c.subtitle,
                                style: const TextStyle(
                                  color: Colors.black54,
                                  fontSize: 14,
                                ),
                              ),
                              const SizedBox(height: 10),
                              Container(
                                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                                decoration: BoxDecoration(
                                  color: Colors.white.withValues(alpha: 0.85),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: const Text(
                                  '了解更多',
                                  style: TextStyle(
                                    color: Colors.black87,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
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
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 8,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                _heroCards.length,
                (i) => _buildDot(i == _currentHeroIndex),
              ),
            ),
          ),
          // 左右分页按钮
          Positioned(
            left: 4,
            top: 0,
            bottom: 0,
            child: Center(
              child: _pagerButton(
                icon: Icons.chevron_left,
                onTap: () {
                  final prev = (_currentHeroIndex - 1 + _heroCards.length) % _heroCards.length;
                  _heroTimer?.cancel();
                  _heroController.animateToPage(
                    prev,
                    duration: const Duration(milliseconds: 350),
                    curve: Curves.easeOut,
                  );
                  setState(() => _currentHeroIndex = prev);
                  _startHeroAutoPlay();
                },
              ),
            ),
          ),
          Positioned(
            right: 4,
            top: 0,
            bottom: 0,
            child: Center(
              child: _pagerButton(
                icon: Icons.chevron_right,
                onTap: () {
                  final next = (_currentHeroIndex + 1) % _heroCards.length;
                  _heroTimer?.cancel();
                  _heroController.animateToPage(
                    next,
                    duration: const Duration(milliseconds: 350),
                    curve: Curves.easeOut,
                  );
                  setState(() => _currentHeroIndex = next);
                  _startHeroAutoPlay();
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _pagerButton({required IconData icon, required VoidCallback onTap}) {
    return Material(
      color: Colors.white.withValues(alpha: 0.8),
      shape: const CircleBorder(),
      child: InkWell(
        customBorder: const CircleBorder(),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(6),
          child: Icon(icon, size: 20, color: Colors.black54),
        ),
      ),
    );
  }

  Widget _buildVideoThumb(String url) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: AspectRatio(
            aspectRatio: 16 / 9,
            child: Image.network(url, fit: BoxFit.cover),
          ),
        ),
        Positioned.fill(
          child: Center(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.black.withValues(alpha: 0.35),
                shape: BoxShape.circle,
              ),
              padding: const EdgeInsets.all(10),
              child: const Icon(Icons.play_arrow, color: Colors.white, size: 30),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildMediaGrid(List<String> images) {
    final int count = images.length.clamp(1, 9);
    final List<String> items = images.take(count).toList();
    int crossAxisCount = count == 1 ? 1 : count <= 4 ? 2 : 3;
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: crossAxisCount,
          crossAxisSpacing: 4,
          mainAxisSpacing: 4,
        ),
        itemCount: items.length,
        itemBuilder: (context, index) {
          final img = items[index];
          return Container(
            color: Colors.grey[200],
            child: Image.network(img, fit: BoxFit.cover),
          );
        },
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
                style: TextStyle(
                  color: selected ? Colors.white : AppTheme.textPrimaryColor,
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                ),
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
                        color: qa.color.withValues(alpha: 0.12),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Icon(qa.icon, color: qa.color, size: 22),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      qa.label,
                      style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
                    ),
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
                  Text(
                    '夏季遛狗尽量避开正午时段，随身携带饮水，注意地面温度，避免烫伤肉垫。',
                    style: AppTheme.captionStyle.copyWith(color: AppTheme.textPrimaryColor),
                  ),
                ],
              ),
            ),
            TextButton(onPressed: () => _showSnackBar('查看更多小知识'), child: const Text('更多')),
          ],
        ),
      ),
    );
  }

  Widget _buildContentCard({
    required String title,
    required String content,
    required String author,
    required int likes,
    required int comments,
    required bool isLiked,
    required List<String> images,
    String? videoThumb,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: AppTheme.cardDecoration,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 18,
                  backgroundColor: AppTheme.primaryLightColor,
                  child: Icon(Icons.pets, color: AppTheme.primaryColor, size: 18),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        author,
                        style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 15),
                      ),
                      Text('刚刚', style: TextStyle(color: Colors.grey[500], fontSize: 12)),
                    ],
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.more_horiz),
                  onPressed: () => _showSnackBar('更多功能开发中...'),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Text(title, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w700)),
            const SizedBox(height: 8),
            Text(
              content,
              style: TextStyle(fontSize: 14, color: Colors.grey[700], height: 1.4),
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 10),
            if (videoThumb != null)
              _buildVideoThumb(videoThumb)
            else if (images.isNotEmpty)
              _buildMediaGrid(images),
            const SizedBox(height: 10),
            const Wrap(
              spacing: 6,
              runSpacing: 6,
              children: [
                _TagChip(label: '宠物'),
                _TagChip(label: '健康'),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                _buildActionButton(
                  icon: isLiked ? Icons.favorite : Icons.favorite_border,
                  label: '$likes',
                  color: isLiked ? Colors.red : AppTheme.textSecondaryColor,
                  onTap: () => setState(() {}),
                ),
                const SizedBox(width: 24),
                _buildActionButton(
                  icon: Icons.comment_outlined,
                  label: '$comments',
                  color: AppTheme.textSecondaryColor,
                  onTap: () => _showSnackBar('评论功能开发中...'),
                ),
                const SizedBox(width: 24),
                _buildActionButton(
                  icon: Icons.share_outlined,
                  label: '分享',
                  color: AppTheme.textSecondaryColor,
                  onTap: () => _showSnackBar('分享功能开发中...'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  static Widget _buildActionButton({
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
          Text(label, style: TextStyle(color: color, fontSize: 14)),
        ],
      ),
    );
  }

  void _showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message)));
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
  const _QuickAction({
    required this.icon,
    required this.label,
    required this.color,
  });
}

class _TagChip extends StatelessWidget {
  final String label;
  const _TagChip({required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: AppTheme.primaryLightColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: const Text(
        '健康',
        style: TextStyle(fontSize: 11, color: AppTheme.primaryDarkColor),
      ),
    );
  }
}



