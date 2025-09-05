import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';
import '../../services/user_auth_service.dart';
import '../../core/components/optimized_image.dart';
import '../../services/dynamic_service.dart';
import '../../routes/app_router.dart';
import '../user_profile_page.dart';

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
  DynamicPostStats? _stats;
  List<DynamicComment> _comments = const [];
  bool _loading = true;
  bool _sendingComment = false;
  final TextEditingController _commentController = TextEditingController();

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
                child: OptimizedThumbnail(
                  imageUrl: images[i],
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.width * 9 / 16,
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

  @override
  void initState() {
    super.initState();
    _load();
  }

  Future<void> _load() async {
    final stats = await DynamicService().getPostStats(widget.postId);
    final comments = await DynamicService().getComments(widget.postId);
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
        actions: [
          IconButton(
            icon: const Icon(Icons.more_horiz),
            onPressed: _showMoreActions,
            tooltip: '更多',
          ),
        ],
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
      decoration: BoxDecoration(
        color: AppTheme.surfaceColor,
        borderRadius: BorderRadius.circular(AppTheme.borderRadiusMedium),
        boxShadow: AppTheme.subtleShadow,
      ),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                GestureDetector(
                  onTap: () => Navigator.of(context).pushNamed(
                    AppRouter.userProfileRoute,
                    arguments: UserProfileArgs(
                      userId: 'user_${widget.author}',
                      displayName: widget.author,
                    ),
                  ),
                  child: CircleAvatar(
                    radius: 20,
                    backgroundColor: AppTheme.primaryLightColor,
                    child: const Icon(Icons.pets, color: AppTheme.primaryColor),
                  ),
                ),
                const SizedBox(width: AppTheme.spacingM),
                GestureDetector(
                  onTap: () => Navigator.of(context).pushNamed(
                    AppRouter.userProfileRoute,
                    arguments: UserProfileArgs(
                      userId: 'user_${widget.author}',
                      displayName: widget.author,
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.author,
                        style: const TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 16,
                        ),
                      ),
                      Text(
                        '刚刚',
                        style: TextStyle(color: Colors.grey[500], fontSize: 12),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            const Divider(height: 1, thickness: 0.5, color: Color(0xFFE5E7EB)),
            const SizedBox(height: 12),
            Text(
              widget.title,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w800),
            ),
            const SizedBox(height: 8),
            Text(
              widget.content,
              style: const TextStyle(
                fontSize: 15,
                color: AppTheme.textSecondaryColor,
                height: 1.5,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMedia() {
    if (widget.videoThumb != null) {
      return Padding(
        padding: const EdgeInsets.fromLTRB(
          AppTheme.spacingM,
          0,
          AppTheme.spacingM,
          AppTheme.spacingM,
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: AspectRatio(
            aspectRatio: 16 / 9,
            child: Stack(
              fit: StackFit.expand,
              children: [
                OptimizedThumbnail(
                  imageUrl: widget.videoThumb!,
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.width * 9 / 16,
                ),

                Container(color: Colors.black.withValues(alpha: 0.2)),
                const Center(
                  child: CircleAvatar(
                    backgroundColor: Colors.white70,
                    radius: 28,
                    child: Icon(
                      Icons.play_arrow,
                      size: 32,
                      color: Colors.black87,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    }
    if (widget.images.isEmpty) return const SizedBox.shrink();
    final isSingle = widget.images.length == 1;
    return Padding(
      padding: const EdgeInsets.fromLTRB(
        AppTheme.spacingM,
        0,
        AppTheme.spacingM,
        AppTheme.spacingM,
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: isSingle
            ? GestureDetector(
                onTap: () => _openImagePreview(widget.images, 0),
                child: AspectRatio(
                  aspectRatio: 4 / 3,
                  child: OptimizedThumbnail(
                    imageUrl: widget.images.first,
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.width * 3 / 4,
                  ),
                ),
              )
            : GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: widget.images.length <= 4 ? 2 : 3,
                  crossAxisSpacing: 4,
                  mainAxisSpacing: 4,
                ),
                itemCount: widget.images.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () => _openImagePreview(widget.images, index),
                    child: Container(
                      color: Colors.grey[200],
                      child: OptimizedThumbnail(
                        imageUrl: widget.images[index],
                        width: 300,
                        height: 300,
                      ),
                    ),
                  );
                },
              ),
      ),
    );
  }

  Widget _buildActions() {
    final stats = _stats ?? const DynamicPostStats();
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: AppTheme.spacingM),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Row(
          children: [
            const Spacer(),
            _outlinedCountAction(
              isActive: stats.likedByCurrentUser,
              activeColor: Colors.red,
              activeIcon: Icons.favorite,
              inactiveIcon: Icons.favorite_border,
              count: stats.likes,
              onTap: () async {
                final s = await DynamicService().toggleLike(widget.postId);
                setState(() => _stats = s);
              },
            ),
            const SizedBox(width: 12),
            _outlinedLabelAction(
              isActive: stats.favoritedByCurrentUser,
              activeColor: AppTheme.primaryColor,
              activeIcon: Icons.bookmark,
              inactiveIcon: Icons.bookmark_border,
              activeLabel: '已收藏',
              inactiveLabel: '收藏',
              onTap: () async {
                final s = await DynamicService().toggleFavorite(widget.postId);
                setState(() => _stats = s);
              },
            ),
            const SizedBox(width: 12),
            _outlinedLabelAction(
              isActive: false,
              activeColor: AppTheme.textSecondaryColor,
              activeIcon: Icons.share,
              inactiveIcon: Icons.share_outlined,
              activeLabel: '转发',
              inactiveLabel: '转发',
              onTap: () async {
                final s = await DynamicService().incrementShare(widget.postId);
                setState(() => _stats = s);
                if (!mounted) return;
                ScaffoldMessenger.of(
                  context,
                ).showSnackBar(const SnackBar(content: Text('已转发')));
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCommentsSection() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: AppTheme.spacingM),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              '评论',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
            ),
            const SizedBox(height: 12),
            if (_comments.isEmpty)
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 24),
                child: Center(
                  child: Text(
                    '还没有评论，来说点什么吧～',
                    style: TextStyle(color: Colors.grey[500]),
                  ),
                ),
              )
            else
              ..._comments.asMap().entries.map((entry) {
                final i = entry.key;
                final c = entry.value;
                return Column(
                  children: [
                    _commentTile(c),
                    if (i != _comments.length - 1)
                      Container(
                        margin: const EdgeInsets.only(left: 48),
                        child: const Divider(
                          height: 1,
                          thickness: 0.5,
                          color: Color(0xFFE5E7EB),
                        ),
                      ),
                  ],
                );
              }).toList(),
          ],
        ),
      ),
    );
  }

  Widget _commentTile(DynamicComment c) {
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
                Text(
                  '用户 ${c.userId.substring(0, 6)}',
                  style: const TextStyle(fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: 6),
                Container(
                  decoration: BoxDecoration(
                    color: const Color(0xFFF9FAFB),
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: const Color(0xFFE5E7EB),
                      width: 0.5,
                    ),
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 8,
                  ),
                  child: _buildRichCommentContent(c.content),
                ),
                const SizedBox(height: 6),
                Row(
                  children: [
                    Text(
                      _timeAgo(c.createdAt),
                      style: TextStyle(color: Colors.grey[500], fontSize: 12),
                    ),
                    const Spacer(),
                    Icon(
                      Icons.thumb_up_alt_outlined,
                      size: 14,
                      color: Color(0xFF9CA3AF),
                    ),
                    const SizedBox(width: 8),
                    Icon(
                      Icons.reply_outlined,
                      size: 14,
                      color: Color(0xFF9CA3AF),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCommentBar() {
    return SafeArea(
      child: Container(
        padding: const EdgeInsets.fromLTRB(12, 8, 12, 8),
        decoration: const BoxDecoration(
          color: AppTheme.surfaceColor,
          border: Border(top: BorderSide(color: Color(0xFFECEFF1), width: 1)),
        ),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          decoration: BoxDecoration(
            color: const Color(0xFFF7F8FA),
            borderRadius: BorderRadius.circular(22),
            border: Border.all(color: const Color(0xFFE6E8EB), width: 1),
          ),
          child: Row(
            children: [
              Expanded(
                child: TextField(
                  controller: _commentController,
                  decoration: const InputDecoration(
                    hintText: '友善发言，理性讨论',
                    isDense: true,
                    border: InputBorder.none,
                  ),
                  enabled: !_sendingComment,
                  textInputAction: TextInputAction.send,
                  onSubmitted: (v) =>
                      _sendingComment ? null : _submitCommentFromInput(),
                ),
              ),
              const SizedBox(width: 6),
              InkWell(
                onTap: _sendingComment ? null : _showAttachSheet,
                borderRadius: BorderRadius.circular(16),
                child: Padding(
                  padding: const EdgeInsets.all(6),
                  child: Icon(
                    Icons.image_outlined,
                    size: 16,
                    color: const Color(0xFF9CA3AF),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _submitCommentFromInput() async {
    final text = _commentController.text.trim();
    if (text.isEmpty) return;
    setState(() => _sendingComment = true);
    try {
      // 使用真实接口创建顶级评论
      await DynamicService().createParentComment(
        postId: widget.postId,
        content: text,
      );
      _commentController.clear();
      await _load();
    } catch (e) {
      _loginTip(e.toString());
    } finally {
      if (mounted) setState(() => _sendingComment = false);
    }
  }

  void _loginTip(String message) {
    if (UserAuthService().currentUser == null) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('请先登录后再进行操作')));
    } else {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(message)));
    }
  }

  String _timeAgo(DateTime time) {
    final diff = DateTime.now().difference(time);
    if (diff.inMinutes < 1) return '刚刚';
    if (diff.inHours < 1) return '${diff.inMinutes} 分钟前';
    if (diff.inDays < 1) return '${diff.inHours} 小时前';
    return '${diff.inDays} 天前';
  }

  void _showMoreActions() {
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

  // --- Comments rich content helpers ---
  Widget _buildRichCommentContent(String content) {
    final parts = content.split(RegExp(r"\s+"));
    final widgets = <Widget>[];
    for (final part in parts) {
      if (_isImageUrl(part)) {
        widgets.add(
          Padding(
            padding: const EdgeInsets.only(bottom: 6),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.network(
                part,
                fit: BoxFit.cover,
                errorBuilder: (_, __, ___) => Container(
                  height: 120,
                  color: const Color(0xFFF3F4F6),
                  alignment: Alignment.center,
                  child: const Icon(
                    Icons.broken_image,
                    color: Color(0xFF9CA3AF),
                  ),
                ),
                loadingBuilder: (ctx, child, progress) => progress == null
                    ? child
                    : const SizedBox(
                        height: 120,
                        child: Center(
                          child: CircularProgressIndicator(strokeWidth: 2),
                        ),
                      ),
              ),
            ),
          ),
        );
      } else if (_isVideoUrl(part)) {
        widgets.add(
          Padding(
            padding: const EdgeInsets.only(bottom: 6),
            child: AspectRatio(
              aspectRatio: 16 / 9,
              child: Stack(
                fit: StackFit.expand,
                children: [
                  Container(color: const Color(0xFF111827)),
                  const Center(
                    child: CircleAvatar(
                      radius: 22,
                      backgroundColor: Colors.white70,
                      child: Icon(Icons.play_arrow, color: Colors.black87),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      } else {
        // Basic emoji support: no parsing needed, Flutter Text supports Unicode emojis
        widgets.add(Text(part + ' '));
      }
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: widgets,
    );
  }

  bool _isImageUrl(String s) {
    return s.startsWith('http') &&
        (s.endsWith('.jpg') ||
            s.endsWith('.jpeg') ||
            s.endsWith('.png') ||
            s.endsWith('.gif'));
  }

  bool _isVideoUrl(String s) {
    return s.startsWith('http') && (s.endsWith('.mp4') || s.endsWith('.mov'));
  }

  void _showAttachSheet() {
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
              leading: const Icon(Icons.image, color: Color(0xFF8B5CF6)),
              title: const Text('添加图片（粘贴图片链接）'),
              onTap: () {
                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('暂不支持本地选取，请直接粘贴图片链接到评论')),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.videocam, color: Color(0xFF10B981)),
              title: const Text('添加视频（粘贴视频链接）'),
              onTap: () {
                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('暂不支持本地选取，请直接粘贴视频链接到评论')),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _outlinedCountAction({
    required bool isActive,
    required Color activeColor,
    required IconData activeIcon,
    required IconData inactiveIcon,
    required int count,
    required VoidCallback onTap,
  }) {
    final Color borderColor = isActive ? activeColor : AppTheme.dividerColor;
    final Color iconColor = isActive
        ? activeColor
        : AppTheme.textSecondaryColor;
    // textColor not needed when using icon-only actions
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(22),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 160),
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
        decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(22),
          border: Border.all(color: borderColor, width: 1),
        ),
        child: Icon(
          isActive ? activeIcon : inactiveIcon,
          size: 18,
          color: iconColor,
        ),
      ),
    );
  }

  Widget _outlinedLabelAction({
    required bool isActive,
    required Color activeColor,
    required IconData activeIcon,
    required IconData inactiveIcon,
    required String activeLabel,
    required String inactiveLabel,
    required VoidCallback onTap,
  }) {
    final Color borderColor = isActive ? activeColor : AppTheme.dividerColor;
    final Color iconColor = isActive
        ? activeColor
        : AppTheme.textSecondaryColor;
    // textColor not needed when using icon-only actions
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(22),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 160),
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
        decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(22),
          border: Border.all(color: borderColor, width: 1),
        ),
        child: Icon(
          isActive ? activeIcon : inactiveIcon,
          size: 18,
          color: iconColor,
        ),
      ),
    );
  }
}
