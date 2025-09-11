import 'package:flutter/material.dart';
import '../../app/theme/app_theme.dart';
import '../routes/app_router.dart';
import '../services/dynamic_service.dart';

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

class UserProfilePage extends StatefulWidget {
  final UserProfileArgs args;
  const UserProfilePage({super.key, required this.args});

  @override
  State<UserProfilePage> createState() => _UserProfilePageState();
}

class _UserProfilePageState extends State<UserProfilePage> {
  bool _loading = true;
  String? _displayName;
  String? _avatar;
  String? _bio;
  List<DynamicPost> _posts = const [];
  int _page = 0;
  final int _limit = 10;
  bool _hasMore = true;
  bool _loadingMore = false;

  @override
  void initState() {
    super.initState();
    _loadInitial();
  }

  Future<void> _loadInitial() async {
    setState(() => _loading = true);
    try {
      final info = await DynamicService().getOtherUserInfo(widget.args.userId);
      final posts = await DynamicService().getUserPosts(
        userId: widget.args.userId,
        page: 0,
        limit: _limit,
      );
      if (!mounted) return;
      setState(() {
        _displayName = info?.username ?? widget.args.displayName;
        _avatar = info?.avatar ?? widget.args.avatarUrl;
        _bio = widget.args.bio;
        _posts = posts;
        _page = 1;
        _hasMore = posts.length == _limit;
        _loading = false;
      });
    } catch (_) {
      if (!mounted) return;
      setState(() => _loading = false);
    }
  }

  Future<void> _loadMore() async {
    if (_loadingMore || !_hasMore) return;
    setState(() => _loadingMore = true);
    try {
      final more = await DynamicService().getUserPosts(
        userId: widget.args.userId,
        page: _page,
        limit: _limit,
      );
      if (!mounted) return;
      setState(() {
        _posts = [..._posts, ...more];
        _page += 1;
        _hasMore = more.length == _limit;
      });
    } finally {
      if (mounted) setState(() => _loadingMore = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final args = widget.args;
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
      body: _loading
          ? const Center(child: CircularProgressIndicator(strokeWidth: 2))
          : RefreshIndicator(
              onRefresh: _loadInitial,
              child: ListView(
                padding: const EdgeInsets.all(16),
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 36,
                        backgroundColor: AppTheme.primaryLightColor,
                        backgroundImage: (_avatar ?? args.avatarUrl) != null
                            ? NetworkImage((_avatar ?? args.avatarUrl)!)
                            : null,
                        child: (_avatar ?? args.avatarUrl) == null
                            ? const Icon(
                                Icons.person,
                                color: AppTheme.primaryColor,
                              )
                            : null,
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              _displayName ?? args.displayName,
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            const SizedBox(height: 6),
                            Text(
                              _bio ?? args.bio ?? '这个人很低调，还没有填写简介～',
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
                  const SizedBox(height: 16),
                  const Divider(height: 1, color: Color(0xFFE5E7EB)),
                  const SizedBox(height: 12),
                  const Text(
                    'TA 的动态',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                  ),
                  const SizedBox(height: 8),
                  if (_posts.isEmpty)
                    Container(
                      padding: const EdgeInsets.symmetric(vertical: 40),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: const Color(0xFFE5E7EB),
                          width: 0.5,
                        ),
                      ),
                      child: const Center(
                        child: Text(
                          '暂无动态',
                          style: TextStyle(color: Color(0xFF9CA3AF)),
                        ),
                      ),
                    )
                  else
                    ListView.separated(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: _posts.length,
                      separatorBuilder: (_, __) => const SizedBox(height: 10),
                      itemBuilder: (context, i) {
                        final p = _posts[i];
                        return Card(
                          margin: EdgeInsets.zero,
                          color: Colors.white,
                          elevation: 1,
                          shadowColor: Colors.black12,
                          surfaceTintColor: Colors.transparent,
                          clipBehavior: Clip.antiAlias,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                            side: const BorderSide(
                              color: Color(0xFFE5E7EB),
                              width: 0.5,
                            ),
                          ),
                          child: InkWell(
                            onTap: () => Navigator.of(context).pushNamed(
                              AppRouter.contentDetailRoute,
                              arguments: ContentDetailArgs(
                                postId: p.id,
                                title: p.title,
                                content: p.content,
                                author: _displayName ?? args.displayName,
                                images: p.images,
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: const [
                                      // 用户主页的动态卡片不重复展示用户信息
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 12,
                                    vertical: 12,
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        p.title,
                                        style: const TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600,
                                          color: Color(0xFF1F2937),
                                        ),
                                      ),
                                      const SizedBox(height: 6),
                                      Text(
                                        p.content,
                                        style: const TextStyle(
                                          fontSize: 13,
                                          color: Color(0xFF374151),
                                          height: 1.4,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                if (p.images.isNotEmpty)
                                  ClipRRect(
                                    borderRadius: const BorderRadius.only(
                                      bottomLeft: Radius.circular(12),
                                      bottomRight: Radius.circular(12),
                                    ),
                                    child: AspectRatio(
                                      aspectRatio: 16 / 9,
                                      child: Image.network(
                                        p.images.first,
                                        fit: BoxFit.cover,
                                        errorBuilder: (_, __, ___) => Container(
                                          color: const Color(0xFFF3F4F6),
                                          alignment: Alignment.center,
                                          child: const Icon(
                                            Icons.broken_image,
                                            color: Color(0xFF9CA3AF),
                                          ),
                                        ),
                                        loadingBuilder:
                                            (
                                              ctx,
                                              child,
                                              progress,
                                            ) => progress == null
                                            ? child
                                            : const Center(
                                                child:
                                                    CircularProgressIndicator(
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
                                      _metricActive(
                                        active: p.likedByCurrentUser,
                                        activeIcon: Icons.favorite_rounded,
                                        inactiveIcon:
                                            Icons.favorite_border_rounded,
                                        activeColor: Color(0xFFFF6B6B),
                                        value: p.likes,
                                      ),
                                      const SizedBox(width: 12),
                                      _metric(
                                        icon: Icons.chat_bubble_outline,
                                        value: p.comments,
                                      ),
                                      const SizedBox(width: 12),
                                      _metricActive(
                                        active: p.favoritedByCurrentUser,
                                        activeIcon: Icons.bookmark_rounded,
                                        inactiveIcon:
                                            Icons.bookmark_border_rounded,
                                        activeColor: Color(0xFFF59E0B),
                                        value: p.favorites,
                                      ),
                                      const SizedBox(width: 8),
                                      IconButton(
                                        icon: const Icon(
                                          Icons.more_horiz,
                                          size: 18,
                                          color: Color(0xFF9CA3AF),
                                        ),
                                        onPressed: () =>
                                            _showProfileCardMoreActions(
                                              context,
                                            ),
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
                  if (_hasMore)
                    Padding(
                      padding: const EdgeInsets.only(top: 8),
                      child: Center(
                        child: TextButton(
                          onPressed: _loadingMore ? null : _loadMore,
                          child: Text(_loadingMore ? '加载中...' : '加载更多'),
                        ),
                      ),
                    ),
                ],
              ),
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

Widget _metric({required IconData icon, required int value}) {
  return Row(
    mainAxisSize: MainAxisSize.min,
    children: [
      Icon(icon, size: 18, color: const Color(0xFF9CA3AF)),
      const SizedBox(width: 4),
      Text(
        value > 999 ? '${(value / 1000).toStringAsFixed(1)}k' : '$value',
        style: const TextStyle(
          fontSize: 12,
          color: Color(0xFF9CA3AF),
          fontWeight: FontWeight.w600,
        ),
      ),
    ],
  );
}

Widget _metricActive({
  required bool active,
  required IconData activeIcon,
  required IconData inactiveIcon,
  required Color activeColor,
  required int value,
}) {
  final Color color = active ? activeColor : const Color(0xFF9CA3AF);
  return Row(
    mainAxisSize: MainAxisSize.min,
    children: [
      Icon(active ? activeIcon : inactiveIcon, size: 18, color: color),
      const SizedBox(width: 4),
      Text(
        value > 999 ? '${(value / 1000).toStringAsFixed(1)}k' : '$value',
        style: TextStyle(
          fontSize: 12,
          color: color,
          fontWeight: FontWeight.w600,
        ),
      ),
    ],
  );
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
