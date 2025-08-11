import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

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
      avatarColor: Colors.blue,
    ),
    MessageItem(
      id: '2',
      title: '订单更新',
      content: '您的订单 #12345 已发货，预计明天送达',
      time: '5分钟前',
      isRead: false,
      type: MessageType.order,
      avatar: Icons.local_shipping,
      avatarColor: Colors.green,
    ),
    MessageItem(
      id: '3',
      title: '优惠活动',
      content: '限时优惠！全场商品8折，仅限今日',
      time: '1小时前',
      isRead: true,
      type: MessageType.promotion,
      avatar: Icons.local_offer,
      avatarColor: Colors.orange,
    ),
    MessageItem(
      id: '4',
      title: '客服消息',
      content: '您好，有什么可以帮助您的吗？',
      time: '2小时前',
      isRead: true,
      type: MessageType.service,
      avatar: Icons.support_agent,
      avatarColor: Colors.purple,
    ),
    MessageItem(
      id: '5',
      title: '账户安全',
      content: '检测到新设备登录，如非本人操作请及时修改密码',
      time: '1天前',
      isRead: true,
      type: MessageType.security,
      avatar: Icons.security,
      avatarColor: Colors.red,
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
      backgroundColor: AppTheme.backgroundColor,
      appBar: AppBar(
        title: Text(
          '消息中心',
          style: AppTheme.headingStyle.copyWith(
            fontSize: AppTheme.fontSizeXL,
            color: AppTheme.textPrimaryColor,
          ),
        ),
        backgroundColor: AppTheme.surfaceColor,
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.more_vert),
            onPressed: () {
              _showMoreOptions();
            },
          ),
        ],
      ),
      body: Column(
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
    );
  }

  Widget _buildSearchBar() {
    return Container(
      margin: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: TextField(
        controller: _searchController,
        onChanged: (value) {
          setState(() {
            _searchQuery = value;
          });
        },
        decoration: InputDecoration(
          hintText: '搜索消息...',
          prefixIcon: const Icon(Icons.search, color: Colors.grey),
          suffixIcon: _searchQuery.isNotEmpty
              ? IconButton(
                  icon: const Icon(Icons.clear, color: Colors.grey),
                  onPressed: () {
                    _searchController.clear();
                    setState(() {
                      _searchQuery = '';
                    });
                  },
                )
              : null,
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        ),
      ),
    );
  }

  Widget _buildCategoryTabs() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: TabBar(
        controller: _tabController,
        indicator: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Colors.blue[100],
        ),
        labelColor: Colors.blue[700],
        unselectedLabelColor: Colors.grey[600],
        labelStyle: const TextStyle(fontWeight: FontWeight.w600),
        unselectedLabelStyle: const TextStyle(fontWeight: FontWeight.normal),
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
      padding: const EdgeInsets.all(16),
      itemCount: messages.length,
      itemBuilder: (context, index) {
        final message = messages[index];
        return _buildMessageItem(message);
      },
    );
  }

  Widget _buildMessageItem(MessageItem message) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.all(16),
        leading: Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            color: message.avatarColor.withOpacity(0.1),
            borderRadius: BorderRadius.circular(25),
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
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: message.isRead ? FontWeight.normal : FontWeight.w600,
                  color: message.isRead ? Colors.grey[700] : Colors.black,
                ),
              ),
            ),
            if (!message.isRead)
              Container(
                width: 8,
                height: 8,
                decoration: const BoxDecoration(
                  color: Colors.red,
                  shape: BoxShape.circle,
                ),
              ),
          ],
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 4),
            Text(
              message.content,
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey[600],
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 8),
            Text(
              message.time,
              style: TextStyle(
                fontSize: 12,
                color: Colors.grey[500],
              ),
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
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.inbox_outlined,
            size: 80,
            color: Colors.grey[400],
          ),
          const SizedBox(height: 16),
          Text(
            '暂无消息',
            style: TextStyle(
              fontSize: 18,
              color: Colors.grey[600],
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            '当有新消息时，会在这里显示',
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey[500],
            ),
          ),
        ],
      ),
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
        title: Row(
          children: [
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: message.avatarColor.withOpacity(0.1),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Icon(
                message.avatar,
                color: message.avatarColor,
                size: 20,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                message.title,
                style: const TextStyle(fontSize: 18),
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
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 16),
            Text(
              '时间: ${message.time}',
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey[600],
              ),
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
      builder: (context) => Container(
        padding: const EdgeInsets.all(16),
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
              leading: const Icon(Icons.delete, color: Colors.red),
              title: const Text('删除消息', style: TextStyle(color: Colors.red)),
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
      builder: (context) => Container(
        padding: const EdgeInsets.all(16),
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

