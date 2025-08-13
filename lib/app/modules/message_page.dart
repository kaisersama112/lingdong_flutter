import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../theme/app_components.dart';

class MessagePage extends StatefulWidget {
  const MessagePage({super.key});

  @override
  State<MessagePage> createState() => _MessagePageState();
}

class _MessagePageState extends State<MessagePage> with TickerProviderStateMixin {
  late TabController _tabController;
  final TextEditingController _searchController = TextEditingController();
  String _searchQuery = '';
  
  // 模拟消息数据
  final List<MessageItem> _allMessages = [
    MessageItem(
      id: '1',
      title: '系统通知',
      content: '您的账户已成功激活，现在可以使用所有功能了',
      time: '刚刚',
      isRead: false,
      type: MessageType.system,
      avatar: Icons.notifications,
      avatarColor: AppTheme.primaryColor,
    ),
    MessageItem(
      id: '2',
      title: '订单更新',
      content: '您的订单 #12345 已发货，预计明天送达',
      time: '5分钟前',
      isRead: false,
      type: MessageType.order,
      avatar: Icons.local_shipping,
      avatarColor: AppTheme.successColor,
    ),
    MessageItem(
      id: '3',
      title: '优惠活动',
      content: '限时优惠！全场商品8折，仅限今日',
      time: '1小时前',
      isRead: true,
      type: MessageType.promotion,
      avatar: Icons.local_offer,
      avatarColor: AppTheme.warningColor,
    ),
    MessageItem(
      id: '4',
      title: '客服消息',
      content: '您好，有什么可以帮助您的吗？',
      time: '2小时前',
      isRead: true,
      type: MessageType.service,
      avatar: Icons.support_agent,
      avatarColor: AppTheme.secondaryColor,
    ),
    MessageItem(
      id: '5',
      title: '账户安全',
      content: '检测到新设备登录，如非本人操作请及时修改密码',
      time: '1天前',
      isRead: true,
      type: MessageType.security,
      avatar: Icons.security,
      avatarColor: AppTheme.errorColor,
    ),
  ];

  List<MessageItem> get _filteredMessages {
    if (_searchQuery.isEmpty) {
      return _allMessages;
    }
    return _allMessages.where((message) =>
        message.title.toLowerCase().contains(_searchQuery.toLowerCase()) ||
        message.content.toLowerCase().contains(_searchQuery.toLowerCase())).toList();
  }

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: AppTheme.sunsetGradient,
        ),
        child: SafeArea(
          child: Column(
            children: [
              // 头部区域
              _buildHeader(),
              
              // 内容区域
              Expanded(
                child: Container(
                  decoration: const BoxDecoration(
                    color: AppTheme.backgroundColor,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(AppTheme.borderRadiusXLarge),
                      topRight: Radius.circular(AppTheme.borderRadiusXLarge),
                    ),
                  ),
                  child: Column(
                    children: [
                      // 搜索栏
                      _buildSearchBar(),
                      
                      // 分类标签
                      _buildCategoryTabs(),
                      
                      // 消息列表
                      Expanded(
                        child: _buildMessageList(),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      padding: const EdgeInsets.all(AppTheme.spacingL),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(AppTheme.spacingS),
            decoration: AppTheme.glassmorphismDecoration,
            child: const Icon(
              Icons.message,
              color: Colors.white,
              size: 24,
            ),
          ),
          const SizedBox(width: AppTheme.spacingM),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '消息中心',
                  style: AppTheme.headingStyle.copyWith(
                    color: Colors.white,
                    fontSize: AppTheme.fontSizeXXL,
                  ),
                ),
                Text(
                  '及时了解最新动态和通知',
                  style: AppTheme.captionStyle.copyWith(
                    color: Colors.white.withValues(alpha:0.8),
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(AppTheme.spacingS),
            decoration: AppTheme.glassmorphismDecoration,
            child: IconButton(
              icon: const Icon(Icons.more_vert, color: Colors.white),
              onPressed: () {
                _showMoreOptions();
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSearchBar() {
    return Container(
      margin: const EdgeInsets.all(AppTheme.spacingM),
      decoration: AppTheme.glassmorphismDecoration,
      child: TextField(
        controller: _searchController,
        onChanged: (value) {
          setState(() {
            _searchQuery = value;
          });
        },
        decoration: InputDecoration(
          hintText: '搜索消息...',
          hintStyle: TextStyle(color: AppTheme.textSecondaryColor),
          prefixIcon: const Icon(Icons.search, color: AppTheme.textSecondaryColor),
          suffixIcon: _searchQuery.isNotEmpty
              ? IconButton(
                  icon: const Icon(Icons.clear, color: AppTheme.textSecondaryColor),
                  onPressed: () {
                    _searchController.clear();
                    setState(() {
                      _searchQuery = '';
                    });
                  },
                )
              : null,
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(
            horizontal: AppTheme.spacingM,
            vertical: AppTheme.spacingM,
          ),
        ),
      ),
    );
  }

  Widget _buildCategoryTabs() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: AppTheme.spacingM),
      decoration: AppTheme.glassmorphismDecoration,
      child: TabBar(
        controller: _tabController,
        indicator: BoxDecoration(
          borderRadius: BorderRadius.circular(AppTheme.borderRadiusMedium),
          gradient: AppTheme.primaryGradient,
        ),
        labelColor: AppTheme.primaryColor,
        unselectedLabelColor: AppTheme.textSecondaryColor,
        labelStyle: AppTheme.subheadingStyle.copyWith(fontSize: AppTheme.fontSizeM),
        unselectedLabelStyle: AppTheme.bodyStyle,
        tabs: const [
          Tab(text: '全部'),
          Tab(text: '未读'),
          Tab(text: '系统'),
          Tab(text: '订单'),
        ],
      ),
    );
  }

  Widget _buildMessageList() {
    return TabBarView(
      controller: _tabController,
      children: [
        _buildMessageListView(_filteredMessages),
        _buildMessageListView(_filteredMessages.where((m) => !m.isRead).toList()),
        _buildMessageListView(_filteredMessages.where((m) => m.type == MessageType.system).toList()),
        _buildMessageListView(_filteredMessages.where((m) => m.type == MessageType.order).toList()),
      ],
    );
  }

  Widget _buildMessageListView(List<MessageItem> messages) {
    if (messages.isEmpty) {
      return _buildEmptyState();
    }

    return ListView.builder(
      padding: const EdgeInsets.all(AppTheme.spacingM),
      itemCount: messages.length,
      itemBuilder: (context, index) {
        final message = messages[index];
        return _buildMessageItem(message);
      },
    );
  }

  Widget _buildMessageItem(MessageItem message) {
    return Container(
      margin: const EdgeInsets.only(bottom: AppTheme.spacingM),
      decoration: AppTheme.cardDecoration,
      child: ListTile(
        contentPadding: const EdgeInsets.all(AppTheme.spacingM),
        leading: Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                message.avatarColor.withValues(alpha:0.2),
                message.avatarColor.withValues(alpha:0.1),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(AppTheme.borderRadiusLarge),
            border: Border.all(
              color: message.avatarColor.withValues(alpha:0.3),
              width: 1,
            ),
          ),
          child: Icon(
            message.avatar,
            color: message.avatarColor,
            size: 24,
          ),
        ),
        title: Row(
          children: [
            Expanded(
              child: Text(
                message.title,
                style: AppTheme.subheadingStyle.copyWith(
                  fontSize: AppTheme.fontSizeL,
                  fontWeight: message.isRead ? FontWeight.normal : FontWeight.w600,
                  color: message.isRead ? AppTheme.textSecondaryColor : AppTheme.textPrimaryColor,
                ),
              ),
            ),
            if (!message.isRead)
              Container(
                width: 8,
                height: 8,
                decoration: BoxDecoration(
                  color: AppTheme.errorColor,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: AppTheme.errorColor.withValues(alpha:0.3),
                      blurRadius: 4,
                      spreadRadius: 1,
                    ),
                  ],
                ),
              ),
          ],
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: AppTheme.spacingXS),
            Text(
              message.content,
              style: AppTheme.bodyStyle.copyWith(
                color: AppTheme.textSecondaryColor,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: AppTheme.spacingS),
            Text(
              message.time,
              style: AppTheme.captionStyle,
            ),
          ],
        ),
        onTap: () {
          _onMessageTap(message);
        },
        onLongPress: () {
          _showMessageOptions(message);
        },
      ),
    );
  }

  Widget _buildEmptyState() {
    return AppComponents.emptyState(
      icon: Icons.inbox_outlined,
      title: '暂无消息',
      subtitle: '当有新消息时，会在这里显示',
      iconColor: AppTheme.textLightColor,
    );
  }

  void _onMessageTap(MessageItem message) {
    // 标记为已读
    setState(() {
      message.isRead = true;
    });
    
    // 显示消息详情
    _showMessageDetail(message);
  }

  void _showMessageDetail(MessageItem message) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppTheme.borderRadiusLarge),
        ),
        title: Row(
          children: [
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    message.avatarColor.withValues(alpha:0.2),
                    message.avatarColor.withValues(alpha:0.1),
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(AppTheme.borderRadiusLarge),
                border: Border.all(
                  color: message.avatarColor.withValues(alpha:0.3),
                  width: 1,
                ),
              ),
              child: Icon(
                message.avatar,
                color: message.avatarColor,
                size: 20,
              ),
            ),
            const SizedBox(width: AppTheme.spacingM),
            Expanded(
              child: Text(
                message.title,
                style: AppTheme.subheadingStyle,
              ),
            ),
          ],
        ),
        content: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              message.content,
              style: AppTheme.bodyStyle,
            ),
            const SizedBox(height: AppTheme.spacingM),
            AppComponents.infoRow(
              label: '时间',
              value: message.time,
              labelStyle: AppTheme.captionStyle.copyWith(
                color: AppTheme.textSecondaryColor,
              ),
              valueStyle: AppTheme.captionStyle,
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('关闭'),
          ),
        ],
      ),
    );
  }

  void _showMessageOptions(MessageItem message) {
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
              title: Text(message.isRead ? '标记为未读' : '标记为已读'),
              onTap: () {
                setState(() {
                  message.isRead = !message.isRead;
                });
                Navigator.of(context).pop();
              },
            ),
            ListTile(
              leading: const Icon(Icons.delete, color: AppTheme.errorColor),
              title: Text(
                '删除消息',
                style: TextStyle(color: AppTheme.errorColor),
              ),
              onTap: () {
                setState(() {
                  _allMessages.remove(message);
                });
                Navigator.of(context).pop();
              },
            ),
          ],
        ),
      ),
    );
  }

  void _showMoreOptions() {
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
              title: const Text('全部标记为已读'),
              onTap: () {
                setState(() {
                  for (var message in _allMessages) {
                    message.isRead = true;
                  }
                });
                Navigator.of(context).pop();
              },
            ),
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text('消息设置'),
              onTap: () {
                Navigator.of(context).pop();
                _showSettings();
              },
            ),
            ListTile(
              leading: const Icon(Icons.help_outline),
              title: const Text('帮助与反馈'),
              onTap: () {
                Navigator.of(context).pop();
                _showHelp();
              },
            ),
          ],
        ),
      ),
    );
  }

  void _showSettings() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('消息设置功能开发中...')),
    );
  }

  void _showHelp() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('帮助与反馈功能开发中...')),
    );
  }
}

// 消息类型枚举
enum MessageType {
  system,
  order,
  promotion,
  service,
  security,
}

// 消息数据模型
class MessageItem {
  final String id;
  final String title;
  final String content;
  final String time;
  bool isRead;
  final MessageType type;
  final IconData avatar;
  final Color avatarColor;

  MessageItem({
    required this.id,
    required this.title,
    required this.content,
    required this.time,
    required this.isRead,
    required this.type,
    required this.avatar,
    required this.avatarColor,
  });
}

