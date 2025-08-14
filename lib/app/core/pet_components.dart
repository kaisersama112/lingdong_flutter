import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import 'models.dart';
import 'package:flutter/services.dart';
import 'package:qr_flutter/qr_flutter.dart';

/// 宠物选择器组件
class PetSelector extends StatelessWidget {
  final List<Pet> pets;
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
        borderRadius: BorderRadius.circular(AppTheme.borderRadiusMedium),
        boxShadow: AppTheme.cardShadow,
      ),
      child: Padding(
        padding: const EdgeInsets.all(AppTheme.spacingM),
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  '选择宠物',
                  style: const TextStyle(
                    fontSize: AppTheme.fontSizeL,
                    fontWeight: FontWeight.bold,
                    color: AppTheme.textPrimaryColor,
                  ),
                ),
                const Spacer(),
                if (showAddButton && onAddPet != null)
                  IconButton(
                    icon: const Icon(Icons.add_circle_outline),
                    onPressed: onAddPet,
                    color: AppTheme.primaryColor,
                  ),
              ],
            ),
            const SizedBox(height: AppTheme.spacingM),
            SizedBox(
              height: 80,
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
                        color: isSelected ? pet.color.withValues(alpha: 0.1) : AppTheme.backgroundColor,
                        borderRadius: BorderRadius.circular(AppTheme.borderRadiusMedium),
                        border: Border.all(
                          color: isSelected ? pet.color : AppTheme.dividerColor,
                          width: isSelected ? 2 : 1,
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            pet.avatar,
                            style: const TextStyle(fontSize: 24),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            pet.name,
                            style: TextStyle(
                              fontSize: AppTheme.fontSizeS,
                              fontWeight: FontWeight.w600,
                              color: isSelected ? pet.color : AppTheme.textPrimaryColor,
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
        ),
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
              style: const TextStyle(fontWeight: FontWeight.w700, letterSpacing: 0.5),
            ),
          ),
          if (showCopyButton)
            IconButton(
              tooltip: '复制',
              icon: const Icon(Icons.copy, size: 18, color: Colors.grey),
              onPressed: () async {
                await Clipboard.setData(ClipboardData(text: identityCode));
                if (context.mounted) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('已复制身份码')),
                  );
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

/// 宠物信息头部组件
class PetInfoHeader extends StatelessWidget {
  final Pet pet;
  final VoidCallback? onCopyIdentity;
  final VoidCallback? onShowQr;

  const PetInfoHeader({
    super.key,
    required this.pet,
    this.onCopyIdentity,
    this.onShowQr,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: AppTheme.spacingM),
      padding: const EdgeInsets.all(AppTheme.spacingM),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(AppTheme.borderRadiusMedium),
        border: Border.all(color: AppTheme.dividerColor),
        boxShadow: AppTheme.cardShadow,
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: 24,
            backgroundColor: pet.color.withValues(alpha: 0.12),
            child: Text(pet.avatar, style: const TextStyle(fontSize: 22)),
          ),
          const SizedBox(width: AppTheme.spacingM),
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
                          fontWeight: FontWeight.w700,
                          color: AppTheme.textPrimaryColor,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        color: pet.color.withValues(alpha: 0.1),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        pet.breed,
                        style: TextStyle(
                          color: pet.color,
                          fontSize: AppTheme.fontSizeXS,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 6),
                Row(
                  children: [
                    Icon(Icons.cake, size: 14, color: AppTheme.textSecondaryColor),
                    const SizedBox(width: 4),
                    Text(
                      '${pet.birthDate.year}-${pet.birthDate.month}-${pet.birthDate.day}',
                      style: TextStyle(
                        color: AppTheme.textSecondaryColor,
                        fontSize: AppTheme.fontSizeS,
                      ),
                    ),
                    const SizedBox(width: 12),
                    Icon(Icons.monitor_weight, size: 14, color: AppTheme.textSecondaryColor),
                    const SizedBox(width: 4),
                    Text(
                      '${pet.weight}kg',
                      style: TextStyle(
                        color: AppTheme.textSecondaryColor,
                        fontSize: AppTheme.fontSizeS,
                      ),
                    ),
                    const SizedBox(width: 12),
                    Icon(Icons.qr_code_2, size: 14, color: AppTheme.textSecondaryColor),
                    const SizedBox(width: 4),
                    Flexible(
                      child: Text(
                        pet.identityCode,
                        style: TextStyle(
                          color: AppTheme.textSecondaryColor,
                          fontSize: AppTheme.fontSizeS,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    if (onCopyIdentity != null)
                      IconButton(
                        padding: EdgeInsets.zero,
                        constraints: const BoxConstraints(minWidth: 24, minHeight: 24),
                        icon: const Icon(Icons.copy, size: 16, color: Colors.grey),
                        onPressed: onCopyIdentity,
                      ),
                    if (onShowQr != null)
                      IconButton(
                        padding: EdgeInsets.zero,
                        constraints: const BoxConstraints(minWidth: 24, minHeight: 24),
                        icon: const Icon(Icons.qr_code, size: 16, color: Colors.grey),
                        onPressed: onShowQr,
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
}

/// 健康记录快捷入口组件
class HealthQuickAccess extends StatelessWidget {
  final Pet pet;
  final VoidCallback? onViewRecords;
  final VoidCallback? onAddRecord;

  const HealthQuickAccess({
    super.key,
    required this.pet,
    this.onViewRecords,
    this.onAddRecord,
  });

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: AppTheme.spacingM,
      runSpacing: AppTheme.spacingM,
      children: [
        _buildQuickChip(
          icon: Icons.vaccines,
          label: '疫苗记录',
          color: AppTheme.primaryColor,
          onTap: () => onViewRecords?.call(),
        ),
        _buildQuickChip(
          icon: Icons.monitor_weight,
          label: '体重记录',
          color: AppTheme.secondaryColor,
          onTap: () => onViewRecords?.call(),
        ),
        _buildQuickChip(
          icon: Icons.medical_services,
          label: '就诊记录',
          color: AppTheme.warningColor,
          onTap: () => onViewRecords?.call(),
        ),
        _buildQuickChip(
          icon: Icons.library_add,
          label: '新增记录',
          color: AppTheme.successColor,
          onTap: () => onAddRecord?.call(),
        ),
      ],
    );
  }

  Widget _buildQuickChip({
    required IconData icon,
    required String label,
    required Color color,
    required VoidCallback? onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(24),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
        decoration: BoxDecoration(
          color: color.withValues(alpha: 0.08),
          borderRadius: BorderRadius.circular(24),
          border: Border.all(color: color.withValues(alpha: 0.25)),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, color: color, size: 18),
            const SizedBox(width: 6),
            Text(
              label,
              style: TextStyle(
                color: color,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
