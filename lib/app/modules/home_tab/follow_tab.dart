import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';

class FollowTab extends StatelessWidget {
  const FollowTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: 8,
      itemBuilder: (context, index) {
        final List<String> images = List.generate(
          (index % 9) + 1,
          (i) => 'https://picsum.photos/seed/follow_${index}_$i/400/400',
        );
        final bool isVideo = index % 3 == 0;
        return _buildContentCard(
          context: context,
          title: '关注内容  ${index + 1}',
          content: '这是你关注的人发布的内容，保持关注获取最新动态...',
          author: '关注用户',
          likes: (index + 1) * 15,
          comments: (index + 1) * 5,
          isLiked: index % 3 == 0,
          images: isVideo ? const [] : images,
          videoThumb: isVideo
              ? 'https://picsum.photos/seed/follow_video_$index/800/450'
              : null,
        );
      },
    );
  }

  Widget _buildContentCard({
    required BuildContext context,
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
                  child: Icon(
                    Icons.pets,
                    color: AppTheme.primaryColor,
                    size: 18,
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
            const SizedBox(height: 12),
            Text(
              title,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
            ),
            const SizedBox(height: 8),
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
                _buildActionButton(
                  icon: isLiked ? Icons.favorite : Icons.favorite_border,
                  label: '$likes',
                  color: isLiked ? Colors.red : AppTheme.textSecondaryColor,
                  onTap: () {
                    ScaffoldMessenger.of(
                      context,
                    ).showSnackBar(const SnackBar(content: Text('点赞功能开发中...')));
                  },
                ),
                const SizedBox(width: 24),
                _buildActionButton(
                  icon: Icons.comment_outlined,
                  label: '$comments',
                  color: AppTheme.textSecondaryColor,
                  onTap: () {
                    ScaffoldMessenger.of(
                      context,
                    ).showSnackBar(const SnackBar(content: Text('评论功能开发中...')));
                  },
                ),
                const SizedBox(width: 24),
                _buildActionButton(
                  icon: Icons.share_outlined,
                  label: '分享',
                  color: AppTheme.textSecondaryColor,
                  onTap: () {
                    ScaffoldMessenger.of(
                      context,
                    ).showSnackBar(const SnackBar(content: Text('分享功能开发中...')));
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
        style: const TextStyle(fontSize: 11, color: AppTheme.primaryDarkColor),
      ),
    );
  }
}
