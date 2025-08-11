import 'package:flutter/material.dart';

class FollowTab extends StatelessWidget {
  const FollowTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: 8,
      itemBuilder: (context, index) {
        return _buildContentCard(
          context: context,
          title: '关注内容  ${index + 1}',
          content: '这是你关注的人发布的内容，保持关注获取最新动态...',
          author: '关注用户',
          likes: (index + 1) * 15,
          comments: (index + 1) * 5,
          isLiked: index % 3 == 0,
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
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('更多功能开发中...')),
                    );
                  },
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
            Row(
              children: [
                _buildActionButton(
                  icon: isLiked ? Icons.favorite : Icons.favorite_border,
                  label: '$likes',
                  color: isLiked ? Colors.red : Colors.grey,
                  onTap: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('点赞功能开发中...')),
                    );
                  },
                ),
                const SizedBox(width: 24),
                _buildActionButton(
                  icon: Icons.comment_outlined,
                  label: '$comments',
                  color: Colors.grey,
                  onTap: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('评论功能开发中...')),
                    );
                  },
                ),
                const SizedBox(width: 24),
                _buildActionButton(
                  icon: Icons.share_outlined,
                  label: '分享',
                  color: Colors.grey,
                  onTap: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('分享功能开发中...')),
                    );
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
}
