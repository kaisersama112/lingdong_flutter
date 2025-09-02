import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';
import 'breed_models.dart';
import 'breed_data.dart';

class BreedDetailPage extends StatelessWidget {
  final DogBreed breed;
  const BreedDetailPage({super.key, required this.breed});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(breed.name),
        backgroundColor: Colors.transparent,
        foregroundColor: AppTheme.textPrimaryColor,
        elevation: 0,
        centerTitle: true,
      ),
      backgroundColor: AppTheme.backgroundColor,
      body: ListView(
        padding: const EdgeInsets.all(AppTheme.spacingM),
        children: [
          _buildHeader(),
          const SizedBox(height: AppTheme.spacingM),
          _buildBadges(),
          const SizedBox(height: AppTheme.spacingM),
          _buildRatings(),
          const SizedBox(height: AppTheme.spacingM),
          ...allGuideCategories
              .map((c) => _buildGuideSection(c))
              .where((w) => w != null)
              .cast<Widget>(),
          const SizedBox(height: AppTheme.spacingL),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      decoration: AppTheme.cardDecoration,
      child: Padding(
        padding: const EdgeInsets.all(AppTheme.spacingM),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(breed.emoji, style: const TextStyle(fontSize: 48)),
            const SizedBox(width: AppTheme.spacingM),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(breed.name, style: AppTheme.headingStyle),
                  const SizedBox(height: 6),
                  Wrap(
                    spacing: AppTheme.spacingS,
                    runSpacing: AppTheme.spacingS,
                    children: [
                      _chip(
                        '体型: ${breed.size}',
                        BreedTagStyle.colorForSize(breed.size),
                      ),
                      _chip('类别: ${breed.group}', AppTheme.primaryLightColor),
                      _chip('原产: ${breed.origin}', AppTheme.accentLightColor),
                      _chip(
                        '寿命: ${breed.lifespan}',
                        AppTheme.secondaryLightColor,
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Text(
                    breed.description,
                    style: AppTheme.bodyStyle.copyWith(
                      color: AppTheme.textSecondaryColor,
                      height: 1.6,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _chip(String text, Color color) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.15),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Text(
        text,
        style: TextStyle(
          color: color,
          fontSize: 12,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  Widget _buildBadges() {
    return _section(
      icon: Icons.tag,
      title: '性格特征',
      child: Wrap(
        spacing: AppTheme.spacingS,
        runSpacing: AppTheme.spacingS,
        children: breed.temperament
            .map((t) => _chip(t, AppTheme.warningLightColor))
            .toList(),
      ),
    );
  }

  Widget _buildRatings() {
    return _section(
      icon: Icons.star,
      title: '特性评分',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _ratingRow('掉毛', breed.shedding, Icons.air),
          const SizedBox(height: 10),
          _ratingRow('护理', breed.grooming, Icons.content_cut),
          const SizedBox(height: 10),
          _ratingRow('精力', breed.energy, Icons.directions_run),
          const SizedBox(height: 10),
          _ratingRow('可训', breed.trainability, Icons.school),
          const SizedBox(height: 10),
          _ratingRow('叫声', breed.barkLevel, Icons.campaign),
        ],
      ),
    );
  }

  Widget _ratingRow(String label, int score, IconData icon) {
    return Row(
      children: [
        Icon(icon, size: 18, color: AppTheme.primaryColor),
        const SizedBox(width: 8),
        SizedBox(width: 44, child: Text(label, style: AppTheme.bodyStyle)),
        const SizedBox(width: 8),
        ...List.generate(5, (i) {
          final active = i < score;
          return Padding(
            padding: const EdgeInsets.only(right: 4),
            child: Icon(
              active ? Icons.star : Icons.star_border,
              size: 18,
              color: active ? Colors.amber : AppTheme.textLightColor,
            ),
          );
        }),
      ],
    );
  }

  Widget? _buildGuideSection(GuideCategory category) {
    final items = breed.guides[category];
    if (items == null || items.isEmpty) return null;
    return _section(
      title: guideCategoryLabel(category),
      icon: Icons.menu_book,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ...items.map(
            (e) => Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    e.title,
                    style: AppTheme.bodyStyle.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    e.content,
                    style: AppTheme.bodyStyle.copyWith(
                      color: AppTheme.textSecondaryColor,
                      height: 1.6,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _section({
    required String title,
    required IconData icon,
    required Widget child,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: AppTheme.spacingM),
      decoration: AppTheme.cardDecoration,
      child: Padding(
        padding: const EdgeInsets.all(AppTheme.spacingM),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(icon, color: AppTheme.primaryColor),
                const SizedBox(width: AppTheme.spacingS),
                Text(title, style: AppTheme.subheadingStyle),
              ],
            ),
            const SizedBox(height: AppTheme.spacingM),
            child,
          ],
        ),
      ),
    );
  }
}
