import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';
import 'feeding_calculator_page.dart';
import 'reminders_page.dart';
import 'lost_pet_page.dart';

class ToolsHubPage extends StatelessWidget {
  const ToolsHubPage({super.key});

  @override
  Widget build(BuildContext context) {
    final tools = [
      _ToolItem(
        icon: Icons.event_available,
        title: '日历提醒',
        subtitle: '疫苗/驱虫/体检/洗护/寄养/美容预约',
        builder: (_) => const RemindersPage(),
      ),
      _ToolItem(
        icon: Icons.sos,
        title: '紧急求助/寻宠',
        subtitle: '一键发布寻宠卡片·同城辐射提醒',
        builder: (_) => const LostPetPage(),
      ),
      _ToolItem(
        icon: Icons.fitness_center,
        title: '喂养与运动计算器',
        subtitle: '按体重与年龄给出每日克数与运动量',
        builder: (_) => const FeedingCalculatorPage(),
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('实用工具'),
        backgroundColor: Colors.white,
        foregroundColor: AppTheme.textPrimaryColor,
        elevation: 0.5,
      ),
      backgroundColor: AppTheme.backgroundColor,
      body: ListView.separated(
        padding: const EdgeInsets.all(16),
        itemCount: tools.length,
        separatorBuilder: (_, __) => const SizedBox(height: 12),
        itemBuilder: (context, i) {
          final t = tools[i];
          return InkWell(
            onTap: () => Navigator.of(
              context,
            ).push(MaterialPageRoute(builder: t.builder)),
            child: Container(
              decoration: AppTheme.cardDecoration,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: AppTheme.primaryLightColor,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Icon(t.icon, color: AppTheme.primaryColor),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(t.title, style: AppTheme.subheadingStyle),
                          const SizedBox(height: 4),
                          Text(t.subtitle, style: AppTheme.captionStyle),
                        ],
                      ),
                    ),
                    const Icon(Icons.chevron_right, color: Colors.black26),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class _ToolItem {
  final IconData icon;
  final String title;
  final String subtitle;
  final WidgetBuilder builder;
  const _ToolItem({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.builder,
  });
}
