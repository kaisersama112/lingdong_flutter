import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';
import '../../services/feed_service.dart';
import 'content_detail_page.dart';
import '../../services/user_auth_service.dart';

class FollowTab extends StatefulWidget {
  const FollowTab({Key? key}) : super(key: key);

  @override
  State<FollowTab> createState() => _FollowTabState();
}

class _FollowTabState extends State<FollowTab> {
  final FeedService _feedService = FeedService();

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(AppTheme.spacingM),
      itemCount: 8,
      itemBuilder: (context, index) {
        final List<String> images = List.generate(
          (index % 9) + 1,
          (i) => 'https://picsum.photos/seed/follow_${index}_$i/400/400',
        );
        final bool isVideo = index % 3 == 0;
        final String postId = 'follow_$index';
        return FutureBuilder<PostStats>(
          future: _feedService.getPostStats(postId),
          builder: (context, snapshot) {
            final stats = snapshot.data ?? const PostStats(likes: 0, favorites: 0, comments: 0, shares: 0, likedByCurrentUser: false, favoritedByCurrentUser: false);
            return GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (_) => ContentDetailPage(
                      postId: postId,
                      title: '关注内容  ${index + 1}',
                      content: '这是你关注的人发布的内容，保持关注获取最新动态...',
                      author: '关注用户',
                      images: isVideo ? const [] : images,
                      videoThumb: isVideo ? 'https://picsum.photos/seed/follow_video_$index/800/450' : null,
                    ),
                  ),
                );
              },
              child: _buildContentCard(
              context: context,
              postId: postId,
              title: '关注内容  ${index + 1}',
              content: '这是你关注的人发布的内容，保持关注获取最新动态...',
              author: '关注用户',
              likes: stats.likes,
              comments: stats.comments,
              isLiked: stats.likedByCurrentUser,
              isFavorited: stats.favoritedByCurrentUser,
              images: isVideo ? const [] : images,
              videoThumb: isVideo
                  ? 'https://picsum.photos/seed/follow_video_$index/800/450'
                  : null,
              ),
            );
          },
        );
      },
    );
  }

  Widget _buildContentCard({
    required BuildContext context,
    required String postId,
    required String title,
    required String content,
    required String author,
    required int likes,
    required int comments,
    required bool isLiked,
    required bool isFavorited,
    required List<String> images,
    String? videoThumb,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: AppTheme.spacingM),
      decoration: BoxDecoration(
        color: AppTheme.surfaceColor,
        borderRadius: BorderRadius.circular(AppTheme.borderRadiusMedium),
        boxShadow: AppTheme.subtleShadow,
      ),
      child: Padding(
        padding: const EdgeInsets.all(AppTheme.spacingM),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 18,
                  backgroundColor: AppTheme.primaryLightColor,
                  child: Icon(
                    Icons.pets,
                    color: AppTheme.primaryColor,
                    size: 18,
                  ),
                ),
                const SizedBox(width: AppTheme.spacingM),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        author,
                        style: const TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 15,
                        ),
                      ),
                      Text(
                        '刚刚',
                        style: TextStyle(color: Colors.grey[500], fontSize: 12),
                      ),
                    ],
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.more_horiz),
                  onPressed: () {
                    ScaffoldMessenger.of(
                      context,
                    ).showSnackBar(const SnackBar(content: Text('更多功能开发中...')));
                  },
                ),
              ],
            ),
            const SizedBox(height: AppTheme.spacingM),
            Text(
              title,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
            ),
            const SizedBox(height: AppTheme.spacingS),
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
                _FollowTagChip(label: '关注'),
                _FollowTagChip(label: '推荐'),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                _buildPillAction(
                  icon: isLiked ? Icons.favorite : Icons.favorite_border,
                  label: '$likes',
                  active: isLiked,
                  onTap: () async {
                    try {
                      await _feedService.toggleLike(postId);
                      if (mounted) setState(() {});
                    } catch (e) {
                      _showLoginTip(context, e.toString());
                    }
                  },
                ),
                const SizedBox(width: 24),
                _buildPillAction(
                  icon: isFavorited ? Icons.bookmark : Icons.bookmark_border,
                  label: isFavorited ? '已收藏' : '收藏',
                  active: isFavorited,
                  onTap: () async {
                    try {
                      await _feedService.toggleFavorite(postId);
                      if (mounted) setState(() {});
                    } catch (e) {
                      _showLoginTip(context, e.toString());
                    }
                  },
                ),
                const SizedBox(width: 24),
                _buildPillAction(
                  icon: Icons.comment_outlined,
                  label: '$comments',
                  active: false,
                  onTap: () {
                    _openCommentInput(context, postId);
                  },
                ),
                const SizedBox(width: 24),
                _buildPillAction(
                  icon: Icons.share_outlined,
                  label: '转发',
                  active: false,
                  onTap: () async {
                    await _feedService.incrementShare(postId);
                    if (!mounted) return;
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('已转发')));
                  },
                ),
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
          Text(label, style: TextStyle(color: color, fontSize: 14)),
        ],
      ),
    );
  }

  Widget _buildPillAction({
    required IconData icon,
    required String label,
    required bool active,
    required VoidCallback onTap,
  }) {
    final Color textColor = active ? Colors.white : AppTheme.textSecondaryColor;
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(24),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 180),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 7),
        decoration: BoxDecoration(
          gradient: active ? AppTheme.primaryGradient : null,
          color: active ? null : Colors.white,
          borderRadius: BorderRadius.circular(24),
          border: active ? null : Border.all(color: AppTheme.dividerColor),
          boxShadow: active
              ? [
                  BoxShadow(
                    color: AppTheme.primaryColor.withValues(alpha: 0.25),
                    blurRadius: 8,
                    offset: const Offset(0, 3),
                  ),
                ]
              : const [
                  BoxShadow(color: Colors.black12, blurRadius: 6, offset: Offset(0, 2)),
                ],
        ),
        child: Row(
          children: [
            Icon(icon, size: 18, color: textColor),
            const SizedBox(width: 6),
            Text(label, style: TextStyle(color: textColor, fontSize: 13, fontWeight: FontWeight.w600)),
          ],
        ),
      ),
    );
  }

  void _openCommentInput(BuildContext context, String postId) {
    final controller = TextEditingController();
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (context) {
        return Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom + 16,
            left: 16,
            right: 16,
            top: 16,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: controller,
                maxLines: 3,
                decoration: const InputDecoration(
                  hintText: '写下你的评论...',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () => Navigator.of(context).pop(),
                    child: const Text('取消'),
                  ),
                  const SizedBox(width: 8),
                  ElevatedButton(
                    onPressed: () async {
                      final text = controller.text.trim();
                      if (text.isEmpty) return;
                      try {
                        await FeedService().addComment(postId, text);
                        if (mounted) setState(() {});
                        if (context.mounted) Navigator.of(context).pop();
                        if (context.mounted) {
                          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('评论成功')));
                        }
                      } catch (e) {
                        if (context.mounted) _showLoginTip(context, e.toString());
                      }
                    },
                    child: const Text('发送'),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  void _showLoginTip(BuildContext context, String message) {
    if (UserAuthService().currentUser == null) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('请先登录后再进行操作')));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message)));
    }
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
              child: const Icon(
                Icons.play_arrow,
                color: Colors.white,
                size: 30,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildMediaGrid(List<String> images) {
    final int count = images.length.clamp(1, 9);
    final List<String> items = images.take(count).toList();
    int crossAxisCount = count == 1
        ? 1
        : count <= 4
        ? 2
        : 3;
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
}

class _FollowTagChip extends StatelessWidget {
  final String label;
  const _FollowTagChip({required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: AppTheme.primaryLightColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Text(
        label,
        style: const TextStyle(fontSize: 11, color: AppTheme.primaryColor),
      ),
    );
  }
}
