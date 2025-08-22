import 'package:flutter/material.dart';
import '../../../theme/app_theme.dart';
import '../cards/info_card.dart';

class PlaceListItem extends StatelessWidget {
  final Place place;
  final VoidCallback? onTap;

  const PlaceListItem({super.key, required this.place, this.onTap});

  @override
  Widget build(BuildContext context) {
    return InfoCard(
      onTap: onTap,
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
                  borderRadius: BorderRadius.circular(
                    AppTheme.borderRadiusMedium,
                  ),
                ),
                child: Center(
                  child: Text(
                    place.image,
                    style: const TextStyle(fontSize: 24),
                  ),
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
                            color: place.isOpen
                                ? AppTheme.successLightColor
                                : AppTheme.errorLightColor,
                            borderRadius: BorderRadius.circular(
                              AppTheme.borderRadiusSmall,
                            ),
                          ),
                          child: Text(
                            place.isOpen ? '营业中' : '已关闭',
                            style: TextStyle(
                              fontSize: AppTheme.fontSizeS,
                              color: place.isOpen
                                  ? AppTheme.successColor
                                  : AppTheme.errorColor,
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
              children: place.features
                  .take(3)
                  .map(
                    (feature) => Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: AppTheme.spacingS,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: AppTheme.primaryLightColor,
                        borderRadius: BorderRadius.circular(
                          AppTheme.borderRadiusSmall,
                        ),
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
                  )
                  .toList(),
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
