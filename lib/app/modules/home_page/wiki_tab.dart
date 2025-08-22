import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';
import '../wiki/breed_models.dart';
import '../wiki/breed_data.dart';
import '../../routes/app_router.dart';

class WikiTab extends StatefulWidget {
  const WikiTab({super.key});

  @override
  State<WikiTab> createState() => _WikiTabState();
}

class _WikiTabState extends State<WikiTab> {
  String _selectedSize = '全部';
  String _search = '';
  int _selectedTabIndex = 0;

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

    return Column(
      children: [
        _buildSearchAndFilters(),
        const SizedBox(height: AppTheme.spacingM),
        _buildTabBar(),
        Expanded(child: _buildTabContent(filtered)),
      ],
    );
  }

  Widget _buildSearchAndFilters() {
    return Padding(
      padding: const EdgeInsets.all(AppTheme.spacingM),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextField(
            decoration: AppTheme.searchInputDecoration.copyWith(
              hintText: '搜索犬种名称/别名...',
            ),
            onChanged: (v) => setState(() => _search = v),
          ),
          const SizedBox(height: AppTheme.spacingM),
          SizedBox(
            height: 36,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: sizes.length,
              itemBuilder: (_, i) {
                final s = sizes[i];
                final selected = s == _selectedSize;
                final color = selected
                    ? Colors.white
                    : AppTheme.textPrimaryColor;
                return GestureDetector(
                  onTap: () => setState(() => _selectedSize = s),
                  child: Container(
                    margin: EdgeInsets.only(
                      right: i == sizes.length - 1 ? 0 : AppTheme.spacingS,
                    ),
                    padding: const EdgeInsets.symmetric(
                      horizontal: AppTheme.spacingM,
                      vertical: AppTheme.spacingS,
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
                            padding: const EdgeInsets.only(
                              right: AppTheme.spacingXS,
                            ),
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
      ),
    );
  }

  Widget _buildTabBar() {
    final tabs = [
      {'icon': Icons.pets, 'label': '犬种百科'},
      {'icon': Icons.school, 'label': '训练课程'},
      {'icon': Icons.psychology, 'label': '行为指南'},
      {'icon': Icons.groups, 'label': '社交活动'},
    ];

    return Container(
      height: 50,
      margin: const EdgeInsets.symmetric(horizontal: AppTheme.spacingM),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppTheme.dividerColor),
      ),
      child: Row(
        children: tabs.asMap().entries.map((entry) {
          final index = entry.key;
          final tab = entry.value;
          final isSelected = _selectedTabIndex == index;

          return Expanded(
            child: GestureDetector(
              onTap: () => setState(() => _selectedTabIndex = index),
              child: Container(
                decoration: BoxDecoration(
                  color: isSelected
                      ? AppTheme.primaryColor
                      : Colors.transparent,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      tab['icon'] as IconData,
                      size: 20,
                      color: isSelected
                          ? Colors.white
                          : AppTheme.textSecondaryColor,
                    ),
                    const SizedBox(height: 2),
                    Text(
                      tab['label'] as String,
                      style: TextStyle(
                        fontSize: 12,
                        color: isSelected
                            ? Colors.white
                            : AppTheme.textSecondaryColor,
                        fontWeight: isSelected
                            ? FontWeight.w600
                            : FontWeight.normal,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }

  Widget _buildTabContent(List<DogBreed> breeds) {
    switch (_selectedTabIndex) {
      case 0:
        return _buildBreedGrid(breeds);
      case 1:
        return _buildTrainingCourses(breeds);
      case 2:
        return _buildBehaviorGuides(breeds);
      case 3:
        return _buildSocialActivities(breeds);
      default:
        return _buildBreedGrid(breeds);
    }
  }

  Widget _buildBreedGrid(List<DogBreed> breeds) {
    if (breeds.isEmpty) {
      return Padding(
        padding: const EdgeInsets.only(top: 32),
        child: Center(child: Text('没有匹配的犬种', style: AppTheme.captionStyle)),
      );
    }
    return GridView.builder(
      padding: const EdgeInsets.all(AppTheme.spacingM),
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

  Widget _buildTrainingCourses(List<DogBreed> breeds) {
    final allCourses = <TrainingCourse>[];
    for (final breed in breeds) {
      allCourses.addAll(breed.trainingCourses);
    }

    if (allCourses.isEmpty) {
      return const Center(
        child: Padding(
          padding: EdgeInsets.all(AppTheme.spacingM),
          child: Text('暂无训练课程'),
        ),
      );
    }

    return ListView.builder(
      padding: const EdgeInsets.all(AppTheme.spacingM),
      itemCount: allCourses.length,
      itemBuilder: (_, i) => _trainingCourseCard(allCourses[i]),
    );
  }

  Widget _buildBehaviorGuides(List<DogBreed> breeds) {
    final allGuides = <BehaviorGuide>[];
    for (final breed in breeds) {
      allGuides.addAll(breed.behaviorGuides);
    }

    if (allGuides.isEmpty) {
      return const Center(
        child: Padding(
          padding: EdgeInsets.all(AppTheme.spacingM),
          child: Text('暂无行为指南'),
        ),
      );
    }

    return ListView.builder(
      padding: const EdgeInsets.all(AppTheme.spacingM),
      itemCount: allGuides.length,
      itemBuilder: (_, i) => _behaviorGuideCard(allGuides[i]),
    );
  }

  Widget _buildSocialActivities(List<DogBreed> breeds) {
    final allActivities = <SocialActivity>[];
    for (final breed in breeds) {
      allActivities.addAll(breed.socialActivities);
    }

    if (allActivities.isEmpty) {
      return const Center(
        child: Padding(
          padding: EdgeInsets.all(AppTheme.spacingM),
          child: Text('暂无社交活动'),
        ),
      );
    }

    return ListView.builder(
      padding: const EdgeInsets.all(AppTheme.spacingM),
      itemCount: allActivities.length,
      itemBuilder: (_, i) => _socialActivityCard(allActivities[i]),
    );
  }

  Widget _breedCard(DogBreed breed) {
    return InkWell(
      onTap: () => Navigator.of(
        context,
      ).pushNamed(AppRouter.breedDetailRoute, arguments: breed),
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
                    ).withValues(alpha: 0.15),
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
              style: AppTheme.subheadingStyle.copyWith(
                fontSize: 17,
                fontWeight: FontWeight.w700,
              ),
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

  Widget _trainingCourseCard(TrainingCourse course) {
    return Container(
      margin: const EdgeInsets.only(bottom: AppTheme.spacingM),
      decoration: AppTheme.cardDecoration,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 120,
            decoration: BoxDecoration(
              color: TrainingUtils.courseTypeColor(
                course.type,
              ).withValues(alpha: 0.1),
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(12),
                topRight: Radius.circular(12),
              ),
            ),
            child: Stack(
              children: [
                Center(
                  child: Icon(
                    Icons.play_circle_outline,
                    size: 48,
                    color: TrainingUtils.courseTypeColor(course.type),
                  ),
                ),
                Positioned(
                  top: AppTheme.spacingS,
                  right: AppTheme.spacingS,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: TrainingUtils.courseTypeColor(course.type),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      TrainingUtils.courseTypeLabel(course.type),
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(AppTheme.spacingM),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  course.title,
                  style: AppTheme.subheadingStyle.copyWith(
                    fontSize: 17,
                    fontWeight: FontWeight.w700,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: AppTheme.spacingS),
                Text(
                  course.description,
                  style: AppTheme.bodyStyle.copyWith(height: 1.4),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: AppTheme.spacingM),
                Row(
                  children: [
                    Icon(
                      Icons.person,
                      size: 16,
                      color: AppTheme.textSecondaryColor,
                    ),
                    const SizedBox(width: 4),
                    Text(course.instructor, style: AppTheme.captionStyle),
                    const Spacer(),
                    Icon(Icons.star, size: 16, color: Colors.amber[600]),
                    const SizedBox(width: 4),
                    Text('${course.rating}', style: AppTheme.captionStyle),
                    const SizedBox(width: AppTheme.spacingM),
                    Icon(
                      Icons.people,
                      size: 16,
                      color: AppTheme.textSecondaryColor,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      '${course.studentCount}',
                      style: AppTheme.captionStyle,
                    ),
                  ],
                ),
                const SizedBox(height: AppTheme.spacingS),
                Row(
                  children: [
                    Icon(
                      Icons.access_time,
                      size: 16,
                      color: AppTheme.textSecondaryColor,
                    ),
                    const SizedBox(width: 4),
                    Text('${course.duration}分钟', style: AppTheme.captionStyle),
                    const SizedBox(width: AppTheme.spacingM),
                    Icon(
                      Icons.pets,
                      size: 16,
                      color: AppTheme.textSecondaryColor,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      TrainingUtils.ageStageLabel(course.targetAge),
                      style: AppTheme.captionStyle,
                    ),
                    const Spacer(),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pushNamed(
                          AppRouter.trainingCourseDetailRoute,
                          arguments: course,
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: TrainingUtils.courseTypeColor(
                          course.type,
                        ),
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(
                          horizontal: AppTheme.spacingM,
                          vertical: AppTheme.spacingS,
                        ),
                        minimumSize: const Size(0, 36),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      child: const Text('开始学习'),
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

  Widget _behaviorGuideCard(BehaviorGuide guide) {
    return Container(
      margin: const EdgeInsets.only(bottom: AppTheme.spacingM),
      decoration: AppTheme.cardDecoration,
      padding: const EdgeInsets.all(AppTheme.spacingM),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: AppTheme.primaryColor.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(
                  Icons.psychology,
                  color: AppTheme.primaryColor,
                  size: 20,
                ),
              ),
              const SizedBox(width: AppTheme.spacingM),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      guide.title,
                      style: AppTheme.subheadingStyle.copyWith(
                        fontSize: 17,
                        fontWeight: FontWeight.w700,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 4),
                    Text('作者: ${guide.author}', style: AppTheme.captionStyle),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: AppTheme.spacingM),
          Text(
            guide.content,
            style: AppTheme.bodyStyle.copyWith(height: 1.4),
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: AppTheme.spacingM),
          Row(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: AppTheme.primaryColor.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  TrainingUtils.ageStageLabel(guide.targetAge),
                  style: TextStyle(
                    color: AppTheme.primaryColor,
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              const SizedBox(width: AppTheme.spacingS),
              ...guide.tags
                  .take(2)
                  .map(
                    (tag) => Container(
                      margin: const EdgeInsets.only(right: AppTheme.spacingS),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.grey[100],
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(tag, style: AppTheme.captionStyle),
                    ),
                  ),
              const Spacer(),
              OutlinedButton(
                onPressed: () {
                  Navigator.of(context).pushNamed(
                    AppRouter.behaviorGuideDetailRoute,
                    arguments: guide,
                  );
                },
                style: OutlinedButton.styleFrom(
                  minimumSize: const Size(0, 36),
                  padding: const EdgeInsets.symmetric(horizontal: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                child: const Text(
                  '查看详情',
                  style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _socialActivityCard(SocialActivity activity) {
    return Container(
      margin: const EdgeInsets.only(bottom: AppTheme.spacingM),
      decoration: AppTheme.cardDecoration,
      padding: const EdgeInsets.all(AppTheme.spacingM),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.green.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Icon(Icons.groups, color: Colors.green, size: 20),
              ),
              const SizedBox(width: AppTheme.spacingM),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      activity.title,
                      style: AppTheme.subheadingStyle,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 4),
                    Row(
                      children: [
                        Icon(
                          Icons.trending_up,
                          size: 14,
                          color: Colors.green[600],
                        ),
                        const SizedBox(width: 4),
                        Text(
                          '难度 ${activity.difficulty}/5',
                          style: AppTheme.captionStyle,
                        ),
                        const SizedBox(width: AppTheme.spacingM),
                        Icon(
                          Icons.access_time,
                          size: 14,
                          color: AppTheme.textSecondaryColor,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          '${activity.duration}分钟',
                          style: AppTheme.captionStyle,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: AppTheme.spacingM),
          Text(
            activity.description,
            style: AppTheme.bodyStyle,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: AppTheme.spacingM),
          Row(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: Colors.green.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  TrainingUtils.ageStageLabel(activity.targetAge),
                  style: const TextStyle(
                    color: Colors.green,
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              const Spacer(),
              OutlinedButton(
                onPressed: () {
                  Navigator.of(context).pushNamed(
                    AppRouter.socialActivityDetailRoute,
                    arguments: activity,
                  );
                },
                style: OutlinedButton.styleFrom(
                  minimumSize: const Size(0, 36),
                  padding: const EdgeInsets.symmetric(horizontal: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                child: const Text(
                  '参与活动',
                  style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
                ),
              ),
            ],
          ),
          const SizedBox(height: AppTheme.spacingS),
          Text(
            '益处: ${activity.benefits.join(', ')}',
            style: AppTheme.captionStyle.copyWith(color: Colors.green[600]),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
