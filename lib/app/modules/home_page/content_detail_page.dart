import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:dio/dio.dart' show MultipartFile;
import 'package:lingdong_server/lingdong_server.dart' as server;
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

class _ContentDetailPageState extends State<ContentDetailPage>
    with TickerProviderStateMixin {
  DynamicPostStats? _stats;
  List<DynamicComment> _comments = const [];
  Map<String, List<DynamicReply>> _commentReplies = {};
  Map<String, bool> _showReplies = {};
  final Map<String, int> _replySkips = {};
  final Map<String, bool> _replyHasMore = {};
  final Map<String, bool> _replyLoadingMore = {};
  static const int _replyPageSize = 10;
  // 用户头像缓存
  final Map<String, String?> _userAvatars = {};
  // 顶级评论分页
  int _commentSkip = 0;
  static const int _commentPageSize = 10;
  bool _commentHasMore = true;
  bool _commentLoadingMore = false;
  bool _loading = true;
  bool _sendingComment = false;
  bool _sendingReply = false;
  final TextEditingController _commentController = TextEditingController();
  final TextEditingController _replyController = TextEditingController();
  final GlobalKey _commentsKey = GlobalKey();
  final FocusNode _commentFocusNode = FocusNode();
  bool _showEmojiPanel = false;
  late AnimationController _fadeController;
  late AnimationController _scaleController;
  late Animation<double> _fadeAnimation;
  late Animation<double> _scaleAnimation;

  void _onCommentTextChanged() {
    if (!mounted) return;
    setState(() {});
  }

  void _toggleEmojiPanel() {
    setState(() {
      _showEmojiPanel = !_showEmojiPanel;
      if (_showEmojiPanel) {
        // Keep keyboard open for mobile typing while showing a compact emoji grid
        _commentFocusNode.requestFocus();
      }
    });
  }

  void _insertAtCursor(String text) {
    final selection = _commentController.selection;
    final fullText = _commentController.text;
    if (!selection.isValid) {
      _commentController.text = fullText + text;
      _commentController.selection = TextSelection.fromPosition(
        TextPosition(offset: _commentController.text.length),
      );
      return;
    }
    final newText = fullText.replaceRange(selection.start, selection.end, text);
    final newOffset = selection.start + text.length;
    _commentController.text = newText;
    _commentController.selection = TextSelection.collapsed(offset: newOffset);
  }

  Future<void> _pickImageAndUpload() async {
    try {
      final ImagePicker picker = ImagePicker();
      final XFile? file = await picker.pickImage(
        source: ImageSource.gallery,
        imageQuality: 90,
      );
      if (file == null) return;

      // Upload via server MediaApi
      final mediaApi = server.LingdongServer().getMediaApi();
      final bytes = await file.readAsBytes();
      final multipart = MultipartFile.fromBytes(bytes, filename: file.name);
      final relatedId = int.tryParse(widget.postId) ?? 0;
      final resp = await mediaApi.uploadMediaApiMediaUploadMediaPost(
        relatedType: server.RelatedTypeEnum.number2, // assume post related
        relatedId: relatedId,
        file: multipart,
        mediaType: server.MediaType.number0, // image
      );
      final url = resp.data?.data?.url;
      if (url == null || url.isEmpty) {
        if (!mounted) return;
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(const SnackBar(content: Text('上传失败，未返回URL')));
        return;
      }
      _insertAtCursor('$url ');
      if (!mounted) return;
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('图片已插入')));
    } catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('选择/上传失败: $e')));
    }
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
    _fadeController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    _scaleController = AnimationController(
      duration: const Duration(milliseconds: 200),
      vsync: this,
    );
    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _fadeController, curve: Curves.easeInOut),
    );
    _scaleAnimation = Tween<double>(begin: 0.8, end: 1.0).animate(
      CurvedAnimation(parent: _scaleController, curve: Curves.easeOutBack),
    );
    _commentController.addListener(_onCommentTextChanged);
    _commentFocusNode.addListener(() {
      if (!mounted) return;
      // When focusing the field, keep emoji panel state but rebuild to adjust layout
      setState(() {});
    });
    _load();
  }

  Future<String?> _getUserAvatar(String authorId) async {
    if (_userAvatars.containsKey(authorId)) {
      return _userAvatars[authorId];
    }

    try {
      final userInfo = await DynamicService().getOtherUserInfo(authorId);
      final avatar = userInfo?.avatar;
      _userAvatars[authorId] = avatar;
      return avatar;
    } catch (e) {
      debugPrint('获取用户头像失败: $e');
      _userAvatars[authorId] = null;
      return null;
    }
  }

  @override
  void dispose() {
    _commentController.removeListener(_onCommentTextChanged);
    _commentController.dispose();
    _replyController.dispose();
    _commentFocusNode.dispose();
    _fadeController.dispose();
    _scaleController.dispose();
    super.dispose();
  }

  Future<void> _load() async {
    try {
      final stats = await DynamicService().getPostStats(widget.postId);
      final comments = await DynamicService().getComments(
        widget.postId,
        skip: 0,
        limit: _commentPageSize,
      );
      if (mounted) {
        setState(() {
          _stats = stats;
          _comments = comments;
          _commentSkip = comments.length;
          _commentHasMore = comments.length == _commentPageSize;
          _loading = false;
        });
        _fadeController.forward();
        _scaleController.forward();
      }
    } catch (e) {
      if (mounted) {
        setState(() {
          _loading = false;
        });
        _loginTip('加载失败: $e');
      }
    }
  }

  Future<void> _loadCommentReplies(
    String commentId, {
    bool append = false,
  }) async {
    try {
      final int currentSkip = append ? (_replySkips[commentId] ?? 0) : 0;
      final replies = await DynamicService().getCommentReplies(
        commentId,
        skip: currentSkip,
        limit: _replyPageSize,
      );
      if (!mounted) return;
      setState(() {
        final existing = _commentReplies[commentId] ?? <DynamicReply>[];
        _commentReplies[commentId] = append ? (existing + replies) : replies;
        _replySkips[commentId] = currentSkip + replies.length;
        _replyHasMore[commentId] = replies.length == _replyPageSize;
      });
    } catch (e) {
      debugPrint('加载评论回复失败: $e');
      if (mounted) {
        setState(() {
          _replyHasMore[commentId] = false;
          _replyLoadingMore[commentId] = false;
        });
      }
    }
  }

  Future<void> _loadMoreReplies(String commentId) async {
    if (_replyLoadingMore[commentId] == true) return;
    setState(() => _replyLoadingMore[commentId] = true);
    await _loadCommentReplies(commentId, append: true);
    if (!mounted) return;
    setState(() => _replyLoadingMore[commentId] = false);
  }

  Future<void> _toggleReplies(String commentId) async {
    if (!_showReplies.containsKey(commentId) || !_showReplies[commentId]!) {
      await _loadCommentReplies(commentId, append: false);
    }

    setState(() {
      _showReplies[commentId] = !(_showReplies[commentId] ?? false);
    });
  }

  Future<void> _sendReply(
    String commentId,
    String username, {
    String? replyToReplyId,
  }) async {
    final content = _replyController.text.trim();
    if (content.isEmpty) return;

    setState(() {
      _sendingReply = true;
    });

    try {
      await DynamicService().createReply(
        parentCommentId: commentId,
        content: content,
        replyToReplyId: replyToReplyId, // 如果是对回复的回复，传递回复ID
      );

      _replyController.clear();
      await _loadCommentReplies(commentId); // 重新加载回复

      if (mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(const SnackBar(content: Text('回复成功')));
      }
    } catch (e) {
      if (mounted) {
        _loginTip('回复失败: $e');
      }
    } finally {
      if (mounted) {
        setState(() {
          _sendingReply = false;
        });
      }
    }
  }

  void _showReplyDialog(
    String commentId,
    String username, {
    String? replyToReplyId,
    String? replyToUsername,
  }) {
    _replyController.clear();
    final isReplyToReply = replyToReplyId != null && replyToUsername != null;
    final dialogTitle = isReplyToReply ? '回复 $replyToUsername' : '回复 $username';
    final hintText = isReplyToReply ? '回复 $replyToUsername...' : '写下你的回复...';

    showDialog(
      context: context,
      builder: (context) => Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
        child: Container(
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(24),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 标题
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: const Color(0xFF3B82F6).withOpacity(0.1),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Icon(
                      Icons.chat_bubble_outline_rounded,
                      size: 20,
                      color: const Color(0xFF3B82F6),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      dialogTitle,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        color: Color(0xFF1A1A1A),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () => Navigator.of(context).pop(),
                    borderRadius: BorderRadius.circular(20),
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: const Color(0xFFF8F9FA),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Icon(
                        Icons.close_rounded,
                        size: 18,
                        color: const Color(0xFF6B7280),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              // 回复上下文
              if (isReplyToReply) ...[
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: const Color(0xFFF8F9FA),
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(
                      color: const Color(0xFFE5E7EB),
                      width: 1,
                    ),
                  ),
                  child: Row(
                    children: [
                      Icon(
                        Icons.reply_rounded,
                        size: 16,
                        color: const Color(0xFF3B82F6),
                      ),
                      const SizedBox(width: 8),
                      Text(
                        '回复 $replyToUsername',
                        style: const TextStyle(
                          fontSize: 14,
                          color: Color(0xFF374151),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
              ],
              // 输入框
              Container(
                decoration: BoxDecoration(
                  color: const Color(0xFFF8F9FA),
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: const Color(0xFFE5E7EB), width: 1),
                ),
                child: TextField(
                  controller: _replyController,
                  maxLines: 4,
                  decoration: InputDecoration(
                    hintText: hintText,
                    hintStyle: const TextStyle(
                      color: Color(0xFF9CA3AF),
                      fontSize: 15,
                    ),
                    border: InputBorder.none,
                    contentPadding: const EdgeInsets.all(16),
                  ),
                  style: const TextStyle(
                    fontSize: 15,
                    color: Color(0xFF374151),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              // 操作按钮
              Row(
                children: [
                  Expanded(
                    child: InkWell(
                      onTap: () => Navigator.of(context).pop(),
                      borderRadius: BorderRadius.circular(16),
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        decoration: BoxDecoration(
                          color: const Color(0xFFF8F9FA),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: const Center(
                          child: Text(
                            '取消',
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                              color: Color(0xFF6B7280),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: InkWell(
                      onTap: _sendingReply
                          ? null
                          : () async {
                              Navigator.of(context).pop();
                              await _sendReply(
                                commentId,
                                username,
                                replyToReplyId: replyToReplyId,
                              );
                            },
                      borderRadius: BorderRadius.circular(16),
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        decoration: BoxDecoration(
                          color: _sendingReply
                              ? const Color(0xFF9CA3AF)
                              : const Color(0xFF3B82F6),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: _sendingReply
                            ? const Center(
                                child: SizedBox(
                                  width: 20,
                                  height: 20,
                                  child: CircularProgressIndicator(
                                    strokeWidth: 2,
                                    valueColor: AlwaysStoppedAnimation<Color>(
                                      Colors.white,
                                    ),
                                  ),
                                ),
                              )
                            : const Center(
                                child: Text(
                                  '发送',
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _likeComment(String commentId) async {
    try {
      await DynamicService().toggleCommentLike(
        commentId,
        targetType: 'comment',
      );

      // 更新本地状态
      setState(() {
        final commentIndex = _comments.indexWhere((c) => c.id == commentId);
        if (commentIndex != -1) {
          final comment = _comments[commentIndex];
          _comments[commentIndex] = DynamicComment(
            id: comment.id,
            userId: comment.userId,
            username: comment.username,
            userAvatar: comment.userAvatar,
            content: comment.content,
            createdAt: comment.createdAt,
            likeCount: comment.isLiked
                ? comment.likeCount - 1
                : comment.likeCount + 1,
            isLiked: !comment.isLiked,
            images: comment.images,
          );
        }
      });

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              _comments.firstWhere((c) => c.id == commentId).isLiked
                  ? '已点赞'
                  : '已取消点赞',
            ),
            duration: const Duration(seconds: 1),
          ),
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('点赞失败: $e')));
      }
    }
  }

  Future<void> _likeReply(String replyId) async {
    try {
      await DynamicService().toggleCommentLike(replyId, targetType: 'reply');

      // 更新本地状态
      setState(() {
        for (final commentId in _commentReplies.keys) {
          final replies = _commentReplies[commentId]!;
          final replyIndex = replies.indexWhere((r) => r.id == replyId);
          if (replyIndex != -1) {
            final reply = replies[replyIndex];
            replies[replyIndex] = DynamicReply(
              id: reply.id,
              userId: reply.userId,
              username: reply.username,
              userAvatar: reply.userAvatar,
              content: reply.content,
              createdAt: reply.createdAt,
              likeCount: reply.isLiked
                  ? reply.likeCount - 1
                  : reply.likeCount + 1,
              isLiked: !reply.isLiked,
              images: reply.images,
              replyToUserId: reply.replyToUserId,
              replyToUsername: reply.replyToUsername,
              parentCommentId: reply.parentCommentId,
            );
            break;
          }
        }
      });

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('点赞成功'), duration: Duration(seconds: 1)),
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('点赞失败: $e')));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFAFAFA),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        foregroundColor: const Color(0xFF1A1A1A),
        title: const Text(
          '内容详情',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w700,
            color: Color(0xFF1A1A1A),
          ),
        ),
        centerTitle: true,
        actions: [
          Container(
            margin: const EdgeInsets.only(right: 8),
            decoration: BoxDecoration(
              color: const Color(0xFFF8F9FA),
              borderRadius: BorderRadius.circular(12),
            ),
            child: IconButton(
              icon: const Icon(
                Icons.more_horiz_rounded,
                color: Color(0xFF6B7280),
              ),
              onPressed: _showMoreActions,
              tooltip: '更多',
            ),
          ),
        ],
      ),
      body: _loading
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const CircularProgressIndicator(
                    strokeWidth: 3,
                    valueColor: AlwaysStoppedAnimation<Color>(
                      Color(0xFF3B82F6),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    '加载中...',
                    style: TextStyle(
                      color: Colors.grey[600],
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            )
          : RefreshIndicator(
              onRefresh: _load,
              color: const Color(0xFF3B82F6),
              backgroundColor: Colors.white,
              child: FadeTransition(
                opacity: _fadeAnimation,
                child: ScaleTransition(
                  scale: _scaleAnimation,
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
              ),
            ),
      bottomNavigationBar: _buildCommentBar(),
    );
  }

  Widget _buildHeader() {
    return Container(
      margin: const EdgeInsets.fromLTRB(16, 12, 16, 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 20,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 用户信息区域
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
                  child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: AppTheme.primaryColor.withOpacity(0.2),
                          blurRadius: 8,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: FutureBuilder<String?>(
                      future: _getUserAvatar('user_${widget.author}'),
                      builder: (context, snapshot) {
                        final avatarUrl = snapshot.data;
                        if (avatarUrl != null && avatarUrl.isNotEmpty) {
                          return OptimizedAvatar(
                            imageUrl: avatarUrl,
                            size: 48,
                            backgroundColor: AppTheme.primaryColor.withOpacity(
                              0.1,
                            ),
                            fallback: Text(
                              widget.author.isNotEmpty
                                  ? widget.author[0].toUpperCase()
                                  : 'U',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                                color: AppTheme.primaryColor,
                              ),
                            ),
                          );
                        } else {
                          return CircleAvatar(
                            radius: 24,
                            backgroundColor: AppTheme.primaryColor.withOpacity(
                              0.1,
                            ),
                            child: Text(
                              widget.author.isNotEmpty
                                  ? widget.author[0].toUpperCase()
                                  : 'U',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                                color: AppTheme.primaryColor,
                              ),
                            ),
                          );
                        }
                      },
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: GestureDetector(
                    onTap: () => Navigator.of(context).pushNamed(
                      AppRouter.userProfileRoute,
                      arguments: UserProfileArgs(
                        userId: 'user_${widget.author}',
                        displayName: widget.author,
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          widget.author,
                          style: const TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 15,
                            color: Color(0xFF1A1A1A),
                          ),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                        ),
                        const SizedBox(height: 2),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 2,
                          ),
                          decoration: BoxDecoration(
                            color: const Color(0xFFF8F9FA),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Text(
                            '刚刚',
                            style: TextStyle(
                              color: Colors.grey[600],
                              fontSize: 11,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            // 标题
            Text(
              widget.title,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w700,
                color: Color(0xFF1A1A1A),
                height: 1.3,
              ),
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 10),
            // 内容
            Text(
              widget.content,
              style: const TextStyle(
                fontSize: 14,
                color: Color(0xFF4A4A4A),
                height: 1.5,
                fontWeight: FontWeight.w400,
              ),
              maxLines: 20,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMedia() {
    if (widget.videoThumb != null) {
      return Padding(
        padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.08),
                blurRadius: 20,
                offset: const Offset(0, 8),
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
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
                  Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.black.withOpacity(0.1),
                          Colors.black.withOpacity(0.3),
                        ],
                      ),
                    ),
                  ),
                  Center(
                    child: Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.3),
                            blurRadius: 12,
                            offset: const Offset(0, 4),
                          ),
                        ],
                      ),
                      child: const CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: 32,
                        child: Icon(
                          Icons.play_arrow,
                          size: 36,
                          color: Color(0xFF1A1A1A),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    }
    if (widget.images.isEmpty) return const SizedBox.shrink();
    final isSingle = widget.images.length == 1;
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.06),
              blurRadius: 20,
              offset: const Offset(0, 8),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
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
                    crossAxisSpacing: 6,
                    mainAxisSpacing: 6,
                  ),
                  itemCount: widget.images.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () => _openImagePreview(widget.images, index),
                      child: Container(
                        decoration: BoxDecoration(
                          color: const Color(0xFFF8F9FA),
                          borderRadius: BorderRadius.circular(12),
                        ),
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
      ),
    );
  }

  Widget _buildActions() {
    final stats = _stats ?? const DynamicPostStats();
    return Container(
      margin: const EdgeInsets.fromLTRB(16, 0, 16, 12),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 20,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: LayoutBuilder(
        builder: (context, constraints) {
          final availableWidth = constraints.maxWidth;
          final buttonWidth = (availableWidth - 48) / 4; // 减去间距

          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                width: buttonWidth,
                child: _modernAction(
                  isActive: stats.likedByCurrentUser,
                  activeColor: const Color(0xFFFF6B6B),
                  inactiveColor: const Color(0xFF9CA3AF),
                  activeIcon: Icons.favorite_rounded,
                  inactiveIcon: Icons.favorite_border_rounded,
                  count: stats.likes,
                  onTap: () async {
                    final s = await DynamicService().toggleLike(widget.postId);
                    setState(() => _stats = s);
                  },
                ),
              ),
              SizedBox(
                width: buttonWidth,
                child: _modernAction(
                  isActive: false,
                  activeColor: const Color(0xFF3B82F6),
                  inactiveColor: const Color(0xFF9CA3AF),
                  activeIcon: Icons.chat_bubble_rounded,
                  inactiveIcon: Icons.chat_bubble_outline_rounded,
                  count: stats.comments,
                  onTap: () {
                    // 滚动到评论区域
                    final ctx = _commentsKey.currentContext;
                    if (ctx != null) {
                      Scrollable.ensureVisible(
                        ctx,
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                      );
                    }
                  },
                ),
              ),
              SizedBox(
                width: buttonWidth,
                child: _modernAction(
                  isActive: stats.favoritedByCurrentUser,
                  activeColor: const Color(0xFFF59E0B),
                  inactiveColor: const Color(0xFF9CA3AF),
                  activeIcon: Icons.bookmark_rounded,
                  inactiveIcon: Icons.bookmark_border_rounded,
                  count: stats.favorites,
                  onTap: () async {
                    final s = await DynamicService().toggleFavorite(
                      widget.postId,
                    );
                    setState(() => _stats = s);
                  },
                ),
              ),
              SizedBox(
                width: buttonWidth,
                child: _modernAction(
                  isActive: false,
                  activeColor: const Color(0xFF10B981),
                  inactiveColor: const Color(0xFF9CA3AF),
                  activeIcon: Icons.share_rounded,
                  inactiveIcon: Icons.share_rounded,
                  count: stats.shares,
                  onTap: () async {
                    final s = await DynamicService().incrementShare(
                      widget.postId,
                    );
                    setState(() => _stats = s);
                    if (!mounted) return;
                    ScaffoldMessenger.of(
                      context,
                    ).showSnackBar(const SnackBar(content: Text('已转发')));
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _buildCommentsSection() {
    return Container(
      key: _commentsKey,
      margin: const EdgeInsets.fromLTRB(16, 0, 16, 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 12),
          // 评论内容区域
          if (_loading)
            Container(
              padding: const EdgeInsets.symmetric(vertical: 40),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.04),
                    blurRadius: 20,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: const Center(
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  valueColor: AlwaysStoppedAnimation<Color>(Color(0xFF3B82F6)),
                ),
              ),
            )
          else if (_comments.isEmpty)
            Container(
              padding: const EdgeInsets.symmetric(vertical: 40),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.04),
                    blurRadius: 20,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.chat_bubble_outline_rounded,
                      size: 48,
                      color: Colors.grey[400],
                    ),
                    const SizedBox(height: 16),
                    Text(
                      '还没有评论',
                      style: TextStyle(
                        color: Colors.grey[600],
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      '来说点什么吧～',
                      style: TextStyle(color: Colors.grey[500], fontSize: 14),
                    ),
                  ],
                ),
              ),
            )
          else ...[
            ..._comments.map((c) => _commentTile(c)).toList(),
            // 顶部评论加载更多（小红书风格链接）
            if (_commentHasMore) ...[
              const SizedBox(height: 4),
              Center(
                child: GestureDetector(
                  onTap: _commentLoadingMore ? null : _loadMoreComments,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    child: Text(
                      _commentLoadingMore ? '加载中...' : '加载更多评论',
                      style: const TextStyle(
                        fontSize: 12,
                        color: Color(0xFF3B82F6),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ],
        ],
      ),
    );
  }

  Widget _commentTile(DynamicComment c) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.03),
            blurRadius: 8,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 用户头像
          GestureDetector(
            onTap: () =>
                _navigateToUserProfile(c.userId, c.username, c.userAvatar),
            child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.06),
                    blurRadius: 6,
                    offset: const Offset(0, 1),
                  ),
                ],
              ),
              child: c.userAvatar != null && c.userAvatar!.isNotEmpty
                  ? OptimizedAvatar(
                      imageUrl: c.userAvatar!,
                      size: 32,
                      backgroundColor: const Color(0xFFF8F9FA),
                      fallback: Text(
                        c.username.isNotEmpty
                            ? c.username[0].toUpperCase()
                            : 'U',
                        style: const TextStyle(
                          color: Color(0xFF6B7280),
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    )
                  : Container(
                      width: 32,
                      height: 32,
                      decoration: const BoxDecoration(
                        color: Color(0xFFF8F9FA),
                        shape: BoxShape.circle,
                      ),
                      child: Center(
                        child: Text(
                          c.username.isNotEmpty
                              ? c.username[0].toUpperCase()
                              : 'U',
                          style: const TextStyle(
                            color: Color(0xFF6B7280),
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
            ),
          ),
          const SizedBox(width: 10),
          // 评论内容区域
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // 用户名和时间
                Row(
                  children: [
                    Flexible(
                      flex: 2,
                      child: GestureDetector(
                        onTap: () => _navigateToUserProfile(
                          c.userId,
                          c.username,
                          c.userAvatar,
                        ),
                        child: Text(
                          c.username,
                          style: const TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 13,
                            color: Color(0xFF1A1A1A),
                          ),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                        ),
                      ),
                    ),
                    const SizedBox(width: 6),
                    Text(
                      '· ${_timeAgo(c.createdAt)}',
                      style: const TextStyle(
                        color: Color(0xFF6B7280),
                        fontSize: 10,
                        fontWeight: FontWeight.w400,
                      ),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                  ],
                ),
                const SizedBox(height: 6),
                // 评论内容
                Text(
                  c.content,
                  style: const TextStyle(
                    fontSize: 14,
                    color: Color(0xFF1F2937),
                    height: 1.5,
                    fontWeight: FontWeight.w400,
                  ),
                  maxLines: 10,
                  overflow: TextOverflow.ellipsis,
                ),
                // 显示评论中的图片
                if (c.images.isNotEmpty) ...[
                  const SizedBox(height: 8),
                  Wrap(
                    spacing: 6,
                    runSpacing: 6,
                    children: c.images.map((imageUrl) {
                      return GestureDetector(
                        onTap: () => _openImagePreview(
                          c.images,
                          c.images.indexOf(imageUrl),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Image.network(
                            imageUrl,
                            width: 68,
                            height: 68,
                            fit: BoxFit.cover,
                            errorBuilder: (_, __, ___) => Container(
                              width: 68,
                              height: 68,
                              decoration: BoxDecoration(
                                color: const Color(0xFFF3F4F6),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: const Icon(
                                Icons.broken_image,
                                color: Color(0xFFD1D5DB),
                                size: 24,
                              ),
                            ),
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ],
                const SizedBox(height: 8),
                // 操作按钮
                Row(
                  children: [
                    // 点赞按钮
                    InkWell(
                      onTap: () => _likeComment(c.id),
                      borderRadius: BorderRadius.circular(12),
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 200),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 6,
                        ),
                        decoration: BoxDecoration(
                          color: c.isLiked
                              ? const Color(0xFFFF6B6B).withOpacity(0.1)
                              : Colors.transparent,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            AnimatedSwitcher(
                              duration: const Duration(milliseconds: 200),
                              transitionBuilder: (child, animation) {
                                return ScaleTransition(
                                  scale: animation,
                                  child: child,
                                );
                              },
                              child: Icon(
                                c.isLiked
                                    ? Icons.favorite_rounded
                                    : Icons.favorite_border_rounded,
                                key: ValueKey(c.isLiked),
                                size: 16,
                                color: c.isLiked
                                    ? const Color(0xFFFF6B6B)
                                    : const Color(0xFF9CA3AF),
                              ),
                            ),
                            const SizedBox(width: 4),
                            Text(
                              '${c.likeCount}',
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                                color: c.isLiked
                                    ? const Color(0xFFFF6B6B)
                                    : const Color(0xFF9CA3AF),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    // 回复按钮
                    InkWell(
                      onTap: () => _showReplyDialog(c.id, c.username),
                      borderRadius: BorderRadius.circular(12),
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 6,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.transparent,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              Icons.chat_bubble_outline_rounded,
                              size: 16,
                              color: const Color(0xFF9CA3AF),
                            ),
                            const SizedBox(width: 4),
                            const Text(
                              '回复',
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                                color: Color(0xFF9CA3AF),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                // 显示回复按钮和回复列表
                if (_commentReplies.containsKey(c.id) &&
                    _commentReplies[c.id]!.isNotEmpty) ...[
                  const SizedBox(height: 8),
                  // 轻量链接样式：展开/收起
                  GestureDetector(
                    onTap: () => _toggleReplies(c.id),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 4),
                      child: Text(
                        _showReplies[c.id] == true
                            ? '收起回复'
                            : '展开 ${_commentReplies[c.id]!.length} 条回复',
                        style: const TextStyle(
                          color: Color(0xFF3B82F6),
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                  if (_showReplies[c.id] == true) ...[
                    Padding(
                      padding: const EdgeInsets.fromLTRB(4, 0, 0, 6),
                      child: Column(
                        children: () {
                          final list = _commentReplies[c.id]!;
                          final bool showGuide = list.length > 1;
                          return list
                              .map(
                                (reply) => Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    // 左侧引导线（多条回复时显示）
                                    if (showGuide)
                                      Container(
                                        width: 1,
                                        constraints: const BoxConstraints(
                                          minHeight: 40,
                                        ),
                                        margin: const EdgeInsets.only(
                                          left: 0,
                                          right: 4,
                                        ),
                                        decoration: BoxDecoration(
                                          color: const Color(0xFFE5E7EB),
                                          borderRadius: BorderRadius.circular(
                                            1,
                                          ),
                                        ),
                                      ),
                                    // 回复卡片
                                    Expanded(child: _replyTile(reply, c.id)),
                                  ],
                                ),
                              )
                              .toList();
                        }(),
                      ),
                    ),
                    if (_replyHasMore[c.id] == true)
                      Padding(
                        padding: const EdgeInsets.only(left: 8, bottom: 6),
                        child: GestureDetector(
                          onTap: () => _loadMoreReplies(c.id),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: Text(
                              _replyLoadingMore[c.id] == true
                                  ? '加载中...'
                                  : '加载更多',
                              style: const TextStyle(
                                fontSize: 12,
                                color: Color(0xFF3B82F6),
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                      ),
                  ],
                ] else if (_commentReplies.containsKey(c.id) &&
                    _commentReplies[c.id]!.isEmpty) ...[
                  const SizedBox(height: 6),
                  GestureDetector(
                    onTap: () => _toggleReplies(c.id),
                    child: const Padding(
                      padding: EdgeInsets.symmetric(vertical: 4),
                      child: Text(
                        '查看回复',
                        style: TextStyle(
                          color: Color(0xFF6B7280),
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                  if (_showReplies[c.id] == true) ...[
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 6),
                      child: Text(
                        '暂无回复',
                        style: TextStyle(
                          color: Color(0xFF9CA3AF),
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ] else ...[
                  const SizedBox(height: 6),
                  GestureDetector(
                    onTap: () => _toggleReplies(c.id),
                    child: const Padding(
                      padding: EdgeInsets.symmetric(vertical: 4),
                      child: Text(
                        '查看回复',
                        style: TextStyle(
                          color: Color(0xFF6B7280),
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                  if (_showReplies[c.id] == true) ...[
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 6),
                      child: Center(
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                          valueColor: AlwaysStoppedAnimation<Color>(
                            Color(0xFF3B82F6),
                          ),
                        ),
                      ),
                    ),
                  ],
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _replyTile(DynamicReply reply, String parentCommentId) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 12,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 用户头像
          GestureDetector(
            onTap: () => _navigateToUserProfile(
              reply.userId,
              reply.username,
              reply.userAvatar,
            ),
            child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.06),
                    blurRadius: 4,
                    offset: const Offset(0, 1),
                  ),
                ],
              ),
              child: reply.userAvatar != null && reply.userAvatar!.isNotEmpty
                  ? OptimizedAvatar(
                      imageUrl: reply.userAvatar!,
                      size: 28,
                      backgroundColor: const Color(0xFFF8F9FA),
                      fallback: Text(
                        reply.username.isNotEmpty
                            ? reply.username[0].toUpperCase()
                            : 'U',
                        style: const TextStyle(
                          color: Color(0xFF6B7280),
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    )
                  : Container(
                      width: 28,
                      height: 28,
                      decoration: BoxDecoration(
                        color: const Color(0xFFF8F9FA),
                        shape: BoxShape.circle,
                      ),
                      child: Center(
                        child: Text(
                          reply.username.isNotEmpty
                              ? reply.username[0].toUpperCase()
                              : 'U',
                          style: const TextStyle(
                            color: Color(0xFF6B7280),
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
            ),
          ),
          const SizedBox(width: 10),
          // 回复内容区域
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // 用户名和时间
                Row(
                  children: [
                    Flexible(
                      flex: 2,
                      child: GestureDetector(
                        onTap: () => _navigateToUserProfile(
                          reply.userId,
                          reply.username,
                          reply.userAvatar,
                        ),
                        child: Text(
                          reply.username,
                          style: const TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 12,
                            color: Color(0xFF1A1A1A),
                          ),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                        ),
                      ),
                    ),
                    if (reply.replyToUsername != null) ...[
                      const SizedBox(width: 6),
                      Flexible(
                        flex: 2,
                        child: GestureDetector(
                          onTap: () => _navigateToUserProfile(
                            reply.replyToUserId ?? '',
                            reply.replyToUsername ?? '',
                            null, // 被回复用户头像暂时为空
                          ),
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 6,
                              vertical: 2,
                            ),
                            decoration: BoxDecoration(
                              color: const Color(0xFFEFF6FF),
                              borderRadius: BorderRadius.circular(6),
                              border: Border.all(
                                color: const Color(0xFF3B82F6).withOpacity(0.2),
                                width: 1,
                              ),
                            ),
                            child: Text(
                              '回复 ${reply.replyToUsername!}',
                              style: const TextStyle(
                                fontSize: 10,
                                color: Color(0xFF3B82F6),
                                fontWeight: FontWeight.w600,
                              ),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                            ),
                          ),
                        ),
                      ),
                    ],
                    const SizedBox(width: 6),
                    Flexible(
                      flex: 1,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 6,
                          vertical: 2,
                        ),
                        decoration: BoxDecoration(
                          color: const Color(0xFFF8F9FA),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text(
                          _timeAgo(reply.createdAt),
                          style: const TextStyle(
                            color: Color(0xFF6B7280),
                            fontSize: 10,
                            fontWeight: FontWeight.w500,
                          ),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 6),
                // 回复内容
                Text(
                  reply.content,
                  style: const TextStyle(
                    fontSize: 13,
                    color: Color(0xFF1F2937),
                    height: 1.4,
                    fontWeight: FontWeight.w400,
                  ),
                  maxLines: 8,
                  overflow: TextOverflow.ellipsis,
                ),
                // 显示回复中的图片
                if (reply.images.isNotEmpty) ...[
                  const SizedBox(height: 8),
                  Wrap(
                    spacing: 6,
                    runSpacing: 6,
                    children: reply.images.map((imageUrl) {
                      return GestureDetector(
                        onTap: () => _openImagePreview(
                          reply.images,
                          reply.images.indexOf(imageUrl),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.network(
                            imageUrl,
                            width: 50,
                            height: 50,
                            fit: BoxFit.cover,
                            errorBuilder: (_, __, ___) => Container(
                              width: 50,
                              height: 50,
                              decoration: BoxDecoration(
                                color: const Color(0xFFF3F4F6),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: const Icon(
                                Icons.broken_image,
                                color: Color(0xFFD1D5DB),
                                size: 18,
                              ),
                            ),
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ],
                const SizedBox(height: 8),
                // 操作按钮
                Row(
                  children: [
                    // 点赞按钮
                    InkWell(
                      onTap: () => _likeReply(reply.id),
                      borderRadius: BorderRadius.circular(8),
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 200),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color: reply.isLiked
                              ? const Color(0xFFFF6B6B).withOpacity(0.1)
                              : Colors.transparent,
                          borderRadius: BorderRadius.circular(8),
                          boxShadow: reply.isLiked
                              ? [
                                  BoxShadow(
                                    color: const Color(
                                      0xFFFF6B6B,
                                    ).withOpacity(0.2),
                                    blurRadius: 4,
                                    offset: const Offset(0, 1),
                                  ),
                                ]
                              : [],
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            AnimatedSwitcher(
                              duration: const Duration(milliseconds: 200),
                              transitionBuilder: (child, animation) {
                                return ScaleTransition(
                                  scale: animation,
                                  child: child,
                                );
                              },
                              child: Icon(
                                reply.isLiked
                                    ? Icons.favorite_rounded
                                    : Icons.favorite_border_rounded,
                                key: ValueKey(reply.isLiked),
                                size: 14,
                                color: reply.isLiked
                                    ? const Color(0xFFFF6B6B)
                                    : const Color(0xFF9CA3AF),
                              ),
                            ),
                            const SizedBox(width: 4),
                            Text(
                              '${reply.likeCount}',
                              style: TextStyle(
                                fontSize: 11,
                                fontWeight: FontWeight.w600,
                                color: reply.isLiked
                                    ? const Color(0xFFFF6B6B)
                                    : const Color(0xFF9CA3AF),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    // 回复按钮
                    InkWell(
                      onTap: () => _showReplyDialog(
                        parentCommentId,
                        reply.username,
                        replyToReplyId: reply.id,
                        replyToUsername: reply.username,
                      ),
                      borderRadius: BorderRadius.circular(8),
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.transparent,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              Icons.chat_bubble_outline_rounded,
                              size: 14,
                              color: const Color(0xFF9CA3AF),
                            ),
                            const SizedBox(width: 4),
                            const Text(
                              '回复',
                              style: TextStyle(
                                fontSize: 11,
                                fontWeight: FontWeight.w600,
                                color: Color(0xFF9CA3AF),
                              ),
                            ),
                          ],
                        ),
                      ),
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
        padding: const EdgeInsets.fromLTRB(16, 12, 16, 16),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.08),
              blurRadius: 20,
              offset: const Offset(0, -4),
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: BoxDecoration(
                color: const Color(0xFFF8F9FA),
                borderRadius: BorderRadius.circular(24),
                border: Border.all(color: const Color(0xFFE5E7EB), width: 1),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _commentController,
                      focusNode: _commentFocusNode,
                      decoration: const InputDecoration(
                        hintText: '友善发言，理性讨论...',
                        hintStyle: TextStyle(
                          color: Color(0xFF9CA3AF),
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                        ),
                        isDense: true,
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.symmetric(vertical: 8),
                      ),
                      enabled: !_sendingComment,
                      textInputAction: TextInputAction.send,
                      onSubmitted: (v) =>
                          _sendingComment ? null : _submitCommentFromInput(),
                      style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                        color: Color(0xFF374151),
                      ),
                      maxLines: 3,
                      minLines: 1,
                    ),
                  ),
                  const SizedBox(width: 8),
                  // Emoji toggle
                  InkWell(
                    onTap: _sendingComment ? null : _toggleEmojiPanel,
                    borderRadius: BorderRadius.circular(20),
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: const Color(0xFFF59E0B).withOpacity(0.12),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Icon(
                        _showEmojiPanel
                            ? Icons.emoji_emotions
                            : Icons.emoji_emotions_outlined,
                        size: 18,
                        color: const Color(0xFFF59E0B),
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  // Image picker (system gallery)
                  InkWell(
                    onTap: _sendingComment ? null : _pickImageAndUpload,
                    borderRadius: BorderRadius.circular(20),
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: const Color(0xFF3B82F6).withOpacity(0.1),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: const Icon(
                        Icons.image_outlined,
                        size: 18,
                        color: Color(0xFF3B82F6),
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  InkWell(
                    onTap: _sendingComment ? null : _submitCommentFromInput,
                    borderRadius: BorderRadius.circular(20),
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: _commentController.text.trim().isNotEmpty
                            ? const Color(0xFF3B82F6)
                            : const Color(0xFFE5E7EB),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: _sendingComment
                          ? const SizedBox(
                              width: 18,
                              height: 18,
                              child: CircularProgressIndicator(
                                strokeWidth: 2,
                                valueColor: AlwaysStoppedAnimation<Color>(
                                  Colors.white,
                                ),
                              ),
                            )
                          : Icon(
                              Icons.send_rounded,
                              size: 18,
                              color: _commentController.text.trim().isNotEmpty
                                  ? Colors.white
                                  : const Color(0xFF9CA3AF),
                            ),
                    ),
                  ),
                ],
              ),
            ),
            if (_showEmojiPanel)
              Container(
                margin: const EdgeInsets.only(top: 8),
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.06),
                      blurRadius: 12,
                      offset: const Offset(0, -2),
                    ),
                  ],
                ),
                height: 200,
                child: GridView.count(
                  crossAxisCount: 8,
                  mainAxisSpacing: 6,
                  crossAxisSpacing: 6,
                  children: const [
                    '😀',
                    '😁',
                    '😂',
                    '🤣',
                    '😊',
                    '😍',
                    '😘',
                    '😜',
                    '🤔',
                    '😏',
                    '🙄',
                    '😴',
                    '🤤',
                    '😅',
                    '😇',
                    '🤗',
                    '👍',
                    '👎',
                    '👏',
                    '🙏',
                    '🔥',
                    '✨',
                    '❤️',
                    '💯',
                    '🐶',
                    '🐱',
                    '🐭',
                    '🐹',
                    '🐰',
                    '🦊',
                    '🐻',
                    '🐼',
                  ].map((e) => _EmojiCell(emoji: e)).toList(),
                ),
              ),
          ],
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
            const SizedBox(height: 16),
            const Text('分享选项', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16)),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _simpleShareItem('复制链接', Icons.link, () {
                  Navigator.pop(context);
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('链接已复制')),
                  );
                }),
                _simpleShareItem('举报', Icons.flag, () {
                  Navigator.pop(context);
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('已提交举报，我们会尽快审核')),
                  );
                }),
              ],
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  Widget _simpleShareItem(String label, IconData icon, VoidCallback onTap) {
    return Column(
      children:
        [
          InkWell(
            onTap: onTap,
            borderRadius: BorderRadius.circular(24),
            child: Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: const Color(0xFFF3F4F6),
                borderRadius: BorderRadius.circular(24),
              ),
              child: Icon(icon, size: 24, color: const Color(0xFF4B5563)),
            ),
          ),
          const SizedBox(height: 8),
          Text(label, style: const TextStyle(fontSize: 12, color: Color(0xFF6B7280))),
        ],
    );
  }

  Widget _modernAction({
    required bool isActive,
    required Color activeColor,
    required Color inactiveColor,
    required IconData activeIcon,
    required IconData inactiveIcon,
    required int count,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
          color: isActive ? activeColor.withOpacity(0.1) : Colors.transparent,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: isActive ? activeColor.withOpacity(0.3) : Colors.transparent,
            width: 1,
          ),
          boxShadow: isActive
              ? [
                  BoxShadow(
                    color: activeColor.withOpacity(0.2),
                    blurRadius: 8,
                    offset: const Offset(0, 2),
                  ),
                ]
              : [],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            AnimatedSwitcher(
              duration: const Duration(milliseconds: 200),
              transitionBuilder: (child, animation) {
                return ScaleTransition(scale: animation, child: child);
              },
              child: Icon(
                isActive ? activeIcon : inactiveIcon,
                key: ValueKey(isActive),
                size: 18,
                color: isActive ? activeColor : inactiveColor,
              ),
            ),
            const SizedBox(height: 3),
            Flexible(
              child: Text(
                count > 999
                    ? '${(count / 1000).toStringAsFixed(1)}k'
                    : '$count',
                style: TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.w600,
                  color: isActive ? activeColor : inactiveColor,
                ),
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// 导航到用户详情页面（优先拉取后端用户信息）
  Future<void> _navigateToUserProfile(
    String userId,
    String username,
    String? avatarUrl,
  ) async {
    try {
      final info = await DynamicService().getOtherUserInfo(userId);
      final displayName = info?.username ?? username;
      final avatar = info?.avatar ?? avatarUrl;
      if (!mounted) return;
      Navigator.of(context).pushNamed(
        AppRouter.userProfileRoute,
        arguments: UserProfileArgs(
          userId: userId,
          displayName: displayName,
          avatarUrl: avatar,
        ),
      );
    } catch (_) {
      if (!mounted) return;
      Navigator.of(context).pushNamed(
        AppRouter.userProfileRoute,
        arguments: UserProfileArgs(
          userId: userId,
          displayName: username,
          avatarUrl: avatarUrl,
        ),
      );
    }
  }

  Future<void> _loadMoreComments() async {
    if (_commentLoadingMore || !_commentHasMore) return;
    setState(() => _commentLoadingMore = true);
    try {
      final more = await DynamicService().getComments(
        widget.postId,
        skip: _commentSkip,
        limit: _commentPageSize,
      );
      if (!mounted) return;
      setState(() {
        _comments = [..._comments, ...more];
        _commentSkip += more.length;
        _commentHasMore = more.length == _commentPageSize;
      });
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('加载更多评论失败: $e')));
      }
    } finally {
      if (mounted) setState(() => _commentLoadingMore = false);
    }
  }
}

class _EmojiCell extends StatelessWidget {
  final String emoji;
  const _EmojiCell({required this.emoji});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        final state = context
            .findAncestorStateOfType<_ContentDetailPageState>();
        state?._insertAtCursor('$emoji');
      },
      borderRadius: BorderRadius.circular(8),
      child: Container(
        decoration: BoxDecoration(
          color: const Color(0xFFF8F9FA),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Center(child: Text(emoji, style: const TextStyle(fontSize: 20))),
      ),
    );
  }
}
