import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';
import '../../core/error_handler.dart';
import '../../services/logout_service.dart';
import '../../services/mock_data_service.dart';
import '../../core/models.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  late UserProfile _userProfile;
  bool _notificationsEnabled = true;
  bool _soundEnabled = true;
  bool _vibrationEnabled = false;
  String _selectedLanguage = '简体中文';
  String _selectedTheme = '跟随系统';

  @override
  void initState() {
    super.initState();
    _userProfile = MockDataService.getUserProfile();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.backgroundColor,
      appBar: AppBar(
        title: const Text('设置'),
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: IconThemeData(color: AppTheme.textPrimaryColor),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: AppTheme.spacingM),

            // 个人信息设置
            _buildSettingsSection(
              title: '个人信息',
              icon: Icons.person,
              children: [
                _buildListSetting(
                  title: '编辑资料',
                  subtitle: '修改头像、姓名、简介等',
                  onTap: () => _editProfile(),
                ),
                _buildListSetting(
                  title: '修改手机号',
                  subtitle: _userProfile.phone,
                  onTap: () => _editPhone(),
                ),
                _buildListSetting(
                  title: '修改邮箱',
                  subtitle: _userProfile.email,
                  onTap: () => _editEmail(),
                ),
                _buildListSetting(
                  title: '修改地址',
                  subtitle: _userProfile.address,
                  onTap: () => _editAddress(),
                ),
              ],
            ),

            const SizedBox(height: AppTheme.spacingL),

            // 通知设置
            _buildSettingsSection(
              title: '通知设置',
              icon: Icons.notifications,
              children: [
                _buildSwitchSetting(
                  title: '推送通知',
                  subtitle: '接收应用推送消息',
                  value: _notificationsEnabled,
                  onChanged: (value) {
                    setState(() {
                      _notificationsEnabled = value;
                    });
                  },
                ),
                _buildSwitchSetting(
                  title: '声音提醒',
                  subtitle: '收到消息时播放提示音',
                  value: _soundEnabled,
                  onChanged: (value) {
                    setState(() {
                      _soundEnabled = value;
                    });
                  },
                ),
                _buildSwitchSetting(
                  title: '震动提醒',
                  subtitle: '收到消息时震动提醒',
                  value: _vibrationEnabled,
                  onChanged: (value) {
                    setState(() {
                      _vibrationEnabled = value;
                    });
                  },
                ),
              ],
            ),

            const SizedBox(height: AppTheme.spacingL),

            // 应用设置
            _buildSettingsSection(
              title: '应用设置',
              icon: Icons.settings,
              children: [
                _buildListSetting(
                  title: '语言设置',
                  subtitle: _selectedLanguage,
                  onTap: () => _showLanguageDialog(),
                ),
                _buildListSetting(
                  title: '主题设置',
                  subtitle: _selectedTheme,
                  onTap: () => _showThemeDialog(),
                ),
                _buildListSetting(
                  title: '清除缓存',
                  subtitle: '释放存储空间',
                  onTap: () => _clearCache(),
                ),
              ],
            ),

            const SizedBox(height: AppTheme.spacingL),

            // 隐私设置
            _buildSettingsSection(
              title: '隐私设置',
              icon: Icons.security,
              children: [
                _buildListSetting(
                  title: '隐私政策',
                  subtitle: '查看隐私保护条款',
                  onTap: () => _openPrivacyPolicy(),
                ),
                _buildListSetting(
                  title: '用户协议',
                  subtitle: '查看用户服务协议',
                  onTap: () => _openUserAgreement(),
                ),
                _buildListSetting(
                  title: '数据导出',
                  subtitle: '导出个人数据',
                  onTap: () => _exportData(),
                ),
              ],
            ),

            const SizedBox(height: AppTheme.spacingL),

            // 关于
            _buildSettingsSection(
              title: '关于',
              icon: Icons.info,
              children: [
                _buildListSetting(
                  title: '版本信息',
                  subtitle: 'v1.0.0',
                  onTap: () => _showVersionInfo(),
                ),
                _buildListSetting(
                  title: '帮助中心',
                  subtitle: '常见问题解答',
                  onTap: () => _openHelpCenter(),
                ),
                _buildListSetting(
                  title: '意见反馈',
                  subtitle: '告诉我们您的建议',
                  onTap: () => _openFeedback(),
                ),
              ],
            ),

            const SizedBox(height: AppTheme.spacingXL),

            // 退出登录按钮
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: AppTheme.spacingL,
              ),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppTheme.errorColor,
                    foregroundColor: Colors.white,
                    elevation: 0,
                    padding: const EdgeInsets.symmetric(
                      horizontal: AppTheme.spacingL,
                      vertical: AppTheme.spacingM,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                        AppTheme.borderRadiusMedium,
                      ),
                    ),
                  ),
                  onPressed: () => LogoutService.showLogoutDialog(context),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(Icons.logout, size: 20),
                      const SizedBox(width: AppTheme.spacingM),
                      Text(
                        '退出登录',
                        style: TextStyle(
                          fontSize: AppTheme.fontSizeL,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            const SizedBox(height: AppTheme.spacingL),
          ],
        ),
      ),
    );
  }

  // 构建设置区域
  Widget _buildSettingsSection({
    required String title,
    required IconData icon,
    required List<Widget> children,
  }) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: AppTheme.spacingL),
      decoration: AppTheme.cardDecoration,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 区域标题
          Padding(
            padding: const EdgeInsets.all(AppTheme.spacingL),
            child: Row(
              children: [
                Icon(icon, color: AppTheme.primaryColor, size: 24),
                const SizedBox(width: AppTheme.spacingM),
                Text(
                  title,
                  style: TextStyle(
                    fontSize: AppTheme.fontSizeXL,
                    fontWeight: FontWeight.bold,
                    color: AppTheme.textPrimaryColor,
                  ),
                ),
              ],
            ),
          ),

          // 设置项
          ...children,
        ],
      ),
    );
  }

  // 构建开关设置项
  Widget _buildSwitchSetting({
    required String title,
    required String subtitle,
    required bool value,
    required ValueChanged<bool> onChanged,
  }) {
    return Column(
      children: [
        ListTile(
          title: Text(
            title,
            style: TextStyle(
              fontSize: AppTheme.fontSizeL,
              fontWeight: FontWeight.w600,
              color: AppTheme.textPrimaryColor,
            ),
          ),
          subtitle: Text(
            subtitle,
            style: TextStyle(
              color: AppTheme.textSecondaryColor,
              fontSize: AppTheme.fontSizeM,
            ),
          ),
          trailing: Switch(
            value: value,
            onChanged: onChanged,
            activeColor: AppTheme.primaryColor,
          ),
        ),
        Divider(
          color: AppTheme.dividerColor,
          height: 1,
          indent: AppTheme.spacingL,
        ),
      ],
    );
  }

  // 构建列表设置项
  Widget _buildListSetting({
    required String title,
    required String subtitle,
    required VoidCallback onTap,
  }) {
    return Column(
      children: [
        ListTile(
          title: Text(
            title,
            style: TextStyle(
              fontSize: AppTheme.fontSizeL,
              fontWeight: FontWeight.w600,
              color: AppTheme.textPrimaryColor,
            ),
          ),
          subtitle: Text(
            subtitle,
            style: TextStyle(
              color: AppTheme.textSecondaryColor,
              fontSize: AppTheme.fontSizeM,
            ),
          ),
          trailing: const Icon(
            Icons.arrow_forward_ios,
            color: AppTheme.textLightColor,
            size: 16,
          ),
          onTap: onTap,
        ),
        Divider(
          color: AppTheme.dividerColor,
          height: 1,
          indent: AppTheme.spacingL,
        ),
      ],
    );
  }

  // 显示语言选择对话框
  void _showLanguageDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('选择语言'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              _buildLanguageOption('简体中文'),
              _buildLanguageOption('English'),
              _buildLanguageOption('日本語'),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text('取消'),
            ),
          ],
        );
      },
    );
  }

  // 构建语言选项
  Widget _buildLanguageOption(String language) {
    return ListTile(
      title: Text(language),
      trailing: _selectedLanguage == language
          ? Icon(Icons.check, color: AppTheme.primaryColor)
          : null,
      onTap: () {
        setState(() {
          _selectedLanguage = language;
        });
        Navigator.of(context).pop();
      },
    );
  }

  // 显示主题选择对话框
  void _showThemeDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('选择主题'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              _buildThemeOption('跟随系统'),
              _buildThemeOption('浅色主题'),
              _buildThemeOption('深色主题'),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text('取消'),
            ),
          ],
        );
      },
    );
  }

  // 构建主题选项
  Widget _buildThemeOption(String theme) {
    return ListTile(
      title: Text(theme),
      trailing: _selectedTheme == theme
          ? Icon(Icons.check, color: AppTheme.primaryColor)
          : null,
      onTap: () {
        setState(() {
          _selectedTheme = theme;
        });
        Navigator.of(context).pop();
      },
    );
  }

  // 清除缓存
  void _clearCache() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('清除缓存'),
          content: const Text('确定要清除应用缓存吗？这将释放一些存储空间。'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text('取消'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
                _performClearCache();
              },
              child: Text('确定'),
            ),
          ],
        );
      },
    );
  }

  // 执行清除缓存
  void _performClearCache() {
    // 这里应该实现实际的清除缓存逻辑
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Text('缓存清除成功'),
        backgroundColor: AppTheme.successColor,
      ),
    );
  }

  // 其他设置方法
  void _openPrivacyPolicy() {
    AppErrorHandler.handleError(context, '隐私政策页面开发中...');
  }

  void _openUserAgreement() {
    AppErrorHandler.handleError(context, '用户协议页面开发中...');
  }

  void _exportData() {
    AppErrorHandler.handleError(context, '数据导出功能开发中...');
  }

  void _showVersionInfo() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('版本信息'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('应用版本: v1.0.0'),
              SizedBox(height: AppTheme.spacingM),
              Text('构建版本: 2024.1.1'),
              SizedBox(height: AppTheme.spacingM),
              Text('开发者: 灵宠团队'),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text('确定'),
            ),
          ],
        );
      },
    );
  }

  void _openHelpCenter() {
    AppErrorHandler.handleError(context, '帮助中心页面开发中...');
  }

  void _openFeedback() {
    AppErrorHandler.handleError(context, '意见反馈功能开发中...');
  }

  // 个人信息编辑方法
  void _editProfile() {
    AppErrorHandler.handleError(context, '编辑资料功能开发中...');
  }

  void _editPhone() {
    AppErrorHandler.handleError(context, '编辑手机号功能开发中...');
  }

  void _editEmail() {
    AppErrorHandler.handleError(context, '编辑邮箱功能开发中...');
  }

  void _editAddress() {
    AppErrorHandler.handleError(context, '编辑地址功能开发中...');
  }
}
