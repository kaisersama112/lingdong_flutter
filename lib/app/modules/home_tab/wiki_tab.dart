import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';
import '../wiki/breed_models.dart';
import '../wiki/breed_data.dart';
import '../wiki/breed_detail_page.dart';

class WikiTab extends StatefulWidget {
  const WikiTab({Key? key}) : super(key: key);

  @override
  State<WikiTab> createState() => _WikiTabState();
}

class _WikiTabState extends State<WikiTab> {
  String _selectedSize = '全部';
  String _search = '';

  @override
  Widget build(BuildContext context) {
    final List<DogBreed> filtered = dogBreeds.where((b) {
      final matchSize = _selectedSize == '全部' || b.size == _selectedSize;
      final q = _search.trim();
      final matchSearch =
          q.isEmpty ||
          b.name.contains(q) ||
          b.aliases.any((a) => a.toLowerCase().contains(q.toLowerCase()));
      return matchSize && matchSearch;
    }).toList();

    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        _buildSearchAndFilters(),
        const SizedBox(height: 12),
        _buildBreedGrid(filtered),
      ],
    );
  }

  Widget _buildSearchAndFilters() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextField(
          decoration: AppTheme.searchInputDecoration.copyWith(
            hintText: '搜索犬种名称/别名...',
          ),
          onChanged: (v) => setState(() => _search = v),
        ),
        const SizedBox(height: 10),
        SizedBox(
          height: 36,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: sizes.length,
            itemBuilder: (_, i) {
              final s = sizes[i];
              final selected = s == _selectedSize;
              final color = selected ? Colors.white : AppTheme.textPrimaryColor;
              return GestureDetector(
                onTap: () => setState(() => _selectedSize = s),
                child: Container(
                  margin: EdgeInsets.only(right: i == sizes.length - 1 ? 0 : 8),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 8,
                  ),
                  decoration: BoxDecoration(
                    color: selected ? AppTheme.primaryColor : Colors.white,
                    borderRadius: BorderRadius.circular(18),
                    border: Border.all(
                      color: selected
                          ? AppTheme.primaryColor
                          : AppTheme.dividerColor,
                    ),
                    boxShadow: selected ? AppTheme.subtleShadow : null,
                  ),
                  child: Row(
                    children: [
                      if (s != '全部')
                        Padding(
                          padding: const EdgeInsets.only(right: 6),
                          child: Icon(Icons.pets, size: 14, color: color),
                        ),
                      Text(
                        s,
                        style: TextStyle(
                          color: color,
                          fontWeight: FontWeight.w600,
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

  Widget _buildBreedGrid(List<DogBreed> breeds) {
    if (breeds.isEmpty) {
      return Padding(
        padding: const EdgeInsets.only(top: 32),
        child: Center(child: Text('没有匹配的犬种', style: AppTheme.captionStyle)),
      );
    }
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 12,
        crossAxisSpacing: 12,
        childAspectRatio: 1.2,
      ),
      itemCount: breeds.length,
      itemBuilder: (_, i) => _breedCard(breeds[i]),
    );
  }

  Widget _breedCard(DogBreed breed) {
    return InkWell(
      onTap: () => Navigator.of(
        context,
      ).push(MaterialPageRoute(builder: (_) => BreedDetailPage(breed: breed))),
      borderRadius: BorderRadius.circular(16),
      child: Container(
        decoration: AppTheme.cardDecoration,
        padding: const EdgeInsets.all(14),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(breed.emoji, style: const TextStyle(fontSize: 28)),
                const Spacer(),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: BreedTagStyle.colorForSize(
                      breed.size,
                    ).withOpacity(0.15),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    breed.size,
                    style: TextStyle(
                      color: BreedTagStyle.colorForSize(breed.size),
                      fontSize: 11,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              breed.name,
              style: AppTheme.subheadingStyle.copyWith(fontSize: 16),
            ),
            const SizedBox(height: 4),
            Text(
              breed.aliases.join(' / '),
              style: AppTheme.captionStyle,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            const Spacer(),
            Row(
              children: [
                Icon(Icons.star, size: 14, color: Colors.amber[700]),
                const SizedBox(width: 2),
                Text('${breed.trainability}', style: AppTheme.captionStyle),
                const SizedBox(width: 10),
                Icon(Icons.air, size: 14, color: Colors.blueGrey[400]),
                const SizedBox(width: 2),
                Text('${breed.shedding}', style: AppTheme.captionStyle),
                const Spacer(),
                Text(
                  '查看指南',
                  style: AppTheme.bodyStyle.copyWith(
                    color: AppTheme.primaryColor,
                  ),
                ),
                const SizedBox(width: 6),
                const Icon(
                  Icons.arrow_forward_ios,
                  size: 14,
                  color: Colors.black26,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
