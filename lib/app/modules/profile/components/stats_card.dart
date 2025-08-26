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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
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
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          width: 48,
          height: 48,
          child: DecoratedBox(
            decoration: BoxDecoration(
              color: color.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(AppTheme.borderRadiusMedium),
            ),
            child: Center(child: Icon(icon, color: color, size: 22)),
          ),
        ),
        const SizedBox(height: AppTheme.spacingS),
        Text(
          value,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: AppTheme.fontSizeL,
            fontWeight: FontWeight.bold,
            color: color,
          ),
        ),
        const SizedBox(height: 2),
        Text(
          label,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: AppTheme.fontSizeS,
            color: AppTheme.textSecondaryColor,
          ),
        ),
      ],
    );
  }
}
