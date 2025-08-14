import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';
import 'feeding_calculator_page.dart';
import 'reminders_page.dart';
import 'lost_pet_page.dart';
import '../publish_page.dart';

class ToolsHubPage extends StatelessWidget {
  const ToolsHubPage({super.key});

  @override
  Widget build(BuildContext context) {
    final tools = [
      _ToolItem(
        icon: Icons.add_photo_alternate,
        title: '发布动态',
        subtitle: '分享你和宠物的美好时光',
        color: AppTheme.primaryColor,
        builder: (_) => const PublishPage(),
      ),
      _ToolItem(
        icon: Icons.event_available,
        title: '智能提醒',
        subtitle: '疫苗/驱虫/体检/洗护/寄养/美容预约',
        color: AppTheme.petColors[0], // 橙色
        builder: (_) => const RemindersPage(),
      ),
      _ToolItem(
        icon: Icons.sos,
        title: '紧急寻宠',
        subtitle: '一键发布寻宠卡片·同城辐射提醒',
        color: AppTheme.petColors[1], // 薄荷绿
        builder: (_) => const LostPetPage(),
      ),
      _ToolItem(
        icon: Icons.fitness_center,
        title: '喂养计算器',
        subtitle: '按体重与年龄给出每日克数与运动量',
        color: AppTheme.petColors[2], // 粉色
        builder: (_) => const FeedingCalculatorPage(),
      ),
    ];

    return Scaffold(
      backgroundColor: AppTheme.backgroundColor,
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFFFFF8F5),
              Color(0xFFFEFEFE),
            ],
            stops: [0.0, 0.6],
          ),
        ),
        child: CustomScrollView(
          slivers: [
            _buildSliverAppBar(),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildHeader(),
                    const SizedBox(height: 24),
                    _buildToolsGrid(context, tools),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSliverAppBar() {
    return SliverAppBar(
      expandedHeight: 120,
      floating: false,
      pinned: true,
      backgroundColor: Colors.transparent,
      elevation: 0,
      flexibleSpace: FlexibleSpaceBar(
        background: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color(0xFFFFF8F5),
                Color(0xFFFEFEFE),
              ],
            ),
          ),
        ),
      ),
      title: const Text(
        '实用工具',
        style: TextStyle(
          color: AppTheme.textPrimaryColor,
          fontWeight: FontWeight.bold,
          fontSize: 20,
        ),
      ),
      centerTitle: true,
    );
  }

  Widget _buildHeader() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: AppTheme.glassmorphismDecoration,
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              gradient: AppTheme.primaryGradient,
              borderRadius: BorderRadius.circular(16),
            ),
            child: const Icon(
              Icons.psychology,
              color: Colors.white,
              size: 24,
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  '智能助手',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: AppTheme.textPrimaryColor,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  '为您的爱宠提供专业服务',
                  style: TextStyle(
                    fontSize: 14,
                    color: AppTheme.textSecondaryColor,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildToolsGrid(BuildContext context, List<_ToolItem> tools) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        childAspectRatio: 0.85,
      ),
      itemCount: tools.length,
      itemBuilder: (context, index) {
        final tool = tools[index];
        return _buildToolCard(context, tool);
      },
    );
  }

  Widget _buildToolCard(BuildContext context, _ToolItem tool) {
    return Container(
      decoration: AppTheme.cardDecoration,
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(AppTheme.borderRadiusLarge),
          onTap: () => Navigator.of(context).push(
            MaterialPageRoute(builder: tool.builder),
          ),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // 图标容器
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        tool.color,
                        tool.color.withValues(alpha: 0.8),
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        color: tool.color.withValues(alpha: 0.3),
                        blurRadius: 12,
                        offset: const Offset(0, 6),
                      ),
                    ],
                  ),
                  child: Icon(
                    tool.icon,
                    color: Colors.white,
                    size: 28,
                  ),
                ),
                const SizedBox(height: 16),
                // 标题
                Text(
                  tool.title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: AppTheme.textPrimaryColor,
                  ),
                ),
                const SizedBox(height: 8),
                // 描述
                Expanded(
                  child: Text(
                    tool.subtitle,
                    style: const TextStyle(
                      fontSize: 12,
                      color: AppTheme.textSecondaryColor,
                      height: 1.4,
                    ),
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                const SizedBox(height: 12),
                // 箭头
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(6),
                      decoration: BoxDecoration(
                        color: tool.color.withValues(alpha: 0.1),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Icon(
                        Icons.arrow_forward_ios,
                        color: tool.color,
                        size: 14,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _ToolItem {
  final IconData icon;
  final String title;
  final String subtitle;
  final Color color;
  final WidgetBuilder builder;
  
  const _ToolItem({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.color,
    required this.builder,
  });
}
