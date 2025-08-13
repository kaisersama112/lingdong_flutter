import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';
import '../../services/feed_service.dart';
import '../../services/user_auth_service.dart';

class ContentDetailPage extends StatefulWidget {
  final String postId;
  final String title;
  final String content;
  final String author;
  final List<String> images;
  final String? videoThumb;

  const ContentDetailPage({
    super.key,
    required this.postId,
    required this.title,
    required this.content,
    required this.author,
    required this.images,
    this.videoThumb,
  });

  @override
  State<ContentDetailPage> createState() => _ContentDetailPageState();
}

class _ContentDetailPageState extends State<ContentDetailPage> {
  final FeedService _feedService = FeedService();
  PostStats? _stats;
  List<FeedComment> _comments = const [];
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    _load();
  }

  Future<void> _load() async {
    final stats = await _feedService.getPostStats(widget.postId);
    final comments = await _feedService.getComments(widget.postId);
    setState(() {
      _stats = stats;
      _comments = comments;
      _loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.backgroundColor,
      appBar: AppBar(
        title: const Text('内容详情'),
        centerTitle: true,
      ),
      body: _loading
          ? const Center(child: CircularProgressIndicator())
          : RefreshIndicator(
              onRefresh: _load,
              child: SingleChildScrollView(
                physics: const AlwaysScrollableScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    _buildHeader(),
                    _buildMedia(),
                    _buildActions(),
                    _buildCommentsSection(),
                    const SizedBox(height: 24),
                  ],
                ),
              ),
            ),
      bottomNavigationBar: _buildCommentBar(),
    );
  }

  Widget _buildHeader() {
    return Container(
      margin: const EdgeInsets.all(AppTheme.spacingM),
      decoration: AppTheme.cardDecoration,
      child: Padding(
        padding: const EdgeInsets.all(AppTheme.spacingL),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 20,
                  backgroundColor: AppTheme.primaryLightColor,
                  child: const Icon(Icons.pets, color: AppTheme.primaryColor),
                ),
                const SizedBox(width: AppTheme.spacingM),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(widget.author, style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 16)),
                    Text('刚刚', style: TextStyle(color: Colors.grey[500], fontSize: 12)),
                  ],
                ),
              ],
            ),
            const SizedBox(height: AppTheme.spacingL),
            Text(widget.title, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w800)),
            const SizedBox(height: AppTheme.spacingS),
            Text(
              widget.content,
              style: const TextStyle(fontSize: 15, color: AppTheme.textSecondaryColor, height: 1.5),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMedia() {
    if (widget.videoThumb != null) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: AppTheme.spacingM),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: AspectRatio(
            aspectRatio: 16 / 9,
            child: Stack(
              fit: StackFit.expand,
              children: [
                Image.network(widget.videoThumb!, fit: BoxFit.cover),
                Container(color: Colors.black.withValues(alpha: 0.2)),
                const Center(
                  child: CircleAvatar(
                    backgroundColor: Colors.white70,
                    radius: 28,
                    child: Icon(Icons.play_arrow, size: 32, color: Colors.black87),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    }
    if (widget.images.isEmpty) return const SizedBox.shrink();
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppTheme.spacingM),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: widget.images.length == 1 ? 1 : (widget.images.length <= 4 ? 2 : 3),
            crossAxisSpacing: 4,
            mainAxisSpacing: 4,
          ),
          itemCount: widget.images.length,
          itemBuilder: (context, index) {
            return Container(color: Colors.grey[200], child: Image.network(widget.images[index], fit: BoxFit.cover));
          },
        ),
      ),
    );
  }

  Widget _buildActions() {
    final stats = _stats ?? const PostStats(likes: 0, favorites: 0, comments: 0, shares: 0, likedByCurrentUser: false, favoritedByCurrentUser: false);
    return Container(
      margin: const EdgeInsets.all(AppTheme.spacingM),
      decoration: AppTheme.cardDecoration,
      child: Padding(
        padding: const EdgeInsets.all(AppTheme.spacingL),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _actionChip(
              icon: stats.likedByCurrentUser ? Icons.favorite : Icons.favorite_border,
              label: '${stats.likes}',
              color: stats.likedByCurrentUser ? Colors.red : AppTheme.textSecondaryColor,
              onTap: () async {
                try {
                  final s = await _feedService.toggleLike(widget.postId);
                  setState(() => _stats = s);
                } catch (e) {
                  _loginTip(e.toString());
                }
              },
            ),
            _actionChip(
              icon: stats.favoritedByCurrentUser ? Icons.bookmark : Icons.bookmark_border,
              label: stats.favoritedByCurrentUser ? '已收藏' : '收藏',
              color: stats.favoritedByCurrentUser ? AppTheme.primaryColor : AppTheme.textSecondaryColor,
              onTap: () async {
                try {
                  final s = await _feedService.toggleFavorite(widget.postId);
                  setState(() => _stats = s);
                } catch (e) {
                  _loginTip(e.toString());
                }
              },
            ),
            _actionChip(
              icon: Icons.share_outlined,
              label: '转发',
              color: AppTheme.textSecondaryColor,
              onTap: () async {
                final s = await _feedService.incrementShare(widget.postId);
                setState(() => _stats = s);
                if (!mounted) return;
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('已转发')));
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _actionChip({
    required IconData icon,
    required String label,
    required Color color,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(24),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(24),
          boxShadow: const [
            BoxShadow(color: Colors.black12, blurRadius: 6, offset: Offset(0, 2)),
          ],
        ),
        child: Row(
          children: [
            Icon(icon, size: 18, color: color),
            const SizedBox(width: 6),
            Text(label, style: TextStyle(color: color, fontSize: 14)),
          ],
        ),
      ),
    );
  }

  Widget _buildCommentsSection() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: AppTheme.spacingM),
      decoration: AppTheme.cardDecoration,
      child: Padding(
        padding: const EdgeInsets.all(AppTheme.spacingL),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('评论', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700)),
            const SizedBox(height: 12),
            if (_comments.isEmpty)
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 24),
                child: Center(
                  child: Text('还没有评论，来说点什么吧～', style: TextStyle(color: Colors.grey[500])),
                ),
              )
            else
              ..._comments.map((c) => _commentTile(c)).toList(),
          ],
        ),
      ),
    );
  }

  Widget _commentTile(FeedComment c) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CircleAvatar(radius: 16, child: Icon(Icons.person, size: 16)),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('用户 ${c.userId.substring(0, 6)}', style: const TextStyle(fontWeight: FontWeight.w600)),
                const SizedBox(height: 4),
                Text(c.content),
                const SizedBox(height: 4),
                Text(
                  _timeAgo(c.createdAt),
                  style: TextStyle(color: Colors.grey[500], fontSize: 12),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCommentBar() {
    final controller = TextEditingController();
    return SafeArea(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: const BoxDecoration(color: Colors.white, boxShadow: [BoxShadow(blurRadius: 6, color: Colors.black12)]),
        child: Row(
          children: [
            Expanded(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                decoration: BoxDecoration(
                  color: Colors.grey[100],
                  borderRadius: BorderRadius.circular(20),
                ),
                child: TextField(
                  controller: controller,
                  decoration: const InputDecoration(
                    hintText: '优质评论将会被更多人看到',
                    border: InputBorder.none,
                  ),
                ),
              ),
            ),
            const SizedBox(width: 8),
            ElevatedButton(
              onPressed: () async {
                final text = controller.text.trim();
                if (text.isEmpty) return;
                try {
                  await _feedService.addComment(widget.postId, text);
                  controller.clear();
                  await _load();
                } catch (e) {
                  _loginTip(e.toString());
                }
              },
              style: AppTheme.primaryButtonStyle,
              child: const Text('发送'),
            ),
          ],
        ),
      ),
    );
  }

  void _loginTip(String message) {
    if (UserAuthService().currentUser == null) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('请先登录后再进行操作')));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message)));
    }
  }

  String _timeAgo(DateTime time) {
    final diff = DateTime.now().difference(time);
    if (diff.inMinutes < 1) return '刚刚';
    if (diff.inHours < 1) return '${diff.inMinutes} 分钟前';
    if (diff.inDays < 1) return '${diff.inHours} 小时前';
    return '${diff.inDays} 天前';
  }
}


