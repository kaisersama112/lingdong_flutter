import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class PublishPage extends StatefulWidget {
  final VoidCallback? onClose;
  const PublishPage({super.key, this.onClose});

  @override
  State<PublishPage> createState() => _PublishPageState();
}

class _PublishPageState extends State<PublishPage>
    with TickerProviderStateMixin {
  late TabController _tabController;
  final TextEditingController _contentController = TextEditingController();
  final TextEditingController _titleController = TextEditingController();
  String _selectedCategory = '社群动态';
  final List<String> _selectedImages = [];
  bool _isPublic = true;

  // AI特效相关状态
  String _selectedFilter = '原图';
  String _selectedEffect = '无特效';
  String _selectedSticker = '无贴纸';
  bool _isAIAnalyzing = false;
  String _aiAnalysisResult = '';

  final List<String> _categories = [
    '社群动态',
    '宠物分享',
    '健康咨询',
    '活动召集',
    '求助信息',
    '其他',
  ];

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

  // 宠物贴纸列表
  final List<Map<String, dynamic>> _stickers = [
    {'name': '无贴纸', 'icon': '🎨', 'emoji': ''},
    {'name': '可爱耳朵', 'icon': '🐰', 'emoji': '🐰'},
    {'name': '天使光环', 'icon': '👼', 'emoji': '👼'},
    {'name': '皇冠', 'icon': '👑', 'emoji': '👑'},
    {'name': '蝴蝶结', 'icon': '🎀', 'emoji': '🎀'},
    {'name': '墨镜', 'icon': '🕶️', 'emoji': '🕶️'},
    {'name': '帽子', 'icon': '🎩', 'emoji': '🎩'},
    {'name': '领结', 'icon': '🎗️', 'emoji': '🎗️'},
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    _contentController.dispose();
    _titleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.backgroundColor,
      body: SafeArea(
        child: Column(
          children: [
            // 简洁的页面头部
            _buildSimpleHeader(),

            // 简洁的标签栏
            _buildSimpleTabBar(),

            // 标签页内容
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: [_buildTextTab(), _buildImageTab(), _buildVideoTab()],
              ),
            ),

            // 底部操作栏 - 发布按钮放在这里更符合用户习惯
            _buildBottomBar(),
          ],
        ),
      ),
    );
  }

  // 简洁的页面头部
  Widget _buildSimpleHeader() {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AppTheme.spacingL,
        vertical: AppTheme.spacingM,
      ),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            AppTheme.primaryColor,
            AppTheme.primaryColor.withValues(alpha: 0.8),
          ],
        ),
        boxShadow: [
          BoxShadow(
            color: AppTheme.primaryColor.withValues(alpha: 0.3),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          // 图标和标题
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: 0.2),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Icon(
                  Icons.add_photo_alternate,
                  color: Colors.white,
                  size: 24,
                ),
              ),
              const SizedBox(width: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    '发布精彩瞬间',
                    style: TextStyle(
                      fontSize: AppTheme.fontSizeXL,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    '分享你和宠物的美好时光',
                    style: TextStyle(
                      fontSize: AppTheme.fontSizeS,
                      color: Colors.white.withValues(alpha: 0.8),
                    ),
                  ),
                ],
              ),
            ],
          ),
          const Spacer(),
          // 快捷工具按钮
          Container(
            decoration: BoxDecoration(
              color: Colors.white.withValues(alpha: 0.2),
              borderRadius: BorderRadius.circular(12),
            ),
            child: IconButton(
              icon: const Icon(Icons.psychology, color: Colors.white, size: 20),
              onPressed: () {
                // AI助手功能
                ScaffoldMessenger.of(
                  context,
                ).showSnackBar(const SnackBar(content: Text('AI助手功能开发中...')));
              },
              tooltip: 'AI助手',
            ),
          ),
        ],
      ),
    );
  }

  // 简洁的标签栏
  Widget _buildSimpleTabBar() {
    return Container(
      color: Colors.white,
      child: TabBar(
        controller: _tabController,
        labelColor: AppTheme.primaryColor,
        unselectedLabelColor: AppTheme.textSecondaryColor,
        indicatorColor: AppTheme.primaryColor,
        indicatorWeight: 3,
        tabs: const [
          Tab(text: '📝 文字'),
          Tab(text: '📸 图片'),
          Tab(text: '🎬 视频'),
        ],
      ),
    );
  }

  Widget _buildTextTab() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildCategorySelector(),
          const SizedBox(height: 20),
          _buildContentInput(),
          const SizedBox(height: 20),
          _buildAIAssistant(),
          const SizedBox(height: 20),
          _buildPrivacySettings(),
        ],
      ),
    );
  }

  Widget _buildImageTab() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildImageUpload(),
          const SizedBox(height: 20),
          _buildFilterSelector(),
          const SizedBox(height: 20),
          _buildEffectSelector(),
          const SizedBox(height: 20),
          _buildStickerSelector(),
          const SizedBox(height: 20),
          _buildAIAnalysis(),
          const SizedBox(height: 20),
          _buildContentInput(),
        ],
      ),
    );
  }

  Widget _buildVideoTab() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildVideoUpload(),
          const SizedBox(height: 20),
          _buildVideoEffects(),
          const SizedBox(height: 20),
          _buildContentInput(),
        ],
      ),
    );
  }

  Widget _buildCategorySelector() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          '选择分类',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: AppTheme.textPrimaryColor,
          ),
        ),
        const SizedBox(height: 12),
        Wrap(
          spacing: 12,
          runSpacing: 12,
          children: _categories.map((category) {
            final isSelected = category == _selectedCategory;
            return GestureDetector(
              onTap: () => setState(() => _selectedCategory = category),
              child: AnimatedContainer(
                duration: AppTheme.shortAnimation,
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 8,
                ),
                decoration: BoxDecoration(
                  gradient: isSelected ? AppTheme.primaryGradient : null,
                  color: isSelected ? null : Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  border: isSelected
                      ? null
                      : Border.all(color: AppTheme.dividerColor),
                  boxShadow: isSelected
                      ? [
                          BoxShadow(
                            color: AppTheme.primaryColor.withValues(alpha: 0.3),
                            blurRadius: 8,
                            offset: const Offset(0, 4),
                          ),
                        ]
                      : null,
                ),
                child: Text(
                  category,
                  style: TextStyle(
                    color: isSelected
                        ? Colors.white
                        : AppTheme.textSecondaryColor,
                    fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500,
                  ),
                ),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }

  Widget _buildContentInput() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          '分享你的想法',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: AppTheme.textPrimaryColor,
          ),
        ),
        const SizedBox(height: 12),
        Container(
          decoration: AppTheme.cardDecoration,
          child: TextField(
            controller: _contentController,
            maxLines: 5,
            decoration: const InputDecoration(
              hintText: '分享你和宠物的美好时光...',
              border: InputBorder.none,
              contentPadding: EdgeInsets.all(16),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildAIAssistant() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: AppTheme.glassmorphismDecoration,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  gradient: AppTheme.secondaryGradient,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Icon(
                  Icons.psychology,
                  color: Colors.white,
                  size: 20,
                ),
              ),
              const SizedBox(width: 12),
              const Text(
                'AI写作助手',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: AppTheme.textPrimaryColor,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Expanded(
                child: ElevatedButton.icon(
                  onPressed: () => _generateAIContent('温馨'),
                  icon: const Icon(Icons.favorite, size: 16),
                  label: const Text('温馨文案'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppTheme.primaryColor,
                    foregroundColor: Colors.white,
                  ),
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: ElevatedButton.icon(
                  onPressed: () => _generateAIContent('幽默'),
                  icon: const Icon(Icons.sentiment_satisfied, size: 16),
                  label: const Text('幽默文案'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppTheme.secondaryColor,
                    foregroundColor: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildImageUpload() {
    return Container(
      height: 200,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: AppTheme.dividerColor,
          style: BorderStyle.solid,
        ),
      ),
      child: _selectedImages.isEmpty
          ? _buildUploadPlaceholder()
          : _buildImagePreview(),
    );
  }

  Widget _buildUploadPlaceholder() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              gradient: AppTheme.primaryGradient,
              borderRadius: BorderRadius.circular(16),
            ),
            child: const Icon(Icons.add_a_photo, color: Colors.white, size: 32),
          ),
          const SizedBox(height: 12),
          const Text(
            '点击上传图片',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: AppTheme.textPrimaryColor,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            '支持AI智能美化',
            style: TextStyle(fontSize: 12, color: AppTheme.textSecondaryColor),
          ),
        ],
      ),
    );
  }

  Widget _buildImagePreview() {
    return GridView.builder(
      padding: const EdgeInsets.all(8),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 8,
        mainAxisSpacing: 8,
      ),
      itemCount: _selectedImages.length + 1,
      itemBuilder: (context, index) {
        if (index == _selectedImages.length) {
          return _buildAddMoreButton();
        }
        return _buildImageItem(_selectedImages[index]);
      },
    );
  }

  Widget _buildAddMoreButton() {
    return Container(
      decoration: BoxDecoration(
        color: AppTheme.primaryLightColor,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: AppTheme.primaryColor,
          style: BorderStyle.solid,
        ),
      ),
      child: const Icon(Icons.add, color: AppTheme.primaryColor, size: 24),
    );
  }

  Widget _buildImageItem(String imagePath) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Image.asset(
            imagePath,
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
        ),
        Positioned(
          top: 4,
          right: 4,
          child: GestureDetector(
            onTap: () => _removeImage(imagePath),
            child: Container(
              padding: const EdgeInsets.all(4),
              decoration: const BoxDecoration(
                color: Colors.red,
                shape: BoxShape.circle,
              ),
              child: const Icon(Icons.close, color: Colors.white, size: 12),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildFilterSelector() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'AI滤镜',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: AppTheme.textPrimaryColor,
          ),
        ),
        const SizedBox(height: 12),
        SizedBox(
          height: 80,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: _filters.length,
            itemBuilder: (context, index) {
              final filter = _filters[index];
              final isSelected = filter['name'] == _selectedFilter;
              return Container(
                margin: const EdgeInsets.only(right: 12),
                child: Column(
                  mainAxisSize: MainAxisSize.min, // 添加这行
                  children: [
                    GestureDetector(
                      onTap: () =>
                          setState(() => _selectedFilter = filter['name']),
                      child: AnimatedContainer(
                        duration: AppTheme.shortAnimation,
                        width: 60,
                        height: 60,
                        decoration: BoxDecoration(
                          gradient: isSelected
                              ? AppTheme.primaryGradient
                              : null,
                          color: isSelected ? null : Colors.white,
                          borderRadius: BorderRadius.circular(12),
                          border: isSelected
                              ? null
                              : Border.all(color: AppTheme.dividerColor),
                        ),
                        child: Center(
                          child: Text(
                            filter['icon'],
                            style: const TextStyle(fontSize: 24),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 3), // 减少间距从4到3
                    Text(
                      filter['name'],
                      style: TextStyle(
                        fontSize: 11, // 稍微减小字体从12到11
                        color: isSelected
                            ? AppTheme.primaryColor
                            : AppTheme.textSecondaryColor,
                        fontWeight: isSelected
                            ? FontWeight.w600
                            : FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildEffectSelector() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'AI特效',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: AppTheme.textPrimaryColor,
          ),
        ),
        const SizedBox(height: 12),
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
            childAspectRatio: 2.5,
          ),
          itemCount: _effects.length,
          itemBuilder: (context, index) {
            final effect = _effects[index];
            final isSelected = effect['name'] == _selectedEffect;
            return GestureDetector(
              onTap: () => setState(() => _selectedEffect = effect['name']),
              child: AnimatedContainer(
                duration: AppTheme.shortAnimation,
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  gradient: isSelected ? AppTheme.primaryGradient : null,
                  color: isSelected ? null : Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  border: isSelected
                      ? null
                      : Border.all(color: AppTheme.dividerColor),
                ),
                child: Row(
                  children: [
                    Text(effect['icon'], style: const TextStyle(fontSize: 20)),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            effect['name'],
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: isSelected
                                  ? Colors.white
                                  : AppTheme.textPrimaryColor,
                            ),
                          ),
                          Text(
                            effect['description'],
                            style: TextStyle(
                              fontSize: 12,
                              color: isSelected
                                  ? Colors.white70
                                  : AppTheme.textSecondaryColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ],
    );
  }

  Widget _buildStickerSelector() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          '可爱贴纸',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: AppTheme.textPrimaryColor,
          ),
        ),
        const SizedBox(height: 12),
        SizedBox(
          height: 80,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: _stickers.length,
            itemBuilder: (context, index) {
              final sticker = _stickers[index];
              final isSelected = sticker['name'] == _selectedSticker;
              return Container(
                margin: const EdgeInsets.only(right: 12),
                child: Column(
                  mainAxisSize: MainAxisSize.min, // 添加这行
                  children: [
                    GestureDetector(
                      onTap: () =>
                          setState(() => _selectedSticker = sticker['name']),
                      child: AnimatedContainer(
                        duration: AppTheme.shortAnimation,
                        width: 60,
                        height: 60,
                        decoration: BoxDecoration(
                          gradient: isSelected ? AppTheme.warmGradient : null,
                          color: isSelected ? null : Colors.white,
                          borderRadius: BorderRadius.circular(12),
                          border: isSelected
                              ? null
                              : Border.all(color: AppTheme.dividerColor),
                        ),
                        child: Center(
                          child: Text(
                            sticker['icon'],
                            style: const TextStyle(fontSize: 24),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 3), // 减少间距从4到3
                    Text(
                      sticker['name'],
                      style: TextStyle(
                        fontSize: 11, // 稍微减小字体从12到11
                        color: isSelected
                            ? AppTheme.warningColor
                            : AppTheme.textSecondaryColor,
                        fontWeight: isSelected
                            ? FontWeight.w600
                            : FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildAIAnalysis() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: AppTheme.glassmorphismDecoration,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  gradient: AppTheme.secondaryGradient,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Icon(
                  Icons.auto_awesome,
                  color: Colors.white,
                  size: 20,
                ),
              ),
              const SizedBox(width: 12),
              const Text(
                'AI智能分析',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: AppTheme.textPrimaryColor,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          if (_aiAnalysisResult.isNotEmpty)
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: AppTheme.secondaryLightColor,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                _aiAnalysisResult,
                style: const TextStyle(
                  fontSize: 14,
                  color: AppTheme.textPrimaryColor,
                ),
              ),
            )
          else
            ElevatedButton.icon(
              onPressed: _performAIAnalysis,
              icon: _isAIAnalyzing
                  ? const SizedBox(
                      width: 16,
                      height: 16,
                      child: CircularProgressIndicator(
                        strokeWidth: 2,
                        color: Colors.white,
                      ),
                    )
                  : const Icon(Icons.psychology, size: 16),
              label: Text(_isAIAnalyzing ? '分析中...' : '开始AI分析'),
              style: ElevatedButton.styleFrom(
                backgroundColor: AppTheme.secondaryColor,
                foregroundColor: Colors.white,
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildVideoUpload() {
    return Container(
      height: 200,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: AppTheme.dividerColor,
          style: BorderStyle.solid,
        ),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                gradient: AppTheme.primaryGradient,
                borderRadius: BorderRadius.circular(16),
              ),
              child: const Icon(Icons.videocam, color: Colors.white, size: 32),
            ),
            const SizedBox(height: 12),
            const Text(
              '录制或上传视频',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: AppTheme.textPrimaryColor,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              '支持AI智能剪辑',
              style: TextStyle(
                fontSize: 12,
                color: AppTheme.textSecondaryColor,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildVideoEffects() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          '视频特效',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: AppTheme.textPrimaryColor,
          ),
        ),
        const SizedBox(height: 12),
        Row(
          children: [
            Expanded(
              child: ElevatedButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.slow_motion_video, size: 16),
                label: const Text('慢动作'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppTheme.primaryColor,
                  foregroundColor: Colors.white,
                ),
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: ElevatedButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.music_note, size: 16),
                label: const Text('配乐'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppTheme.secondaryColor,
                  foregroundColor: Colors.white,
                ),
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: ElevatedButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.text_fields, size: 16),
                label: const Text('字幕'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppTheme.warningColor,
                  foregroundColor: Colors.white,
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
      padding: const EdgeInsets.all(16),
      decoration: AppTheme.cardDecoration,
      child: Row(
        children: [
          Icon(
            _isPublic ? Icons.public : Icons.lock,
            color: AppTheme.textSecondaryColor,
          ),
          const SizedBox(width: 12),
          const Expanded(
            child: Text(
              '公开可见',
              style: TextStyle(fontSize: 16, color: AppTheme.textPrimaryColor),
            ),
          ),
          Switch(
            value: _isPublic,
            onChanged: (value) => setState(() => _isPublic = value),
            activeColor: AppTheme.primaryColor,
          ),
        ],
      ),
    );
  }

  Widget _buildBottomBar() {
    return SafeArea(
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.1),
              blurRadius: 10,
              offset: const Offset(0, -5),
            ),
          ],
        ),
        child: Row(
          children: [
            Expanded(
              child: ElevatedButton.icon(
                onPressed: _publishContent,
                icon: const Icon(Icons.send, size: 16),
                label: const Text('发布'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppTheme.primaryColor,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 12),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // 辅助方法
  void _generateAIContent(String style) {
    // 模拟AI生成内容
    final contents = {
      '温馨': '今天和我的小宝贝一起度过了美好的时光，看着它开心的样子，我的心里也充满了温暖。感谢有你的陪伴，让我的生活更加精彩！',
      '幽默': '我家的小家伙今天又做了一件让人哭笑不得的事情，真是个活宝！有时候我在想，到底是我在养宠物，还是宠物在逗我玩呢？😂',
    };

    setState(() {
      _contentController.text = contents[style] ?? '';
    });
  }

  void _performAIAnalysis() {
    setState(() {
      _isAIAnalyzing = true;
    });

    // 模拟AI分析过程
    Future.delayed(const Duration(seconds: 2), () {
      setState(() {
        _isAIAnalyzing = false;
        _aiAnalysisResult =
            'AI分析结果：\n• 宠物情绪：开心 😊\n• 健康状况：良好\n• 建议：继续保持当前的护理方式';
      });
    });
  }

  void _removeImage(String imagePath) {
    setState(() {
      _selectedImages.remove(imagePath);
    });
  }

  void _publishContent() {
    // 发布逻辑
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('发布成功！'),
        backgroundColor: AppTheme.successColor,
      ),
    );

    if (widget.onClose != null) {
      widget.onClose!();
    } else if (Navigator.of(context).canPop()) {
      Navigator.of(context).pop();
    }
  }
}
