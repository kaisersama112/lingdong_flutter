import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../core/models.dart' as models;
import '../core/pet_components.dart';
import 'pet_management_page.dart';
import 'package:flutter/services.dart';
import 'package:qr_flutter/qr_flutter.dart';

class PetDetailPage extends StatefulWidget {
  final models.Pet pet;

  const PetDetailPage({super.key, required this.pet});

  @override
  State<PetDetailPage> createState() => _PetDetailPageState();
}

class _PetDetailPageState extends State<PetDetailPage>
    with TickerProviderStateMixin {
  late TabController _tabController;
  // ignore: unused_field
  int _selectedTabIndex = 0;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
    _tabController.addListener(() {
      setState(() {
        _selectedTabIndex = _tabController.index;
      });
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.backgroundColor,
      body: CustomScrollView(
        slivers: [
          // 自定义应用栏
          _buildSliverAppBar(),

          // 标签页内容
          SliverToBoxAdapter(
            child: Column(
              children: [
                // 宠物信息头部
                PetInfoHeader(
                  pet: widget.pet,
                  onCopyIdentity: () =>
                      _copyIdentityCode(widget.pet.identityCode),
                  onShowQr: () =>
                      _showIdentityQrDialog(widget.pet.identityCode),
                  onEditPet: _editPet,
                ),
                const SizedBox(height: AppTheme.spacingL),

                // 标签页导航
                _buildTabBar(),
                const SizedBox(height: AppTheme.spacingM),

                // 标签页内容
                _buildTabContent(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSliverAppBar() {
    return SliverAppBar(
      expandedHeight: 200,
      floating: false,
      pinned: true,
      backgroundColor: widget.pet.color.withValues(alpha: 0.1),
      flexibleSpace: FlexibleSpaceBar(
        background: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                widget.pet.color.withValues(alpha: 0.15),
                widget.pet.color.withValues(alpha: 0.05),
              ],
            ),
          ),
          child: Stack(
            children: [
              // 背景装饰
              Positioned(
                top: -50,
                right: -50,
                child: Container(
                  width: 200,
                  height: 200,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: widget.pet.color.withValues(alpha: 0.1),
                  ),
                ),
              ),
              Positioned(
                bottom: -30,
                left: -30,
                child: Container(
                  width: 150,
                  height: 150,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: widget.pet.color.withValues(alpha: 0.08),
                  ),
                ),
              ),

              // 宠物头像和名称
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: widget.pet.color.withValues(alpha: 0.2),
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: widget.pet.color.withValues(alpha: 0.3),
                            blurRadius: 20,
                            offset: const Offset(0, 8),
                          ),
                        ],
                      ),
                      child: PetAvatar(
                        avatar: widget.pet.avatar,
                        size: 48,
                        brokenIconColor: widget.pet.color,
                      ),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      widget.pet.name,
                      style: const TextStyle(
                        fontSize: AppTheme.fontSizeXL,
                        fontWeight: FontWeight.bold,
                        color: AppTheme.textPrimaryColor,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      '${widget.pet.breed} · ${widget.pet.gender}',
                      style: TextStyle(
                        fontSize: AppTheme.fontSizeM,
                        color: AppTheme.textSecondaryColor,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      leading: IconButton(
        icon: Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Colors.white.withValues(alpha: 0.9),
            shape: BoxShape.circle,
          ),
          child: const Icon(Icons.arrow_back, color: AppTheme.textPrimaryColor),
        ),
        onPressed: () => Navigator.of(context).pop(),
      ),
      actions: [
        IconButton(
          icon: Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.white.withValues(alpha: 0.9),
              shape: BoxShape.circle,
            ),
            child: Icon(Icons.edit, color: widget.pet.color),
          ),
          onPressed: _editPet,
        ),
        IconButton(
          icon: Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.white.withValues(alpha: 0.9),
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.more_vert,
              color: AppTheme.textPrimaryColor,
            ),
          ),
          onPressed: _showMoreOptions,
        ),
      ],
    );
  }

  Widget _buildTabBar() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: AppTheme.spacingM),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(AppTheme.borderRadiusLarge),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.06),
            blurRadius: 16,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: TabBar(
        controller: _tabController,
        indicator: BoxDecoration(
          color: widget.pet.color.withValues(alpha: 0.1),
          borderRadius: BorderRadius.circular(AppTheme.borderRadiusLarge),
        ),
        labelColor: widget.pet.color,
        unselectedLabelColor: AppTheme.textSecondaryColor,
        labelStyle: const TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: AppTheme.fontSizeS,
        ),
        unselectedLabelStyle: const TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: AppTheme.fontSizeS,
        ),
        tabs: const [
          Tab(text: '基本信息'),
          Tab(text: '健康记录'),
          Tab(text: '成长轨迹'),
          Tab(text: '相册'),
        ],
      ),
    );
  }

  Widget _buildTabContent() {
    return Container(
      height: 400, // 固定高度，避免内容跳动
      child: TabBarView(
        controller: _tabController,
        children: [
          _buildBasicInfoTab(),
          _buildHealthRecordsTab(),
          _buildGrowthTrackTab(),
          _buildPhotoAlbumTab(),
        ],
      ),
    );
  }

  Widget _buildBasicInfoTab() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(AppTheme.spacingM),
      child: Column(
        children: [
          _buildInfoCard(
            title: '基本信息',
            icon: Icons.info_outline,
            children: [
              _buildInfoRow('品种', widget.pet.breed),
              _buildInfoRow('性别', widget.pet.gender),
              _buildInfoRow(
                '生日',
                '${widget.pet.birthDate.year}-${widget.pet.birthDate.month.toString().padLeft(2, '0')}-${widget.pet.birthDate.day.toString().padLeft(2, '0')}',
              ),
              _buildInfoRow('年龄', _calculateAge(widget.pet.birthDate)),
              _buildInfoRow('体重', '${widget.pet.weight}kg'),
              _buildInfoRow('身份码', widget.pet.identityCode),
            ],
          ),
          const SizedBox(height: AppTheme.spacingM),
          _buildInfoCard(
            title: '健康状态',
            icon: Icons.health_and_safety,
            children: [
              _buildHealthStatusItem('疫苗状态', '已完成', Colors.green),
              _buildHealthStatusItem('驱虫状态', '本月已驱虫', Colors.blue),
              _buildHealthStatusItem('体检状态', '建议定期体检', Colors.orange),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildHealthRecordsTab() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(AppTheme.spacingM),
      child: Column(
        children: [
          _buildInfoCard(
            title: '最近记录',
            icon: Icons.medical_services,
            children: [
              _buildHealthRecordItem('疫苗注射', '2024-01-15', '已完成年度疫苗'),
              _buildHealthRecordItem('体重测量', '2024-01-10', '4.2kg'),
              _buildHealthRecordItem('驱虫', '2024-01-05', '体内外驱虫完成'),
            ],
          ),
          const SizedBox(height: AppTheme.spacingM),
          _buildActionButton(
            '查看全部记录',
            Icons.list,
            widget.pet.color,
            () => _viewAllRecords(),
          ),
        ],
      ),
    );
  }

  Widget _buildGrowthTrackTab() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(AppTheme.spacingM),
      child: Column(
        children: [
          _buildInfoCard(
            title: '成长里程碑',
            icon: Icons.trending_up,
            children: [
              _buildMilestoneItem(
                '2024-01-15',
                '体重达到4.2kg',
                Icons.monitor_weight,
              ),
              _buildMilestoneItem('2024-01-10', '完成年度疫苗', Icons.vaccines),
              _buildMilestoneItem('2024-01-05', '第一次洗澡', Icons.shower),
            ],
          ),
          const SizedBox(height: AppTheme.spacingM),
          _buildActionButton(
            '添加里程碑',
            Icons.add,
            widget.pet.color,
            () => _addMilestone(),
          ),
        ],
      ),
    );
  }

  Widget _buildPhotoAlbumTab() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(AppTheme.spacingM),
      child: Column(
        children: [
          _buildInfoCard(
            title: '相册',
            icon: Icons.photo_library,
            children: [
              Container(
                height: 200,
                decoration: BoxDecoration(
                  color: widget.pet.color.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(
                    AppTheme.borderRadiusMedium,
                  ),
                ),
                child: const Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.photo_library_outlined,
                        size: 48,
                        color: Colors.grey,
                      ),
                      SizedBox(height: 8),
                      Text('暂无照片', style: TextStyle(color: Colors.grey)),
                    ],
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: AppTheme.spacingM),
          _buildActionButton(
            '添加照片',
            Icons.add_a_photo,
            widget.pet.color,
            () => _addPhoto(),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoCard({
    required String title,
    required IconData icon,
    required List<Widget> children,
  }) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(AppTheme.spacingM),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(AppTheme.borderRadiusMedium),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.06),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: widget.pet.color.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(icon, color: widget.pet.color, size: 20),
              ),
              const SizedBox(width: 12),
              Text(
                title,
                style: const TextStyle(
                  fontSize: AppTheme.fontSizeL,
                  fontWeight: FontWeight.bold,
                  color: AppTheme.textPrimaryColor,
                ),
              ),
            ],
          ),
          const SizedBox(height: AppTheme.spacingM),
          ...children,
        ],
      ),
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          SizedBox(
            width: 80,
            child: Text(
              label,
              style: TextStyle(
                color: AppTheme.textSecondaryColor,
                fontSize: AppTheme.fontSizeS,
              ),
            ),
          ),
          Expanded(
            child: Text(
              value,
              style: const TextStyle(
                color: AppTheme.textPrimaryColor,
                fontSize: AppTheme.fontSizeS,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHealthStatusItem(
    String label,
    String status,
    Color statusColor,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          Expanded(
            child: Text(
              label,
              style: TextStyle(
                color: AppTheme.textSecondaryColor,
                fontSize: AppTheme.fontSizeS,
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              color: statusColor.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: statusColor.withValues(alpha: 0.3)),
            ),
            child: Text(
              status,
              style: TextStyle(
                color: statusColor,
                fontSize: AppTheme.fontSizeXS,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHealthRecordItem(String title, String date, String description) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          Container(
            width: 8,
            height: 8,
            decoration: BoxDecoration(
              color: widget.pet.color,
              shape: BoxShape.circle,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    color: AppTheme.textPrimaryColor,
                    fontSize: AppTheme.fontSizeS,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  description,
                  style: TextStyle(
                    color: AppTheme.textSecondaryColor,
                    fontSize: AppTheme.fontSizeXS,
                  ),
                ),
              ],
            ),
          ),
          Text(
            date,
            style: TextStyle(
              color: AppTheme.textSecondaryColor.withValues(alpha: 0.7),
              fontSize: AppTheme.fontSizeXS,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMilestoneItem(String date, String description, IconData icon) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: widget.pet.color.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(icon, color: widget.pet.color, size: 20),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  description,
                  style: const TextStyle(
                    color: AppTheme.textPrimaryColor,
                    fontSize: AppTheme.fontSizeS,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  date,
                  style: TextStyle(
                    color: AppTheme.textSecondaryColor,
                    fontSize: AppTheme.fontSizeXS,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildActionButton(
    String label,
    IconData icon,
    Color color,
    VoidCallback onTap,
  ) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(AppTheme.borderRadiusMedium),
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(vertical: 12),
          decoration: BoxDecoration(
            color: color.withValues(alpha: 0.08),
            borderRadius: BorderRadius.circular(AppTheme.borderRadiusMedium),
            border: Border.all(color: color.withValues(alpha: 0.2)),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, color: color, size: 20),
              const SizedBox(width: 8),
              Text(
                label,
                style: TextStyle(
                  color: color,
                  fontSize: AppTheme.fontSizeS,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  String _calculateAge(DateTime birthDate) {
    final now = DateTime.now();
    final age = now.difference(birthDate).inDays;
    if (age < 30) {
      return '${age}天';
    } else if (age < 365) {
      return '${(age / 30).floor()}个月';
    } else {
      return '${(age / 365).floor()}岁';
    }
  }

  // 操作方法
  void _editPet() async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => PetManagementPage(pet: widget.pet),
      ),
    );

    if (result != null && result is models.Pet) {
      // 宠物信息被更新，可以刷新页面或返回上一页
      Navigator.pop(context, result);
    } else if (result == 'deleted') {
      // 宠物被删除，返回上一页
      Navigator.pop(context, 'deleted');
    }
  }

  void _showMoreOptions() {
    showModalBottomSheet(
      context: context,
      builder: (context) => _buildMoreOptionsSheet(),
    );
  }

  void _viewAllRecords() {
    // TODO: 导航到健康记录页面
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(const SnackBar(content: Text('查看全部记录功能开发中...')));
  }

  void _addMilestone() {
    // TODO: 实现添加里程碑
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(const SnackBar(content: Text('添加里程碑功能开发中...')));
  }

  void _addPhoto() {
    // TODO: 实现添加照片
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(const SnackBar(content: Text('添加照片功能开发中...')));
  }

  void _copyIdentityCode(String code) async {
    await Clipboard.setData(ClipboardData(text: code));
    if (mounted) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('已复制身份码')));
    }
  }

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

  Widget _buildMoreOptionsSheet() {
    return Container(
      padding: const EdgeInsets.all(AppTheme.spacingL),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
            leading: Icon(Icons.share, color: widget.pet.color),
            title: const Text('分享宠物档案'),
            onTap: () {
              Navigator.pop(context);
              // TODO: 实现分享功能
            },
          ),
          ListTile(
            leading: Icon(Icons.print, color: widget.pet.color),
            title: const Text('打印档案'),
            onTap: () {
              Navigator.pop(context);
              // TODO: 实现打印功能
            },
          ),
          ListTile(
            leading: Icon(Icons.delete_outline, color: AppTheme.errorColor),
            title: const Text('删除宠物档案'),
            onTap: () {
              Navigator.pop(context);
              _showDeleteConfirmation();
            },
          ),
        ],
      ),
    );
  }

  void _showDeleteConfirmation() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('确认删除'),
        content: Text('确定要删除 ${widget.pet.name} 的档案吗？此操作不可恢复。'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('取消'),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              Navigator.pop(context);
              // TODO: 实现删除逻辑
            },
            style: TextButton.styleFrom(foregroundColor: AppTheme.errorColor),
            child: const Text('删除'),
          ),
        ],
      ),
    );
  }
}
