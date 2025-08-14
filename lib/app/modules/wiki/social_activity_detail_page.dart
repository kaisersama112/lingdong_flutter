import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';
import 'breed_models.dart';

class SocialActivityDetailPage extends StatelessWidget {
  final SocialActivity activity;

  const SocialActivityDetailPage({
    super.key,
    required this.activity,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(activity.title),
        backgroundColor: Colors.white,
        foregroundColor: AppTheme.textPrimaryColor,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(AppTheme.spacingM),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHeader(),
            const SizedBox(height: AppTheme.spacingL),
            _buildDescription(),
            const SizedBox(height: AppTheme.spacingL),
            _buildBenefits(),
            const SizedBox(height: AppTheme.spacingL),
            _buildRequirements(),
            const SizedBox(height: AppTheme.spacingL),
            _buildActivityInfo(),
          ],
        ),
      ),
      bottomNavigationBar: _buildBottomBar(),
    );
  }

  Widget _buildHeader() {
    return Container(
      padding: const EdgeInsets.all(AppTheme.spacingM),
      decoration: BoxDecoration(
        color: Colors.green.withValues(alpha: 0.05),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: Colors.green.withValues(alpha: 0.2),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.green.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Icon(
                  Icons.groups,
                  color: Colors.green,
                  size: 20,
                ),
              ),
              const SizedBox(width: AppTheme.spacingM),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      activity.title,
                      style: AppTheme.headingStyle,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      activity.description,
                      style: AppTheme.bodyStyle,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: AppTheme.spacingM),
          Row(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 6,
                ),
                decoration: BoxDecoration(
                  color: Colors.green.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Text(
                  TrainingUtils.ageStageLabel(activity.targetAge),
                  style: const TextStyle(
                    color: Colors.green,
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              const SizedBox(width: AppTheme.spacingM),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 6,
                ),
                decoration: BoxDecoration(
                  color: Colors.orange.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Text(
                  '难度 ${activity.difficulty}/5',
                  style: const TextStyle(
                    color: Colors.orange,
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildDescription() {
    return Container(
      padding: const EdgeInsets.all(AppTheme.spacingM),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppTheme.dividerColor),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.description, color: Colors.green),
              const SizedBox(width: AppTheme.spacingS),
              Text(
                '活动描述',
                style: AppTheme.subheadingStyle,
              ),
            ],
          ),
          const SizedBox(height: AppTheme.spacingM),
          Text(
            activity.description,
            style: AppTheme.bodyStyle.copyWith(
              height: 1.6,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBenefits() {
    return Container(
      padding: const EdgeInsets.all(AppTheme.spacingM),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppTheme.dividerColor),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.thumb_up, color: Colors.green),
              const SizedBox(width: AppTheme.spacingS),
              Text(
                '活动益处',
                style: AppTheme.subheadingStyle,
              ),
            ],
          ),
          const SizedBox(height: AppTheme.spacingM),
          ...activity.benefits.map((benefit) => Padding(
            padding: const EdgeInsets.only(bottom: AppTheme.spacingS),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(
                  Icons.check_circle,
                  color: Colors.green,
                  size: 20,
                ),
                const SizedBox(width: AppTheme.spacingS),
                Expanded(
                  child: Text(
                    benefit,
                    style: AppTheme.bodyStyle,
                  ),
                ),
              ],
            ),
          )),
        ],
      ),
    );
  }

  Widget _buildRequirements() {
    return Container(
      padding: const EdgeInsets.all(AppTheme.spacingM),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppTheme.dividerColor),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.checklist, color: Colors.orange),
              const SizedBox(width: AppTheme.spacingS),
              Text(
                '参与要求',
                style: AppTheme.subheadingStyle,
              ),
            ],
          ),
          const SizedBox(height: AppTheme.spacingM),
          ...activity.requirements.map((requirement) => Padding(
            padding: const EdgeInsets.only(bottom: AppTheme.spacingS),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(
                  Icons.info,
                  color: Colors.orange,
                  size: 20,
                ),
                const SizedBox(width: AppTheme.spacingS),
                Expanded(
                  child: Text(
                    requirement,
                    style: AppTheme.bodyStyle,
                  ),
                ),
              ],
            ),
          )),
        ],
      ),
    );
  }

  Widget _buildActivityInfo() {
    return Container(
      padding: const EdgeInsets.all(AppTheme.spacingM),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppTheme.dividerColor),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.info_outline, color: AppTheme.primaryColor),
              const SizedBox(width: AppTheme.spacingS),
              Text(
                '活动信息',
                style: AppTheme.subheadingStyle,
              ),
            ],
          ),
          const SizedBox(height: AppTheme.spacingM),
          _buildInfoItem('活动时长', '${activity.duration} 分钟', Icons.access_time),
          _buildInfoItem('适合年龄', TrainingUtils.ageStageLabel(activity.targetAge), Icons.pets),
          _buildInfoItem('难度等级', '${activity.difficulty}/5', Icons.trending_up),
          _buildInfoItem('活动类型', '社交互动', Icons.groups),
        ],
      ),
    );
  }

  Widget _buildInfoItem(String label, String value, IconData icon) {
    return Padding(
      padding: const EdgeInsets.only(bottom: AppTheme.spacingM),
      child: Row(
        children: [
          Icon(icon, color: AppTheme.textSecondaryColor, size: 20),
          const SizedBox(width: AppTheme.spacingM),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: AppTheme.captionStyle,
                ),
                Text(
                  value,
                  style: AppTheme.bodyStyle.copyWith(fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBottomBar() {
    return Container(
      padding: const EdgeInsets.all(AppTheme.spacingM),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          top: BorderSide(color: AppTheme.dividerColor),
        ),
      ),
      child: Row(
        children: [
          Expanded(
            child: ElevatedButton(
              onPressed: () {
                // TODO: 参与活动
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: AppTheme.spacingM),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: const Text(
                '参与活动',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
          const SizedBox(width: AppTheme.spacingM),
          Container(
            padding: const EdgeInsets.all(AppTheme.spacingM),
            decoration: BoxDecoration(
              border: Border.all(color: AppTheme.dividerColor),
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Icon(
              Icons.share,
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}
