import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';
import '../wiki/breed_models.dart';
import '../wiki/breed_data.dart';
// removed unused app_router import after extracting cards/slivers
import '../wiki/components/search_filters.dart';
import '../wiki/components/tabs_bar.dart';
import '../wiki/components/slivers.dart';

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

    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: WikiSearchFilters(
              selectedSize: _selectedSize,
              searchQuery: _search,
              sizes: sizes,
              onSizeChanged: (s) => setState(() => _selectedSize = s),
              onSearchChanged: (v) => setState(() => _search = v),
            ),
          ),
        ),
        SliverPersistentHeader(
          pinned: true,
          floating: false,
          delegate: _TabsHeaderDelegate(
            minExtent: 44,
            maxExtent: 44,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border(
                  bottom: BorderSide(color: Color(0xFFE5E7EB), width: 0.5),
                ),
              ),
              child: WikiTabsBar(
                selectedIndex: _selectedTabIndex,
                onChanged: (i) => setState(() => _selectedTabIndex = i),
              ),
            ),
          ),
        ),
        ..._buildTabSlivers(filtered),
      ],
    );
  }

  List<Widget> _buildTabSlivers(List<DogBreed> breeds) {
    switch (_selectedTabIndex) {
      case 0:
        return BreedGridSlivers.build(context, breeds);
      case 1:
        return TrainingCourseSlivers.build(_collectCourses(breeds));
      case 2:
        return BehaviorGuideSlivers.build(_collectGuides(breeds));
      case 3:
        return SocialActivitySlivers.build(_collectActivities(breeds));
      default:
        return BreedGridSlivers.build(context, breeds);
    }
  }

  List<TrainingCourse> _collectCourses(List<DogBreed> breeds) => [
    for (final b in breeds) ...b.trainingCourses,
  ];

  List<BehaviorGuide> _collectGuides(List<DogBreed> breeds) => [
    for (final b in breeds) ...b.behaviorGuides,
  ];

  List<SocialActivity> _collectActivities(List<DogBreed> breeds) => [
    for (final b in breeds) ...b.socialActivities,
  ];
}

class _TabsHeaderDelegate extends SliverPersistentHeaderDelegate {
  final double minExtent;
  final double maxExtent;
  final Widget child;

  _TabsHeaderDelegate({
    required this.minExtent,
    required this.maxExtent,
    required this.child,
  });

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    return child;
  }

  @override
  bool shouldRebuild(covariant _TabsHeaderDelegate oldDelegate) {
    return oldDelegate.child != child ||
        oldDelegate.minExtent != minExtent ||
        oldDelegate.maxExtent != maxExtent;
  }
}
