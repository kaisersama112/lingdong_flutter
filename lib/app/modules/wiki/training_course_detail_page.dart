import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';
import 'breed_models.dart';

class TrainingCourseDetailPage extends StatefulWidget {
  final TrainingCourse course;

  const TrainingCourseDetailPage({
    super.key,
    required this.course,
  });

  @override
  State<TrainingCourseDetailPage> createState() => _TrainingCourseDetailPageState();
}

class _TrainingCourseDetailPageState extends State<TrainingCourseDetailPage> {
  bool _isPlaying = false;
  double _progress = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.course.title),
        backgroundColor: Colors.white,
        foregroundColor: AppTheme.textPrimaryColor,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildVideoSection(),
            _buildCourseInfo(),
            _buildProgressSection(),
            _buildCourseContent(),
          ],
        ),
      ),
      bottomNavigationBar: _buildBottomBar(),
    );
  }

  Widget _buildVideoSection() {
    return Container(
      height: 200,
      width: double.infinity,
      decoration: BoxDecoration(
        color: TrainingUtils.courseTypeColor(widget.course.type).withValues(alpha: 0.1),
      ),
      child: Center(
        child: Icon(
          Icons.play_circle_outline,
          size: 64,
          color: TrainingUtils.courseTypeColor(widget.course.type),
        ),
      ),
    );
  }

  Widget _buildCourseInfo() {
    return Padding(
      padding: const EdgeInsets.all(AppTheme.spacingM),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.course.title,
            style: AppTheme.headingStyle,
          ),
          const SizedBox(height: AppTheme.spacingS),
          Text(
            widget.course.description,
            style: AppTheme.bodyStyle,
          ),
          const SizedBox(height: AppTheme.spacingM),
          Row(
            children: [
              Icon(Icons.star, color: Colors.amber[600]),
              Text('${widget.course.rating}'),
              const SizedBox(width: AppTheme.spacingM),
              Text('${widget.course.studentCount} 人学习'),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildProgressSection() {
    return Container(
      margin: const EdgeInsets.all(AppTheme.spacingM),
      padding: const EdgeInsets.all(AppTheme.spacingM),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppTheme.dividerColor),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('学习进度', style: AppTheme.subheadingStyle),
          const SizedBox(height: AppTheme.spacingM),
          LinearProgressIndicator(value: _progress),
          Text('${(_progress * 100).toInt()}% 完成'),
        ],
      ),
    );
  }

  Widget _buildCourseContent() {
    return Container(
      margin: const EdgeInsets.all(AppTheme.spacingM),
      padding: const EdgeInsets.all(AppTheme.spacingM),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppTheme.dividerColor),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('课程内容', style: AppTheme.subheadingStyle),
          const SizedBox(height: AppTheme.spacingM),
          Text('• 课程介绍'),
          Text('• 基础理论'),
          Text('• 实操演示'),
          Text('• 练习指导'),
        ],
      ),
    );
  }

  Widget _buildBottomBar() {
    return Container(
      padding: const EdgeInsets.all(AppTheme.spacingM),
      child: ElevatedButton(
        onPressed: () {
          setState(() {
            _progress = 0.1;
          });
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: TrainingUtils.courseTypeColor(widget.course.type),
          foregroundColor: Colors.white,
        ),
        child: const Text('开始学习'),
      ),
    );
  }
}
