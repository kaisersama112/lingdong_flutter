import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../theme/app_components.dart';

class SocialPage extends StatefulWidget {
  const SocialPage({super.key});

  @override
  State<SocialPage> createState() => _SocialPageState();
}

class _SocialPageState extends State<SocialPage> with TickerProviderStateMixin {
  late TabController _tabController;
  final TextEditingController _searchController = TextEditingController();
  String _searchQuery = '';
  String _selectedCategory = '全部';

  // 分类列表
  final List<String> _categories = [
    '全部',
    '宠物友好',
    '遛狗公园',
    '宠物医院',
    '宠物商店',
    '宠物美容',
    '宠物餐厅',
    '宠物酒店',
  ];

  // 模拟周边场所数据
  final List<Place> _places = [
    Place(
      id: '1',
      name: '阳光宠物公园',
      category: '遛狗公园',
      address: '朝阳区建国路88号',
      distance: '0.8km',
      rating: 4.8,
      reviewCount: 156,
      image: '🏞️',
      isOpen: true,
      features: ['免费停车', '饮水设施', '遮阳棚'],
      description: '大型开放式宠物公园，环境优美，设施完善',
    ),
    Place(
      id: '2',
      name: '星巴克宠物友好店',
      category: '宠物友好',
      address: '朝阳区三里屯路19号',
      distance: '1.2km',
      rating: 4.6,
      reviewCount: 89,
      image: '☕',
      isOpen: true,
      features: ['宠物座椅', '宠物零食', '户外座位'],
      description: '欢迎携带宠物入内的咖啡店，提供宠物专用设施',
    ),
    Place(
      id: '3',
      name: '爱宠动物医院',
      category: '宠物医院',
      address: '朝阳区东三环中路15号',
      distance: '1.5km',
      rating: 4.9,
      reviewCount: 234,
      image: '🏥',
      isOpen: true,
      features: ['24小时急诊', '专家门诊', '设备先进'],
      description: '专业宠物医疗，设备齐全，医生经验丰富',
    ),
    Place(
      id: '4',
      name: '萌宠生活馆',
      category: '宠物商店',
      address: '朝阳区工体北路8号',
      distance: '2.1km',
      rating: 4.7,
      reviewCount: 167,
      image: '🛍️',
      isOpen: true,
      features: ['品种齐全', '品质保证', '会员优惠'],
      description: '一站式宠物用品商店，商品种类丰富',
    ),
    Place(
      id: '5',
      name: '宠物美容沙龙',
      category: '宠物美容',
      address: '朝阳区建国门外大街12号',
      distance: '2.3km',
      rating: 4.5,
      reviewCount: 98,
      image: '✂️',
      isOpen: true,
      features: ['专业美容师', '进口用品', '预约服务'],
      description: '专业宠物美容服务，让爱宠更加美丽',
    ),
    Place(
      id: '6',
      name: '汪星人餐厅',
      category: '宠物餐厅',
      address: '朝阳区三里屯SOHO',
      distance: '2.8km',
      rating: 4.4,
      reviewCount: 76,
      image: '🍽️',
      isOpen: true,
      features: ['宠物菜单', '主人套餐', '环境优雅'],
      description: '专为宠物和主人设计的特色餐厅',
    ),
  ];

  // 模拟社群动态数据
  final List<CommunityPost> _communityPosts = [
    CommunityPost(
      id: '1',
      user: '宠物达人小王',
      avatar: '👨',
      content: '今天带我家金毛去阳光宠物公园玩，环境真的很好！推荐给大家～',
      images: ['🐕', '🏞️'],
      likes: 45,
      comments: 12,
      time: '2小时前',
      location: '阳光宠物公园',
    ),
    CommunityPost(
      id: '2',
      user: '萌宠妈妈',
      avatar: '👩',
      content: '发现了一家超棒的宠物友好咖啡店，可以带宠物一起享受下午茶时光',
      images: ['☕', '🐱'],
      likes: 32,
      comments: 8,
      time: '4小时前',
      location: '星巴克宠物友好店',
    ),
    CommunityPost(
      id: '3',
      user: '爱宠医生',
      avatar: '👨‍⚕️',
      content: '提醒大家定期给宠物做体检，预防胜于治疗！',
      images: ['🏥', '💊'],
      likes: 67,
      comments: 15,
      time: '6小时前',
      location: '爱宠动物医院',
    ),
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: AppTheme.sunsetGradient,
        ),
        child: SafeArea(
          child: Column(
            children: [
              // 头部区域
              _buildHeader(),
              
              // 内容区域
              Expanded(
                child: Container(
                  decoration: const BoxDecoration(
                    color: AppTheme.backgroundColor,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(AppTheme.borderRadiusXLarge),
                      topRight: Radius.circular(AppTheme.borderRadiusXLarge),
                    ),
                  ),
                  child: Column(
                    children: [
                      // 搜索栏
                      _buildSearchBar(),

                      // 分类标签
                      _buildCategoryTabs(),

                      // 标签页
                      _buildTabBar(),

                      // 内容区域
                      Expanded(child: _buildTabBarView()),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      padding: const EdgeInsets.all(AppTheme.spacingL),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(AppTheme.spacingS),
            decoration: AppTheme.glassmorphismDecoration,
            child: const Icon(
              Icons.location_on,
              color: Colors.white,
              size: 24,
            ),
          ),
          const SizedBox(width: AppTheme.spacingM),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '发现周边',
                  style: AppTheme.headingStyle.copyWith(
                    color: Colors.white,
                    fontSize: AppTheme.fontSizeXXL,
                  ),
                ),
                Text(
                  '找到最适合你和宠物的好去处',
                  style: AppTheme.captionStyle.copyWith(
                    color: Colors.white.withOpacity(0.8),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSearchBar() {
    return Container(
      margin: const EdgeInsets.all(AppTheme.spacingM),
      decoration: AppTheme.glassmorphismDecoration,
      child: TextField(
        controller: _searchController,
        onChanged: (value) {
          setState(() {
            _searchQuery = value;
          });
        },
        decoration: InputDecoration(
          hintText: '搜索周边宠物场所...',
          hintStyle: TextStyle(color: AppTheme.textSecondaryColor),
          prefixIcon: const Icon(Icons.search, color: AppTheme.textSecondaryColor),
          suffixIcon: _searchQuery.isNotEmpty
              ? IconButton(
                  icon: const Icon(Icons.clear, color: AppTheme.textSecondaryColor),
                  onPressed: () {
                    _searchController.clear();
                    setState(() {
                      _searchQuery = '';
                    });
                  },
                )
              : null,
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(
            horizontal: AppTheme.spacingM,
            vertical: AppTheme.spacingM,
          ),
        ),
      ),
    );
  }

  Widget _buildCategoryTabs() {
    return Container(
      height: 50,
      margin: const EdgeInsets.symmetric(horizontal: AppTheme.spacingM),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: _categories.length,
        itemBuilder: (context, index) {
          final category = _categories[index];
          final isSelected = category == _selectedCategory;

          return GestureDetector(
            onTap: () {
              setState(() {
                _selectedCategory = category;
              });
            },
            child: AnimatedContainer(
              duration: AppTheme.mediumAnimation,
              margin: const EdgeInsets.only(right: AppTheme.spacingS),
              padding: const EdgeInsets.symmetric(
                horizontal: AppTheme.spacingM,
                vertical: AppTheme.spacingS,
              ),
              decoration: isSelected
                  ? BoxDecoration(
                      gradient: AppTheme.primaryGradient,
                      borderRadius: BorderRadius.circular(AppTheme.borderRadiusLarge),
                      boxShadow: AppTheme.cardShadow,
                    )
                  : BoxDecoration(
                      color: AppTheme.surfaceColor,
                      borderRadius: BorderRadius.circular(AppTheme.borderRadiusLarge),
                      border: Border.all(color: AppTheme.dividerColor),
                    ),
              child: Center(
                child: Text(
                  category,
                  style: TextStyle(
                    color: isSelected ? Colors.white : AppTheme.textPrimaryColor,
                    fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
                    fontSize: AppTheme.fontSizeM,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildTabBar() {
    return Container(
      margin: const EdgeInsets.all(AppTheme.spacingM),
      decoration: AppTheme.glassmorphismDecoration,
      child: TabBar(
        controller: _tabController,
        indicator: BoxDecoration(
          borderRadius: BorderRadius.circular(AppTheme.borderRadiusMedium),
          gradient: AppTheme.primaryGradient,
        ),
        labelColor: AppTheme.primaryColor,
        unselectedLabelColor: AppTheme.textSecondaryColor,
        labelStyle: AppTheme.subheadingStyle.copyWith(fontSize: AppTheme.fontSizeL),
        unselectedLabelStyle: AppTheme.bodyStyle,
        tabs: const [
          Tab(text: '周边场所'),
          Tab(text: '社群动态'),
        ],
      ),
    );
  }

  Widget _buildTabBarView() {
    return TabBarView(
      controller: _tabController,
      children: [_buildPlacesTab(), _buildCommunityTab()],
    );
  }

  Widget _buildPlacesTab() {
    final filteredPlaces = _selectedCategory == '全部'
        ? _places
        : _places
              .where((place) => place.category == _selectedCategory)
              .toList();

    return ListView.builder(
      padding: const EdgeInsets.all(AppTheme.spacingM),
      itemCount: filteredPlaces.length,
      itemBuilder: (context, index) {
        final place = filteredPlaces[index];
        return _buildPlaceCard(place);
      },
    );
  }

  Widget _buildPlaceCard(Place place) {
    return Container(
      margin: const EdgeInsets.only(bottom: AppTheme.spacingM),
      decoration: AppTheme.cardDecoration,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 场所图片和基本信息
          Container(
            height: 120,
            decoration: BoxDecoration(
              gradient: AppTheme.secondaryGradient,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(AppTheme.borderRadiusLarge),
                topRight: Radius.circular(AppTheme.borderRadiusLarge),
              ),
            ),
            child: Row(
              children: [
                Expanded(
                  flex: 2,
                  child: Center(
                    child: Text(
                      place.image,
                      style: const TextStyle(fontSize: 60),
                    ),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Padding(
                    padding: const EdgeInsets.all(AppTheme.spacingM),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          place.name,
                          style: AppTheme.subheadingStyle.copyWith(
                            color: Colors.white,
                            fontSize: AppTheme.fontSizeL,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(height: AppTheme.spacingXS),
                        Row(
                          children: [
                            const Icon(
                              Icons.location_on,
                              size: 16,
                              color: Colors.white,
                            ),
                            const SizedBox(width: AppTheme.spacingXS),
                            Expanded(
                              child: Text(
                                place.address,
                                style: AppTheme.captionStyle.copyWith(
                                  color: Colors.white.withOpacity(0.8),
                                ),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: AppTheme.spacingXS),
                        Row(
                          children: [
                            const Icon(Icons.star, size: 16, color: Colors.amber),
                            const SizedBox(width: AppTheme.spacingXS),
                            Text(
                              '${place.rating}',
                              style: AppTheme.captionStyle.copyWith(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Text(
                              ' (${place.reviewCount})',
                              style: AppTheme.captionStyle.copyWith(
                                color: Colors.white.withOpacity(0.8),
                              ),
                            ),
                            const Spacer(),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: AppTheme.spacingS,
                                vertical: AppTheme.spacingXS,
                              ),
                              decoration: BoxDecoration(
                                color: place.isOpen
                                    ? AppTheme.successColor.withOpacity(0.2)
                                    : AppTheme.errorColor.withOpacity(0.2),
                                borderRadius: BorderRadius.circular(AppTheme.borderRadiusSmall),
                              ),
                              child: Text(
                                place.isOpen ? '营业中' : '已关闭',
                                style: AppTheme.captionStyle.copyWith(
                                  color: place.isOpen
                                      ? AppTheme.successColor
                                      : AppTheme.errorColor,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),

          // 场所详情
          Padding(
            padding: const EdgeInsets.all(AppTheme.spacingM),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  place.description,
                  style: AppTheme.bodyStyle.copyWith(
                    color: AppTheme.textSecondaryColor,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),

                const SizedBox(height: AppTheme.spacingM),

                // 特色功能标签
                Wrap(
                  spacing: AppTheme.spacingS,
                  runSpacing: AppTheme.spacingS,
                  children: place.features.map((feature) {
                    return Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: AppTheme.spacingS,
                        vertical: AppTheme.spacingXS,
                      ),
                      decoration: BoxDecoration(
                        color: AppTheme.primaryLightColor,
                        borderRadius: BorderRadius.circular(AppTheme.borderRadiusSmall),
                        border: Border.all(color: AppTheme.primaryColor.withOpacity(0.3)),
                      ),
                      child: Text(
                        feature,
                        style: AppTheme.captionStyle.copyWith(
                          color: AppTheme.primaryColor,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    );
                  }).toList(),
                ),

                const SizedBox(height: AppTheme.spacingM),

                // 操作按钮
                Row(
                  children: [
                    Expanded(
                      child: OutlinedButton.icon(
                        onPressed: () {
                          _showPlaceDetail(place);
                        },
                        icon: const Icon(Icons.info_outline, size: 16),
                        label: const Text('查看详情'),
                        style: AppTheme.secondaryButtonStyle,
                      ),
                    ),
                    const SizedBox(width: AppTheme.spacingM),
                    Expanded(
                      child: ElevatedButton.icon(
                        onPressed: () {
                          _navigateToPlace(place);
                        },
                        icon: const Icon(Icons.directions, size: 16),
                        label: const Text('导航'),
                        style: AppTheme.primaryButtonStyle,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCommunityTab() {
    return ListView.builder(
      padding: const EdgeInsets.all(AppTheme.spacingM),
      itemCount: _communityPosts.length,
      itemBuilder: (context, index) {
        final post = _communityPosts[index];
        return _buildCommunityPostCard(post);
      },
    );
  }

  Widget _buildCommunityPostCard(CommunityPost post) {
    return Container(
      margin: const EdgeInsets.only(bottom: AppTheme.spacingM),
      decoration: AppTheme.cardDecoration,
      child: Padding(
        padding: const EdgeInsets.all(AppTheme.spacingM),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 用户信息
            Row(
              children: [
                                 Container(
                   width: 40,
                   height: 40,
                   decoration: BoxDecoration(
                     gradient: AppTheme.softGradient,
                     borderRadius: BorderRadius.circular(AppTheme.borderRadiusLarge),
                   ),
                  child: Center(
                    child: Text(
                      post.avatar,
                      style: const TextStyle(fontSize: 20),
                    ),
                  ),
                ),
                const SizedBox(width: AppTheme.spacingM),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        post.user,
                        style: AppTheme.subheadingStyle.copyWith(
                          fontSize: AppTheme.fontSizeL,
                        ),
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.location_on,
                            size: 14,
                            color: AppTheme.textSecondaryColor,
                          ),
                          const SizedBox(width: AppTheme.spacingXS),
                          Text(
                            post.location,
                            style: AppTheme.captionStyle,
                          ),
                          const SizedBox(width: AppTheme.spacingS),
                          Text(
                            post.time,
                            style: AppTheme.captionStyle,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.more_horiz),
                  onPressed: () {
                    _showPostOptions(post);
                  },
                ),
              ],
            ),

            const SizedBox(height: AppTheme.spacingM),

            // 动态内容
            Text(
              post.content,
              style: AppTheme.bodyStyle,
            ),

            const SizedBox(height: AppTheme.spacingM),

            // 图片展示
            if (post.images.isNotEmpty)
              Container(
                height: 80,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: post.images.length,
                  itemBuilder: (context, index) {
                    return Container(
                      width: 80,
                      margin: const EdgeInsets.only(right: AppTheme.spacingS),
                      decoration: BoxDecoration(
                        gradient: AppTheme.warmGradient,
                        borderRadius: BorderRadius.circular(AppTheme.borderRadiusMedium),
                      ),
                      child: Center(
                        child: Text(
                          post.images[index],
                          style: const TextStyle(fontSize: 40),
                        ),
                      ),
                    );
                  },
                ),
              ),

            const SizedBox(height: AppTheme.spacingM),

            // 互动按钮
            Row(
              children: [
                _buildActionButton(
                  icon: Icons.favorite_border,
                  label: '${post.likes}',
                  onTap: () {
                    _likePost(post);
                  },
                ),
                const SizedBox(width: AppTheme.spacingL),
                _buildActionButton(
                  icon: Icons.comment_outlined,
                  label: '${post.comments}',
                  onTap: () {
                    _commentPost(post);
                  },
                ),
                const SizedBox(width: AppTheme.spacingL),
                _buildActionButton(
                  icon: Icons.share_outlined,
                  label: '分享',
                  onTap: () {
                    _sharePost(post);
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildActionButton({
    required IconData icon,
    required String label,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        children: [
          Icon(icon, size: 20, color: AppTheme.textSecondaryColor),
          const SizedBox(width: AppTheme.spacingS),
          Text(
            label,
            style: AppTheme.captionStyle.copyWith(
              color: AppTheme.textSecondaryColor,
            ),
          ),
        ],
      ),
    );
  }

  void _showPlaceDetail(Place place) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppTheme.borderRadiusLarge),
        ),
        title: Row(
          children: [
            Text(place.image, style: const TextStyle(fontSize: 24)),
            const SizedBox(width: AppTheme.spacingM),
            Expanded(
              child: Text(place.name, style: AppTheme.subheadingStyle),
            ),
          ],
        ),
        content: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            AppComponents.infoRow(label: '地址', value: place.address),
            AppComponents.infoRow(label: '距离', value: place.distance),
            AppComponents.infoRow(label: '评分', value: '${place.rating} (${place.reviewCount}条评价)'),
            AppComponents.infoRow(label: '状态', value: place.isOpen ? "营业中" : "已关闭"),
            const SizedBox(height: AppTheme.spacingM),
            Text('特色功能:', style: AppTheme.subheadingStyle),
            const SizedBox(height: AppTheme.spacingS),
            Wrap(
              spacing: AppTheme.spacingS,
              children: place.features.map((feature) {
                return AppComponents.tag(text: feature);
              }).toList(),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('关闭'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pop();
              _navigateToPlace(place);
            },
            style: AppTheme.primaryButtonStyle,
            child: const Text('导航'),
          ),
        ],
      ),
    );
  }

  void _navigateToPlace(Place place) {
    _showSnackBar('正在导航到 ${place.name}...');
  }

  void _showPostOptions(CommunityPost post) {
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(AppTheme.borderRadiusLarge),
        ),
      ),
      builder: (context) => Container(
        padding: const EdgeInsets.all(AppTheme.spacingM),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: const Icon(Icons.report),
              title: const Text('举报'),
              onTap: () {
                Navigator.of(context).pop();
                _showSnackBar('举报功能开发中...');
              },
            ),
            ListTile(
              leading: const Icon(Icons.block),
              title: const Text('屏蔽'),
              onTap: () {
                Navigator.of(context).pop();
                _showSnackBar('屏蔽功能开发中...');
              },
            ),
          ],
        ),
      ),
    );
  }

  void _likePost(CommunityPost post) {
    _showSnackBar('点赞功能开发中...');
  }

  void _commentPost(CommunityPost post) {
    _showSnackBar('评论功能开发中...');
  }

  void _sharePost(CommunityPost post) {
    _showSnackBar('分享功能开发中...');
  }

  void _showSnackBar(String message) {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text(message)));
  }
}

// 场所数据模型
class Place {
  final String id;
  final String name;
  final String category;
  final String address;
  final String distance;
  final double rating;
  final int reviewCount;
  final String image;
  final bool isOpen;
  final List<String> features;
  final String description;

  Place({
    required this.id,
    required this.name,
    required this.category,
    required this.address,
    required this.distance,
    required this.rating,
    required this.reviewCount,
    required this.image,
    required this.isOpen,
    required this.features,
    required this.description,
  });
}

// 社群动态数据模型
class CommunityPost {
  final String id;
  final String user;
  final String avatar;
  final String content;
  final List<String> images;
  final int likes;
  final int comments;
  final String time;
  final String location;

  CommunityPost({
    required this.id,
    required this.user,
    required this.avatar,
    required this.content,
    required this.images,
    required this.likes,
    required this.comments,
    required this.time,
    required this.location,
  });
}
