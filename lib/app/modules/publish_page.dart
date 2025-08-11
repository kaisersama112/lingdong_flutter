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
  List<String> _selectedImages = [];
  bool _isPublic = true;

  final List<String> _categories = [
    '社群动态',
    '宠物分享',
    '健康咨询',
    '活动召集',
    '求助信息',
    '其他',
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
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
      appBar: AppBar(
        title: Text(
          '发布内容',
          style: AppTheme.headingStyle.copyWith(
            fontSize: AppTheme.fontSizeXL,
            color: AppTheme.textPrimaryColor,
          ),
        ),
        backgroundColor: AppTheme.surfaceColor,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: AppTheme.textPrimaryColor),
          onPressed: () {
            if (widget.onClose != null) {
              widget.onClose!();
              return;
            }
            if (Navigator.of(context).canPop()) {
              Navigator.of(context).pop();
            }
          },
        ),
      ),
      body: Column(
        children: [
          // 顶部宠物主题横幅
          _buildHeaderBanner(),

          // 发布类型选择
          _buildPublishTypeSelector(),

          // 标签页
          _buildTabBar(),

          // 内容区域
          Expanded(child: _buildTabBarView()),
        ],
      ),
      bottomNavigationBar: SafeArea(
        child: Container(
          padding: const EdgeInsets.fromLTRB(
            AppTheme.spacingM,
            AppTheme.spacingS,
            AppTheme.spacingM,
            AppTheme.spacingM,
          ),
          decoration: BoxDecoration(
            color: AppTheme.surfaceColor,
            boxShadow: AppTheme.subtleShadow,
          ),
          child: Row(
            children: [
              Expanded(
                child: OutlinedButton(
                  onPressed: () => _showSnackBar('已存为草稿'),
                  style: AppTheme.secondaryButtonStyle,
                  child: const Text('存草稿'),
                ),
              ),
              const SizedBox(width: AppTheme.spacingM),
              Expanded(
                child: SizedBox(
                  height: 48,
                  child: ElevatedButton.icon(
                    onPressed: _publishContent,
                    style: AppTheme.primaryButtonStyle,
                    icon: const Icon(Icons.pets, size: 18),
                    label: const Text('发布'),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeaderBanner() {
    return Container(
      margin: const EdgeInsets.fromLTRB(
        AppTheme.spacingM,
        AppTheme.spacingM,
        AppTheme.spacingM,
        AppTheme.spacingS,
      ),
      decoration: AppTheme.elevatedCardDecoration.copyWith(
        borderRadius: BorderRadius.circular(AppTheme.borderRadiusLarge),
        gradient: AppTheme.secondaryGradient,
      ),
      child: Stack(
        children: [
          // 背景爪印
          Positioned(
            right: -10,
            top: -6,
            child: Opacity(
              opacity: 0.18,
              child: Text('🐾', style: TextStyle(fontSize: 72)),
            ),
          ),
          Positioned(
            left: 12,
            bottom: -10,
            child: Opacity(
              opacity: 0.12,
              child: Text('🐶', style: TextStyle(fontSize: 64)),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(AppTheme.spacingL),
            child: Row(
              children: [
                const Text('🐕', style: TextStyle(fontSize: 36)),
                const SizedBox(width: AppTheme.spacingM),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '记录宠物的温馨瞬间',
                        style: AppTheme.subheadingStyle.copyWith(
                          color: Colors.white,
                          fontSize: AppTheme.fontSizeXL,
                        ),
                      ),
                      const SizedBox(height: 6),
                      Text(
                        '照片、心得、技巧… 与爱宠一起分享吧',
                        style: AppTheme.captionStyle.copyWith(
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPublishTypeSelector() {
    return Container(
      margin: const EdgeInsets.all(AppTheme.spacingM),
      padding: const EdgeInsets.all(AppTheme.spacingM),
      decoration: AppTheme.cardDecoration,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('发布类型', style: AppTheme.subheadingStyle),
          const SizedBox(height: AppTheme.spacingM),
          Row(
            children: [
              Expanded(
                child: _buildTypeOption(
                  title: '社群公告',
                  subtitle: '所有用户可见',
                  icon: Icons.public,
                  isSelected: _isPublic,
                  onTap: () => setState(() => _isPublic = true),
                ),
              ),
              const SizedBox(width: AppTheme.spacingM),
              Expanded(
                child: _buildTypeOption(
                  title: '个人动态',
                  subtitle: '仅关注者可见',
                  icon: Icons.person,
                  isSelected: !_isPublic,
                  onTap: () => setState(() => _isPublic = false),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildTypeOption({
    required String title,
    required String subtitle,
    required IconData icon,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Stack(
        children: [
          Container(
            padding: const EdgeInsets.all(AppTheme.spacingM),
            decoration: BoxDecoration(
              color: isSelected ? null : AppTheme.surfaceColor,
              gradient: isSelected ? AppTheme.primaryGradient : null,
              borderRadius: BorderRadius.circular(AppTheme.borderRadiusMedium),
              boxShadow: AppTheme.subtleShadow,
              border: Border.all(
                color: isSelected
                    ? AppTheme.primaryDarkColor
                    : AppTheme.dividerColor,
                width: 1,
              ),
            ),
            child: Column(
              children: [
                Icon(
                  icon,
                  color: isSelected
                      ? Colors.white
                      : AppTheme.textSecondaryColor,
                  size: 32,
                ),
                const SizedBox(height: AppTheme.spacingS),
                Text(
                  title,
                  style: TextStyle(
                    fontSize: AppTheme.fontSizeL,
                    fontWeight: FontWeight.w600,
                    color: isSelected
                        ? Colors.white
                        : AppTheme.textPrimaryColor,
                  ),
                ),
                const SizedBox(height: AppTheme.spacingXS),
                Text(
                  subtitle,
                  style: TextStyle(
                    fontSize: AppTheme.fontSizeS,
                    color: isSelected
                        ? Colors.white70
                        : AppTheme.textLightColor,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
          if (isSelected)
            Positioned(
              right: 8,
              top: 8,
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
                padding: const EdgeInsets.all(2),
                child: Icon(
                  Icons.check_circle,
                  color: AppTheme.primaryColor,
                  size: 18,
                ),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildTabBar() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: AppTheme.spacingM),
      decoration: AppTheme.cardDecoration,
      child: TabBar(
        controller: _tabController,
        indicator: BoxDecoration(
          borderRadius: BorderRadius.circular(AppTheme.borderRadiusMedium),
          color: AppTheme.primaryLightColor,
        ),
        labelColor: AppTheme.primaryColor,
        unselectedLabelColor: AppTheme.textSecondaryColor,
        labelStyle: const TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: AppTheme.fontSizeL,
        ),
        unselectedLabelStyle: const TextStyle(
          fontWeight: FontWeight.normal,
          fontSize: AppTheme.fontSizeL,
        ),
        tabs: const [
          Tab(icon: Icon(Icons.edit_outlined), text: '内容编辑'),
          Tab(icon: Icon(Icons.preview_outlined), text: '预览效果'),
        ],
      ),
    );
  }

  Widget _buildTabBarView() {
    return TabBarView(
      controller: _tabController,
      children: [_buildContentEditTab(), _buildPreviewTab()],
    );
  }

  Widget _buildContentEditTab() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(AppTheme.spacingM),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 分类选择
          _buildCategorySelector(),

          const SizedBox(height: AppTheme.spacingM),

          // 选择宠物/犬种
          _buildPetSelector(),

          const SizedBox(height: AppTheme.spacingM),

          // 标题输入
          _buildTitleInput(),

          const SizedBox(height: AppTheme.spacingM),

          // 内容输入
          _buildContentInput(),

          const SizedBox(height: AppTheme.spacingS),
          _buildEditorToolbar(),

          const SizedBox(height: AppTheme.spacingS),
          _buildMoodChips(),

          const SizedBox(height: AppTheme.spacingM),

          // 图片选择
          _buildImageSelector(),

          const SizedBox(height: AppTheme.spacingM),

          // 位置选择
          _buildLocationSelector(),

          const SizedBox(height: AppTheme.spacingM),

          // 标签选择
          _buildTagSelector(),

          const SizedBox(height: AppTheme.spacingXL),
        ],
      ),
    );
  }

  Widget _buildPetSelector() {
    return Container(
      padding: const EdgeInsets.all(AppTheme.spacingM),
      decoration: AppTheme.cardDecoration,
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: AppTheme.secondaryLightColor,
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Icon(Icons.pets, color: AppTheme.secondaryDarkColor),
          ),
          const SizedBox(width: AppTheme.spacingM),
          Expanded(child: Text('选择宠物/犬种', style: AppTheme.bodyStyle)),
          IconButton(
            icon: Icon(Icons.chevron_right, color: AppTheme.textSecondaryColor),
            onPressed: () => _showSnackBar('选择宠物功能开发中…'),
          ),
        ],
      ),
    );
  }

  Widget _buildCategorySelector() {
    return Container(
      padding: const EdgeInsets.all(AppTheme.spacingM),
      decoration: AppTheme.cardDecoration,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('选择分类', style: AppTheme.subheadingStyle),
          const SizedBox(height: AppTheme.spacingM),
          Wrap(
            spacing: AppTheme.spacingS,
            runSpacing: AppTheme.spacingS,
            children: _categories.map((category) {
              final isSelected = category == _selectedCategory;
              return GestureDetector(
                onTap: () => setState(() => _selectedCategory = category),
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: AppTheme.spacingM,
                    vertical: AppTheme.spacingS,
                  ),
                  decoration: BoxDecoration(
                    color: isSelected
                        ? AppTheme.primaryColor
                        : AppTheme.surfaceColor,
                    borderRadius: BorderRadius.circular(
                      AppTheme.borderRadiusMedium,
                    ),
                    border: Border.all(
                      color: isSelected
                          ? AppTheme.primaryColor
                          : AppTheme.dividerColor,
                    ),
                  ),
                  child: Text(
                    category,
                    style: TextStyle(
                      color: isSelected
                          ? Colors.white
                          : AppTheme.textPrimaryColor,
                      fontSize: AppTheme.fontSizeM,
                      fontWeight: isSelected
                          ? FontWeight.w600
                          : FontWeight.normal,
                    ),
                  ),
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }

  Widget _buildTitleInput() {
    return Container(
      padding: const EdgeInsets.all(AppTheme.spacingM),
      decoration: AppTheme.cardDecoration,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('标题', style: AppTheme.subheadingStyle),
          const SizedBox(height: AppTheme.spacingM),
          TextField(
            controller: _titleController,
            decoration: InputDecoration(
              hintText: '请输入标题...',
              hintStyle: TextStyle(color: AppTheme.textLightColor),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(
                  AppTheme.borderRadiusMedium,
                ),
                borderSide: BorderSide(color: AppTheme.dividerColor),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(
                  AppTheme.borderRadiusMedium,
                ),
                borderSide: BorderSide(color: AppTheme.primaryColor, width: 2),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildContentInput() {
    return Container(
      padding: const EdgeInsets.all(AppTheme.spacingM),
      decoration: AppTheme.cardDecoration,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('内容', style: AppTheme.subheadingStyle),
          const SizedBox(height: AppTheme.spacingM),
          TextField(
            controller: _contentController,
            maxLines: 6,
            maxLength: 500,
            decoration: InputDecoration(
              hintText: '分享你的想法...',
              hintStyle: TextStyle(color: AppTheme.textLightColor),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(
                  AppTheme.borderRadiusMedium,
                ),
                borderSide: BorderSide(color: AppTheme.dividerColor),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(
                  AppTheme.borderRadiusMedium,
                ),
                borderSide: BorderSide(color: AppTheme.primaryColor, width: 2),
              ),
              counterText: '',
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildEditorToolbar() {
    Widget action(IconData icon, String label, VoidCallback onTap) {
      return Expanded(
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(AppTheme.borderRadiusSmall),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: AppTheme.spacingS),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: AppTheme.primaryLightColor,
                    borderRadius: BorderRadius.circular(
                      AppTheme.borderRadiusSmall,
                    ),
                  ),
                  child: Icon(icon, color: AppTheme.primaryDarkColor, size: 18),
                ),
                const SizedBox(height: 4),
                Text(label, style: AppTheme.captionStyle),
              ],
            ),
          ),
        ),
      );
    }

    return Container(
      decoration: AppTheme.cardDecoration,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: AppTheme.spacingM,
          vertical: AppTheme.spacingS,
        ),
        child: Row(
          children: [
            action(Icons.photo_outlined, '相册', () => _showSnackBar('从相册选择')),
            action(
              Icons.photo_camera_outlined,
              '相机',
              () => _showSnackBar('打开相机'),
            ),
            action(Icons.alternate_email, '@话题', () => _showSnackBar('插入话题')),
            action(Icons.tag_outlined, '标签', () => _showSnackBar('添加标签')),
          ],
        ),
      ),
    );
  }

  Widget _buildMoodChips() {
    final moods = [
      ['开心', '😊'],
      ['活力', '⚡'],
      ['乖巧', '🧡'],
      ['调皮', '😜'],
    ];
    return SizedBox(
      height: 36,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemBuilder: (_, i) {
          final m = moods[i];
          return Container(
            padding: const EdgeInsets.symmetric(
              horizontal: AppTheme.spacingM,
              vertical: AppTheme.spacingS,
            ),
            decoration: BoxDecoration(
              color: AppTheme.successLightColor,
              borderRadius: BorderRadius.circular(18),
            ),
            child: Row(
              children: [
                Text(m[1]),
                const SizedBox(width: 6),
                Text(
                  m[0],
                  style: AppTheme.bodyStyle.copyWith(
                    color: AppTheme.successColor,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          );
        },
        separatorBuilder: (_, __) => const SizedBox(width: 8),
        itemCount: moods.length,
      ),
    );
  }

  Widget _buildImageSelector() {
    return Container(
      padding: const EdgeInsets.all(AppTheme.spacingM),
      decoration: AppTheme.cardDecoration,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text('添加图片', style: AppTheme.subheadingStyle),
              const SizedBox(width: AppTheme.spacingS),
              Text('(最多 9 张)', style: AppTheme.captionStyle),
            ],
          ),
          const SizedBox(height: AppTheme.spacingM),
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: AppTheme.spacingS,
              mainAxisSpacing: AppTheme.spacingS,
            ),
            itemCount: _selectedImages.length + 1,
            itemBuilder: (context, index) {
              if (index == _selectedImages.length) {
                return _buildAddImageButton();
              }
              return _buildImageItem(_selectedImages[index], index);
            },
          ),
        ],
      ),
    );
  }

  Widget _buildAddImageButton() {
    return GestureDetector(
      onTap: _addImage,
      child: Container(
        decoration: BoxDecoration(
          color: AppTheme.backgroundColor,
          borderRadius: BorderRadius.circular(AppTheme.borderRadiusMedium),
          border: Border.all(
            color: AppTheme.dividerColor,
            style: BorderStyle.solid,
          ),
        ),
        child: Icon(
          Icons.add_photo_alternate_outlined,
          color: AppTheme.textSecondaryColor,
          size: 32,
        ),
      ),
    );
  }

  Widget _buildImageItem(String image, int index) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            color: AppTheme.backgroundColor,
            borderRadius: BorderRadius.circular(AppTheme.borderRadiusMedium),
            image: DecorationImage(
              image: NetworkImage(image),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Positioned(
          top: 4,
          right: 4,
          child: GestureDetector(
            onTap: () => _removeImage(index),
            child: Container(
              padding: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                color: AppTheme.errorColor,
                shape: BoxShape.circle,
              ),
              child: const Icon(Icons.close, color: Colors.white, size: 16),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildLocationSelector() {
    return Container(
      padding: const EdgeInsets.all(AppTheme.spacingM),
      decoration: AppTheme.cardDecoration,
      child: Row(
        children: [
          Icon(Icons.location_on, color: AppTheme.primaryColor),
          const SizedBox(width: AppTheme.spacingM),
          Expanded(child: Text('添加位置', style: AppTheme.bodyStyle)),
          IconButton(
            icon: Icon(
              Icons.arrow_forward_ios,
              color: AppTheme.textSecondaryColor,
            ),
            onPressed: _selectLocation,
          ),
        ],
      ),
    );
  }

  Widget _buildTagSelector() {
    return Container(
      padding: const EdgeInsets.all(AppTheme.spacingM),
      decoration: AppTheme.cardDecoration,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('添加标签', style: AppTheme.subheadingStyle),
          const SizedBox(height: AppTheme.spacingM),
          Wrap(
            spacing: AppTheme.spacingS,
            runSpacing: AppTheme.spacingS,
            children: [
              _buildTagChip('宠物健康', true),
              _buildTagChip('日常分享', false),
              _buildTagChip('萌宠瞬间', false),
              _buildTagChip('训练技巧', false),
              _buildTagChip('美食推荐', false),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildTagChip(String label, bool isSelected) {
    return GestureDetector(
      onTap: () {
        // 这里可以添加标签选择逻辑
      },
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: AppTheme.spacingM,
          vertical: AppTheme.spacingS,
        ),
        decoration: BoxDecoration(
          color: isSelected ? AppTheme.primaryColor : AppTheme.surfaceColor,
          borderRadius: BorderRadius.circular(AppTheme.borderRadiusMedium),
          border: Border.all(
            color: isSelected ? AppTheme.primaryColor : AppTheme.dividerColor,
          ),
        ),
        child: Text(
          label,
          style: TextStyle(
            color: isSelected ? Colors.white : AppTheme.textPrimaryColor,
            fontSize: AppTheme.fontSizeS,
          ),
        ),
      ),
    );
  }

  Widget _buildPreviewTab() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(AppTheme.spacingM),
      child: Column(children: [_buildPreviewCard()]),
    );
  }

  Widget _buildPreviewCard() {
    return Container(
      padding: const EdgeInsets.all(AppTheme.spacingM),
      decoration: AppTheme.cardDecoration,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 用户信息
          Row(
            children: [
              CircleAvatar(
                radius: 20,
                backgroundColor: AppTheme.primaryLightColor,
                child: Icon(Icons.person, color: AppTheme.primaryColor),
              ),
              const SizedBox(width: AppTheme.spacingM),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('我的动态', style: AppTheme.subheadingStyle),
                    Text('刚刚', style: AppTheme.captionStyle),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: AppTheme.spacingS,
                  vertical: AppTheme.spacingXS,
                ),
                decoration: BoxDecoration(
                  color: _isPublic
                      ? AppTheme.successLightColor
                      : AppTheme.warningLightColor,
                  borderRadius: BorderRadius.circular(
                    AppTheme.borderRadiusSmall,
                  ),
                ),
                child: Text(
                  _isPublic ? '公开' : '私密',
                  style: TextStyle(
                    fontSize: AppTheme.fontSizeXS,
                    color: _isPublic
                        ? AppTheme.successColor
                        : AppTheme.warningColor,
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: AppTheme.spacingM),

          // 内容预览
          if (_titleController.text.isNotEmpty) ...[
            Text(_titleController.text, style: AppTheme.subheadingStyle),
            const SizedBox(height: AppTheme.spacingS),
          ],

          if (_contentController.text.isNotEmpty)
            Text(_contentController.text, style: AppTheme.bodyStyle),

          if (_selectedImages.isNotEmpty) ...[
            const SizedBox(height: AppTheme.spacingM),
            Container(
              height: 120,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: _selectedImages.length,
                itemBuilder: (context, index) {
                  return Container(
                    width: 120,
                    margin: const EdgeInsets.only(right: AppTheme.spacingS),
                    decoration: BoxDecoration(
                      color: AppTheme.backgroundColor,
                      borderRadius: BorderRadius.circular(
                        AppTheme.borderRadiusMedium,
                      ),
                      image: DecorationImage(
                        image: NetworkImage(_selectedImages[index]),
                        fit: BoxFit.cover,
                      ),
                    ),
                  );
                },
              ),
            ),
          ],

          const SizedBox(height: AppTheme.spacingM),

          // 分类标签
          if (_selectedCategory.isNotEmpty)
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: AppTheme.spacingS,
                vertical: AppTheme.spacingXS,
              ),
              decoration: BoxDecoration(
                color: AppTheme.primaryLightColor,
                borderRadius: BorderRadius.circular(AppTheme.borderRadiusSmall),
              ),
              child: Text(
                _selectedCategory,
                style: TextStyle(
                  fontSize: AppTheme.fontSizeXS,
                  color: AppTheme.primaryColor,
                ),
              ),
            ),
        ],
      ),
    );
  }

  void _addImage() {
    // 这里可以添加图片选择逻辑
    setState(() {
      _selectedImages.add('https://via.placeholder.com/150');
    });
  }

  void _removeImage(int index) {
    setState(() {
      _selectedImages.removeAt(index);
    });
  }

  void _selectLocation() {
    _showSnackBar('位置选择功能开发中...');
  }

  void _publishContent() {
    if (_contentController.text.isEmpty) {
      _showSnackBar('请输入内容');
      return;
    }

    _showSnackBar('发布成功！');
    // 这里可以添加发布逻辑
  }

  void _showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message), backgroundColor: AppTheme.primaryColor),
    );
  }
}
