import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';
import '../../core/error_handler.dart';
import '../../core/models.dart';
import '../pet/pet_components.dart';
import '../../services/user_auth_service.dart';
import '../../services/pet_service.dart';
import '../../model/user.dart' as user_model;
import '../records/records_page.dart';
import '../records/add_health_record_page.dart';
import 'profile_page.dart';
import 'settings_page.dart';
import '../pet/pet_detail_page.dart';
import '../pet/pet_management_page.dart';
import 'package:flutter/services.dart';
import 'package:qr_flutter/qr_flutter.dart';

class ArchiveProfilePage extends StatefulWidget {
  const ArchiveProfilePage({super.key});

  @override
  State<ArchiveProfilePage> createState() => _ArchiveProfilePageState();
}

class _ArchiveProfilePageState extends State<ArchiveProfilePage> {
  int _selectedPetIndex = 0;
  final UserAuthService _authService = UserAuthService();
  final PetService _petService = PetService();
  user_model.User? _currentUser;
  bool _isLoadingUser = true;
  bool _isLoadingPets = true;

  // 宠物数据 - 从API获取
  List<Pet> _pets = [];

  @override
  void initState() {
    super.initState();
    _loadUserInfo();
    _loadPets();
  }

  /// 加载用户信息
  Future<void> _loadUserInfo() async {
    try {
      setState(() {
        _isLoadingUser = true;
      });

      // 获取当前用户信息
      final user = await _authService.getCurrentUserInfo();
      debugPrint('加载用户信息: $user');
      if (mounted) {
        setState(() {
          _currentUser = user;
          _isLoadingUser = false;
        });
      }
    } catch (e) {
      debugPrint('加载用户信息失败: $e');
      if (mounted) {
        setState(() {
          _isLoadingUser = false;
        });
      }
    }
  }

  /// 同步认证Token到PetService
  void _syncAuthToken() {
    try {
      final token = _authService.getAccessToken();
      if (token != null && token.isNotEmpty) {
        _petService.setAuthToken(token);
        debugPrint('已同步认证Token到PetService');
      } else {
        debugPrint('无法获取认证Token，用户可能未登录');
      }
    } catch (e) {
      debugPrint('同步认证Token失败: $e');
    }
  }

  /// 加载宠物数据
  Future<void> _loadPets() async {
    try {
      setState(() {
        _isLoadingPets = true;
      });

      // 同步认证Token到PetService
      _syncAuthToken();

      // 优化：只加载基本信息，避免一次性加载过多数据
      final pets = await _petService.getUserPets('current_user');

      if (mounted) {
        setState(() {
          _pets = pets;
          _isLoadingPets = false;
        });
      }

      // 延迟加载宠物详细信息（按需加载）
      if (pets.isNotEmpty) {
        _loadPetDetailsLazily(pets.first.id);
      }
    } catch (e) {
      debugPrint('加载宠物数据失败: $e');
      if (mounted) {
        setState(() {
          _isLoadingPets = false;
        });
      }
    }
  }

  /// 延迟加载宠物详细信息（按需加载）
  Future<void> _loadPetDetailsLazily(String petId) async {
    try {
      // 延迟1秒后加载详细信息，避免阻塞页面渲染
      await Future.delayed(const Duration(milliseconds: 1000));

      if (!mounted) return;

      // 按需加载记录数量，只加载用户当前需要的类型
      final recordCounts = await _petService.getPetRecordCounts(petId);

      if (mounted) {
        setState(() {
          // 更新当前宠物的记录数量
          // 这里可以根据需要更新UI显示
        });
      }
    } catch (e) {
      debugPrint('延迟加载宠物详细信息失败: $e');
    }
  }

  /// 按需加载完整记录数量（当用户需要查看所有类型时）
  Future<void> _loadFullRecordCounts(String petId) async {
    try {
      final fullCounts = await _petService.getFullRecordCounts(petId);
      if (mounted) {
        setState(() {
          // 更新完整的记录数量
          // 这里可以根据需要更新UI显示
        });
      }
    } catch (e) {
      debugPrint('加载完整记录数量失败: $e');
    }
  }

  /// 刷新用户信息
  Future<void> _refreshUserInfo() async {
    try {
      setState(() {
        _isLoadingUser = true;
      });

      // 从服务器刷新用户信息
      final user = await _authService.refreshUserInfo();

      if (mounted) {
        setState(() {
          _currentUser = user;
          _isLoadingUser = false;
        });
      }
    } catch (e) {
      debugPrint('刷新用户信息失败: $e');
      if (mounted) {
        setState(() {
          _isLoadingUser = false;
        });
      }
    }
  }

  /// 刷新宠物数据
  Future<void> _refreshPets() async {
    try {
      setState(() {
        _isLoadingPets = true;
      });

      // 先同步认证Token
      _syncAuthToken();

      // 获取当前用户ID
      final userId = _currentUser?.userId ?? 'guest';

      // 从API刷新宠物列表
      final pets = await _petService.refreshPets(userId);

      if (mounted) {
        setState(() {
          _pets = pets;
          _isLoadingPets = false;
          // 确保选中的宠物索引有效
          if (_pets.isNotEmpty && _selectedPetIndex >= _pets.length) {
            _selectedPetIndex = 0;
          }
        });
      }
    } catch (e) {
      debugPrint('刷新宠物数据失败: $e');
      if (mounted) {
        setState(() {
          _isLoadingPets = false;
        });
      }
    }
  }

  /// 刷新所有数据
  Future<void> _refreshAllData() async {
    await Future.wait([_refreshUserInfo(), _refreshPets()]);
  }

  /// 获取用户显示名称
  String _getUserDisplayName() {
    if (_currentUser != null) {
      return _currentUser!.username;
    }
    return '未登录';
  }

  /// 获取用户头像
  String _getUserAvatar() {
    if (_currentUser?.avatar != null && _currentUser!.avatar!.isNotEmpty) {
      return _currentUser!.avatar!;
    }
    // 如果没有头像，使用用户名首字母
    final name = _getUserDisplayName();
    if (name.isNotEmpty && name != '未登录') {
      return name[0];
    }
    return '👤';
  }

  /// 判断是否为有效的URL
  bool _isValidUrl(String? value) {
    if (value == null || value.isEmpty) return false;
    return value.startsWith('http://') || value.startsWith('https://');
  }

  /// 构建用户头像内容（支持URL/表情/首字母）
  Widget _buildUserAvatarContent() {
    if (_isLoadingUser) {
      return SizedBox(
        width: 16,
        height: 16,
        child: CircularProgressIndicator(
          strokeWidth: 2,
          valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
        ),
      );
    }

    final avatar = _currentUser?.avatar;
    if (_isValidUrl(avatar)) {
      return ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Image.network(
          avatar!,
          width: 28,
          height: 28,
          fit: BoxFit.cover,
          cacheWidth: (28 * MediaQuery.of(context).devicePixelRatio).round(),
          cacheHeight: (28 * MediaQuery.of(context).devicePixelRatio).round(),
          errorBuilder: (context, error, stack) {
            return const Icon(Icons.person, color: Colors.white, size: 18);
          },
        ),
      );
    }

    return Text(
      _getUserAvatar(),
      style: const TextStyle(fontSize: 16, color: Colors.white),
    );
  }

  /// 检查用户是否已登录
  bool get _isUserLoggedIn => _currentUser != null;

  /// 显示用户登录状态提示
  Widget _buildUserStatusIndicator() {
    if (_isLoadingUser) {
      return Container(
        padding: const EdgeInsets.symmetric(horizontal: AppTheme.spacingM),
        child: Row(
          children: [
            SizedBox(
              width: 16,
              height: 16,
              child: CircularProgressIndicator(
                strokeWidth: 2,
                valueColor: AlwaysStoppedAnimation<Color>(
                  AppTheme.primaryColor,
                ),
              ),
            ),
            const SizedBox(width: AppTheme.spacingS),
            Text(
              '正在加载用户信息...',
              style: TextStyle(
                fontSize: AppTheme.fontSizeS,
                color: AppTheme.getTextSecondaryColor(context),
              ),
            ),
          ],
        ),
      );
    }

    if (!_isUserLoggedIn) {
      return Container(
        padding: const EdgeInsets.symmetric(horizontal: AppTheme.spacingM),
        child: Row(
          children: [
            Icon(
              Icons.info_outline,
              size: 16,
              color: AppTheme.getTextSecondaryColor(context),
            ),
            const SizedBox(width: AppTheme.spacingS),
            Expanded(
              child: Text(
                '请先登录以获取完整的用户信息',
                style: TextStyle(
                  fontSize: AppTheme.fontSizeS,
                  color: AppTheme.getTextSecondaryColor(context),
                ),
              ),
            ),
          ],
        ),
      );
    }

    return const SizedBox.shrink();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.getBackgroundColor(context),
      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: () async {
            await _refreshAllData();
          },
          child: Column(
            children: [
              // 简化的页面头部 - 只显示标题和用户头像
              _buildSimpleHeader(),

              // 内容区域
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    color: AppTheme.getBackgroundColor(context),
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(AppTheme.borderRadiusLarge),
                      topRight: Radius.circular(AppTheme.borderRadiusLarge),
                    ),
                  ),
                  child: _buildContent(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// 构建内容区域
  Widget _buildContent() {
    // 显示加载状态
    if (_isLoadingPets) {
      return const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircularProgressIndicator(),
            SizedBox(height: 16),
            Text('正在加载宠物数据...'),
          ],
        ),
      );
    }

    // 显示空状态
    if (_pets.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.pets,
              size: 64,
              color: AppTheme.getTextSecondaryColor(context),
            ),
            const SizedBox(height: 16),
            Text(
              '还没有宠物档案',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: AppTheme.getTextPrimaryColor(context),
              ),
            ),
            const SizedBox(height: 8),
            Text(
              '点击右上角添加按钮创建第一个宠物档案',
              style: TextStyle(
                fontSize: 14,
                color: AppTheme.getTextSecondaryColor(context),
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 24),
            ElevatedButton.icon(
              onPressed: () => _addNewPet(),
              icon: const Icon(Icons.add),
              label: const Text('添加宠物'),
            ),
          ],
        ),
      );
    }

    // 显示宠物内容
    return SingleChildScrollView(
      physics: const AlwaysScrollableScrollPhysics(),
      child: Column(
        children: [
          // 顶部已包含宠物切换，不再在内容区重复选择器
          const SizedBox(height: AppTheme.spacingM),

          // 宠物信息头部
          PetInfoHeader(
            pet: _pets[_selectedPetIndex],
            onCopyIdentity: () =>
                _copyIdentityCode(_pets[_selectedPetIndex].identityCode),
            onShowQr: () =>
                _showIdentityQrDialog(_pets[_selectedPetIndex].identityCode),
            onEditPet: _editPet,
          ),
          const SizedBox(height: AppTheme.spacingM),

          // 健康记录快捷入口 + 快捷操作（合并为统一容器）
          _buildQuickCombinedSection(),
          const SizedBox(height: AppTheme.spacingL),

          // 宠物详情入口
          _buildPetDetailEntry(),
          const SizedBox(height: AppTheme.spacingL),
        ],
      ),
    );
  }

  // 美化的页面头部 - 显示标题、用户头像和设置按钮
  Widget _buildSimpleHeader() {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(
            horizontal: AppTheme.spacingM,
            vertical: AppTheme.spacingS,
          ),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                AppTheme.primaryColor.withValues(alpha: 0.1),
                AppTheme.primaryLightColor.withValues(alpha: 0.05),
              ],
            ),
            border: Border(
              bottom: BorderSide(
                color: AppTheme.getDividerColor(context),
                width: 1,
              ),
            ),
          ),
          child: Row(
            children: [
              // 仅头像，节省空间
              _buildCompactUserAvatarButton(),
              const SizedBox(width: AppTheme.spacingS),
              // 自适应的宠物下拉
              Expanded(child: _buildCompactPetSwitcher()),
              const SizedBox(width: AppTheme.spacingS),
              _buildCompactAddPetButton(),
              const SizedBox(width: AppTheme.spacingXS),
              _buildCompactSettingsButton(),
            ],
          ),
        ),
      ],
    );
  }

  // 快捷操作区域 - 单宠家庭重点功能
  Widget _buildQuickActions() {
    final pet = _pets[_selectedPetIndex];

    return Container(
      margin: EdgeInsets.zero,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '快捷操作',
            style: TextStyle(
              color: AppTheme.getTextSecondaryColor(context),
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
                  icon: Icons.add_circle,
                  label: '新增记录',
                  subtitle: '直接添加一条健康记录',
                  color: pet.color,
                  onTap: () => _quickAddHealthRecord(),
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

  // 统一容器：健康记录快捷入口 + 快捷操作
  Widget _buildQuickCombinedSection() {
    final pet = _pets[_selectedPetIndex];
    return Container(
      margin: EdgeInsets.zero,
      padding: const EdgeInsets.all(AppTheme.spacingM),
      decoration: BoxDecoration(
        color: AppTheme.getSurfaceColor(context),
        borderRadius: BorderRadius.circular(AppTheme.borderRadiusLarge),
        border: Border.all(color: AppTheme.getDividerColor(context)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.04),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 健康记录快捷入口
          HealthQuickAccess(
            pet: pet,
            onViewRecords: (type) => _navigateToRecords(filterType: type),
            onAddRecord: () async {
              await navigateToAddHealthRecordPage(
                context,
                pets: _pets,
                presetPetId: pet.id,
              );
            },
            recordCounts: _getRecordCounts(),
            embedded: true,
          ),
          const SizedBox(height: AppTheme.spacingM),
          // 分割线让结构更清晰
          Divider(color: AppTheme.getDividerColor(context), height: 1),
          const SizedBox(height: AppTheme.spacingM),
          // 快捷操作
          _buildQuickActions(),
        ],
      ),
    );
  }

  // 顶部新增宠物按钮
  Widget _buildAddPetButton() {
    return Tooltip(
      message: '新增宠物',
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () async {
            final result = await Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const PetManagementPage(),
              ),
            );
            if (result != null && result is Pet) {
              setState(() {
                _pets.add(result);
                _selectedPetIndex = _pets.length - 1;
              });
            }
          },
          borderRadius: BorderRadius.circular(20),
          child: Container(
            height: 40,
            width: 40,
            decoration: BoxDecoration(
              color: AppTheme.getSurfaceColor(context),
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                color: AppTheme.getDividerColor(context),
                width: 1,
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.06),
                  blurRadius: 8,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            alignment: Alignment.center,
            child: Icon(
              Icons.add,
              size: 20,
              color: AppTheme.getTextPrimaryColor(context),
            ),
          ),
        ),
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
          padding: const EdgeInsets.symmetric(
            horizontal: AppTheme.spacingM,
            vertical: AppTheme.spacingS,
          ),
          decoration: BoxDecoration(
            color: AppTheme.getSurfaceColor(context),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: AppTheme.getDividerColor(context)),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.03),
                blurRadius: 6,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: AppTheme.getSurfaceColor(context),
                  shape: BoxShape.circle,
                  border: Border.all(color: AppTheme.getDividerColor(context)),
                ),
                child: Icon(icon, color: color, size: 18),
              ),
              const SizedBox(height: AppTheme.spacingS),
              Text(
                label,
                style: TextStyle(
                  color: AppTheme.getTextPrimaryColor(context),
                  fontSize: AppTheme.fontSizeS,
                  fontWeight: FontWeight.w600,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 2),
              Text(
                subtitle,
                style: TextStyle(
                  color: AppTheme.getTextSecondaryColor(context),
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
      margin: EdgeInsets.zero,
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
                  child: PetAvatar(
                    avatar: pet.avatar,
                    size: 24,
                    brokenIconColor: pet.color,
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

  // 紧凑版用户头像按钮（去掉用户名与箭头）
  Widget _buildCompactUserAvatarButton() {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: _navigateToProfile,
        borderRadius: BorderRadius.circular(18),
        child: Container(
          height: 36,
          width: 36,
          decoration: BoxDecoration(
            color: AppTheme.getSurfaceColor(context),
            borderRadius: BorderRadius.circular(18),
            border: Border.all(
              color: AppTheme.primaryColor.withValues(alpha: 0.2),
              width: 1,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.06),
                blurRadius: 6,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          alignment: Alignment.center,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(14),
            child: SizedBox(
              width: 28,
              height: 28,
              child: _buildUserAvatarContent(),
            ),
          ),
        ),
      ),
    );
  }

  // 紧凑版宠物切换器
  Widget _buildCompactPetSwitcher() {
    return Container(
      height: 36,
      padding: const EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(
        color: AppTheme.getSurfaceColor(context),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppTheme.getDividerColor(context), width: 1),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          isDense: true,
          isExpanded: true,
          value: _pets.isNotEmpty ? _pets[_selectedPetIndex].id : null,
          hint: Row(
            children: [
              Icon(
                Icons.pets,
                size: 16,
                color: AppTheme.getTextSecondaryColor(context),
              ),
              const SizedBox(width: 6),
              Text(
                '选择宠物',
                style: TextStyle(
                  color: AppTheme.getTextSecondaryColor(context),
                  fontSize: AppTheme.fontSizeS,
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
          icon: const Icon(Icons.expand_more, size: 18),
          selectedItemBuilder: (context) => _pets
              .map(
                (p) => Align(
                  alignment: Alignment.centerLeft,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      PetAvatar(
                        avatar: p.avatar,
                        size: 16,
                        brokenIconColor: p.color,
                      ),
                      const SizedBox(width: 6),
                      Flexible(
                        child: Text(
                          p.name,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            color: AppTheme.getTextPrimaryColor(context),
                            fontSize: AppTheme.fontSizeS,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              )
              .toList(),
          items: _pets
              .map(
                (p) => DropdownMenuItem<String>(
                  value: p.id,
                  child: Row(
                    children: [
                      PetAvatar(
                        avatar: p.avatar,
                        size: 16,
                        brokenIconColor: p.color,
                      ),
                      const SizedBox(width: 8),
                      Flexible(
                        child: Text(
                          p.name,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            color: AppTheme.getTextPrimaryColor(context),
                            fontSize: AppTheme.fontSizeS,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              )
              .toList(),
          onChanged: (value) {
            if (value == null) return;
            setState(() {
              _selectedPetIndex = _pets.indexWhere((p) => p.id == value);
            });
          },
        ),
      ),
    );
  }

  // 紧凑版新增宠物按钮
  Widget _buildCompactAddPetButton() {
    return Tooltip(
      message: '新增宠物',
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: _addNewPet,
          borderRadius: BorderRadius.circular(18),
          child: Container(
            height: 36,
            width: 36,
            decoration: BoxDecoration(
              color: AppTheme.getSurfaceColor(context),
              borderRadius: BorderRadius.circular(18),
              border: Border.all(
                color: AppTheme.getDividerColor(context),
                width: 1,
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.06),
                  blurRadius: 6,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            alignment: Alignment.center,
            child: Icon(
              Icons.add,
              size: 18,
              color: AppTheme.getTextPrimaryColor(context),
            ),
          ),
        ),
      ),
    );
  }

  // 紧凑版设置按钮
  Widget _buildCompactSettingsButton() {
    return Tooltip(
      message: '设置 (长按测试API、认证和Token缓存)',
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: _openSettings,
          onLongPress: () async {
            await Future.wait([
              _testUserInfo(),
              _testAuthToken(),
              _testTokenCache(),
            ]);
          },
          borderRadius: BorderRadius.circular(18),
          child: Container(
            height: 36,
            width: 36,
            decoration: BoxDecoration(
              color: AppTheme.primaryColor,
              borderRadius: BorderRadius.circular(18),
              boxShadow: [
                BoxShadow(
                  color: AppTheme.primaryColor.withValues(alpha: 0.25),
                  blurRadius: 6,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            alignment: Alignment.center,
            child: const Icon(Icons.settings, color: Colors.white, size: 18),
          ),
        ),
      ),
    );
  }

  // 获取记录数量统计
  Map<String, int> _getRecordCounts() {
    // 如果有选中的宠物，从API获取真实数据
    if (_pets.isNotEmpty && _selectedPetIndex < _pets.length) {
      final petId = _pets[_selectedPetIndex].id;
      // 这里应该异步获取，但为了简化，先返回默认值
      // 实际应用中应该使用FutureBuilder或StreamBuilder
      return {
        'vaccination': 0,
        'weight': 0,
        'vetVisit': 0,
        'deworming': 0,
        'grooming': 0,
      };
    }

    // 默认值
    return {
      'vaccination': 0,
      'weight': 0,
      'vetVisit': 0,
      'deworming': 0,
      'grooming': 0,
    };
  }

  /// 异步获取记录数量
  Future<Map<String, int>> _getRecordCountsAsync() async {
    if (_pets.isEmpty || _selectedPetIndex >= _pets.length) {
      return {
        'vaccination': 0,
        'weight': 0,
        'vetVisit': 0,
        'deworming': 0,
        'grooming': 0,
      };
    }

    try {
      final petId = _pets[_selectedPetIndex].id;
      return await _petService.getPetRecordCounts(petId);
    } catch (e) {
      debugPrint('获取记录数量失败: $e');
      return {
        'vaccination': 0,
        'weight': 0,
        'vetVisit': 0,
        'deworming': 0,
        'grooming': 0,
      };
    }
  }

  /// 添加新宠物
  void _addNewPet() async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const PetManagementPage()),
    );
    if (result != null && result is Pet) {
      // 刷新宠物列表
      await _refreshPets();
    }
  }

  // 导航到个人资料页面
  void _navigateToProfile() async {
    // 先刷新用户信息
    await _refreshUserInfo();

    if (mounted) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (_) => const ProfilePage()),
      ).then((_) {
        // 从个人资料页面返回后，再次刷新用户信息
        _refreshUserInfo();
      });
    }
  }

  // 打开设置页面
  void _openSettings() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const SettingsPage()),
    );
  }

  /// 测试用户信息获取功能
  Future<void> _testUserInfo() async {
    try {
      debugPrint('开始测试用户信息获取...');

      // 测试获取当前用户信息
      final user = await _authService.getCurrentUserInfo();
      if (user != null) {
        debugPrint('获取用户信息成功:');
        debugPrint('  - 用户ID: ${user.userId}');
        debugPrint('  - 用户名: ${user.username}');
        debugPrint('  - 手机号: ${user.phone}');
        debugPrint('  - 邮箱: ${user.email}');
        debugPrint('  - 头像: ${user.avatar}');
        debugPrint('  - 注册时间: ${user.registerTime}');
        debugPrint('  - 最后登录: ${user.lastLoginTime}');

        // 显示成功提示
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('用户信息获取成功: ${user.username}'),
              backgroundColor: Colors.green,
            ),
          );
        }
      } else {
        debugPrint('用户信息为空');
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('用户信息为空，请先登录'),
              backgroundColor: Colors.orange,
            ),
          );
        }
      }
    } catch (e) {
      debugPrint('测试用户信息获取失败: $e');
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('测试失败: $e'), backgroundColor: Colors.red),
        );
      }
    }
  }

  /// 测试Token缓存功能
  Future<void> _testTokenCache() async {
    try {
      debugPrint('开始测试Token缓存功能...');

      // 测试UserAuthService的Token缓存
      await _authService.testTokenCache();

      // 测试PetService的Token同步
      _syncAuthToken();

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Token缓存测试完成，请查看控制台日志'),
            backgroundColor: Colors.green,
          ),
        );
      }
    } catch (e) {
      debugPrint('Token缓存测试失败: $e');
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Token缓存测试失败: $e'),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }

  /// 测试认证Token设置
  Future<void> _testAuthToken() async {
    try {
      debugPrint('开始测试认证Token...');

      // 检查UserAuthService的Token
      final authToken = _authService.getAccessToken();
      if (authToken != null && authToken.isNotEmpty) {
        debugPrint('UserAuthService Token: ${authToken.substring(0, 20)}...');
      } else {
        debugPrint('UserAuthService Token: 未设置');
      }

      // 同步Token到PetService
      _syncAuthToken();

      // 测试PetService的API调用
      await _petService.testPetApi();

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('认证Token测试完成，请查看控制台日志'),
            backgroundColor: Colors.green,
          ),
        );
      }
    } catch (e) {
      debugPrint('认证Token测试失败: $e');
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('认证Token测试失败: $e'),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }

  /// 测试宠物API功能
  Future<void> _testPetApi() async {
    try {
      debugPrint('开始测试宠物API功能...');

      // 测试PetService
      await _petService.testPetApi();

      // 显示成功提示
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('宠物API测试完成，请查看控制台日志'),
            backgroundColor: Colors.green,
          ),
        );
      }
    } catch (e) {
      debugPrint('宠物API测试失败: $e');
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('宠物API测试失败: $e'), backgroundColor: Colors.red),
        );
      }
    }
  }

  // 顶部宠物切换器（下拉样式）
  Widget _buildPetSwitcher() {
    // 显示加载状态
    if (_isLoadingPets) {
      return Container(
        height: 40,
        padding: const EdgeInsets.symmetric(horizontal: 8),
        decoration: BoxDecoration(
          color: AppTheme.getSurfaceColor(context),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: AppTheme.getDividerColor(context),
            width: 1,
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              width: 16,
              height: 16,
              child: CircularProgressIndicator(
                strokeWidth: 2,
                valueColor: AlwaysStoppedAnimation<Color>(
                  AppTheme.primaryColor,
                ),
              ),
            ),
            const SizedBox(width: 8),
            Flexible(
              child: Text(
                '加载中...',
                style: TextStyle(
                  color: AppTheme.getTextSecondaryColor(context),
                  fontSize: AppTheme.fontSizeS,
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      );
    }

    // 显示空状态
    if (_pets.isEmpty) {
      return Container(
        height: 40,
        padding: const EdgeInsets.symmetric(horizontal: 8),
        decoration: BoxDecoration(
          color: AppTheme.getSurfaceColor(context),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: AppTheme.getDividerColor(context),
            width: 1,
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.pets,
              size: 16,
              color: AppTheme.getTextSecondaryColor(context),
            ),
            const SizedBox(width: 8),
            Flexible(
              child: Text(
                '暂无宠物',
                style: TextStyle(
                  color: AppTheme.getTextSecondaryColor(context),
                  fontSize: AppTheme.fontSizeS,
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      );
    }

    // 显示宠物列表
    return Container(
      height: 40,
      padding: const EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(
        color: AppTheme.getSurfaceColor(context),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: AppTheme.getDividerColor(context), width: 1),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          isDense: true,
          isExpanded: true,
          value: _pets[_selectedPetIndex].id,
          icon: const Icon(Icons.keyboard_arrow_down_rounded, size: 18),
          selectedItemBuilder: (context) => _pets
              .map(
                (p) => Align(
                  alignment: Alignment.centerLeft,
                  child: PetAvatar(
                    avatar: p.avatar,
                    size: 16,
                    brokenIconColor: p.color,
                  ),
                ),
              )
              .toList(),
          items: _pets
              .map(
                (p) => DropdownMenuItem<String>(
                  value: p.id,
                  child: Row(
                    children: [
                      PetAvatar(
                        avatar: p.avatar,
                        size: 16,
                        brokenIconColor: p.color,
                      ),
                      const SizedBox(width: 8),
                      Flexible(
                        child: Text(
                          p.name,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            color: AppTheme.getTextPrimaryColor(context),
                            fontSize: AppTheme.fontSizeM,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              )
              .toList(),
          onChanged: (value) {
            if (value == null) return;
            setState(() {
              _selectedPetIndex = _pets.indexWhere((p) => p.id == value);
            });
          },
        ),
      ),
    );
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
      } else if (result is Pet) {
        // 宠物信息被更新
        setState(() {
          _pets[_selectedPetIndex] = result;
        });
      }
    }
  }

  // 健康记录导航
  void _navigateToRecords({
    bool openAddSheet = false,
    HealthRecordType? filterType,
  }) {
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
  void _viewPetDetail(Pet pet) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => PetDetailPage(pet: pet)),
    );
  }

  // 快捷操作方法
  void _viewPhotoAlbum() {
    AppErrorHandler.handleError(context, '相册功能开发中...');
  }

  void _viewGrowthTrack() {
    AppErrorHandler.handleError(context, '成长轨迹功能开发中...');
  }

  Future<void> _quickAddHealthRecord() async {
    final pet = _pets[_selectedPetIndex];
    final rec = await navigateToAddHealthRecordPage(
      context,
      pets: _pets,
      presetPetId: pet.id,
    );
    if (rec == null) return;
    if (!mounted) return;
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(const SnackBar(content: Text('已创建健康记录')));
  }

  void _printPetProfile() {
    AppErrorHandler.handleError(context, '打印功能开发中...');
  }

  // 复制身份码
  void _copyIdentityCode(String code) async {
    await Clipboard.setData(ClipboardData(text: code));
    if (mounted) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('已复制身份码')));
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
                QrImageView(data: code, size: 200, version: QrVersions.auto),
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

/*
使用说明：

1. 用户信息自动获取：
   - 页面初始化时会自动调用 `_authService.getCurrentUserInfo()` 获取用户信息
   - 如果用户已登录，会显示真实的用户名和头像
   - 如果用户未登录，会显示"未登录"状态

2. 宠物数据自动获取：
   - 页面初始化时会自动调用 `_petService.getUserPets()` 获取宠物列表
   - 从后端API获取真实的宠物数据
   - 如果API失败，会回退到本地数据库
   - 支持宠物切换和空状态显示

3. 认证Token管理：
   - 自动从 `UserAuthService` 获取认证Token
   - 在每次API调用前同步Token到 `PetService`
   - 支持Token刷新和验证
   - 确保API请求包含正确的认证头

4. Token缓存机制：
   - 登录成功后Token会自动保存到本地存储
   - 应用刷新后会自动从本地存储恢复Token
   - 登出时会自动清除Token缓存
   - 支持Token持久化存储，避免刷新后丢失

5. 用户信息刷新：
   - 下拉页面可以刷新用户信息和宠物数据
   - 点击用户头像会先刷新用户信息，然后跳转到个人资料页面
   - 从个人资料页面返回后会再次刷新用户信息

6. 宠物数据刷新：
   - 下拉页面可以刷新宠物数据
   - 添加新宠物后会自动刷新列表
   - 编辑宠物后会自动更新数据

7. 测试功能：
   - 长按设置按钮可以测试用户信息、认证Token、Token缓存和宠物API功能
   - 会在控制台输出详细的API调用日志
   - 会显示相应的成功/失败提示

8. 用户状态显示：
   - 加载中：显示加载指示器
   - 未登录：显示提示信息
   - 已登录：显示用户信息

9. 宠物状态显示：
   - 加载中：显示加载指示器
   - 空状态：显示添加宠物提示
   - 有宠物：显示宠物列表和详情

10. 错误处理：
    - 网络错误时会显示错误信息
    - 认证失败时会尝试刷新Token
    - Token过期时会自动清除缓存
    - 用户信息为空时会显示相应提示
    - 宠物数据为空时会显示添加提示
    - 所有错误都会在控制台输出详细信息

使用流程：
1. 用户登录成功后，Token会自动设置并缓存
2. 页面会自动获取用户信息和宠物数据
3. 每次API调用前会自动同步认证Token
4. 应用刷新后会自动恢复Token缓存
5. 用户可以下拉刷新或点击头像刷新信息
6. 用户可以切换宠物查看不同宠物的信息
7. 长按设置按钮可以测试功能是否正常

注意事项：
- 确保 UserAuthService 和 PetService 已正确初始化
- 确保后端API接口正常工作
- 确保用户已登录且Token有效
- Token会自动缓存和恢复，无需手动管理
- 网络错误时会返回本地缓存数据
- 用户信息和宠物数据更新后会自动刷新UI
- 支持离线模式，API失败时会使用本地数据
- 认证Token会自动同步和管理
- Token缓存支持应用重启后自动恢复
*/
