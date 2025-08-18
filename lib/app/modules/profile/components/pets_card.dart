import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../../theme/app_theme.dart';
import '../../../core/components.dart';
import '../../../core/models.dart';
import '../../../core/pet_components.dart';

class PetsCard extends StatelessWidget {
  final List<Pet> pets;
  final VoidCallback onViewAllPets;

  const PetsCard({super.key, required this.pets, required this.onViewAllPets});

  @override
  Widget build(BuildContext context) {
    return PetAppComponents.buildCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(Icons.pets, color: AppTheme.primaryColor),
              const SizedBox(width: AppTheme.spacingS),
              Text(
                '我的宠物',
                style: const TextStyle(
                  fontSize: AppTheme.fontSizeL,
                  fontWeight: FontWeight.bold,
                  color: AppTheme.textPrimaryColor,
                ),
              ),
              const Spacer(),
              TextButton.icon(
                onPressed: onViewAllPets,
                icon: const Icon(Icons.arrow_forward_ios, size: 12),
                label: const Text('查看全部'),
                style: TextButton.styleFrom(
                  foregroundColor: AppTheme.primaryColor,
                ),
              ),
            ],
          ),
          const SizedBox(height: AppTheme.spacingM),

          SizedBox(
            height: 80,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: pets.length > 3 ? 3 : pets.length,
              itemBuilder: (context, index) {
                final pet = pets[index];
                return Container(
                  width: 100,
                  margin: const EdgeInsets.only(right: AppTheme.spacingM),
                  decoration: BoxDecoration(
                    color: pet.color.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(
                      AppTheme.borderRadiusMedium,
                    ),
                    border: Border.all(
                      color: pet.color.withValues(alpha: 0.3),
                      width: 1,
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
                          color: pet.color,
                        ),
                      ),
                      const SizedBox(height: 2),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(
                            Icons.qr_code_2,
                            size: 12,
                            color: Colors.grey,
                          ),
                          const SizedBox(width: 2),
                          Flexible(
                            child: Text(
                              pet.identityCode,
                              style: TextStyle(
                                fontSize: AppTheme.fontSizeXS,
                                color: AppTheme.textSecondaryColor,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          IconButton(
                            padding: EdgeInsets.zero,
                            constraints: const BoxConstraints(
                              minWidth: 24,
                              minHeight: 24,
                            ),
                            icon: const Icon(
                              Icons.copy,
                              size: 14,
                              color: Colors.grey,
                            ),
                            onPressed: () async {
                              await Clipboard.setData(
                                ClipboardData(text: pet.identityCode),
                              );
                              if (context.mounted) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(content: Text('已复制身份码')),
                                );
                              }
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
