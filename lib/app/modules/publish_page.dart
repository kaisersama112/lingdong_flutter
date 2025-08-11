import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class PublishPage extends StatefulWidget {
  const PublishPage({super.key});

  @override
  State<PublishPage> createState() => _PublishPageState();
}

class _PublishPageState extends State<PublishPage> with TickerProviderStateMixin {
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
          onPressed: () => Navigator.of(context).pop(),
        ),
        actions: [
          TextButton(
            onPressed: _publishContent,
            child: Text(
              '发布',
              style: TextStyle(
                color: AppTheme.primaryColor,
                fontSize: AppTheme.fontSizeL,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          // 发布类型选择
          _buildPublishTypeSelector(),
          
          // 标签页
          _buildTabBar(),
          
          // 内容区域
          Expanded(
            child: _buildTabBarView(),
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
          Text(
            '发布类型',
            style: AppTheme.subheadingStyle,
          ),
          const SizedBox(height: AppTheme.spacingM),
          Row(
            children: [
              Expanded(
                child: _buildTypeOption(
                  title: '社群公共',
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
      child: Container(
        padding: const EdgeInsets.all(AppTheme.spacingM),
        decoration: BoxDecoration(
          color: isSelected ? AppTheme.primaryLightColor : AppTheme.surfaceColor,
          borderRadius: BorderRadius.circular(AppTheme.borderRadiusMedium),
          border: Border.all(
            color: isSelected ? AppTheme.primaryColor : AppTheme.dividerColor,
            width: isSelected ? 2 : 1,
          ),
        ),
        child: Column(
          children: [
            Icon(
              icon,
              color: isSelected ? AppTheme.primaryColor : AppTheme.textSecondaryColor,
              size: 32,
            ),
            const SizedBox(height: AppTheme.spacingS),
            Text(
              title,
              style: TextStyle(
                fontSize: AppTheme.fontSizeL,
                fontWeight: FontWeight.w600,
                color: isSelected ? AppTheme.primaryColor : AppTheme.textPrimaryColor,
              ),
            ),
            const SizedBox(height: AppTheme.spacingXS),
            Text(
              subtitle,
              style: TextStyle(
                fontSize: AppTheme.fontSizeS,
                color: isSelected ? AppTheme.primaryColor : AppTheme.textSecondaryColor,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
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
        labelStyle: const TextStyle(fontWeight: FontWeight.w600, fontSize: AppTheme.fontSizeL),
        unselectedLabelStyle: const TextStyle(fontWeight: FontWeight.normal, fontSize: AppTheme.fontSizeL),
        tabs: const [
          Tab(text: '内容编辑'),
          Tab(text: '预览效果'),
        ],
      ),
    );
  }

  Widget _buildTabBarView() {
    return TabBarView(
      controller: _tabController,
      children: [
        _buildContentEditTab(),
        _buildPreviewTab(),
      ],
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
          
          // 标题输入
          _buildTitleInput(),
          
          const SizedBox(height: AppTheme.spacingM),
          
          // 内容输入
          _buildContentInput(),
          
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

  Widget _buildCategorySelector() {
    return Container(
      padding: const EdgeInsets.all(AppTheme.spacingM),
      decoration: AppTheme.cardDecoration,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '选择分类',
            style: AppTheme.subheadingStyle,
          ),
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
                    color: isSelected ? AppTheme.primaryColor : AppTheme.surfaceColor,
                    borderRadius: BorderRadius.circular(AppTheme.borderRadiusMedium),
                    border: Border.all(
                      color: isSelected ? AppTheme.primaryColor : AppTheme.dividerColor,
                    ),
                  ),
                  child: Text(
                    category,
                    style: TextStyle(
                      color: isSelected ? Colors.white : AppTheme.textPrimaryColor,
                      fontSize: AppTheme.fontSizeM,
                      fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
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
          Text(
            '标题',
            style: AppTheme.subheadingStyle,
          ),
          const SizedBox(height: AppTheme.spacingM),
          TextField(
            controller: _titleController,
            decoration: InputDecoration(
              hintText: '请输入标题...',
              hintStyle: TextStyle(color: AppTheme.textLightColor),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(AppTheme.borderRadiusMedium),
                borderSide: BorderSide(color: AppTheme.dividerColor),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(AppTheme.borderRadiusMedium),
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
          Text(
            '内容',
            style: AppTheme.subheadingStyle,
          ),
          const SizedBox(height: AppTheme.spacingM),
          TextField(
            controller: _contentController,
            maxLines: 6,
            decoration: InputDecoration(
              hintText: '分享你的想法...',
              hintStyle: TextStyle(color: AppTheme.textLightColor),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(AppTheme.borderRadiusMedium),
                borderSide: BorderSide(color: AppTheme.dividerColor),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(AppTheme.borderRadiusMedium),
                borderSide: BorderSide(color: AppTheme.primaryColor, width: 2),
              ),
            ),
          ),
        ],
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
          Text(
            '添加图片',
            style: AppTheme.subheadingStyle,
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
          border: Border.all(color: AppTheme.dividerColor, style: BorderStyle.solid),
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
              child: const Icon(
                Icons.close,
                color: Colors.white,
                size: 16,
              ),
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
          Expanded(
            child: Text(
              '添加位置',
              style: AppTheme.bodyStyle,
            ),
          ),
          IconButton(
            icon: Icon(Icons.arrow_forward_ios, color: AppTheme.textSecondaryColor),
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
          Text(
            '添加标签',
            style: AppTheme.subheadingStyle,
          ),
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
      child: Column(
        children: [
          _buildPreviewCard(),
        ],
      ),
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
                    Text(
                      '我的动态',
                      style: AppTheme.subheadingStyle,
                    ),
                    Text(
                      '刚刚',
                      style: AppTheme.captionStyle,
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: AppTheme.spacingS,
                  vertical: AppTheme.spacingXS,
                ),
                decoration: BoxDecoration(
                  color: _isPublic ? AppTheme.successLightColor : AppTheme.warningLightColor,
                  borderRadius: BorderRadius.circular(AppTheme.borderRadiusSmall),
                ),
                child: Text(
                  _isPublic ? '公开' : '私密',
                  style: TextStyle(
                    fontSize: AppTheme.fontSizeXS,
                    color: _isPublic ? AppTheme.successColor : AppTheme.warningColor,
                  ),
                ),
              ),
            ],
          ),
          
          const SizedBox(height: AppTheme.spacingM),
          
          // 内容预览
          if (_titleController.text.isNotEmpty) ...[
            Text(
              _titleController.text,
              style: AppTheme.subheadingStyle,
            ),
            const SizedBox(height: AppTheme.spacingS),
          ],
          
          if (_contentController.text.isNotEmpty)
            Text(
              _contentController.text,
              style: AppTheme.bodyStyle,
            ),
          
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
                      borderRadius: BorderRadius.circular(AppTheme.borderRadiusMedium),
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
      SnackBar(
        content: Text(message),
        backgroundColor: AppTheme.primaryColor,
      ),
    );
  }
}