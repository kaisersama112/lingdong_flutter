import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../services/chat_service.dart';
import '../core/models/chat_models.dart';

class ChatDetailPage extends StatefulWidget {
  final ChatConversation conversation;

  const ChatDetailPage({super.key, required this.conversation});

  @override
  State<ChatDetailPage> createState() => _ChatDetailPageState();
}

class _ChatDetailPageState extends State<ChatDetailPage> {
  final ChatService _chatService = ChatService();
  final TextEditingController _messageController = TextEditingController();
  final ScrollController _scrollController = ScrollController();

  List<ChatMessage> _messages = [];
  bool _isLoading = false;
  String? _errorMessage;

  @override
  void initState() {
    super.initState();
    _loadMessages();
  }

  @override
  void dispose() {
    _messageController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  /// 加载消息列表
  Future<void> _loadMessages() async {
    setState(() {
      _isLoading = true;
      _errorMessage = null;
    });

    try {
      final messages = await _chatService.getConversationMessages(
        widget.conversation.sessionId,
      );
      setState(() {
        _messages = messages;
        _isLoading = false;
      });
      _scrollToBottom();
    } catch (e) {
      setState(() {
        _errorMessage = e.toString();
        _isLoading = false;
      });
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('加载消息失败: $e'),
            backgroundColor: AppTheme.errorColor,
          ),
        );
      }
    }
  }

  /// 发送消息
  Future<void> _sendMessage() async {
    final content = _messageController.text.trim();
    if (content.isEmpty) return;

    _messageController.clear();

    try {
      final request = SendMessageRequest(
        conversationId: widget.conversation.sessionId,
        content: content,
        type: ChatMessageType.text,
      );

      ChatMessage message;
      if (widget.conversation.type == ConversationType.group) {
        message = await _chatService.sendGroupMessage(request);
      } else {
        message = await _chatService.sendMessage(request);
      }

      setState(() {
        _messages.add(message);
      });
      _scrollToBottom();
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('发送失败: $e'),
            backgroundColor: AppTheme.errorColor,
          ),
        );
      }
    }
  }

  /// 滚动到底部
  void _scrollToBottom() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_scrollController.hasClients) {
        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.backgroundColor,
      appBar: AppBar(
        backgroundColor: AppTheme.primaryColor,
        foregroundColor: Colors.white,
        title: Row(
          children: [
            CircleAvatar(
              radius: 20,
              backgroundImage: widget.conversation.avatar != null
                  ? NetworkImage(widget.conversation.avatar!)
                  : null,
              child: widget.conversation.avatar == null
                  ? Icon(
                      widget.conversation.type == ConversationType.group
                          ? Icons.group
                          : Icons.person,
                      color: Colors.white,
                    )
                  : null,
            ),
            const SizedBox(width: AppTheme.spacingM),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.conversation.title,
                    style: const TextStyle(
                      fontSize: AppTheme.fontSizeL,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  if (widget.conversation.type == ConversationType.group)
                    const Text(
                      '群聊',
                      style: TextStyle(
                        fontSize: AppTheme.fontSizeS,
                        color: Colors.white70,
                      ),
                    ),
                ],
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.more_vert),
            onPressed: _showMoreOptions,
          ),
        ],
      ),
      body: Column(
        children: [
          // 消息列表
          Expanded(child: _buildMessagesList()),
          // 输入框
          _buildInputArea(),
        ],
      ),
    );
  }

  Widget _buildMessagesList() {
    if (_isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    if (_errorMessage != null) {
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
            ElevatedButton(onPressed: _loadMessages, child: const Text('重试')),
          ],
        ),
      );
    }

    if (_messages.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.chat_bubble_outline,
              size: 80,
              color: AppTheme.textLightColor,
            ),
            const SizedBox(height: AppTheme.spacingM),
            Text(
              '暂无消息',
              style: AppTheme.subheadingStyle.copyWith(
                color: AppTheme.textSecondaryColor,
              ),
            ),
            const SizedBox(height: AppTheme.spacingS),
            Text('开始聊天吧！', style: AppTheme.captionStyle),
          ],
        ),
      );
    }

    return ListView.builder(
      controller: _scrollController,
      padding: const EdgeInsets.all(AppTheme.spacingM),
      itemCount: _messages.length,
      itemBuilder: (context, index) {
        final message = _messages[index];
        return _buildMessageItem(message);
      },
    );
  }

  Widget _buildMessageItem(ChatMessage message) {
    final isMe = message.senderId == 'current_user'; // TODO: 获取当前用户ID
    final isGroup = widget.conversation.type == ConversationType.group;

    return Container(
      margin: const EdgeInsets.only(bottom: AppTheme.spacingM),
      child: Row(
        mainAxisAlignment: isMe
            ? MainAxisAlignment.end
            : MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (!isMe && isGroup)
            Container(
              margin: const EdgeInsets.only(right: AppTheme.spacingS),
              child: CircleAvatar(
                radius: 16,
                backgroundImage: message.senderAvatar != null
                    ? NetworkImage(message.senderAvatar!)
                    : null,
                child: message.senderAvatar == null
                    ? const Icon(Icons.person, size: 16)
                    : null,
              ),
            ),
          Flexible(
            child: Container(
              constraints: BoxConstraints(
                maxWidth: MediaQuery.of(context).size.width * 0.7,
              ),
              padding: const EdgeInsets.symmetric(
                horizontal: AppTheme.spacingM,
                vertical: AppTheme.spacingS,
              ),
              decoration: BoxDecoration(
                color: isMe ? AppTheme.primaryColor : Colors.grey[200],
                borderRadius: BorderRadius.circular(
                  AppTheme.borderRadiusMedium,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (!isMe && isGroup)
                    Text(
                      message.senderName,
                      style: TextStyle(
                        fontSize: AppTheme.fontSizeS,
                        fontWeight: FontWeight.bold,
                        color: AppTheme.textPrimaryColor,
                      ),
                    ),
                  if (!isMe && isGroup) const SizedBox(height: 2),
                  Text(
                    message.content,
                    style: TextStyle(
                      color: isMe ? Colors.white : AppTheme.textPrimaryColor,
                      fontSize: AppTheme.fontSizeM,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    _formatTime(message.createdAt),
                    style: TextStyle(
                      fontSize: AppTheme.fontSizeXS,
                      color: isMe
                          ? Colors.white70
                          : AppTheme.textSecondaryColor,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInputArea() {
    return Container(
      padding: const EdgeInsets.all(AppTheme.spacingM),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.1),
            blurRadius: 4,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: Row(
        children: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: _showAttachmentOptions,
          ),
          Expanded(
            child: TextField(
              controller: _messageController,
              decoration: const InputDecoration(
                hintText: '输入消息...',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(AppTheme.borderRadiusLarge),
                  ),
                ),
                contentPadding: EdgeInsets.symmetric(
                  horizontal: AppTheme.spacingM,
                  vertical: AppTheme.spacingS,
                ),
              ),
              maxLines: null,
              textInputAction: TextInputAction.send,
              onSubmitted: (_) => _sendMessage(),
            ),
          ),
          const SizedBox(width: AppTheme.spacingS),
          IconButton(
            icon: const Icon(Icons.send),
            onPressed: _sendMessage,
            style: IconButton.styleFrom(
              backgroundColor: AppTheme.primaryColor,
              foregroundColor: Colors.white,
            ),
          ),
        ],
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
              leading: const Icon(Icons.info_outline),
              title: const Text('会话信息'),
              onTap: () {
                Navigator.of(context).pop();
                _showConversationInfo();
              },
            ),
            if (widget.conversation.type == ConversationType.group)
              ListTile(
                leading: const Icon(Icons.group),
                title: const Text('群成员'),
                onTap: () {
                  Navigator.of(context).pop();
                  _showGroupMembers();
                },
              ),
            ListTile(
              leading: const Icon(Icons.clear_all),
              title: const Text('清空聊天记录'),
              onTap: () {
                Navigator.of(context).pop();
                _clearMessages();
              },
            ),
          ],
        ),
      ),
    );
  }

  void _showAttachmentOptions() {
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
              leading: const Icon(Icons.photo),
              title: const Text('图片'),
              onTap: () {
                Navigator.of(context).pop();
                // TODO: 实现图片选择
              },
            ),
            ListTile(
              leading: const Icon(Icons.videocam),
              title: const Text('视频'),
              onTap: () {
                Navigator.of(context).pop();
                // TODO: 实现视频选择
              },
            ),
            ListTile(
              leading: const Icon(Icons.attach_file),
              title: const Text('文件'),
              onTap: () {
                Navigator.of(context).pop();
                // TODO: 实现文件选择
              },
            ),
          ],
        ),
      ),
    );
  }

  void _showConversationInfo() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(widget.conversation.title),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('会话ID: ${widget.conversation.sessionId}'),
            Text(
              '类型: ${widget.conversation.type == ConversationType.group ? '群聊' : '单聊'}',
            ),
            Text('参与者: ${widget.conversation.participants.length}人'),
            Text('未读消息: ${widget.conversation.unreadCount}'),
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

  void _showGroupMembers() {
    // TODO: 实现群成员列表
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(const SnackBar(content: Text('群成员功能开发中...')));
  }

  void _clearMessages() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('清空聊天记录'),
        content: const Text('确定要清空所有聊天记录吗？此操作不可撤销。'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('取消'),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              setState(() {
                _messages.clear();
              });
            },
            child: const Text('确定'),
          ),
        ],
      ),
    );
  }

  String _formatTime(DateTime time) {
    final now = DateTime.now();
    final difference = now.difference(time);

    if (difference.inDays > 0) {
      return '${time.month}/${time.day} ${time.hour.toString().padLeft(2, '0')}:${time.minute.toString().padLeft(2, '0')}';
    } else if (difference.inHours > 0) {
      return '${difference.inHours}小时前';
    } else if (difference.inMinutes > 0) {
      return '${difference.inMinutes}分钟前';
    } else {
      return '刚刚';
    }
  }
}
