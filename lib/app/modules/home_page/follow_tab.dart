import 'package:flutter/material.dart';
import '../../services/feed_service.dart';
import '../../routes/app_router.dart';
import '../user_profile_page.dart';

class FollowTab extends StatefulWidget {
  const FollowTab({Key? key}) : super(key: key);

  @override
  State<FollowTab> createState() => _FollowTabState();
}

class _FollowTabState extends State<FollowTab> {
  final FeedService _feedService = FeedService();
  // 本地交互状态
  final Map<String, bool> _liked = {};
  final Map<String, bool> _favorited = {};
  final Map<String, int> _likeCounts = {};
  final Map<String, int> _commentCounts = {};

  void _ensureStatsInitialized(String postId, PostStats stats) {
    _liked.putIfAbsent(postId, () => stats.likedByCurrentUser);
    _favorited.putIfAbsent(postId, () => stats.favoritedByCurrentUser);
    _likeCounts.putIfAbsent(postId, () => stats.likes);
    _commentCounts.putIfAbsent(postId, () => stats.comments);
  }

  void _toggleLike(String postId) {
    final bool current = _liked[postId] ?? false;
    final int count = _likeCounts[postId] ?? 0;
    setState(() {
      _liked[postId] = !current;
      _likeCounts[postId] = count + (current ? -1 : 1);
    });
  }

  void _toggleFavorite(String postId) {
    final bool current = _favorited[postId] ?? false;
    setState(() {
      _favorited[postId] = !current;
    });
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
                child: Image.network(images[i], fit: BoxFit.contain),
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

  void _showMoreActions(String postId) {
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
              leading: const Icon(Icons.block, color: Color(0xFF111827)),
              title: const Text('拉黑此用户'),
              onTap: () {
                Navigator.pop(context);
                ScaffoldMessenger.of(
                  context,
                ).showSnackBar(const SnackBar(content: Text('已拉黑该用户')));
              },
            ),
            ListTile(
              leading: const Icon(
                Icons.person_remove,
                color: Color(0xFF6B7280),
              ),
              title: const Text('取消关注'),
              onTap: () {
                Navigator.pop(context);
                ScaffoldMessenger.of(
                  context,
                ).showSnackBar(const SnackBar(content: Text('已取消关注')));
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

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
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
            final stats =
                snapshot.data ??
                const PostStats(
                  likes: 0,
                  favorites: 0,
                  comments: 0,
                  shares: 0,
                  likedByCurrentUser: false,
                  favoritedByCurrentUser: false,
                );
            _ensureStatsInitialized(postId, stats);
            return GestureDetector(
              onTap: () {
                Navigator.of(context).pushNamed(
                  AppRouter.contentDetailRoute,
                  arguments: ContentDetailArgs(
                    postId: postId,
                    title: '分享一个超可爱的宠物日常',
                    content: '分享一个超可爱的宠物日常，今天带我家小狗狗去公园玩，它特别开心！',
                    author: '宠物达人',
                    images: const [
                      'https://images.dog.ceo/breeds/hound-ibizan/n02091244_1003.jpg',
                      'https://images.dog.ceo/breeds/hound-ibizan/n02091244_1121.jpg',
                      'https://images.dog.ceo/breeds/terrier-yorkshire/n02094433_1211.jpg',
                    ],
                    videoThumb: null,
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
                index: index,
              ),
            );
          },
        );
      },
    );
  }

  // 纯图标布局已统一，不再需要 _buildActionButton

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
    required int index,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFFE5E7EB), width: 0.5),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.04),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
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
                    arguments: const UserProfileArgs(
                      userId: 'user_follow',
                      displayName: '关注用户',
                      avatarUrl: null,
                      bio: '爱狗人士，记录与毛孩子的点滴',
                    ),
                  ),
                  child: CircleAvatar(
                    radius: 18,
                    backgroundColor: const Color(
                      0xFF8B5CF6,
                    ).withValues(alpha: 0.1),
                    child: const Text('🐕', style: TextStyle(fontSize: 18)),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        author,
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF1F2937),
                        ),
                      ),
                      Text(
                        '${(index % 3) + 1}小时前',
                        style: const TextStyle(
                          fontSize: 11,
                          color: Color(0xFF9CA3AF),
                        ),
                      ),
                    ],
                  ),
                ),
                IconButton(
                  icon: const Icon(
                    Icons.more_horiz,
                    size: 18,
                    color: Color(0xFF9CA3AF),
                  ),
                  onPressed: () => _showMoreActions(postId),
                ),
              ],
            ),
          ),

          const Divider(height: 1, thickness: 0.5, color: Color(0xFFE5E7EB)),

          // 正文
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF1F2937),
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  content,
                  style: const TextStyle(
                    fontSize: 13,
                    color: Color(0xFF374151),
                    height: 1.4,
                  ),
                ),
              ],
            ),
          ),

          // 媒体
          if (images.isNotEmpty || videoThumb != null) ...[
            const Divider(height: 1, thickness: 0.5, color: Color(0xFFE5E7EB)),
            const SizedBox(height: 12),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Builder(
                builder: (_) {
                  if (videoThumb != null) {
                    return ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          AspectRatio(
                            aspectRatio: 16 / 9,
                            child: Image.network(
                              videoThumb,
                              width: double.infinity,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: Colors.black.withValues(alpha: 0.45),
                              shape: BoxShape.circle,
                            ),
                            child: const Icon(
                              Icons.play_arrow,
                              color: Colors.white,
                              size: 28,
                            ),
                          ),
                        ],
                      ),
                    );
                  }
                  if (images.length > 1) {
                    return _buildMediaGrid(images);
                  }
                  return GestureDetector(
                    onTap: () => _openImagePreview(images, 0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: AspectRatio(
                        aspectRatio: 16 / 9,
                        child: Image.network(
                          images.first,
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],

          // 操作区（纯图标，右对齐）
          const Divider(height: 1, thickness: 0.5, color: Color(0xFFE5E7EB)),
          Padding(
            padding: const EdgeInsets.all(12),
            child: Row(
              children: [
                const Spacer(),
                IconButton(
                  icon: Icon(
                    (_liked[postId] ?? isLiked)
                        ? Icons.favorite
                        : Icons.favorite_border,
                    size: 18,
                    color: (_liked[postId] ?? isLiked)
                        ? Colors.red
                        : const Color(0xFF9CA3AF),
                  ),
                  onPressed: () => _toggleLike(postId),
                ),
                const SizedBox(width: 8),
                const IconButton(
                  onPressed: null,
                  icon: Icon(
                    Icons.chat_bubble_outline,
                    size: 18,
                    color: Color(0xFF9CA3AF),
                  ),
                ),
                const SizedBox(width: 8),
                IconButton(
                  icon: Icon(
                    (_favorited[postId] ?? isFavorited)
                        ? Icons.bookmark
                        : Icons.bookmark_border,
                    size: 18,
                    color: (_favorited[postId] ?? isFavorited)
                        ? const Color(0xFF8B5CF6)
                        : const Color(0xFF9CA3AF),
                  ),
                  onPressed: () => _toggleFavorite(postId),
                ),
                const SizedBox(width: 8),
                IconButton(
                  icon: const Icon(
                    Icons.more_horiz,
                    size: 18,
                    color: Color(0xFF9CA3AF),
                  ),
                  onPressed: () => _showMoreActions(postId),
                ),
              ],
            ),
          ),
        ],
      ),
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
          return GestureDetector(
            onTap: () => _openImagePreview(images, index),
            child: Container(
              color: Colors.grey[200],
              child: Image.network(
                img,
                fit: BoxFit.cover,
                cacheWidth: 300,
                cacheHeight: 300,
              ),
            ),
          );
        },
      ),
    );
  }
}
