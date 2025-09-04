import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../core/error_handler.dart';
import '../core/optimized_list.dart';
import '../core/components/forms/search_field.dart';
import '../core/components/forms/category_selector.dart';
import '../core/components/layout/loading_widget.dart';
import '../core/components/layout/empty_state.dart';
import '../core/components/lists/place_list_item.dart';
import '../core/components/modals/place_detail_modal.dart';

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
    if (!mounted) return;

    setState(() {
      _isLoading = true;
    });

    try {
      // 模拟网络请求延迟
      await Future.delayed(const Duration(milliseconds: 800));

      if (mounted) {
        setState(() {
          _isLoading = false;
        });
      }
    } catch (e) {
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
        AppErrorHandler.handleError(context, e);
      }
    }
  }

  // 获取过滤后的场所列表
  List<Place> get _filteredPlaces {
    return _places.where((place) {
      final matchesCategory =
          _selectedCategory == '全部' || place.category == _selectedCategory;
      final matchesSearch =
          _searchQuery.isEmpty ||
          place.name.toLowerCase().contains(_searchQuery.toLowerCase()) ||
          place.address.toLowerCase().contains(_searchQuery.toLowerCase());
      return matchesCategory && matchesSearch;
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    final bool canPop = Navigator.canPop(context);
    return Scaffold(
      backgroundColor: AppTheme.backgroundColor,
      appBar: canPop
          ? AppBar(
              title: const Text('周边·遛弯'),
              backgroundColor: Colors.white,
              foregroundColor: AppTheme.textPrimaryColor,
              elevation: 0.5,
            )
          : null,
      body: SafeArea(
        child: Column(
          children: [
            // 顶部标题与说明移除

            // 使用新的搜索组件
            SearchField(
              controller: _searchController,
              hintText: '搜索周边场所...',
              onChanged: (value) {
                setState(() {
                  _searchQuery = value;
                });
              },
            ),

            // 使用新的分类选择器组件
            CategorySelector(
              categories: _categories,
              selectedCategory: _selectedCategory,
              onCategoryChanged: (category) {
                setState(() {
                  _selectedCategory = category;
                });
              },
              activeColor: AppTheme.secondaryColor,
            ),

            // 内容区域
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
      ),
    );
  }

  Widget _buildPlacesList() {
    if (_isLoading) {
      return const LoadingWidget(message: '正在加载周边场所...');
    }

    if (_filteredPlaces.isEmpty) {
      return EmptyState(
        message: _searchQuery.isEmpty ? '暂无周边场所信息' : '没有找到相关场所',
        icon: Icons.location_off,
        actionButton: ElevatedButton(
          onPressed: _loadData,
          child: const Text('重新加载'),
        ),
      );
    }

    return OptimizedListView<Place>(
      items: _filteredPlaces,
      itemBuilder: (context, place, index) =>
          PlaceListItem(place: place, onTap: () => _showPlaceDetail(place)),
      padding: const EdgeInsets.all(AppTheme.spacingM),
      separator: const SizedBox(height: AppTheme.spacingM),
    );
  }

  void _showPlaceDetail(Place place) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => PlaceDetailModal(
        place: place,
        onNavigate: () => _navigateToPlace(place),
        onCall: () => _callPlace(place),
      ),
    );
  }

  void _navigateToPlace(Place place) {
    // 集成地图导航功能
    _showNavigationOptions(place);
  }

  void _callPlace(Place place) {
    // 集成电话拨打功能
    _showCallOptions(place);
  }

  // 显示导航选项
  void _showNavigationOptions(Place place) {
    showModalBottomSheet(
      context: context,
      builder: (context) => Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              '导航到 ${place.name}',
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 20),
            ListTile(
              leading: const Icon(Icons.directions, color: Color(0xFF10B981)),
              title: const Text('使用百度地图'),
              subtitle: const Text('打开百度地图进行导航'),
              onTap: () {
                Navigator.pop(context);
                _openBaiduMaps(place);
              },
            ),
            ListTile(
              leading: const Icon(Icons.map, color: Color(0xFF3B82F6)),
              title: const Text('使用高德地图'),
              subtitle: const Text('打开高德地图进行导航'),
              onTap: () {
                Navigator.pop(context);
                _openAmapMaps(place);
              },
            ),
            ListTile(
              leading: const Icon(Icons.location_on, color: Color(0xFF8B5CF6)),
              title: const Text('复制地址'),
              subtitle: const Text('复制地址到剪贴板'),
              onTap: () {
                Navigator.pop(context);
                _copyAddress(place);
              },
            ),
          ],
        ),
      ),
    );
  }

  // 显示电话选项
  void _showCallOptions(Place place) {
    showModalBottomSheet(
      context: context,
      builder: (context) => Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              '联系 ${place.name}',
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 20),
            ListTile(
              leading: const Icon(Icons.phone, color: Color(0xFF10B981)),
              title: const Text('拨打电话'),
              subtitle: const Text('400-123-4567'),
              onTap: () {
                Navigator.pop(context);
                _makePhoneCall('400-123-4567');
              },
            ),
            ListTile(
              leading: const Icon(Icons.message, color: Color(0xFF3B82F6)),
              title: const Text('发送短信'),
              subtitle: const Text('发送短信咨询'),
              onTap: () {
                Navigator.pop(context);
                _sendSMS('400-123-4567');
              },
            ),
          ],
        ),
      ),
    );
  }

  // 打开百度地图
  void _openBaiduMaps(Place place) {
    // 模拟打开百度地图
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('正在打开百度地图导航到 ${place.name}'),
        backgroundColor: const Color(0xFF10B981),
      ),
    );
  }

  // 打开高德地图
  void _openAmapMaps(Place place) {
    // 模拟打开高德地图
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('正在打开高德地图导航到 ${place.name}'),
        backgroundColor: const Color(0xFF3B82F6),
      ),
    );
  }

  // 复制地址
  void _copyAddress(Place place) {
    // 模拟复制地址
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('已复制地址：${place.address}'),
        backgroundColor: const Color(0xFF8B5CF6),
      ),
    );
  }

  // 拨打电话
  void _makePhoneCall(String phoneNumber) {
    // 模拟拨打电话
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('正在拨打 $phoneNumber'),
        backgroundColor: const Color(0xFF10B981),
      ),
    );
  }

  // 发送短信
  void _sendSMS(String phoneNumber) {
    // 模拟发送短信
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('正在发送短信到 $phoneNumber'),
        backgroundColor: const Color(0xFF3B82F6),
      ),
    );
  }
}

// 使用组件中定义的Place类
