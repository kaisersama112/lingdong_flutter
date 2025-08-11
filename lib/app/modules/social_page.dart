import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

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
      backgroundColor: AppTheme.backgroundColor,
      body: Column(
        children: [
          // 搜索栏
          _buildSearchBar(),
          
          // 分类标签
          _buildCategoryTabs(),
          
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

  Widget _buildSearchBar() {
    return Container(
      margin: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(25),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: TextField(
        controller: _searchController,
        onChanged: (value) {
          setState(() {
            _searchQuery = value;
          });
        },
        decoration: InputDecoration(
          hintText: '搜索周边宠物场所...',
          hintStyle: TextStyle(color: Colors.grey[500]),
          prefixIcon: const Icon(Icons.search, color: Colors.grey),
          suffixIcon: _searchQuery.isNotEmpty
              ? IconButton(
                  icon: const Icon(Icons.clear, color: Colors.grey),
                  onPressed: () {
                    _searchController.clear();
                    setState(() {
                      _searchQuery = '';
                    });
                  },
                )
              : null,
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        ),
      ),
    );
  }

  Widget _buildCategoryTabs() {
    return Container(
      height: 50,
      margin: const EdgeInsets.symmetric(horizontal: 16),
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
            child: Container(
              margin: const EdgeInsets.only(right: 12),
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: BoxDecoration(
                color: isSelected ? Colors.blue : Colors.white,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color: isSelected ? Colors.blue : Colors.grey[300]!,
                  width: 1,
                ),
                boxShadow: isSelected ? [
                  BoxShadow(
                    color: Colors.blue.withOpacity(0.3),
                    blurRadius: 8,
                    offset: const Offset(0, 2),
                  ),
                ] : null,
              ),
              child: Center(
                child: Text(
                  category,
                  style: TextStyle(
                    color: isSelected ? Colors.white : Colors.grey[700],
                    fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
                    fontSize: 14,
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
      margin: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: TabBar(
        controller: _tabController,
        indicator: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Colors.blue[100],
        ),
        labelColor: Colors.blue[700],
        unselectedLabelColor: Colors.grey[600],
        labelStyle: const TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
        unselectedLabelStyle: const TextStyle(fontWeight: FontWeight.normal, fontSize: 16),
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
      children: [
        _buildPlacesTab(),
        _buildCommunityTab(),
      ],
    );
  }

  Widget _buildPlacesTab() {
    final filteredPlaces = _selectedCategory == '全部' 
        ? _places 
        : _places.where((place) => place.category == _selectedCategory).toList();

    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: filteredPlaces.length,
      itemBuilder: (context, index) {
        final place = filteredPlaces[index];
        return _buildPlaceCard(place);
      },
    );
  }

  Widget _buildPlaceCard(Place place) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 场所图片和基本信息
          Container(
            height: 120,
            decoration: BoxDecoration(
              color: Colors.grey[100],
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(16),
                topRight: Radius.circular(16),
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
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          place.name,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(height: 4),
                        Row(
                          children: [
                            Icon(Icons.location_on, size: 16, color: Colors.grey[600]),
                            const SizedBox(width: 4),
                            Expanded(
                              child: Text(
                                place.address,
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.grey[600],
                                ),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 4),
                        Row(
                          children: [
                            Icon(Icons.star, size: 16, color: Colors.amber),
                            const SizedBox(width: 4),
                            Text(
                              '${place.rating}',
                              style: const TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Text(
                              ' (${place.reviewCount})',
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.grey[600],
                              ),
                            ),
                            const Spacer(),
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                              decoration: BoxDecoration(
                                color: place.isOpen ? Colors.green[100] : Colors.red[100],
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Text(
                                place.isOpen ? '营业中' : '已关闭',
                                style: TextStyle(
                                  fontSize: 10,
                                  color: place.isOpen ? Colors.green[700] : Colors.red[700],
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
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  place.description,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey[700],
                    height: 1.4,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                
                const SizedBox(height: 12),
                
                // 特色功能标签
                Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: place.features.map((feature) {
                    return Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        color: Colors.blue[50],
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: Colors.blue[200]!),
                      ),
                      child: Text(
                        feature,
                        style: TextStyle(
                          fontSize: 10,
                          color: Colors.blue[700],
                        ),
                      ),
                    );
                  }).toList(),
                ),
                
                const SizedBox(height: 16),
                
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
                        style: OutlinedButton.styleFrom(
                          foregroundColor: Colors.blue,
                          side: const BorderSide(color: Colors.blue),
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: ElevatedButton.icon(
                        onPressed: () {
                          _navigateToPlace(place);
                        },
                        icon: const Icon(Icons.directions, size: 16),
                        label: const Text('导航'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue,
                          foregroundColor: Colors.white,
                        ),
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
      padding: const EdgeInsets.all(16),
      itemCount: _communityPosts.length,
      itemBuilder: (context, index) {
        final post = _communityPosts[index];
        return _buildCommunityPostCard(post);
      },
    );
  }

  Widget _buildCommunityPostCard(CommunityPost post) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 用户信息
            Row(
              children: [
                CircleAvatar(
                  radius: 20,
                  backgroundColor: Colors.blue[100],
                  child: Text(
                    post.avatar,
                    style: const TextStyle(fontSize: 20),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        post.user,
                        style: const TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                        ),
                      ),
                      Row(
                        children: [
                          Icon(Icons.location_on, size: 14, color: Colors.grey[500]),
                          const SizedBox(width: 4),
                          Text(
                            post.location,
                            style: TextStyle(
                              color: Colors.grey[500],
                              fontSize: 12,
                            ),
                          ),
                          const SizedBox(width: 8),
                          Text(
                            post.time,
                            style: TextStyle(
                              color: Colors.grey[500],
                              fontSize: 12,
                            ),
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
            
            const SizedBox(height: 12),
            
            // 动态内容
            Text(
              post.content,
              style: const TextStyle(
                fontSize: 14,
                height: 1.4,
              ),
            ),
            
            const SizedBox(height: 12),
            
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
                      margin: const EdgeInsets.only(right: 8),
                      decoration: BoxDecoration(
                        color: Colors.grey[100],
                        borderRadius: BorderRadius.circular(8),
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
            
            const SizedBox(height: 16),
            
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
                const SizedBox(width: 24),
                _buildActionButton(
                  icon: Icons.comment_outlined,
                  label: '${post.comments}',
                  onTap: () {
                    _commentPost(post);
                  },
                ),
                const SizedBox(width: 24),
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
          Icon(icon, size: 20, color: Colors.grey[600]),
          const SizedBox(width: 6),
          Text(
            label,
            style: TextStyle(
              color: Colors.grey[600],
              fontSize: 14,
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
        title: Row(
          children: [
            Text(place.image, style: const TextStyle(fontSize: 24)),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                place.name,
                style: const TextStyle(fontSize: 18),
              ),
            ),
          ],
        ),
        content: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('地址: ${place.address}'),
            Text('距离: ${place.distance}'),
            Text('评分: ${place.rating} (${place.reviewCount}条评价)'),
            Text('状态: ${place.isOpen ? "营业中" : "已关闭"}'),
            const SizedBox(height: 8),
            Text('特色功能:'),
            Wrap(
              spacing: 8,
              children: place.features.map((feature) {
                return Chip(
                  label: Text(feature),
                  backgroundColor: Colors.blue[50],
                  labelStyle: TextStyle(color: Colors.blue[700]),
                );
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
      builder: (context) => Container(
        padding: const EdgeInsets.all(16),
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
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
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