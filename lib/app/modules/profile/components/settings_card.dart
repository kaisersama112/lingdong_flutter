import 'package:flutter/material.dart';
import '../../../theme/app_theme.dart';

class SettingsCard extends StatelessWidget {
  final VoidCallback onOpenNotificationSettings;
  final VoidCallback onOpenPrivacySettings;
  final VoidCallback onOpenLanguageSettings;
  final VoidCallback onOpenHelpCenter;
  final VoidCallback onOpenAboutPage;
  final VoidCallback onOpenSettings;

  const SettingsCard({
    super.key,
    required this.onOpenNotificationSettings,
    required this.onOpenPrivacySettings,
    required this.onOpenLanguageSettings,
    required this.onOpenHelpCenter,
    required this.onOpenAboutPage,
    required this.onOpenSettings,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: AppTheme.cardDecoration,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 设置标题
          Padding(
            padding: const EdgeInsets.all(AppTheme.spacingL),
            child: Row(
              children: [
                Icon(Icons.settings, color: AppTheme.primaryColor, size: 24),
                const SizedBox(width: AppTheme.spacingM),
                Text(
                  '设置',
                  style: TextStyle(
                    fontSize: AppTheme.fontSizeXL,
                    fontWeight: FontWeight.bold,
                    color: AppTheme.textPrimaryColor,
                  ),
                ),
              ],
            ),
          ),

          // 设置选项列表
          _buildSettingItem(
            icon: Icons.notifications,
            title: '消息通知',
            subtitle: '管理推送和消息设置',
            onTap: onOpenNotificationSettings,
          ),

          _buildSettingItem(
            icon: Icons.security,
            title: '隐私设置',
            subtitle: '管理账户隐私和安全',
            onTap: onOpenPrivacySettings,
          ),

          _buildSettingItem(
            icon: Icons.language,
            title: '语言设置',
            subtitle: '简体中文',
            onTap: onOpenLanguageSettings,
          ),

          _buildSettingItem(
            icon: Icons.help,
            title: '帮助与反馈',
            subtitle: '常见问题和使用帮助',
            onTap: onOpenHelpCenter,
          ),

          _buildSettingItem(
            icon: Icons.info,
            title: '关于我们',
            subtitle: '版本信息 v1.0.0',
            onTap: onOpenAboutPage,
          ),

          const SizedBox(height: AppTheme.spacingM),

          // 设置入口
          _buildSettingItem(
            icon: Icons.settings,
            title: '更多设置',
            subtitle: '查看完整设置选项',
            onTap: onOpenSettings,
          ),

          const SizedBox(height: AppTheme.spacingL),
        ],
      ),
    );
  }

  // 构建设置项
  Widget _buildSettingItem({
    required IconData icon,
    required String title,
    required String subtitle,
    required VoidCallback onTap,
  }) {
    return Column(
      children: [
        ListTile(
          leading: Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: AppTheme.primaryLightColor,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(icon, color: AppTheme.primaryColor, size: 20),
          ),
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
        Divider(color: AppTheme.dividerColor, height: 1, indent: 56),
      ],
    );
  }
}
