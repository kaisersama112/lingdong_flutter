import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../theme/app_components.dart';
import '../core/components.dart';
import '../core/error_handler.dart';
import '../core/optimized_list.dart';

class SocialPage extends StatefulWidget {
  const SocialPage({super.key});

  @override
  State<SocialPage> createState() => _SocialPageState();
}

class _SocialPageState extends State<SocialPage> {
  final TextEditingController _searchController = TextEditingController();
  String _searchQuery = '';
  String _selectedCategory = '全部';
  bool _isLoading = false;

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
      address: '朝阳区建国门外大街25号',
      distance: '2.8km',
      rating: 4.4,
      reviewCount: 76,
      image: '🍽️',
      isOpen: true,
      features: ['宠物菜单', '营养搭配', '环境优雅'],
      description: '专为宠物设计的餐厅，提供营养美味的宠物餐',
    ),
    Place(
      id: '7',
      name: '宠物度假酒店',
      category: '宠物酒店',
      address: '朝阳区东三环南路30号',
      distance: '3.2km',
      rating: 4.6,
      reviewCount: 112,
      image: '🏨',
      isOpen: true,
      features: ['豪华套房', '24小时监控', '专业护理'],
      description: '高端宠物寄养服务，让宠物享受星级待遇',
    ),
  ];

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  Future<void> _loadData() async {
    setState(() {
      _isLoading = true;
    });

    try {
      // 模拟网络请求延迟
      await Future.delayed(const Duration(milliseconds: 800));
      
      setState(() {
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _isLoading = false;
      });
      if (mounted) {
        AppErrorHandler.handleError(context, e);
      }
    }
  }

  // 获取过滤后的场所列表
  List<Place> get _filteredPlaces {
    return _places.where((place) {
      final matchesCategory = _selectedCategory == '全部' || place.category == _selectedCategory;
      final matchesSearch = _searchQuery.isEmpty || 
          place.name.toLowerCase().contains(_searchQuery.toLowerCase()) ||
          place.address.toLowerCase().contains(_searchQuery.toLowerCase());
      return matchesCategory && matchesSearch;
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.backgroundColor,
      body: Column(
        children: [
          // 页面头部
          BeautifulPageHeader(
            title: '探索周边',
            subtitle: '发现宠物友好的好去处',
            icon: Icons.location_on,
            backgroundColor: AppTheme.secondaryColor,
            height: 120,
          ),
          
          // 搜索栏 - 移到头部下方，更符合用户习惯
          BeautifulSearchBar(
            controller: _searchController,
            hintText: '搜索周边场所...',
            onChanged: (value) {
              setState(() {
                _searchQuery = value;
              });
            },
          ),
          
          // 分类标签 - 紧跟在搜索栏下方
          BeautifulCategoryTabs(
            categories: _categories,
            selectedIndex: _categories.indexOf(_selectedCategory),
            onCategoryChanged: (index) {
              setState(() {
                _selectedCategory = _categories[index];
              });
            },
            activeColor: AppTheme.secondaryColor,
          ),
          
          // 内容区域 - 简化布局，直接显示列表
          Expanded(
            child: Container(
              decoration: const BoxDecoration(
                color: AppTheme.backgroundColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(AppTheme.borderRadiusLarge),
                  topRight: Radius.circular(AppTheme.borderRadiusLarge),
                ),
              ),
              child: _buildPlacesList(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPlacesList() {
    if (_isLoading) {
      return PetAppComponents.buildLoading(message: '正在加载周边场所...');
    }

    if (_filteredPlaces.isEmpty) {
      return PetAppComponents.buildEmptyState(
        message: _searchQuery.isEmpty 
            ? '暂无周边场所信息'
            : '没有找到相关场所',
        icon: Icons.location_off,
        actionButton: ElevatedButton(
          onPressed: _loadData,
          child: const Text('重新加载'),
        ),
      );
    }

    return OptimizedListView<Place>(
      items: _filteredPlaces,
      itemBuilder: (context, place, index) => _buildPlaceCard(place),
      padding: const EdgeInsets.all(AppTheme.spacingM),
      separator: const SizedBox(height: AppTheme.spacingM),
    );
  }

  Widget _buildPlaceCard(Place place) {
    return PetAppComponents.buildCard(
      onTap: () => _showPlaceDetail(place),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 头部信息
          Row(
            children: [
              // 场所图标
              Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  color: AppTheme.secondaryLightColor,
                  borderRadius: BorderRadius.circular(AppTheme.borderRadiusMedium),
                ),
                child: Center(
                  child: Text(place.image, style: const TextStyle(fontSize: 24)),
                ),
              ),
              const SizedBox(width: AppTheme.spacingM),
              
              // 场所信息
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            place.name,
                            style: const TextStyle(
                              fontSize: AppTheme.fontSizeL,
                              fontWeight: FontWeight.w600,
                              color: AppTheme.textPrimaryColor,
                            ),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: AppTheme.spacingS,
                            vertical: 4,
                          ),
                          decoration: BoxDecoration(
                            color: place.isOpen ? AppTheme.successLightColor : AppTheme.errorLightColor,
                            borderRadius: BorderRadius.circular(AppTheme.borderRadiusSmall),
                          ),
                          child: Text(
                            place.isOpen ? '营业中' : '已关闭',
                            style: TextStyle(
                              fontSize: AppTheme.fontSizeS,
                              color: place.isOpen ? AppTheme.successColor : AppTheme.errorColor,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 4),
                    Text(
                      place.address,
                      style: TextStyle(
                        fontSize: AppTheme.fontSizeS,
                        color: AppTheme.textSecondaryColor,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          
          const SizedBox(height: AppTheme.spacingM),
          
          // 评分和距离
          Row(
            children: [
              // 评分
              Row(
                children: [
                  const Icon(
                    Icons.star,
                    size: 16,
                    color: AppTheme.warningColor,
                  ),
                  const SizedBox(width: 4),
                  Text(
                    place.rating.toString(),
                    style: const TextStyle(
                      fontSize: AppTheme.fontSizeS,
                      fontWeight: FontWeight.w600,
                      color: AppTheme.textPrimaryColor,
                    ),
                  ),
                  Text(
                    ' (${place.reviewCount})',
                    style: TextStyle(
                      fontSize: AppTheme.fontSizeS,
                      color: AppTheme.textSecondaryColor,
                    ),
                  ),
                ],
              ),
              const SizedBox(width: AppTheme.spacingL),
              
              // 距离
              Row(
                children: [
                  const Icon(
                    Icons.location_on,
                    size: 16,
                    color: AppTheme.secondaryColor,
                  ),
                  const SizedBox(width: 4),
                  Text(
                    place.distance,
                    style: TextStyle(
                      fontSize: AppTheme.fontSizeS,
                      color: AppTheme.textSecondaryColor,
                    ),
                  ),
                ],
              ),
            ],
          ),
          
          const SizedBox(height: AppTheme.spacingM),
          
          // 特色标签
          if (place.features.isNotEmpty) ...[
            Wrap(
              spacing: AppTheme.spacingS,
              runSpacing: AppTheme.spacingS,
              children: place.features.take(3).map((feature) => 
                PetAppComponents.buildTag(
                  text: feature,
                  backgroundColor: AppTheme.primaryLightColor,
                  textColor: AppTheme.primaryColor,
                ),
              ).toList(),
            ),
            const SizedBox(height: AppTheme.spacingS),
          ],
          
          // 描述
          Text(
            place.description,
            style: TextStyle(
              fontSize: AppTheme.fontSizeS,
              color: AppTheme.textSecondaryColor,
              height: 1.4,
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }

  void _showPlaceDetail(Place place) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => Container(
        height: MediaQuery.of(context).size.height * 0.8,
        decoration: const BoxDecoration(
          color: AppTheme.surfaceColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(AppTheme.borderRadiusLarge),
            topRight: Radius.circular(AppTheme.borderRadiusLarge),
          ),
        ),
        child: Column(
          children: [
            // 拖拽指示器
            Container(
              margin: const EdgeInsets.only(top: AppTheme.spacingM),
              width: 40,
              height: 4,
              decoration: BoxDecoration(
                color: AppTheme.dividerColor,
                borderRadius: BorderRadius.circular(2),
              ),
            ),
            
            // 内容
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(AppTheme.spacingL),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // 头部信息
                    Row(
                      children: [
                        Container(
                          width: 80,
                          height: 80,
                          decoration: BoxDecoration(
                            color: AppTheme.secondaryLightColor,
                            borderRadius: BorderRadius.circular(AppTheme.borderRadiusMedium),
                          ),
                          child: Center(
                            child: Text(place.image, style: const TextStyle(fontSize: 40)),
                          ),
                        ),
                        const SizedBox(width: AppTheme.spacingL),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                place.name,
                                style: const TextStyle(
                                  fontSize: AppTheme.fontSizeXL,
                                  fontWeight: FontWeight.bold,
                                  color: AppTheme.textPrimaryColor,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                place.category,
                                style: TextStyle(
                                  fontSize: AppTheme.fontSizeM,
                                  color: AppTheme.secondaryColor,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    
                    const SizedBox(height: AppTheme.spacingL),
                    
                    // 详细信息
                    PetAppComponents.buildInfoRow(
                      label: '地址',
                      value: place.address,
                      icon: Icons.location_on,
                    ),
                    PetAppComponents.buildInfoRow(
                      label: '距离',
                      value: place.distance,
                      icon: Icons.directions_walk,
                    ),
                    PetAppComponents.buildInfoRow(
                      label: '评分',
                      value: '${place.rating} (${place.reviewCount}条评价)',
                      icon: Icons.star,
                    ),
                    PetAppComponents.buildInfoRow(
                      label: '营业状态',
                      value: place.isOpen ? '营业中' : '已关闭',
                      icon: place.isOpen ? Icons.check_circle : Icons.cancel,
                      showDivider: false,
                    ),
                    
                    const SizedBox(height: AppTheme.spacingL),
                    
                    // 特色服务
                    if (place.features.isNotEmpty) ...[
                      Text(
                        '特色服务',
                        style: TextStyle(
                          fontSize: AppTheme.fontSizeL,
                          fontWeight: FontWeight.w600,
                          color: AppTheme.textPrimaryColor,
                        ),
                      ),
                      const SizedBox(height: AppTheme.spacingM),
                      Wrap(
                        spacing: AppTheme.spacingS,
                        runSpacing: AppTheme.spacingS,
                        children: place.features.map((feature) => 
                          PetAppComponents.buildTag(
                            text: feature,
                            backgroundColor: AppTheme.primaryLightColor,
                            textColor: AppTheme.primaryColor,
                          ),
                        ).toList(),
                      ),
                      const SizedBox(height: AppTheme.spacingL),
                    ],
                    
                    // 描述
                    Text(
                      '详细介绍',
                      style: TextStyle(
                        fontSize: AppTheme.fontSizeL,
                        fontWeight: FontWeight.w600,
                        color: AppTheme.textPrimaryColor,
                      ),
                    ),
                    const SizedBox(height: AppTheme.spacingM),
                    Text(
                      place.description,
                      style: TextStyle(
                        fontSize: AppTheme.fontSizeM,
                        color: AppTheme.textSecondaryColor,
                        height: 1.5,
                      ),
                    ),
                    
                    const SizedBox(height: AppTheme.spacingXL),
                    
                    // 操作按钮
                    Row(
                      children: [
                        Expanded(
                          child: ElevatedButton.icon(
                            onPressed: () => _navigateToPlace(place),
                            icon: const Icon(Icons.directions),
                            label: const Text('导航'),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppTheme.primaryColor,
                              foregroundColor: Colors.white,
                              padding: const EdgeInsets.symmetric(vertical: AppTheme.spacingM),
                            ),
                          ),
                        ),
                        const SizedBox(width: AppTheme.spacingM),
                        Expanded(
                          child: OutlinedButton.icon(
                            onPressed: () => _callPlace(place),
                            icon: const Icon(Icons.phone),
                            label: const Text('电话'),
                            style: OutlinedButton.styleFrom(
                              foregroundColor: AppTheme.primaryColor,
                              side: const BorderSide(color: AppTheme.primaryColor),
                              padding: const EdgeInsets.symmetric(vertical: AppTheme.spacingM),
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
    );
  }

  void _navigateToPlace(Place place) {
    // 这里可以集成地图导航功能
    AppErrorHandler.handleError(context, '导航功能开发中...');
  }

  void _callPlace(Place place) {
    // 这里可以集成电话拨打功能
    AppErrorHandler.handleError(context, '电话功能开发中...');
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

  const Place({
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

