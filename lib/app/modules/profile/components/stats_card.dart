import 'package:flutter/material.dart';
import '../../../theme/app_theme.dart';
import '../../../core/components.dart';

class StatsCard extends StatelessWidget {
  final int petCount;
  final String followingCount;
  final String followersCount;
  final String likesCount;

  const StatsCard({
    super.key,
    required this.petCount,
    required this.followingCount,
    required this.followersCount,
    required this.likesCount,
  });

  @override
  Widget build(BuildContext context) {
    return PetAppComponents.buildCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '我的统计',
            style: const TextStyle(
              fontSize: AppTheme.fontSizeL,
              fontWeight: FontWeight.bold,
              color: AppTheme.textPrimaryColor,
            ),
          ),
          const SizedBox(height: AppTheme.spacingM),

          Row(
            children: [
              Expanded(
                child: _buildStatItem(
                  icon: Icons.pets,
                  label: '宠物数量',
                  value: petCount.toString(),
                  color: AppTheme.primaryColor,
                ),
              ),
              Expanded(
                child: _buildStatItem(
                  icon: Icons.favorite,
                  label: '关注数',
                  value: followingCount,
                  color: AppTheme.secondaryColor,
                ),
              ),
              Expanded(
                child: _buildStatItem(
                  icon: Icons.people,
                  label: '粉丝数',
                  value: followersCount,
                  color: AppTheme.warningColor,
                ),
              ),
              Expanded(
                child: _buildStatItem(
                  icon: Icons.thumb_up,
                  label: '获赞数',
                  value: likesCount,
                  color: AppTheme.successColor,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildStatItem({
    required IconData icon,
    required String label,
    required String value,
    required Color color,
  }) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(AppTheme.spacingM),
          decoration: BoxDecoration(
            color: color.withValues(alpha: 0.1),
            borderRadius: BorderRadius.circular(AppTheme.borderRadiusMedium),
          ),
          child: Icon(icon, color: color, size: 24),
        ),
        const SizedBox(height: AppTheme.spacingS),
        Text(
          value,
          style: TextStyle(
            fontSize: AppTheme.fontSizeL,
            fontWeight: FontWeight.bold,
            color: color,
          ),
        ),
        Text(
          label,
          style: TextStyle(
            fontSize: AppTheme.fontSizeS,
            color: AppTheme.textSecondaryColor,
          ),
        ),
      ],
    );
  }
}
