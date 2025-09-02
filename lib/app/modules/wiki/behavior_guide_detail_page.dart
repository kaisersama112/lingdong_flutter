import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';
import 'breed_models.dart';

class BehaviorGuideDetailPage extends StatelessWidget {
  final BehaviorGuide guide;

  const BehaviorGuideDetailPage({super.key, required this.guide});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(guide.title),
        backgroundColor: Colors.transparent,
        foregroundColor: AppTheme.textPrimaryColor,
        elevation: 0,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(AppTheme.spacingM),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHeader(),
            const SizedBox(height: AppTheme.spacingL),
            _buildContent(),
            const SizedBox(height: AppTheme.spacingL),
            _buildTags(),
            const SizedBox(height: AppTheme.spacingL),
            _buildAuthorInfo(),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      padding: const EdgeInsets.all(AppTheme.spacingM),
      decoration: BoxDecoration(
        color: AppTheme.primaryColor.withValues(alpha: 0.05),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppTheme.primaryColor.withValues(alpha: 0.2)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: AppTheme.primaryColor.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(
                  Icons.psychology,
                  color: AppTheme.primaryColor,
                  size: 20,
                ),
              ),
              const SizedBox(width: AppTheme.spacingM),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(guide.title, style: AppTheme.headingStyle),
                    const SizedBox(height: 4),
                    Text('作者: ${guide.author}', style: AppTheme.captionStyle),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: AppTheme.spacingM),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: AppTheme.primaryColor.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Text(
              TrainingUtils.ageStageLabel(guide.targetAge),
              style: TextStyle(
                color: AppTheme.primaryColor,
                fontSize: 12,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildContent() {
    return _section(
      icon: Icons.article,
      title: '指南内容',
      child: Text(
        guide.content,
        style: AppTheme.bodyStyle.copyWith(height: 1.6, fontSize: 16),
      ),
    );
  }

  Widget _buildTags() {
    return _section(
      icon: Icons.label,
      title: '相关标签',
      child: Wrap(
        spacing: AppTheme.spacingS,
        runSpacing: AppTheme.spacingS,
        children: guide.tags
            .map(
              (tag) => Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 6,
                ),
                decoration: BoxDecoration(
                  color: AppTheme.primaryColor.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Text(
                  tag,
                  style: TextStyle(
                    color: AppTheme.primaryColor,
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            )
            .toList(),
      ),
    );
  }

  Widget _buildAuthorInfo() {
    return _section(
      icon: Icons.person,
      title: '作者信息',
      child: Row(
        children: [
          CircleAvatar(
            radius: 25,
            backgroundColor: AppTheme.primaryColor.withValues(alpha: 0.1),
            child: Icon(Icons.person, size: 25, color: AppTheme.primaryColor),
          ),
          const SizedBox(width: AppTheme.spacingM),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(guide.author, style: AppTheme.subheadingStyle),
                const SizedBox(height: 4),
                Text('专业训犬师', style: AppTheme.captionStyle),
                const SizedBox(height: 4),
                Text(
                  '发布时间: ${_formatDate(guide.createdAt)}',
                  style: AppTheme.captionStyle,
                ),
              ],
            ),
          ),
          TextButton(onPressed: () {}, child: const Text('查看详情')),
        ],
      ),
    );
  }

  String _formatDate(DateTime date) {
    return '${date.year}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}';
  }
}

Widget _section({
  required IconData icon,
  required String title,
  required Widget child,
}) {
  return Container(
    padding: const EdgeInsets.all(AppTheme.spacingM),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(12),
      border: Border.all(color: AppTheme.dividerColor),
    ),
    margin: const EdgeInsets.only(bottom: AppTheme.spacingM),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(icon, color: AppTheme.primaryColor),
            const SizedBox(width: AppTheme.spacingS),
            Text(title, style: AppTheme.subheadingStyle),
          ],
        ),
        const SizedBox(height: AppTheme.spacingM),
        child,
      ],
    ),
  );
}
