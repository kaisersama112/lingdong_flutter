import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../services/chat_service.dart';
import '../services/dynamic_service.dart';
import '../routes/app_router.dart';
import '../core/models/chat_models.dart';
import 'chat_detail_page.dart';
import 'user_profile_page.dart';

class MessagePage extends StatefulWidget {
  const MessagePage({super.key});

  @override
  State<MessagePage> createState() => _MessagePageState();
}

enum _TopMenuAction { addFriend, createGroup }

class _MessagePageState extends State<MessagePage>
    with TickerProviderStateMixin {
  late TabController _tabController;
  final TextEditingController _searchController = TextEditingController();
  String _searchQuery = '';

  // 聊天服务
  final ChatService _chatService = ChatService();

  // 状态管理
  bool _isLoading = false;
  String? _errorMessage;
  List<ChatConversation> _conversations = [];

  List<ChatConversation> get _filteredConversations {
    if (_searchQuery.isEmpty) {
      return _conversations;
    }
    return _conversations
        .where(
          (conversation) =>
              conversation.title.toLowerCase().contains(
                _searchQuery.toLowerCase(),
              ) ||
              (conversation.lastMessage?.toLowerCase().contains(
                    _searchQuery.toLowerCase(),
                  ) ??
                  false),
        )
        .toList();
  }

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    _loadConversations();
  }

  @override
  void dispose() {
    _tabController.dispose();
    _searchController.dispose();
    super.dispose();
  }

  /// 加载会话列表
  Future<void> _loadConversations() async {
    setState(() {
      _isLoading = true;
      _errorMessage = null;
    });

    try {
      final conversations = await _chatService.getUserConversations();
      setState(() {
        _conversations = conversations;
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _errorMessage = e.toString();
        _isLoading = false;
      });
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('加载会话失败: $e'),
            backgroundColor: AppTheme.errorColor,
          ),
        );
      }
    }
  }

  /// 刷新会话列表
  Future<void> _refreshConversations() async {
    await _loadConversations();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.backgroundColor,
      appBar: AppBar(
        title: const Text('消息'),
        backgroundColor: Colors.transparent,
        bottom: TabBar(
          controller: _tabController,
          labelColor: AppTheme.primaryColor,
          unselectedLabelColor: AppTheme.textSecondaryColor,
          indicatorColor: AppTheme.primaryColor,
          indicatorWeight: 2,
          tabs: const [
            Tab(text: '会话'),
            Tab(text: '好友'),
            Tab(text: '群聊'),
          ],
        ),
        actions: [
          PopupMenuButton<_TopMenuAction>(
            tooltip: '更多',
            icon: const Icon(Icons.add),
            onSelected: (value) {
              switch (value) {
                case _TopMenuAction.addFriend:
                  _onAddFriendAction();
                  break;
                case _TopMenuAction.createGroup:
                  _onCreateGroupAction();
                  break;
              }
            },
            itemBuilder: (context) => const [
              PopupMenuItem<_TopMenuAction>(
                value: _TopMenuAction.addFriend,
                child: ListTile(
                  leading: Icon(Icons.person_add_alt_1),
                  title: Text('添加好友'),
                  dense: true,
                  contentPadding: EdgeInsets.zero,
                ),
              ),
              PopupMenuItem<_TopMenuAction>(
                value: _TopMenuAction.createGroup,
                child: ListTile(
                  leading: Icon(Icons.group_add),
                  title: Text('创建群聊'),
                  dense: true,
                  contentPadding: EdgeInsets.zero,
                ),
              ),
            ],
          ),
        ],
      ),
      body: SafeArea(
        child: TabBarView(
          controller: _tabController,
          children: [
            _buildAllConversationsTab(),
            _buildFriendsTab(),
            _buildGroupsTab(),
          ],
        ),
      ),
    );
  }

  // 已被SliverAppBar替代
  // ignore: unused_element
  Widget _buildSimpleHeader() => const SizedBox.shrink();

  // 已被SliverAppBar.bottom替代
  // ignore: unused_element
  Widget _buildSimpleTabBar() => const SizedBox.shrink();

  // 构建全部会话标签页
  Widget _buildAllConversationsTab() {
    return _buildConversationListView(_filteredConversations);
  }

  // 好友标签页（互相关注 / 我关注 / 关注我的）
  int _friendFilter = 0; // 0:互相关注 1:我关注 2:关注我的
  Widget _buildFriendsTab() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: AppTheme.spacingM,
            vertical: AppTheme.spacingS,
          ),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: List<Widget>.generate(3, (index) {
                final labels = ['互相关注', '我关注', '关注我的'];
                final selected = _friendFilter == index;
                return Padding(
                  padding: EdgeInsets.only(
                    right: index == 2 ? 0 : AppTheme.spacingS,
                  ),
                  child: ChoiceChip(
                    label: Text(labels[index]),
                    selected: selected,
                    showCheckmark: false,
                    labelStyle: TextStyle(
                      color: selected
                          ? AppTheme.primaryColor
                          : AppTheme.textSecondaryColor,
                    ),
                    selectedColor: AppTheme.primaryColor.withValues(
                      alpha: 0.12,
                    ),
                    backgroundColor: AppTheme.dividerColor.withValues(
                      alpha: 0.35,
                    ),
                    shape: StadiumBorder(
                      side: BorderSide(
                        color: selected
                            ? AppTheme.primaryColor
                            : AppTheme.dividerColor,
                      ),
                    ),
                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    visualDensity: const VisualDensity(
                      horizontal: -1,
                      vertical: -2,
                    ),
                    onSelected: (_) => setState(() => _friendFilter = index),
                  ),
                );
              }),
            ),
          ),
        ),
        const Divider(height: 1, color: AppTheme.dividerColor),
        Expanded(child: _buildFriendListReal()),
      ],
    );
  }

  // 真实好友列表（接入关系API）
  List<UserFollowItem> _friendItems = const [];
  bool _friendsLoading = false;
  bool _friendsHasMore = true;
  int _friendsSkip = 0;
  static const int _friendsPageSize = 20;

  Future<void> _loadFriendsInitial() async {
    setState(() {
      _friendsLoading = true;
      _friendsSkip = 0;
    });
    final service = DynamicService();
    List<UserFollowItem> data;
    if (_friendFilter == 0) {
      data = await service.getMyMutualFollows(
        skip: _friendsSkip,
        limit: _friendsPageSize,
      );
    } else if (_friendFilter == 1) {
      data = await service.getMyFollowing(
        skip: _friendsSkip,
        limit: _friendsPageSize,
      );
    } else {
      data = await service.getMyFollowers(
        skip: _friendsSkip,
        limit: _friendsPageSize,
      );
    }
    setState(() {
      _friendItems = data;
      _friendsHasMore = data.length == _friendsPageSize;
      _friendsLoading = false;
      _friendsSkip = data.length;
    });
  }

  Future<void> _loadFriendsMore() async {
    if (_friendsLoading || !_friendsHasMore) return;
    setState(() => _friendsLoading = true);
    final service = DynamicService();
    List<UserFollowItem> data;
    if (_friendFilter == 0) {
      data = await service.getMyMutualFollows(
        skip: _friendsSkip,
        limit: _friendsPageSize,
      );
    } else if (_friendFilter == 1) {
      data = await service.getMyFollowing(
        skip: _friendsSkip,
        limit: _friendsPageSize,
      );
    } else {
      data = await service.getMyFollowers(
        skip: _friendsSkip,
        limit: _friendsPageSize,
      );
    }
    setState(() {
      _friendItems = [..._friendItems, ...data];
      _friendsHasMore = data.length == _friendsPageSize;
      _friendsLoading = false;
      _friendsSkip += data.length;
    });
  }

  Widget _buildFriendListReal() {
    if (_friendsLoading && _friendItems.isEmpty) {
      return _buildLoadingSkeleton();
    }
    if (_friendItems.isEmpty) {
      return _buildEmptySimple('暂无好友', '去社区多互动，结识新朋友');
    }
    return RefreshIndicator(
      onRefresh: _loadFriendsInitial,
      child: ListView.separated(
        padding: const EdgeInsets.all(AppTheme.spacingM),
        itemBuilder: (context, index) {
          if (index == _friendItems.length) {
            _loadFriendsMore();
            return const Padding(
              padding: EdgeInsets.symmetric(vertical: AppTheme.spacingM),
              child: Center(child: CircularProgressIndicator(strokeWidth: 2)),
            );
          }
          final item = _friendItems[index];
          return Container(
            decoration: AppTheme.cardDecoration,
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: AppTheme.primaryColor.withValues(alpha: 0.1),
                foregroundColor: AppTheme.primaryColor,
                backgroundImage: item.avatar != null
                    ? NetworkImage(item.avatar!)
                    : null,
                child: item.avatar == null ? const Icon(Icons.person) : null,
              ),
              title: Text(item.username),
              subtitle: Text(
                _friendFilter == 0
                    ? '互相关注'
                    : (_friendFilter == 1 ? '我关注' : '关注我'),
                style: AppTheme.captionStyle,
              ),
              trailing: const Icon(
                Icons.chevron_right_rounded,
                color: AppTheme.textLightColor,
                size: 18,
              ),
              onTap: () {
                Navigator.of(context).pushNamed(
                  AppRouter.userProfileRoute,
                  arguments: UserProfileArgs(
                    userId: item.userId,
                    displayName: item.username,
                    avatarUrl: item.avatar,
                  ),
                );
              },
            ),
          );
        },
        separatorBuilder: (_, __) => const SizedBox(height: AppTheme.spacingS),
        itemCount: _friendItems.length + (_friendsHasMore ? 1 : 0),
      ),
    );
  }

  // 群聊标签页
  Widget _buildGroupsTab() {
    // 占位数据（后续接入群聊API）
    final groups = [
      {'name': '本地宠友群', 'members': '128人'},
      {'name': '萌宠摄影', 'members': '56人'},
    ];

    if (groups.isEmpty) {
      return _buildEmptySimple('暂无群聊', '创建或加入兴趣群，参与讨论');
    }

    return ListView.separated(
      padding: const EdgeInsets.all(AppTheme.spacingM),
      itemBuilder: (context, index) {
        final g = groups[index];
        return Container(
          decoration: AppTheme.cardDecoration,
          child: ListTile(
            leading: CircleAvatar(
              backgroundColor: AppTheme.accentColor.withValues(alpha: 0.1),
              foregroundColor: AppTheme.accentColor,
              child: const Icon(Icons.group),
            ),
            title: Text(g['name'] ?? ''),
            subtitle: Text(g['members'] ?? '', style: AppTheme.captionStyle),
            trailing: const Icon(
              Icons.chevron_right_rounded,
              color: AppTheme.textLightColor,
              size: 18,
            ),
            onTap: () {},
          ),
        );
      },
      separatorBuilder: (_, __) => const SizedBox(height: AppTheme.spacingS),
      itemCount: groups.length,
    );
  }

  Widget _buildEmptySimple(String title, String tip) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.inbox_outlined, size: 56, color: AppTheme.textLightColor),
          const SizedBox(height: AppTheme.spacingM),
          Text(
            title,
            style: AppTheme.subheadingStyle.copyWith(
              color: AppTheme.textSecondaryColor,
            ),
          ),
          const SizedBox(height: AppTheme.spacingS),
          Text(tip, style: AppTheme.captionStyle),
        ],
      ),
    );
  }

  // 搜索入口暂不使用

  // 极简版移除添加好友对话，改为搜索入口

  // 极简版移除新建群聊对话

  void _onAddFriendAction() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('添加好友'),
        content: const Text('后续可接入：搜索昵称/扫码添加/从通讯录导入'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('关闭'),
          ),
        ],
      ),
    );
  }

  void _onCreateGroupAction() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('创建群聊'),
        content: const Text('后续可接入：选择好友创建群聊/设置群头像与名称'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('关闭'),
          ),
        ],
      ),
    );
  }

  Widget _buildConversationListView(List<ChatConversation> conversations) {
    if (_isLoading) {
      return _buildLoadingSkeleton();
    }

    if (_errorMessage != null) {
      return _buildErrorState();
    }

    if (conversations.isEmpty) {
      return _buildEmptyState();
    }

    return RefreshIndicator(
      onRefresh: _refreshConversations,
      child: ListView.builder(
        padding: const EdgeInsets.all(AppTheme.spacingM),
        itemCount: conversations.length,
        itemBuilder: (context, index) {
          final conversation = conversations[index];
          return _buildConversationItem(conversation);
        },
      ),
    );
  }

  Widget _buildLoadingSkeleton() {
    return ListView.separated(
      padding: const EdgeInsets.all(AppTheme.spacingM),
      itemBuilder: (context, index) {
        return Row(
          children: [
            Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                color: AppTheme.textLightColor.withValues(alpha: 0.2),
                borderRadius: BorderRadius.circular(AppTheme.borderRadiusLarge),
              ),
            ),
            const SizedBox(width: AppTheme.spacingM),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 14,
                    width: 160,
                    decoration: BoxDecoration(
                      color: AppTheme.textLightColor.withValues(alpha: 0.2),
                      borderRadius: BorderRadius.circular(6),
                    ),
                  ),
                  const SizedBox(height: AppTheme.spacingS),
                  Container(
                    height: 12,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: AppTheme.textLightColor.withValues(alpha: 0.15),
                      borderRadius: BorderRadius.circular(6),
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
      },
      separatorBuilder: (_, __) => const SizedBox(height: AppTheme.spacingM),
      itemCount: 6,
    );
  }

  Widget _buildConversationItem(ChatConversation conversation) {
    return Container(
      margin: const EdgeInsets.only(bottom: AppTheme.spacingS),
      decoration: AppTheme.cardDecoration,
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(
          horizontal: AppTheme.spacingM,
          vertical: AppTheme.spacingS,
        ),
        leading: Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                AppTheme.primaryColor.withValues(alpha: 0.2),
                AppTheme.primaryColor.withValues(alpha: 0.1),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(AppTheme.borderRadiusLarge),
            border: Border.all(
              color: AppTheme.primaryColor.withValues(alpha: 0.3),
              width: 1,
            ),
          ),
          child: conversation.avatar != null
              ? ClipRRect(
                  borderRadius: BorderRadius.circular(
                    AppTheme.borderRadiusLarge,
                  ),
                  child: Image.network(
                    conversation.avatar!,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) => Icon(
                      conversation.type == ConversationType.group
                          ? Icons.group
                          : Icons.person,
                      color: AppTheme.primaryColor,
                      size: 24,
                    ),
                  ),
                )
              : Icon(
                  conversation.type == ConversationType.group
                      ? Icons.group
                      : Icons.person,
                  color: AppTheme.primaryColor,
                  size: 24,
                ),
        ),
        title: Text(
          conversation.title,
          style: AppTheme.subheadingStyle.copyWith(
            fontSize: AppTheme.fontSizeL,
            fontWeight: conversation.unreadCount > 0
                ? FontWeight.w600
                : FontWeight.normal,
            color: AppTheme.textPrimaryColor,
          ),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: AppTheme.spacingXS),
            if (conversation.lastMessage != null)
              Text(
                conversation.lastMessage!,
                style: AppTheme.bodyStyle.copyWith(
                  color: AppTheme.textSecondaryColor,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            const SizedBox(height: AppTheme.spacingXS),
            Text(
              _formatTime(conversation.lastMessageTime),
              style: AppTheme.captionStyle,
            ),
          ],
        ),
        trailing: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            if (conversation.unreadCount > 0)
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: AppTheme.spacingS,
                  vertical: 2,
                ),
                decoration: BoxDecoration(
                  color: AppTheme.errorColor,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  conversation.unreadCount > 99
                      ? '99+'
                      : '${conversation.unreadCount}',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            const SizedBox(height: 4),
            const Icon(
              Icons.chevron_right_rounded,
              color: AppTheme.textLightColor,
              size: 18,
            ),
          ],
        ),
        onTap: () => _onConversationTap(conversation),
        onLongPress: () => _showConversationOptions(conversation),
      ),
    );
  }

  Widget _buildErrorState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.error_outline, size: 80, color: AppTheme.errorColor),
          const SizedBox(height: AppTheme.spacingM),
          Text(
            '加载失败',
            style: AppTheme.subheadingStyle.copyWith(
              color: AppTheme.textPrimaryColor,
            ),
          ),
          const SizedBox(height: AppTheme.spacingS),
          Text(
            _errorMessage ?? '未知错误',
            style: AppTheme.captionStyle,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: AppTheme.spacingM),
          ElevatedButton(
            onPressed: _loadConversations,
            child: const Text('重试'),
          ),
        ],
      ),
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.inbox_outlined, size: 80, color: AppTheme.textLightColor),
          const SizedBox(height: AppTheme.spacingM),
          Text(
            '暂无消息',
            style: AppTheme.subheadingStyle.copyWith(
              color: AppTheme.textSecondaryColor,
            ),
          ),
          const SizedBox(height: AppTheme.spacingS),
          Text(
            '当有新消息时，会在这里显示',
            style: AppTheme.captionStyle,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  void _onConversationTap(ChatConversation conversation) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => ChatDetailPage(conversation: conversation),
      ),
    );
  }

  void _showConversationOptions(ChatConversation conversation) {
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(AppTheme.borderRadiusLarge),
        ),
      ),
      builder: (context) => Container(
        padding: const EdgeInsets.all(AppTheme.spacingM),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: const Icon(Icons.mark_email_read),
              title: Text(conversation.unreadCount > 0 ? '标记为已读' : '标记为未读'),
              onTap: () {
                // TODO: 实现标记已读/未读功能
                Navigator.of(context).pop();
              },
            ),
            ListTile(
              leading: const Icon(Icons.pin_drop),
              title: const Text('置顶会话'),
              onTap: () {
                // TODO: 实现置顶功能
                Navigator.of(context).pop();
              },
            ),
            ListTile(
              leading: const Icon(Icons.delete, color: AppTheme.errorColor),
              title: Text('删除会话', style: TextStyle(color: AppTheme.errorColor)),
              onTap: () {
                // TODO: 实现删除会话功能
                Navigator.of(context).pop();
              },
            ),
          ],
        ),
      ),
    );
  }

  String _formatTime(DateTime? time) {
    if (time == null) return '';

    final now = DateTime.now();
    final difference = now.difference(time);

    if (difference.inDays > 0) {
      return '${difference.inDays}天前';
    } else if (difference.inHours > 0) {
      return '${difference.inHours}小时前';
    } else if (difference.inMinutes > 0) {
      return '${difference.inMinutes}分钟前';
    } else {
      return '刚刚';
    }
  }
}
