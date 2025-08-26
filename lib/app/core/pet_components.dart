import 'package:flutter/material.dart';
import 'dart:convert';
import '../theme/app_theme.dart';
import 'models.dart' as models;
import 'package:flutter/services.dart';
import 'package:qr_flutter/qr_flutter.dart';

/// 通用头像渲染组件：支持表情字符与 data URL 图片
class PetAvatar extends StatelessWidget {
  final String avatar;
  final double size;
  final Color? brokenIconColor;

  const PetAvatar({
    super.key,
    required this.avatar,
    this.size = 24,
    this.brokenIconColor,
  });

  @override
  Widget build(BuildContext context) {
    if (avatar.startsWith('data:image')) {
      try {
        final parts = avatar.split(',');
        final base64Str = parts.length > 1 ? parts[1] : parts.first;
        final bytes = base64Decode(base64Str);
        return ClipOval(
          child: Image.memory(
            bytes,
            width: size,
            height: size,
            fit: BoxFit.cover,
          ),
        );
      } catch (_) {
        return Icon(
          Icons.broken_image,
          size: size * 0.9,
          color: brokenIconColor ?? Colors.grey,
        );
      }
    }
    if (avatar.startsWith('http://') || avatar.startsWith('https://')) {
      return ClipOval(
        child: Image.network(
          avatar,
          width: size,
          height: size,
          fit: BoxFit.cover,
          errorBuilder: (context, error, stackTrace) => Icon(
            Icons.broken_image,
            size: size * 0.9,
            color: brokenIconColor ?? Colors.grey,
          ),
        ),
      );
    }
    return Text(avatar, style: TextStyle(fontSize: size));
  }
}

/// 宠物选择器组件 - 单宠家庭优化版本
class PetSelector extends StatelessWidget {
  final List<models.Pet> pets;
  final String selectedPetId;
  final ValueChanged<String> onPetSelected;
  final VoidCallback? onAddPet;
  final bool showAddButton;

  const PetSelector({
    super.key,
    required this.pets,
    required this.selectedPetId,
    required this.onPetSelected,
    this.onAddPet,
    this.showAddButton = true,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(AppTheme.spacingM),
      decoration: BoxDecoration(
        color: AppTheme.surfaceColor,
        borderRadius: BorderRadius.circular(AppTheme.borderRadiusLarge),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.08),
            blurRadius: 20,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(AppTheme.spacingL),
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: AppTheme.primaryColor.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Icon(
                    Icons.pets,
                    color: AppTheme.primaryColor,
                    size: 20,
                  ),
                ),
                const SizedBox(width: 12),
                Text(
                  pets.length > 1 ? '我的宠物' : '我的宠物',
                  style: const TextStyle(
                    fontSize: AppTheme.fontSizeL,
                    fontWeight: FontWeight.bold,
                    color: AppTheme.textPrimaryColor,
                  ),
                ),
                const Spacer(),
                if (showAddButton && onAddPet != null) _buildAddPetButton(),
              ],
            ),
            const SizedBox(height: AppTheme.spacingL),
            if (pets.isEmpty)
              _buildEmptyState()
            else if (pets.length == 1)
              _buildSinglePetView(pets.first)
            else
              _buildMultiPetSelector(),
          ],
        ),
      ),
    );
  }

  Widget _buildAddPetButton() {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            AppTheme.primaryColor,
            AppTheme.primaryColor.withValues(alpha: 0.8),
          ],
        ),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: AppTheme.primaryColor.withValues(alpha: 0.3),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onAddPet,
          borderRadius: BorderRadius.circular(20),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: const Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.add, color: Colors.white, size: 18),
                SizedBox(width: 6),
                Text(
                  '添加宠物',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: AppTheme.fontSizeS,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildEmptyState() {
    return Container(
      padding: const EdgeInsets.all(AppTheme.spacingXL),
      child: Column(
        children: [
          Icon(
            Icons.pets_outlined,
            size: 48,
            color: AppTheme.textSecondaryColor.withValues(alpha: 0.5),
          ),
          const SizedBox(height: AppTheme.spacingM),
          Text(
            '还没有添加宠物',
            style: TextStyle(
              color: AppTheme.textSecondaryColor,
              fontSize: AppTheme.fontSizeM,
            ),
          ),
          const SizedBox(height: AppTheme.spacingS),
          Text(
            '点击上方按钮添加你的第一个宠物',
            style: TextStyle(
              color: AppTheme.textSecondaryColor.withValues(alpha: 0.7),
              fontSize: AppTheme.fontSizeS,
            ),
          ),
        ],
      ),
    );
  }

  // 单宠物展示 - 针对单宠家庭优化
  Widget _buildSinglePetView(models.Pet pet) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            pet.color.withValues(alpha: 0.08),
            pet.color.withValues(alpha: 0.04),
          ],
        ),
        borderRadius: BorderRadius.circular(AppTheme.borderRadiusLarge),
        border: Border.all(color: pet.color.withValues(alpha: 0.15)),
      ),
      child: Padding(
        padding: const EdgeInsets.all(AppTheme.spacingM), // 减少内边距
        child: Row(
          children: [
            // 宠物头像
            Container(
              padding: const EdgeInsets.all(12), // 减少头像内边距
              decoration: BoxDecoration(
                color: pet.color.withValues(alpha: 0.15),
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: pet.color.withValues(alpha: 0.2),
                    blurRadius: 8, // 减少阴影
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: PetAvatar(
                avatar: pet.avatar,
                size: 24,
                brokenIconColor: pet.color,
              ),
            ),
            const SizedBox(width: AppTheme.spacingM), // 减少间距
            // 宠物信息
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min, // 添加这个属性
                children: [
                  Text(
                    pet.name,
                    style: const TextStyle(
                      fontSize: AppTheme.fontSizeL, // 减少字体大小
                      fontWeight: FontWeight.bold,
                      color: AppTheme.textPrimaryColor,
                    ),
                  ),
                  const SizedBox(height: 6), // 减少间距
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 4,
                    ), // 减少标签内边距
                    decoration: BoxDecoration(
                      color: pet.color.withValues(alpha: 0.15),
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(
                        color: pet.color.withValues(alpha: 0.3),
                      ),
                    ),
                    child: Text(
                      pet.breed,
                      style: TextStyle(
                        color: pet.color,
                        fontSize: AppTheme.fontSizeXS, // 减少字体大小
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  const SizedBox(height: 8), // 减少间距
                  Row(
                    children: [
                      Flexible(
                        // 添加Flexible包装
                        child: _buildInfoChip(
                          icon: Icons.cake,
                          label:
                              '${pet.birthDate.year}-${pet.birthDate.month.toString().padLeft(2, '0')}',
                          color: pet.color,
                        ),
                      ),
                      const SizedBox(width: AppTheme.spacingS), // 减少间距
                      Flexible(
                        // 添加Flexible包装
                        child: _buildInfoChip(
                          icon: Icons.monitor_weight,
                          label: '${pet.weight}kg',
                          color: pet.color,
                        ),
                      ),
                      const SizedBox(width: AppTheme.spacingS), // 减少间距
                      Flexible(
                        // 添加Flexible包装
                        child: _buildInfoChip(
                          icon: Icons.wc,
                          label: pet.gender,
                          color: pet.color,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            // 操作按钮
            Column(
              mainAxisSize: MainAxisSize.min, // 添加这个属性
              children: [
                IconButton(
                  onPressed: () => onPetSelected(pet.id),
                  icon: Container(
                    padding: const EdgeInsets.all(6), // 减少按钮内边距
                    decoration: BoxDecoration(
                      color: pet.color.withValues(alpha: 0.15),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.edit_outlined,
                      color: pet.color,
                      size: 18, // 减少图标大小
                    ),
                  ),
                  tooltip: '编辑宠物信息',
                  padding: EdgeInsets.zero, // 减少按钮内边距
                  constraints: const BoxConstraints(
                    minWidth: 32,
                    minHeight: 32,
                  ), // 减少按钮大小
                ),
                const SizedBox(height: 4), // 减少间距
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 6,
                    vertical: 2,
                  ), // 减少标签内边距
                  decoration: BoxDecoration(
                    color: pet.color,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Text(
                    '当前宠物',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: AppTheme.fontSizeXS,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // 多宠物选择器 - 保留原有功能
  Widget _buildMultiPetSelector() {
    return Column(
      children: [
        Text(
          '选择要查看的宠物',
          style: TextStyle(
            color: AppTheme.textSecondaryColor,
            fontSize: AppTheme.fontSizeS,
          ),
        ),
        const SizedBox(height: AppTheme.spacingS),
        SizedBox(
          height: 100,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: pets.length,
            itemBuilder: (context, index) {
              final pet = pets[index];
              final isSelected = pet.id == selectedPetId;

              return GestureDetector(
                onTap: () => onPetSelected(pet.id),
                child: Container(
                  width: 80,
                  margin: const EdgeInsets.only(right: AppTheme.spacingM),
                  decoration: BoxDecoration(
                    color: isSelected
                        ? pet.color.withValues(alpha: 0.1)
                        : AppTheme.backgroundColor,
                    borderRadius: BorderRadius.circular(
                      AppTheme.borderRadiusMedium,
                    ),
                    border: Border.all(
                      color: isSelected ? pet.color : AppTheme.dividerColor,
                      width: isSelected ? 2 : 1,
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      PetAvatar(
                        avatar: pet.avatar,
                        size: 24,
                        brokenIconColor: pet.color,
                      ),
                      const SizedBox(height: 4),
                      Text(
                        pet.name,
                        style: TextStyle(
                          fontSize: AppTheme.fontSizeS,
                          fontWeight: FontWeight.w600,
                          color: isSelected
                              ? pet.color
                              : AppTheme.textPrimaryColor,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildInfoChip({
    required IconData icon,
    required String label,
    required Color color,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.08),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: color.withValues(alpha: 0.2)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 14, color: color),
          const SizedBox(width: 4),
          Flexible(
            // 添加Flexible包装
            child: Text(
              label,
              style: TextStyle(
                color: color,
                fontSize: AppTheme.fontSizeXS,
                fontWeight: FontWeight.w600,
              ),
              overflow: TextOverflow.ellipsis, // 添加文本溢出处理
            ),
          ),
        ],
      ),
    );
  }
}

/// 身份码条组件
class IdentityCodeBar extends StatelessWidget {
  final String identityCode;
  final bool showCopyButton;
  final bool showQrButton;

  const IdentityCodeBar({
    super.key,
    required this.identityCode,
    this.showCopyButton = true,
    this.showQrButton = true,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: AppTheme.dividerColor),
        boxShadow: AppTheme.cardShadow,
      ),
      child: Row(
        children: [
          const Icon(Icons.qr_code_2, size: 18, color: Colors.grey),
          const SizedBox(width: 8),
          Expanded(
            child: SelectableText(
              identityCode,
              style: const TextStyle(
                fontWeight: FontWeight.w700,
                letterSpacing: 0.5,
              ),
            ),
          ),
          if (showCopyButton)
            IconButton(
              tooltip: '复制',
              icon: const Icon(Icons.copy, size: 18, color: Colors.grey),
              onPressed: () async {
                await Clipboard.setData(ClipboardData(text: identityCode));
                if (context.mounted) {
                  ScaffoldMessenger.of(
                    context,
                  ).showSnackBar(const SnackBar(content: Text('已复制身份码')));
                }
              },
            ),
          if (showQrButton)
            IconButton(
              tooltip: '二维码',
              icon: const Icon(Icons.qr_code, size: 18, color: Colors.grey),
              onPressed: () => _showIdentityQrDialog(context, identityCode),
            ),
        ],
      ),
    );
  }

  void _showIdentityQrDialog(BuildContext context, String code) {
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

/// 宠物信息头部组件 - 优化版本
class PetInfoHeader extends StatelessWidget {
  final models.Pet pet;
  final VoidCallback? onCopyIdentity;
  final VoidCallback? onShowQr;
  final VoidCallback? onEditPet;

  const PetInfoHeader({
    super.key,
    required this.pet,
    this.onCopyIdentity,
    this.onShowQr,
    this.onEditPet,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.zero,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            pet.color.withValues(alpha: 0.05),
            pet.color.withValues(alpha: 0.02),
          ],
        ),
        borderRadius: BorderRadius.circular(AppTheme.borderRadiusLarge),
        border: Border.all(color: pet.color.withValues(alpha: 0.1)),
        boxShadow: [
          BoxShadow(
            color: pet.color.withValues(alpha: 0.1),
            blurRadius: 20,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(AppTheme.spacingL),
        child: Column(
          children: [
            // 头部信息行
            Row(
              children: [
                // 宠物头像
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: pet.color.withValues(alpha: 0.15),
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: pet.color.withValues(alpha: 0.2),
                        blurRadius: 12,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: PetAvatar(
                    avatar: pet.avatar,
                    size: 36,
                    brokenIconColor: pet.color,
                  ),
                ),
                const SizedBox(width: AppTheme.spacingL),

                // 宠物基本信息
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              pet.name,
                              style: const TextStyle(
                                fontSize: AppTheme.fontSizeXL,
                                fontWeight: FontWeight.bold,
                                color: AppTheme.textPrimaryColor,
                              ),
                            ),
                          ),
                          if (onEditPet != null)
                            IconButton(
                              onPressed: onEditPet,
                              icon: Icon(
                                Icons.edit_outlined,
                                color: pet.color,
                                size: 20,
                              ),
                              tooltip: '编辑宠物信息',
                            ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      _buildBreedTag(),
                      const SizedBox(height: 12),
                      _buildBasicInfoRow(),
                    ],
                  ),
                ),
              ],
            ),

            const SizedBox(height: AppTheme.spacingL),

            // 身份码区域
            _buildIdentitySection(),
          ],
        ),
      ),
    );
  }

  Widget _buildBreedTag() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: pet.color.withValues(alpha: 0.15),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: pet.color.withValues(alpha: 0.3)),
      ),
      child: Text(
        pet.breed,
        style: TextStyle(
          color: pet.color,
          fontSize: AppTheme.fontSizeS,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  Widget _buildBasicInfoRow() {
    return Wrap(
      spacing: AppTheme.spacingL,
      runSpacing: AppTheme.spacingS,
      children: [
        _buildInfoItem(
          icon: Icons.cake,
          label: '生日',
          value:
              '${pet.birthDate.year}-${pet.birthDate.month.toString().padLeft(2, '0')}-${pet.birthDate.day.toString().padLeft(2, '0')}',
        ),
        _buildInfoItem(
          icon: Icons.monitor_weight,
          label: '体重',
          value: '${pet.weight}kg',
        ),
        _buildInfoItem(icon: Icons.wc, label: '性别', value: pet.gender),
      ],
    );
  }

  Widget _buildInfoItem({
    required IconData icon,
    required String label,
    required String value,
  }) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, size: 16, color: AppTheme.textSecondaryColor),
        const SizedBox(width: 6),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              label,
              style: TextStyle(
                color: AppTheme.textSecondaryColor.withValues(alpha: 0.7),
                fontSize: AppTheme.fontSizeXS,
              ),
            ),
            Text(
              value,
              style: const TextStyle(
                color: AppTheme.textPrimaryColor,
                fontSize: AppTheme.fontSizeS,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildIdentitySection() {
    return Container(
      padding: const EdgeInsets.all(AppTheme.spacingM),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(AppTheme.borderRadiusMedium),
        border: Border.all(color: AppTheme.dividerColor),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(6),
                decoration: BoxDecoration(
                  color: pet.color.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(Icons.qr_code_2, size: 16, color: pet.color),
              ),
              const SizedBox(width: 8),
              const Text(
                '宠物身份码',
                style: TextStyle(
                  fontSize: AppTheme.fontSizeS,
                  fontWeight: FontWeight.w600,
                  color: AppTheme.textPrimaryColor,
                ),
              ),
              const Spacer(),
              Flexible(
                // 添加Flexible包装
                child: Text(
                  pet.identityCode,
                  style: TextStyle(
                    fontSize: AppTheme.fontSizeS,
                    fontWeight: FontWeight.w700,
                    color: pet.color,
                    letterSpacing: 0.5,
                  ),
                  overflow: TextOverflow.ellipsis, // 添加文本溢出处理
                ),
              ),
            ],
          ),
          const SizedBox(height: AppTheme.spacingM),
          Row(
            children: [
              Expanded(
                child: _buildActionButton(
                  icon: Icons.copy,
                  label: '复制',
                  onTap: onCopyIdentity,
                  color: AppTheme.primaryColor,
                ),
              ),
              const SizedBox(width: AppTheme.spacingM),
              Expanded(
                child: _buildActionButton(
                  icon: Icons.qr_code,
                  label: '二维码',
                  onTap: onShowQr,
                  color: AppTheme.secondaryColor,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildActionButton({
    required IconData icon,
    required String label,
    required VoidCallback? onTap,
    required Color color,
  }) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(AppTheme.borderRadiusMedium),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 10),
          decoration: BoxDecoration(
            color: color.withValues(alpha: 0.08),
            borderRadius: BorderRadius.circular(AppTheme.borderRadiusMedium),
            border: Border.all(color: color.withValues(alpha: 0.2)),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, color: color, size: 18),
              const SizedBox(width: 6),
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
}

/// 健康记录快捷入口组件 - 单宠家庭优化版本
class HealthQuickAccess extends StatelessWidget {
  final models.Pet pet;
  final Function(models.HealthRecordType)? onViewRecords;
  final VoidCallback? onAddRecord;
  final Map<String, int>? recordCounts;

  const HealthQuickAccess({
    super.key,
    required this.pet,
    this.onViewRecords,
    this.onAddRecord,
    this.recordCounts,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.zero,
      decoration: BoxDecoration(
        color: AppTheme.getSurfaceColor(context),
        borderRadius: BorderRadius.circular(AppTheme.borderRadiusLarge),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.06),
            blurRadius: 16,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(AppTheme.spacingL),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: AppTheme.primaryColor.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Icon(
                    Icons.health_and_safety,
                    color: AppTheme.primaryColor,
                    size: 20,
                  ),
                ),
                const SizedBox(width: 12),
                const Text(
                  '健康管理',
                  style: TextStyle(
                    fontSize: AppTheme.fontSizeL,
                    fontWeight: FontWeight.bold,
                    color: AppTheme.textPrimaryColor,
                  ),
                ),
                const Spacer(),
                if (onAddRecord != null) _buildAddRecordButton(),
              ],
            ),
            const SizedBox(height: AppTheme.spacingL),

            // 健康状态概览
            _buildHealthOverview(context),
            const SizedBox(height: AppTheme.spacingL),

            // 快捷功能入口
            _buildQuickAccessGrid(context),
          ],
        ),
      ),
    );
  }

  Widget _buildAddRecordButton() {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            AppTheme.successColor,
            AppTheme.successColor.withValues(alpha: 0.8),
          ],
        ),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: AppTheme.successColor.withValues(alpha: 0.3),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onAddRecord,
          borderRadius: BorderRadius.circular(20),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: const Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.add, color: Colors.white, size: 18),
                SizedBox(width: 6),
                Text(
                  '新增记录',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: AppTheme.fontSizeS,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // 健康状态概览 - 单宠家庭重点展示
  Widget _buildHealthOverview(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppTheme.spacingS), // 减少内边距
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            pet.color.withValues(alpha: 0.08),
            pet.color.withValues(alpha: 0.04),
          ],
        ),
        borderRadius: BorderRadius.circular(AppTheme.borderRadiusMedium),
        border: Border.all(color: pet.color.withValues(alpha: 0.15)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min, // 添加这个属性
        children: [
          Row(
            children: [
              Icon(
                Icons.info_outline,
                color: pet.color,
                size: 16, // 减少图标大小
              ),
              const SizedBox(width: 6), // 减少间距
              Flexible(
                // 添加Flexible包装
                child: Text(
                  '${pet.name}的健康状态',
                  style: TextStyle(
                    color: pet.color,
                    fontSize: AppTheme.fontSizeXS, // 减少字体大小
                    fontWeight: FontWeight.w600,
                  ),
                  overflow: TextOverflow.ellipsis, // 添加文本溢出处理
                ),
              ),
            ],
          ),
          const SizedBox(height: AppTheme.spacingS), // 减少间距
          Row(
            children: [
              Expanded(
                child: _buildHealthStatusCard(
                  context,
                  icon: Icons.vaccines,
                  label: '疫苗',
                  status: '已完成',
                  color: Colors.green,
                  count: recordCounts?['vaccination'] ?? 0,
                ),
              ),
              const SizedBox(width: AppTheme.spacingS), // 减少间距
              Expanded(
                child: _buildHealthStatusCard(
                  context,
                  icon: Icons.monitor_weight,
                  label: '体重',
                  status: '正常',
                  color: Colors.blue,
                  count: recordCounts?['weight'] ?? 0,
                ),
              ),
              const SizedBox(width: AppTheme.spacingS), // 减少间距
              Expanded(
                child: _buildHealthStatusCard(
                  context,
                  icon: Icons.medical_services,
                  label: '体检',
                  status: '建议',
                  color: Colors.orange,
                  count: recordCounts?['vetVisit'] ?? 0,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildHealthStatusCard(
    BuildContext context, {
    required IconData icon,
    required String label,
    required String status,
    required Color color,
    required int count,
  }) {
    return Container(
      padding: const EdgeInsets.all(AppTheme.spacingXS),
      decoration: BoxDecoration(
        color: AppTheme.getSurfaceColor(context),
        borderRadius: BorderRadius.circular(AppTheme.borderRadiusSmall),
        border: Border.all(color: color.withValues(alpha: 0.2)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(icon, color: color, size: 14),
          const SizedBox(height: 4),
          Flexible(
            child: Text(
              label,
              style: TextStyle(
                color: AppTheme.textSecondaryColor,
                fontSize: AppTheme.fontSizeXS,
              ),
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          const SizedBox(height: 2),
          Flexible(
            child: Text(
              status,
              style: TextStyle(
                color: color,
                fontSize: AppTheme.fontSizeXS,
                fontWeight: FontWeight.w600,
              ),
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          if (count > 0)
            Flexible(
              child: Text(
                '${count}条记录',
                style: TextStyle(
                  color: color.withValues(alpha: 0.7),
                  fontSize: AppTheme.fontSizeXS,
                ),
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildQuickAccessGrid(BuildContext context) {
    final quickActions = [
      QuickAction(
        icon: Icons.vaccines,
        label: '疫苗记录',
        color: AppTheme.primaryColor,
        count: recordCounts?['vaccination'] ?? 0,
        onTap: () => onViewRecords?.call(models.HealthRecordType.vaccination),
      ),
      QuickAction(
        icon: Icons.monitor_weight,
        label: '体重记录',
        color: AppTheme.secondaryColor,
        count: recordCounts?['weight'] ?? 0,
        onTap: () => onViewRecords?.call(models.HealthRecordType.weight),
      ),
      QuickAction(
        icon: Icons.medical_services,
        label: '就诊记录',
        color: AppTheme.warningColor,
        count: recordCounts?['vetVisit'] ?? 0,
        onTap: () => onViewRecords?.call(models.HealthRecordType.vetVisit),
      ),
      QuickAction(
        icon: Icons.medication,
        label: '用药记录',
        color: AppTheme.errorColor,
        count: recordCounts?['medication'] ?? 0,
        onTap: () => onViewRecords?.call(models.HealthRecordType.medication),
      ),
      QuickAction(
        icon: Icons.bug_report,
        label: '驱虫记录',
        color: AppTheme.secondaryColor,
        count: recordCounts?['deworming'] ?? 0,
        onTap: () => onViewRecords?.call(models.HealthRecordType.deworming),
      ),
      QuickAction(
        icon: Icons.content_cut,
        label: '美容记录',
        color: AppTheme.successColor,
        count: recordCounts?['grooming'] ?? 0,
        onTap: () => onViewRecords?.call(models.HealthRecordType.grooming),
      ),
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '快捷功能',
          style: TextStyle(
            color: AppTheme.textSecondaryColor,
            fontSize: AppTheme.fontSizeS,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: AppTheme.spacingM),
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: MediaQuery.of(context).size.width < 300 ? 1 : 2,
            crossAxisSpacing: AppTheme.spacingM,
            mainAxisSpacing: AppTheme.spacingM,
            childAspectRatio: 2.5,
          ),
          itemCount: quickActions.length,
          itemBuilder: (context, index) {
            final action = quickActions[index];
            return _buildQuickActionCard(action);
          },
        ),
      ],
    );
  }

  Widget _buildQuickActionCard(QuickAction action) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: action.onTap,
        borderRadius: BorderRadius.circular(AppTheme.borderRadiusMedium),
        child: Container(
          padding: const EdgeInsets.all(AppTheme.spacingS),
          decoration: BoxDecoration(
            color: action.color.withValues(alpha: 0.08),
            borderRadius: BorderRadius.circular(AppTheme.borderRadiusMedium),
            border: Border.all(color: action.color.withValues(alpha: 0.2)),
          ),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(6),
                decoration: BoxDecoration(
                  color: action.color.withValues(alpha: 0.15),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(action.icon, color: action.color, size: 16),
              ),
              const SizedBox(width: AppTheme.spacingS),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      action.label,
                      style: TextStyle(
                        color: action.color,
                        fontWeight: FontWeight.w600,
                        fontSize: AppTheme.fontSizeXS,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    if (action.count > 0)
                      Text(
                        '${action.count} 条记录',
                        style: TextStyle(
                          color: action.color.withValues(alpha: 0.7),
                          fontSize: AppTheme.fontSizeXS,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                  ],
                ),
              ),
              Icon(
                Icons.arrow_forward_ios,
                color: action.color.withValues(alpha: 0.5),
                size: 16,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// 快捷操作数据模型
class QuickAction {
  final IconData icon;
  final String label;
  final Color color;
  final int count;
  final VoidCallback? onTap;

  const QuickAction({
    required this.icon,
    required this.label,
    required this.color,
    this.count = 0,
    this.onTap,
  });
}
