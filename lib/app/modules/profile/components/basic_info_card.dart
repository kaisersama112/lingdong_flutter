import 'package:flutter/material.dart';
import '../../../theme/app_theme.dart';
import '../../../core/components.dart';
import '../../../core/models.dart';

class BasicInfoCard extends StatelessWidget {
  final UserProfile userProfile;
  final VoidCallback onEditPhone;
  final VoidCallback onEditEmail;
  final VoidCallback onEditAddress;

  const BasicInfoCard({
    super.key,
    required this.userProfile,
    required this.onEditPhone,
    required this.onEditEmail,
    required this.onEditAddress,
  });

  @override
  Widget build(BuildContext context) {
    return PetAppComponents.buildCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(Icons.info_outline, color: AppTheme.primaryColor),
              const SizedBox(width: AppTheme.spacingS),
              Text(
                '基本信息',
                style: const TextStyle(
                  fontSize: AppTheme.fontSizeL,
                  fontWeight: FontWeight.bold,
                  color: AppTheme.textPrimaryColor,
                ),
              ),
            ],
          ),
          const SizedBox(height: AppTheme.spacingM),

          _buildInfoItem(
            icon: Icons.phone,
            label: '手机号',
            value: userProfile.phone,
            onTap: onEditPhone,
          ),
          _buildInfoItem(
            icon: Icons.email,
            label: '邮箱',
            value: userProfile.email,
            onTap: onEditEmail,
          ),
          _buildInfoItem(
            icon: Icons.location_on,
            label: '地址',
            value: userProfile.address,
            onTap: onEditAddress,
          ),
          _buildInfoItem(
            icon: Icons.calendar_today,
            label: '注册时间',
            value:
                '${userProfile.joinDate.year}年${userProfile.joinDate.month}月${userProfile.joinDate.day}日',
            onTap: null,
            showDivider: false,
          ),
        ],
      ),
    );
  }

  Widget _buildInfoItem({
    required IconData icon,
    required String label,
    required String value,
    required VoidCallback? onTap,
    bool showDivider = true,
  }) {
    return Column(
      children: [
        ListTile(
          leading: Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: AppTheme.primaryColor.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(icon, color: AppTheme.primaryColor, size: 20),
          ),
          title: Text(
            label,
            style: const TextStyle(
              fontWeight: FontWeight.w600,
              color: AppTheme.textPrimaryColor,
            ),
          ),
          subtitle: Text(
            value,
            style: TextStyle(
              color: AppTheme.textSecondaryColor,
              fontSize: AppTheme.fontSizeM,
            ),
          ),
          trailing: onTap != null
              ? const Icon(Icons.edit, color: AppTheme.primaryColor, size: 20)
              : null,
          onTap: onTap,
        ),
        if (showDivider)
          Divider(color: AppTheme.dividerColor, height: 1, indent: 56),
      ],
    );
  }
}
