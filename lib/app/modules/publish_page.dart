import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../services/dynamic_service.dart';
import 'package:lingdong_server/lingdong_server.dart' as server;

class PublishPage extends StatefulWidget {
  final VoidCallback? onClose;
  const PublishPage({super.key, this.onClose});

  @override
  State<PublishPage> createState() => _PublishPageState();
}

class _PublishPageState extends State<PublishPage> {
  final TextEditingController _contentController = TextEditingController();
  final TextEditingController _titleController = TextEditingController();
  final List<String> _selectedImages = [];
  bool _isPublic = true;
  bool _publishing = false;
  bool _isVideoMode = false;

  // AI特效相关状态
  String _selectedFilter = '原图';
  String _selectedEffect = '无特效';
  bool _isAIAnalyzing = false;
  String _aiAnalysisResult = '';

  // AI滤镜列表
  final List<Map<String, dynamic>> _filters = [
    {'name': '原图', 'icon': '🖼️', 'color': Colors.transparent},
    {'name': '温暖', 'icon': '🌅', 'color': const Color(0xFFFFB74D)},
    {'name': '清新', 'icon': '🌿', 'color': const Color(0xFF4ECDC4)},
    {'name': '梦幻', 'icon': '✨', 'color': const Color(0xFFAB47BC)},
    {'name': '复古', 'icon': '📷', 'color': const Color(0xFF8D6E63)},
    {'name': '黑白', 'icon': '⚫', 'color': const Color(0xFF424242)},
  ];

  // AI特效列表
  final List<Map<String, dynamic>> _effects = [
    {'name': '无特效', 'icon': '🎬', 'description': '保持原样'},
    {'name': 'AI美颜', 'icon': '✨', 'description': '智能美化宠物'},
    {'name': '背景虚化', 'icon': '🌫️', 'description': '突出宠物主体'},
    {'name': '表情识别', 'icon': '😊', 'description': '识别宠物情绪'},
    {'name': '年龄预测', 'icon': '🎂', 'description': 'AI预测宠物年龄'},
    {'name': '品种识别', 'icon': '🔍', 'description': '智能识别品种'},
    {'name': '健康检测', 'icon': '🏥', 'description': 'AI健康评估'},
    {'name': '动作捕捉', 'icon': '🎯', 'description': '捕捉精彩瞬间'},
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _contentController.dispose();
    _titleController.dispose();
    super.dispose();
  }

  // 高级选项显示状态
  bool _showAdvancedOptions = false;

  // 主题色彩
  // 创建自定义ColorScheme以匹配AppTheme颜色
  final ColorScheme _colorScheme = ColorScheme.fromSeed(
    seedColor: AppTheme.primaryColor,
    primary: AppTheme.primaryColor,
    primaryContainer: AppTheme.primaryLightColor,
    secondary: AppTheme.secondaryColor,
    secondaryContainer: AppTheme.secondaryLightColor,

    surface: AppTheme.surfaceColor,
    error: AppTheme.errorColor,
    onPrimary: Colors.white,
    onSecondary: Colors.white,

    onSurface: AppTheme.textPrimaryColor,
    onError: Colors.white,
    brightness: Brightness.light,
    outline: AppTheme.dividerColor,
    surfaceContainerHighest: AppTheme.dividerColor.withValues(alpha: 0.3),
  );

  // 布局常量
  static const double _spacingS = 8.0;
  static const double _spacingM = 12.0;
  static const double _spacingL = 16.0;
  static const double _spacingXL = 20.0;
  static const double _borderRadius = 16.0;
  static const double _borderRadiusSmall = 12.0;
  static const double _borderRadiusPill = 24.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _colorScheme.surface ,
      body: SafeArea(
        child: Column(
          children: [
            // 现代化页面头部
            _buildHeader(),

            // 主要内容区域
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(_spacingL),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // 内容类型切换（平滑动画效果）
                    _buildContentModeSwitch(),
                    const SizedBox(height: _spacingXL),
                    
                    // 核心发布内容区域 - 统一卡片式设计
                    Container(
                      decoration: _cardDecoration,
                      padding: const EdgeInsets.all(_spacingL),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // 内容输入区域（置顶）
                          _buildContentInput(),
                           
                          // 快捷功能按钮栏 - 话题、@、定位、更多
                          if (!_isVideoMode) ...[
                            const SizedBox(height: _spacingM),
                            _buildQuickActionsBar(),
                          ],
                           
                          // 媒体上传区域
                          if (!_isVideoMode) ...[
                            const SizedBox(height: _spacingL),
                            _buildImageUpload(),
                            
                            // 高级编辑选项（平滑折叠效果）
                            if (_selectedImages.isNotEmpty) ...[
                              const SizedBox(height: _spacingL),
                              _buildAdvancedOptionsToggle(),
                              // 使用AnimatedSwitcher实现平滑过渡动画
                              AnimatedSwitcher(
                                duration: const Duration(milliseconds: 300),
                                transitionBuilder: (child, animation) => 
                                  SizeTransition(
                                    sizeFactor: animation,
                                    child: child,
                                  ),
                                child: _showAdvancedOptions ? Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  key: const ValueKey('advancedOptions'),
                                  children: [
                                    const SizedBox(height: _spacingL),
                                    _buildFilterSelector(),
                                    const SizedBox(height: _spacingL),
                                    _buildEffectSelector(),
                                    const SizedBox(height: _spacingL),
                                    _buildAIAnalysis(),
                                  ],
                                ) : const SizedBox.shrink(key: ValueKey('empty')),
                              ),
                            ],
                          ] else ...[
                            const SizedBox(height: _spacingL),
                            _buildVideoUpload(),
                            const SizedBox(height: _spacingL),
                            _buildVideoEffects(),
                          ],
                        ],
                      ),
                    ),
                    
                    // 隐私设置卡片
                    const SizedBox(height: _spacingL),
                    _buildPrivacySettings(),
                    
                    // 底部空间，避免被底部栏遮挡
                    const SizedBox(height: 80),
                  ],
                ),
              ),
            ),

            // 底部操作栏
            _buildBottomBar(),
          ],
        ),
      ),
    );
  }

  // 统一卡片装饰样式 - 现代化柔和阴影
  final BoxDecoration _cardDecoration = BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(_borderRadius),
    boxShadow: [
      BoxShadow(
        color: Colors.black.withValues(alpha: 0.06),
        blurRadius: 10,
        offset: const Offset(0, 4),
      ),
    ],
    border: Border.all(
      color: Colors.grey.shade300,
      width: 0.5,
    ),
  );

  // 现代化页面头部 - 增强视觉层次感
  Widget _buildHeader() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      padding: const EdgeInsets.symmetric(horizontal: _spacingL, vertical: _spacingM),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            '发布内容',
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 18,
              color: _colorScheme.onSurface,
            ),
          ),
          GestureDetector(
            onTap: () {
              // 保存草稿逻辑
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('已保存草稿')),
              );
            },
            behavior: HitTestBehavior.translucent,
            child: Text(
              '草稿',
              style: TextStyle(
                color: _colorScheme.secondary,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }

    // 内容模式切换器（图文/视频）
    Widget _buildContentModeSwitch() {
      return Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(_borderRadiusPill),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.05),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          children: [
            Expanded(
              child: GestureDetector(
                onTap: () => setState(() => _isVideoMode = false),
                behavior: HitTestBehavior.translucent,
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  decoration: BoxDecoration(
                    gradient: !_isVideoMode ? AppTheme.primaryGradient : null,
                    borderRadius: BorderRadius.circular(_borderRadiusPill),
                  ),
                  child: Center(
                    child: Text(
                      '📝 图文',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: !_isVideoMode ? Colors.white : _colorScheme.onSurface,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: GestureDetector(
                onTap: () => setState(() => _isVideoMode = true),
                behavior: HitTestBehavior.translucent,
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  decoration: BoxDecoration(
                    gradient: _isVideoMode ? AppTheme.primaryGradient : null,
                    borderRadius: BorderRadius.circular(_borderRadiusPill),
                  ),
                  child: Center(
                    child: Text(
                      '🎬 视频',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: _isVideoMode ? Colors.white : _colorScheme.onSurface,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    }

  // 视频相关功能已在文件下方定义

  // 快捷功能按钮栏 - 话题、@、定位、更多
  Widget _buildContentInput() {
    return Container(
      decoration: BoxDecoration(
        color: _colorScheme.surfaceContainerHighest,
        borderRadius: BorderRadius.circular(_borderRadiusSmall),
      ),
      child: TextField(
        controller: _contentController,
        minLines: 4,
        maxLines: 10,
        decoration: InputDecoration(
          hintText: '分享你的精彩瞬间...',
          hintStyle: TextStyle(
            color: _colorScheme.onSurfaceVariant,
            fontSize: 16,
          ),
          border: InputBorder.none,
          contentPadding: const EdgeInsets.all(_spacingM),
        ),
        style: TextStyle(
          color: _colorScheme.onSurface,
          fontSize: 16,
        ),
      ),
    );
  }

  Widget _buildQuickActionsBar() {
    return Container(
      padding: const EdgeInsets.all(_spacingS),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(_borderRadiusSmall),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.03),
            blurRadius: 6,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildQuickActionButton(
            icon: Icons.people_alt_outlined,
            label: '话题',
            onTap: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('话题功能开发中...')),
              );
            },
          ),
          _buildQuickActionButton(
            icon: Icons.alternate_email_outlined,
            label: '@',
            onTap: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('@功能开发中...')),
              );
            },
          ),
          _buildQuickActionButton(
            icon: Icons.location_on_outlined,
            label: '定位',
            onTap: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('定位功能开发中...')),
              );
            },
          ),
          _buildQuickActionButton(
            icon: Icons.more_horiz,
            label: '更多',
            onTap: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('更多功能开发中...')),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildQuickActionButton({
    required IconData icon,
    required String label,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.translucent,
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(_spacingS),
            decoration: BoxDecoration(
              color: _colorScheme.primary.withValues(alpha: 0.08),
              borderRadius: BorderRadius.circular(_borderRadiusSmall),
            ),
            child: Icon(icon, color: _colorScheme.primary, size: 22),
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w500,
              color: _colorScheme.onSurfaceVariant,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildImageUpload() {
    return Container(
      height: 220,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(_borderRadius),
        border: Border.all(
          color: _colorScheme.outline,
          style: BorderStyle.solid,
          width: 1.0,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.06),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(_spacingL),
              decoration: BoxDecoration(
                gradient: AppTheme.primaryGradient,
                borderRadius: BorderRadius.circular(_borderRadius),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.15),
                    blurRadius: 12,
                    offset: const Offset(0, 5),
                  ),
                ],
              ),
              child: const Icon(Icons.image_outlined, color: Colors.white, size: 36),
            ),
            const SizedBox(height: _spacingM),
            Text(
              '添加图片',
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.w600,
                color: _colorScheme.onSurface,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              '最多添加9张图片',
              style: TextStyle(
                fontSize: 13,
                color: _colorScheme.onSurfaceVariant,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildVideoUpload() {
    return Container(
      height: 220,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(_borderRadius),
        border: Border.all(
          color: _colorScheme.outline,
          style: BorderStyle.solid,
          width: 1.0,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.06),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(_spacingL),
              decoration: BoxDecoration(
                gradient: AppTheme.primaryGradient,
                borderRadius: BorderRadius.circular(_borderRadius),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.15),
                    blurRadius: 12,
                    offset: const Offset(0, 5),
                  ),
                ],
              ),
              child: const Icon(Icons.videocam, color: Colors.white, size: 36),
            ),
            const SizedBox(height: _spacingM),
            Text(
              '录制或上传视频',
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.w600,
                color: _colorScheme.onSurface,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              '支持AI智能剪辑',
              style: TextStyle(
                fontSize: 13,
                color: _colorScheme.onSurfaceVariant,
              ),
            ),
          ],
        ),
      ),
    );
  }

  // 高级编辑选项切换器
  Widget _buildAdvancedOptionsToggle() {
    return GestureDetector(
      onTap: () => setState(() => _showAdvancedOptions = !_showAdvancedOptions),
      behavior: HitTestBehavior.translucent,
      child: Container(
        padding: const EdgeInsets.all(_spacingM),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(_borderRadiusSmall),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.03),
              blurRadius: 6,
              offset: const Offset(0, 1),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '高级编辑选项',
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 15,
                color: _colorScheme.onSurface,
              ),
            ),
            Icon(
              _showAdvancedOptions ? Icons.expand_less : Icons.expand_more,
              color: _colorScheme.secondary,
            ),
          ],
        ),
      ),
    );
  }

  // 滤镜选择器
  Widget _buildFilterSelector() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(_borderRadiusSmall),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.03),
            blurRadius: 6,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      padding: const EdgeInsets.all(_spacingL),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'AI滤镜',
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 16,
              color: _colorScheme.onSurface,
            ),
          ),
          const SizedBox(height: _spacingM),
          SizedBox(
            height: 80,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: _filters.length,
              itemBuilder: (context, index) {
                final filter = _filters[index];
                final isSelected = _selectedFilter == filter['name'];
                
                return Padding(
                  padding: const EdgeInsets.only(right: _spacingM),
                  child: GestureDetector(
                    onTap: () => setState(() => _selectedFilter = filter['name']),
                    behavior: HitTestBehavior.translucent,
                    child: Container(
                      width: 60,
                      decoration: BoxDecoration(
                        color: isSelected ? _colorScheme.primary.withValues(alpha: 0.1) : Colors.white,
                        borderRadius: BorderRadius.circular(_borderRadiusSmall),
                        border: Border.all(
                          color: isSelected ? _colorScheme.primary : _colorScheme.outline,
                          width: 1.0,
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            filter['icon'],
                            style: const TextStyle(fontSize: 24),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            filter['name'],
                            style: TextStyle(
                              fontSize: 11,
                              color: _colorScheme.onSurface,
                              fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  // AI分析区域
  Widget _buildAIAnalysis() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(_borderRadiusSmall),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.03),
            blurRadius: 6,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      padding: const EdgeInsets.all(_spacingL),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'AI智能分析',
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 16,
              color: _colorScheme.onSurface,
            ),
          ),
          const SizedBox(height: _spacingM),
          if (_isAIAnalyzing) ...[
            Container(
              padding: const EdgeInsets.all(_spacingL),
              decoration: BoxDecoration(
                color: _colorScheme.primary.withValues(alpha: 0.05),
                borderRadius: BorderRadius.circular(_borderRadiusSmall),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(
                    width: 20,
                    height: 20,
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                      color: Colors.blue,
                    ),
                  ),
                  const SizedBox(width: _spacingM),
                  Text(
                    '正在进行AI分析...',
                    style: TextStyle(
                      color: _colorScheme.onSurface,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
          ] else if (_aiAnalysisResult.isNotEmpty) ...[
            Container(
              padding: const EdgeInsets.all(_spacingL),
              decoration: BoxDecoration(
                color: _colorScheme.primary.withValues(alpha: 0.05),
                borderRadius: BorderRadius.circular(_borderRadiusSmall),
              ),
              child: Text(
                _aiAnalysisResult,
                style: TextStyle(
                  color: _colorScheme.onSurface,
                  fontSize: 14,
                  height: 1.6,
                ),
              ),
            ),
          ] else ...[
            Container(
              padding: const EdgeInsets.all(_spacingL),
              decoration: BoxDecoration(
                color: _colorScheme.surfaceContainerHighest,
                borderRadius: BorderRadius.circular(_borderRadiusSmall),
              ),
              child: Text(
                'AI可以分析宠物的情绪、健康状况等信息',
                style: TextStyle(
                  color: _colorScheme.onSurfaceVariant,
                  fontSize: 14,
                ),
              ),
            ),
          ],
          const SizedBox(height: _spacingM),
          ElevatedButton.icon(
            onPressed: _isAIAnalyzing ? null : _performAIAnalysis,
            icon: const Icon(Icons.auto_awesome, size: 16),
            label: const Text('执行AI分析'),
            style: ElevatedButton.styleFrom(
              backgroundColor: _colorScheme.secondary,
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(_borderRadiusSmall),
              ),
              padding: const EdgeInsets.symmetric(vertical: _spacingS),
              elevation: 3,
              shadowColor: _colorScheme.secondary.withValues(alpha: 0.3),
              textStyle: const TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 14,
              ),
            ),
          ),
        ],
      ),
    );
  }

  // 特效选择器
  Widget _buildEffectSelector() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(_borderRadiusSmall),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.03),
            blurRadius: 6,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      padding: const EdgeInsets.all(_spacingL),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '智能特效',
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 16,
              color: _colorScheme.onSurface,
            ),
          ),
          const SizedBox(height: _spacingM),
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
              childAspectRatio: 3 / 2,
              crossAxisSpacing: _spacingM,
              mainAxisSpacing: _spacingM,
            ),
            itemCount: _effects.length,
            itemBuilder: (context, index) {
              final effect = _effects[index];
              final isSelected = _selectedEffect == effect['name'];
              
              return GestureDetector(
                onTap: () => setState(() => _selectedEffect = effect['name']),
                behavior: HitTestBehavior.translucent,
                child: Container(
                  decoration: BoxDecoration(
                    color: isSelected ? _colorScheme.primary.withValues(alpha: 0.1) : Colors.white,
                    borderRadius: BorderRadius.circular(_borderRadiusSmall),
                    border: Border.all(
                      color: isSelected ? _colorScheme.primary : _colorScheme.outline,
                      width: 1.0,
                    ),
                  ),
                  padding: const EdgeInsets.all(_spacingS),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        effect['icon'],
                        style: const TextStyle(fontSize: 20),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        effect['name'],
                        style: TextStyle(
                          fontSize: 10,
                          color: _colorScheme.onSurface,
                          fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  // 视频特效按钮组
  Widget _buildVideoEffects() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '视频特效',
          style: TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.w600,
            color: _colorScheme.onSurface,
          ),
        ),
        const SizedBox(height: _spacingM),
        Row(
          children: [
            Expanded(
              child: ElevatedButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.slow_motion_video, size: 18),
                label: const Text('慢动作'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: _colorScheme.primary,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(_borderRadiusSmall),
                  ),
                  padding: const EdgeInsets.symmetric(vertical: _spacingM),
                  elevation: 4,
                  shadowColor: _colorScheme.primary.withValues(alpha: 0.3),
                  textStyle: const TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                  ),
                ),
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: ElevatedButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.music_note, size: 18),
                label: const Text('配乐'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: _colorScheme.secondary,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(_borderRadiusSmall),
                  ),
                  padding: const EdgeInsets.symmetric(vertical: _spacingM),
                  elevation: 4,
                  shadowColor: _colorScheme.secondary.withValues(alpha: 0.3),
                  textStyle: const TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                  ),
                ),
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: ElevatedButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.text_fields, size: 18),
                label: const Text('字幕'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: _colorScheme.secondary,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(_borderRadiusSmall),
                  ),
                  padding: const EdgeInsets.symmetric(vertical: _spacingM),
                  elevation: 4,
                  shadowColor: _colorScheme.secondary.withValues(alpha: 0.3),
                  textStyle: const TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildPrivacySettings() {
    return Container(
      padding: const EdgeInsets.all(_spacingL),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(_borderRadius),
        border: Border.all(
          color: _colorScheme.outline,
          style: BorderStyle.solid,
          width: 1.0,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.06),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: _colorScheme.primary.withValues(alpha: 0.08),
              borderRadius: BorderRadius.circular(_borderRadiusSmall),
            ),
            child: Icon(
              _isPublic ? Icons.public : Icons.lock,
              color: _colorScheme.primary,
              size: 24,
            ),
          ),
          const SizedBox(width: _spacingM),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '公开可见',
                  style: TextStyle(fontSize: 16, color: _colorScheme.onSurface, fontWeight: FontWeight.w600),
                ),
                Text(
                  _isPublic ? '所有人可见' : '仅自己可见',
                  style: TextStyle(fontSize: 13, color: _colorScheme.onSurfaceVariant),
                ),
              ],
            ),
          ),
          Switch(
            value: _isPublic,
            onChanged: (value) => setState(() => _isPublic = value),
            activeColor: _colorScheme.primary,
            activeTrackColor: _colorScheme.primary.withValues(alpha: 0.2),
            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
          ),
        ],
      ),
    );
  }

  Widget _buildBottomBar() {
    return SafeArea(
      child: Container(
        padding: const EdgeInsets.all(_spacingXL),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.1),
              blurRadius: 12,
              offset: const Offset(0, -5),
            ),
          ],
        ),
        child: Row(
          children: [
            Expanded(
              child: ElevatedButton.icon(
                onPressed: _publishContent,
                icon: _publishing ? const SizedBox(
                  width: 16,
                  height: 16,
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                    color: Colors.white,
                  ),
                ) : const Icon(Icons.send, size: 16),
                label: Text(_publishing ? '发布中...' : '发布'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: _colorScheme.primary,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(_borderRadiusPill),
                  ),
                  padding: const EdgeInsets.symmetric(vertical: _spacingM),
                  elevation: 6,
                  shadowColor: _colorScheme.primary.withValues(alpha: 0.4),
                  textStyle: const TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // 辅助方法
  void _performAIAnalysis() {
    setState(() {
      _isAIAnalyzing = true;
    });

    // 模拟AI分析过程
    Future.delayed(const Duration(seconds: 2), () {
      if (!mounted) return;
      setState(() {
        _isAIAnalyzing = false;
        _aiAnalysisResult =
            'AI分析结果：\n• 宠物情绪：开心 😊\n• 健康状况：良好\n• 建议：继续保持当前的护理方式';
      });
    });
  }

  // 该方法暂时未使用，保留用于未来扩展
  // void _removeImage(String imagePath) {
  //   setState(() {
  //     _selectedImages.remove(imagePath);
  //   });
  // }

  // 创建媒体对象列表
  List<server.MediaCreate> _createMediaList() {
    // 调试信息
    if (_isVideoMode) {
      debugPrint('创建媒体列表，视频模式');
    } else {
      debugPrint('创建媒体列表，图片数量: ${_selectedImages.length}');
    }

    // 在开发环境中，我们使用本地路径作为临时解决方案
    // 在实际应用中，应该先上传图片/视频，然后使用上传后的URL
    if (_isVideoMode) {
      // 视频模式，返回一个视频媒体对象
      return [
        server.MediaCreate((b) => b
          ..mediaType = server.MediaType.number1 // 1表示视频类型
          ..description = '动态视频'
          // 对于开发测试，使用占位符URL
          ..url = 'https://example.com/placeholder.mp4')
      ];
    } else {
      // 图片模式，返回图片媒体对象列表
      return _selectedImages.map((imagePath) {
        return server.MediaCreate((b) => b
          ..mediaType = server.MediaType.number0 // 0表示图片类型
          ..description = '动态图片'
          // 对于开发测试，可以使用占位符URL或不上传媒体
          ..url = imagePath.contains('http') ? imagePath : 'https://example.com/placeholder.jpg');
      }).toList();
    }
  }

  // 发布内容
  Future<void> _publishContent() async {
    if (_publishing) return;

    // 验证内容
    final content = _contentController.text.trim();
    if (content.isEmpty && ((!_isVideoMode && _selectedImages.isEmpty))) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(_isVideoMode ? '请输入内容' : '请输入内容或选择图片')),
      );
      return;
    }

    setState(() {
      _publishing = true;
    });

    try {
      // 创建媒体列表
      final medias = _createMediaList();
      
      // 调试信息
      debugPrint('准备调用createPost:');
      debugPrint('  content: $content');
      debugPrint('  medias count: ${medias.length}');
      debugPrint('  location: 北京市朝阳区');
      debugPrint('  可见性: ${_isPublic ? '公开' : '私密'} (visibility: ${_isPublic ? 0 : 1})');
      debugPrint('  内容类型: ${_isVideoMode ? '视频' : '图文'}');
    
      // 调用DynamicService创建动态
      // 开发测试时，可以暂时不传medias参数，以排除媒体文件问题
      await DynamicService().createPost(
        content: content,
        relatedType: server.RelatedTypeEnum.number1, // 默认使用宠物分享分类

        medias: medias.isNotEmpty ? medias : null,
        location: '北京市朝阳区',
        visibility: _isPublic ? 0 : 1, // 0=公开, 1=私有
      );

      // 发布成功，显示提示
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('动态发布成功！')),
        );
      }

      // 关闭页面并返回首页
      if (widget.onClose != null) {
        widget.onClose!();
      } else {
        // 由于PublishPage可能是底部导航栏的页面，不能直接pop
        // 而是重置页面状态
        _contentController.clear();
        _selectedImages.clear();
        if (mounted) {
          setState(() {
            _isPublic = true;
          });
        }
        await Future.delayed(const Duration(seconds: 1));
        // 如果是从导航栏进入的页面，切换到首页
        if (mounted && ModalRoute.of(context)?.settings.name == null) {
          // 这里不做导航操作，保持在当前页面但重置状态
        }
      }

    } catch (e) {
      // 发布失败，显示错误提示
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('发布失败：${e.toString()}')),
        );
      }
    } finally {
      if (mounted) {
        setState(() {
          _publishing = false;
        });
      }
    }
  }
}