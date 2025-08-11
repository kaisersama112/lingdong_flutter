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
        backgroundColor: Colors.white,
        foregroundColor: AppTheme.textPrimaryColor,
        elevation: 0.5,
      ),
      backgroundColor: AppTheme.backgroundColor,
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _buildHeader(),
          const SizedBox(height: 12),
          _buildBadges(),
          const SizedBox(height: 12),
          _buildRatings(),
          const SizedBox(height: 16),
          ...allGuideCategories
              .map((c) => _buildGuideSection(c))
              .where((w) => w != null)
              .cast<Widget>(),
          const SizedBox(height: 24),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      decoration: AppTheme.cardDecoration,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(breed.emoji, style: const TextStyle(fontSize: 48)),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    breed.name,
                    style: AppTheme.subheadingStyle.copyWith(fontSize: 20),
                  ),
                  const SizedBox(height: 6),
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: [
                      _chip(
                        '体型: ${breed.size}',
                        BreedTagStyle.colorForSize(breed.size),
                      ),
                      _chip('类别: ${breed.group}', const Color(0xFF90CAF9)),
                      _chip('原产: ${breed.origin}', const Color(0xFFA5D6A7)),
                      _chip('寿命: ${breed.lifespan}', const Color(0xFFFFCC80)),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Text(
                    breed.description,
                    style: AppTheme.bodyStyle.copyWith(
                      color: AppTheme.textSecondaryColor,
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
    return Container(
      decoration: AppTheme.cardDecoration,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Wrap(
          spacing: 8,
          runSpacing: 8,
          children: breed.temperament
              .map((t) => _chip(t, const Color(0xFFFFF59D)))
              .toList(),
        ),
      ),
    );
  }

  Widget _buildRatings() {
    return Container(
      decoration: AppTheme.cardDecoration,
      child: Padding(
        padding: const EdgeInsets.all(16),
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
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: AppTheme.cardDecoration,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(guideCategoryLabel(category), style: AppTheme.subheadingStyle),
            const SizedBox(height: 8),
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
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
