import 'package:flutter/material.dart';
import '../../../theme/app_theme.dart';
import '../buttons/app_button.dart';
import '../lists/place_list_item.dart';

class PlaceDetailModal extends StatelessWidget {
  final Place place;
  final VoidCallback? onNavigate;
  final VoidCallback? onCall;

  const PlaceDetailModal({
    super.key,
    required this.place,
    this.onNavigate,
    this.onCall,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
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
                  _buildInfoRow('地址', place.address, Icons.location_on),
                  _buildInfoRow('距离', place.distance, Icons.directions_walk),
                  _buildInfoRow('评分', '${place.rating} (${place.reviewCount}条评价)', Icons.star),
                  _buildInfoRow('营业状态', place.isOpen ? '营业中' : '已关闭', 
                      place.isOpen ? Icons.check_circle : Icons.cancel, showDivider: false),
                  
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
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: AppTheme.spacingS,
                            vertical: 4,
                          ),
                          decoration: BoxDecoration(
                            color: AppTheme.primaryLightColor,
                            borderRadius: BorderRadius.circular(AppTheme.borderRadiusSmall),
                          ),
                          child: Text(
                            feature,
                            style: TextStyle(
                              fontSize: AppTheme.fontSizeS,
                              color: AppTheme.primaryColor,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
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
                        child: AppButton(
                          text: '导航',
                          icon: Icons.directions,
                          onPressed: onNavigate,
                        ),
                      ),
                      const SizedBox(width: AppTheme.spacingM),
                      Expanded(
                        child: AppButton(
                          text: '电话',
                          icon: Icons.phone,
                          onPressed: onCall,
                          isOutlined: true,
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
    );
  }

  Widget _buildInfoRow(String label, String value, IconData icon, {bool showDivider = true}) {
    return Column(
      children: [
        Row(
          children: [
            Icon(icon, color: AppTheme.textSecondaryColor, size: 20),
            const SizedBox(width: AppTheme.spacingM),
            Expanded(
              child: Text(
                label,
                style: TextStyle(
                  fontSize: AppTheme.fontSizeM,
                  color: AppTheme.textSecondaryColor,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Text(
              value,
              style: TextStyle(
                fontSize: AppTheme.fontSizeM,
                color: AppTheme.textPrimaryColor,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
        if (showDivider) ...[
          const SizedBox(height: AppTheme.spacingM),
          Divider(color: AppTheme.dividerColor, height: 1),
          const SizedBox(height: AppTheme.spacingM),
        ],
      ],
    );
  }
}
