import 'package:flutter/material.dart';
import '../../app/theme/app_theme.dart';
import '../routes/app_router.dart';

class UserProfileArgs {
  final String userId;
  final String displayName;
  final String? avatarUrl;
  final String? bio;

  const UserProfileArgs({
    required this.userId,
    required this.displayName,
    this.avatarUrl,
    this.bio,
  });
}

class UserProfilePage extends StatelessWidget {
  final UserProfileArgs args;
  const UserProfilePage({super.key, required this.args});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          PopupMenuButton<String>(
            onSelected: (value) {
              if (value == 'report') {
                ScaffoldMessenger.of(
                  context,
                ).showSnackBar(const SnackBar(content: Text('已提交举报，我们会尽快审核')));
              } else if (value == 'share') {
                _showShareSheet(context);
              }
            },
            itemBuilder: (context) => const [
              PopupMenuItem<String>(value: 'share', child: Text('分享主页')),
              PopupMenuItem<String>(value: 'report', child: Text('举报')),
            ],
          ),
        ],
      ),
      backgroundColor: AppTheme.backgroundColor,
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 36,
                backgroundColor: AppTheme.primaryLightColor,
                backgroundImage: args.avatarUrl != null
                    ? NetworkImage(args.avatarUrl!)
                    : null,
                child: args.avatarUrl == null
                    ? const Icon(Icons.person, color: AppTheme.primaryColor)
                    : null,
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      args.displayName,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      args.bio ?? '这个人很低调，还没有填写简介～',
                      style: const TextStyle(
                        fontSize: 13,
                        color: AppTheme.textSecondaryColor,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox.shrink(),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              OutlinedButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.person_add_alt_1, size: 16),
                label: const Text('关注'),
              ),
              const SizedBox(width: 8),
              OutlinedButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.mail_outline, size: 16),
                label: const Text('私信'),
              ),
              const SizedBox(width: 8),
              // 举报入口隐藏到右上角菜单
            ],
          ),
          const SizedBox(height: 16),
          const Divider(height: 1, color: Color(0xFFE5E7EB)),
          const SizedBox(height: 12),
          const Text(
            'TA 的动态',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
          ),
          const SizedBox(height: 8),
          ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: 6,
            separatorBuilder: (_, __) => const SizedBox(height: 10),
            itemBuilder: (context, i) {
              final title = '记录第 ${i + 1} 天的散步日常';
              final content = '今天和小狗在公园玩耍，遇到了很多小伙伴，天气很好～';
              final images = [
                'https://images.dog.ceo/breeds/hound-ibizan/n02091244_1003.jpg',
                'https://images.dog.ceo/breeds/hound-ibizan/n02091244_1121.jpg',
              ];
              return Card(
                margin: EdgeInsets.zero,
                color: Colors.white,
                elevation: 1,
                shadowColor: Colors.black12,
                surfaceTintColor: Colors.transparent,
                clipBehavior: Clip.antiAlias,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                  side: const BorderSide(color: Color(0xFFE5E7EB), width: 0.5),
                ),
                child: InkWell(
                  onTap: () => Navigator.of(context).pushNamed(
                    AppRouter.contentDetailRoute,
                    arguments: ContentDetailArgs(
                      postId: 'user_${args.userId}_$i',
                      title: title,
                      content: content,
                      author: args.displayName,
                      images: images,
                      videoThumb: null,
                    ),
                  ),
                  borderRadius: BorderRadius.circular(12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(12),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            // 用户主页的动态卡片不重复展示用户信息
                          ],
                        ),
                      ),
                      // 移除头部分割线
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 12,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              title,
                              style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                color: Color(0xFF1F2937),
                              ),
                            ),
                            const SizedBox(height: 6),
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
                      ClipRRect(
                        borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(12),
                          bottomRight: Radius.circular(12),
                        ),
                        child: AspectRatio(
                          aspectRatio: 16 / 9,
                          child: Image.network(
                            images.first,
                            fit: BoxFit.cover,
                            errorBuilder: (_, __, ___) => Container(
                              color: const Color(0xFFF3F4F6),
                              alignment: Alignment.center,
                              child: const Icon(
                                Icons.broken_image,
                                color: Color(0xFF9CA3AF),
                              ),
                            ),
                            loadingBuilder: (ctx, child, progress) =>
                                progress == null
                                ? child
                                : const Center(
                                    child: CircularProgressIndicator(
                                      strokeWidth: 2,
                                    ),
                                  ),
                          ),
                        ),
                      ),
                      const Divider(
                        height: 1,
                        thickness: 0.5,
                        color: Color(0xFFE5E7EB),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(12),
                        child: Row(
                          children: [
                            const Spacer(),
                            IconButton(
                              icon: const Icon(
                                Icons.favorite_border,
                                size: 18,
                                color: Color(0xFF9CA3AF),
                              ),
                              onPressed: () {},
                            ),
                            const SizedBox(width: 8),
                            IconButton(
                              icon: const Icon(
                                Icons.chat_bubble_outline,
                                size: 18,
                                color: Color(0xFF9CA3AF),
                              ),
                              onPressed: () {},
                            ),
                            const SizedBox(width: 8),
                            IconButton(
                              icon: const Icon(
                                Icons.bookmark_border,
                                size: 18,
                                color: Color(0xFF9CA3AF),
                              ),
                              onPressed: () {},
                            ),
                            const SizedBox(width: 8),
                            IconButton(
                              icon: const Icon(
                                Icons.more_horiz,
                                size: 18,
                                color: Color(0xFF9CA3AF),
                              ),
                              onPressed: () =>
                                  _showProfileCardMoreActions(context),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

void _showShareSheet(BuildContext context) {
  showModalBottomSheet(
    context: context,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
    ),
    builder: (_) => SafeArea(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 8),
          const Text('分享至', style: TextStyle(fontWeight: FontWeight.w600)),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: const [
              _ShareIcon(label: '微信', icon: Icons.wechat),
              _ShareIcon(label: '朋友圈', icon: Icons.share),
              _ShareIcon(label: 'QQ', icon: Icons.message),
              _ShareIcon(label: '复制链接', icon: Icons.link),
            ],
          ),
          const SizedBox(height: 12),
        ],
      ),
    ),
  );
}

class _ShareIcon extends StatelessWidget {
  final String label;
  final IconData icon;
  const _ShareIcon({required this.label, required this.icon});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pop(context);
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('已选择“$label”')));
      },
      borderRadius: BorderRadius.circular(12),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            const CircleAvatar(
              radius: 20,
              backgroundColor: Color(0xFFF3F4F6),
              child: Icon(Icons.ios_share, color: Color(0xFF6B7280)),
            ),
            const SizedBox(height: 6),
            Text(
              label,
              style: const TextStyle(fontSize: 12, color: Color(0xFF6B7280)),
            ),
          ],
        ),
      ),
    );
  }
}

void _showProfileCardMoreActions(BuildContext context) {
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
