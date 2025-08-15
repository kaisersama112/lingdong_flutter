import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../theme/app_components.dart';
import '../core/components.dart';
import '../core/error_handler.dart';
import '../core/models.dart' as models;
import '../core/pet_components.dart';
import 'records_page.dart';
import 'profile/profile_page.dart';
import 'pet_detail_page.dart';
import 'pet_management_page.dart';
import 'package:flutter/services.dart';
import 'package:qr_flutter/qr_flutter.dart';

class ArchiveProfilePage extends StatefulWidget {
  const ArchiveProfilePage({super.key});

  @override
  State<ArchiveProfilePage> createState() => _ArchiveProfilePageState();
}

class _ArchiveProfilePageState extends State<ArchiveProfilePage> {
  int _selectedPetIndex = 0;
  
  // 简单的用户数据
  final Map<String, String> _userData = {
    'name': '张三',
    'avatar': '👤',
  };
  
  // 模拟宠物数据
  final List<models.Pet> _pets = [
    models.Pet(
      id: '1',
      name: '小白',
      type: '狗狗',
      breed: '金毛寻回犬',
      avatar: '🐕',
      color: Colors.orange,
      birthDate: DateTime(2020, 3, 15),
      weight: 25.5,
      gender: '公',
      identityCode: 'PET20240315001',
    ),
    models.Pet(
      id: '2',
      name: '咪咪',
      type: '猫咪',
      breed: '英国短毛猫',
      avatar: '🐱',
      color: Colors.blue,
      birthDate: DateTime(2021, 6, 20),
      weight: 4.2,
      gender: '母',
      identityCode: 'PET20240620002',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.backgroundColor,
      body: SafeArea(
        child: Column(
          children: [
            // 简化的页面头部 - 只显示标题和用户头像
            _buildSimpleHeader(),
            
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
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      // 宠物选择器
                      PetSelector(
                        pets: _pets,
                        selectedPetId: _pets[_selectedPetIndex].id,
                        onPetSelected: (petId) {
                          setState(() {
                            _selectedPetIndex = _pets.indexWhere((p) => p.id == petId);
                          });
                        },
                        onAddPet: _addPet,
                      ),
                      const SizedBox(height: AppTheme.spacingM),
                      
                      // 宠物信息头部
                      PetInfoHeader(
                        pet: _pets[_selectedPetIndex],
                        onCopyIdentity: () => _copyIdentityCode(_pets[_selectedPetIndex].identityCode),
                        onShowQr: () => _showIdentityQrDialog(_pets[_selectedPetIndex].identityCode),
                        onEditPet: _editPet,
                      ),
                      const SizedBox(height: AppTheme.spacingM),
                      
                      // 健康记录快捷入口
                      HealthQuickAccess(
                        pet: _pets[_selectedPetIndex],
                        onViewRecords: (type) => _navigateToRecords(filterType: type),
                        onAddRecord: () => _navigateToRecords(openAddSheet: true),
                        recordCounts: _getRecordCounts(),
                      ),
                      const SizedBox(height: AppTheme.spacingL),
                      
                      // 快捷操作区域
                      _buildQuickActions(),
                      const SizedBox(height: AppTheme.spacingL),
                      
                      // 宠物详情入口
                      _buildPetDetailEntry(),
                      const SizedBox(height: AppTheme.spacingL),
                      
                      // 测试区域 - 显示布局信息
                      _buildDebugInfo(),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // 简化的页面头部 - 只显示标题和用户头像
  Widget _buildSimpleHeader() {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AppTheme.spacingL,
        vertical: AppTheme.spacingM,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
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
          // 页面标题
          Expanded(
            child: Text(
              '宠物档案',
              style: TextStyle(
                fontSize: AppTheme.fontSizeXL,
                fontWeight: FontWeight.bold,
                color: AppTheme.textPrimaryColor,
              ),
            ),
          ),
          
          // 用户头像按钮
          _buildUserAvatarButton(),
        ],
      ),
    );
  }

  // 快捷操作区域 - 单宠家庭重点功能
  Widget _buildQuickActions() {
    final pet = _pets[_selectedPetIndex];
    
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: AppTheme.spacingM),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '快捷操作',
            style: TextStyle(
              color: AppTheme.textSecondaryColor,
              fontSize: AppTheme.fontSizeS,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: AppTheme.spacingM),
          Row(
            children: [
              Expanded(
                child: _buildQuickActionCard(
                  icon: Icons.photo_library,
                  label: '相册',
                  subtitle: '查看${pet.name}的照片',
                  color: pet.color,
                  onTap: () => _viewPhotoAlbum(),
                ),
              ),
              const SizedBox(width: AppTheme.spacingM),
              Expanded(
                child: _buildQuickActionCard(
                  icon: Icons.trending_up,
                  label: '成长轨迹',
                  subtitle: '记录${pet.name}的成长',
                  color: pet.color,
                  onTap: () => _viewGrowthTrack(),
                ),
              ),
            ],
          ),
          const SizedBox(height: AppTheme.spacingM),
          Row(
            children: [
              Expanded(
                child: _buildQuickActionCard(
                  icon: Icons.share,
                  label: '分享档案',
                  subtitle: '分享${pet.name}的信息',
                  color: pet.color,
                  onTap: () => _sharePetProfile(),
                ),
              ),
              const SizedBox(width: AppTheme.spacingM),
              Expanded(
                child: _buildQuickActionCard(
                  icon: Icons.print,
                  label: '打印档案',
                  subtitle: '打印${pet.name}的档案',
                  color: pet.color,
                  onTap: () => _printPetProfile(),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildQuickActionCard({
    required IconData icon,
    required String label,
    required String subtitle,
    required Color color,
    required VoidCallback onTap,
  }) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(AppTheme.borderRadiusMedium),
        child: Container(
          padding: const EdgeInsets.all(AppTheme.spacingS), // 减少内边距
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(AppTheme.borderRadiusMedium),
            border: Border.all(color: color.withValues(alpha: 0.2)),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.04),
                blurRadius: 8,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min, // 添加这个属性
            children: [
              Container(
                padding: const EdgeInsets.all(8), // 减少图标容器内边距
                decoration: BoxDecoration(
                  color: color.withValues(alpha: 0.1),
                  shape: BoxShape.circle,
                ),
                child: Icon(icon, color: color, size: 20), // 减少图标大小
              ),
              const SizedBox(height: AppTheme.spacingS), // 减少间距
              Text(
                label,
                style: TextStyle(
                  color: color,
                  fontSize: AppTheme.fontSizeXS, // 减少字体大小
                  fontWeight: FontWeight.w600,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 2), // 减少间距
              Text(
                subtitle,
                style: TextStyle(
                  color: AppTheme.textSecondaryColor,
                  fontSize: AppTheme.fontSizeXS,
                ),
                textAlign: TextAlign.center,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ),
    );
  }

  // 宠物详情入口 - 单宠家庭重点功能
  Widget _buildPetDetailEntry() {
    final pet = _pets[_selectedPetIndex];
    
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: AppTheme.spacingM),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () => _viewPetDetail(pet),
          borderRadius: BorderRadius.circular(AppTheme.borderRadiusLarge),
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.all(AppTheme.spacingM), // 减少内边距
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  pet.color.withValues(alpha: 0.1),
                  pet.color.withValues(alpha: 0.05),
                ],
              ),
              borderRadius: BorderRadius.circular(AppTheme.borderRadiusLarge),
              border: Border.all(color: pet.color.withValues(alpha: 0.2)),
            ),
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(12), // 减少头像内边距
                  decoration: BoxDecoration(
                    color: pet.color.withValues(alpha: 0.15),
                    shape: BoxShape.circle,
                  ),
                  child: Text(
                    pet.avatar,
                    style: const TextStyle(fontSize: 24), // 减少头像大小
                  ),
                ),
                const SizedBox(width: AppTheme.spacingM), // 减少间距
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min, // 添加这个属性
                    children: [
                      Text(
                        '查看${pet.name}的完整档案',
                        style: TextStyle(
                          color: pet.color,
                          fontSize: AppTheme.fontSizeM, // 减少字体大小
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 4), // 减少间距
                      Text(
                        '包含详细信息、健康记录、成长轨迹等',
                        style: TextStyle(
                          color: pet.color.withValues(alpha: 0.7),
                          fontSize: AppTheme.fontSizeXS, // 减少字体大小
                        ),
                      ),
                    ],
                  ),
                ),
                Icon(
                  Icons.arrow_forward_ios,
                  color: pet.color,
                  size: 18, // 减少图标大小
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // 测试区域 - 显示布局信息
  Widget _buildDebugInfo() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: AppTheme.spacingM),
      padding: const EdgeInsets.all(AppTheme.spacingM),
      decoration: BoxDecoration(
        color: Colors.grey.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(AppTheme.borderRadiusMedium),
        border: Border.all(color: Colors.grey.withValues(alpha: 0.3)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '布局优化测试',
            style: TextStyle(
              color: Colors.grey[700],
              fontSize: AppTheme.fontSizeS,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            '宠物数量: ${_pets.length}',
            style: TextStyle(
              color: Colors.grey[600],
              fontSize: AppTheme.fontSizeXS,
            ),
          ),
          Text(
            '当前宠物: ${_pets[_selectedPetIndex].name}',
            style: TextStyle(
              color: Colors.grey[600],
              fontSize: AppTheme.fontSizeXS,
            ),
          ),
          Text(
            '健康记录数量: ${_getRecordCounts().values.reduce((a, b) => a + b)}',
            style: TextStyle(
              color: Colors.grey[600],
              fontSize: AppTheme.fontSizeXS,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildUserAvatarButton() {
    return GestureDetector(
      onTap: _navigateToProfile,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
          color: Colors.white.withValues(alpha: 0.2),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.1),
                    blurRadius: 4,
                    offset: const Offset(0, 1),
                  ),
                ],
              ),
              child: CircleAvatar(
                radius: 16,
                backgroundColor: AppTheme.primaryLightColor,
                child: Text(
                  _userData['avatar']!,
                  style: const TextStyle(fontSize: 16, color: Colors.white),
                ),
              ),
            ),
            const SizedBox(width: 6),
            Text(
              _userData['name']!,
              style: const TextStyle(
                fontSize: AppTheme.fontSizeS,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),
            const SizedBox(width: 4),
            const Icon(
              Icons.arrow_forward_ios,
              color: Colors.white,
              size: 12,
            ),
          ],
        ),
      ),
    );
  }

  // 获取记录数量统计
  Map<String, int> _getRecordCounts() {
    return {
      'vaccination': 3,
      'weight': 8,
      'vetVisit': 2,
      'medication': 1,
      'deworming': 4,
      'grooming': 2,
    };
  }

  // 导航到个人资料页面
  void _navigateToProfile() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => const ProfilePage()),
    );
  }

  // 宠物管理方法
  void _addPet() async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const PetManagementPage(),
      ),
    );
    
    if (result != null && result is models.Pet) {
      setState(() {
        _pets.add(result);
        _selectedPetIndex = _pets.length - 1; // 选择新添加的宠物
      });
    }
  }

  void _editPet() async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => PetManagementPage(pet: _pets[_selectedPetIndex]),
      ),
    );
    
    if (result != null) {
      if (result == 'deleted') {
        // 宠物被删除
        setState(() {
          _pets.removeAt(_selectedPetIndex);
          if (_pets.isEmpty) {
            // 如果没有宠物了，可以添加一个默认宠物或显示空状态
            _selectedPetIndex = 0;
          } else if (_selectedPetIndex >= _pets.length) {
            _selectedPetIndex = _pets.length - 1;
          }
        });
      } else if (result is models.Pet) {
        // 宠物信息被更新
        setState(() {
          _pets[_selectedPetIndex] = result;
        });
      }
    }
  }

  // 健康记录导航
  void _navigateToRecords({bool openAddSheet = false, models.HealthRecordType? filterType}) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => RecordsPage(
          initialPetId: _pets[_selectedPetIndex].id,
          openAddSheet: openAddSheet,
          initialFilterType: filterType,
        ),
      ),
    );
  }

  // 查看宠物详情
  void _viewPetDetail(models.Pet pet) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => PetDetailPage(pet: pet),
      ),
    );
  }

  // 快捷操作方法
  void _viewPhotoAlbum() {
    AppErrorHandler.handleError(context, '相册功能开发中...');
  }

  void _viewGrowthTrack() {
    AppErrorHandler.handleError(context, '成长轨迹功能开发中...');
  }

  void _sharePetProfile() {
    AppErrorHandler.handleError(context, '分享功能开发中...');
  }

  void _printPetProfile() {
    AppErrorHandler.handleError(context, '打印功能开发中...');
  }

  // 复制身份码
  void _copyIdentityCode(String code) async {
    await Clipboard.setData(ClipboardData(text: code));
    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('已复制身份码')),
      );
    }
  }

  // 显示身份码二维码
  void _showIdentityQrDialog(String code) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text('宠物身份码二维码'),
        content: SizedBox(
          width: 240,
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                QrImageView(
                  data: code,
                  size: 200,
                  version: QrVersions.auto,
                ),
                const SizedBox(height: 12),
                SelectableText(
                  code,
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('关闭'),
          ),
        ],
      ),
    );
  }
}
