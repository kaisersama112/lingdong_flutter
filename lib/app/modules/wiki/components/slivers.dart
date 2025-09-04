import 'package:flutter/material.dart';
import '../breed_models.dart';
import 'cards.dart';
import '../../../core/components/layout/empty_state.dart';

class BreedGridSlivers {
  static List<Widget> build(BuildContext context, List<DogBreed> breeds) {
    if (breeds.isEmpty) {
      return [
        const SliverPadding(padding: EdgeInsets.only(top: 32)),
        const SliverToBoxAdapter(
          child: EmptyState(message: '没有匹配的犬种', icon: Icons.search_off),
        ),
      ];
    }

    final double width = MediaQuery.of(context).size.width;
    int columns = 2;
    double aspect = 1.0;
    if (width >= 1200) {
      columns = 4;
      aspect = 1.2;
    } else if (width >= 900) {
      columns = 3;
      aspect = 1.15;
    } else if (width >= 600) {
      columns = 2;
      aspect = 1.05;
    } else {
      columns = 2;
      aspect = 0.85;
    }

    return [
      SliverPadding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        sliver: SliverGrid(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: columns,
            mainAxisSpacing: 12,
            crossAxisSpacing: 12,
            childAspectRatio: aspect,
          ),
          delegate: SliverChildBuilderDelegate(
            (context, index) => BreedCard(breed: breeds[index]),
            childCount: breeds.length,
          ),
        ),
      ),
    ];
  }
}

class TrainingCourseSlivers {
  static List<Widget> build(List<TrainingCourse> courses) {
    if (courses.isEmpty) {
      return [
        const SliverToBoxAdapter(
          child: EmptyState(message: '暂无训练课程', icon: Icons.menu_book),
        ),
      ];
    }

    return [
      SliverPadding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        sliver: SliverList.builder(
          itemCount: courses.length,
          itemBuilder: (_, i) => Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: TrainingCourseCard(course: courses[i]),
          ),
        ),
      ),
    ];
  }
}

class BehaviorGuideSlivers {
  static List<Widget> build(List<BehaviorGuide> guides) {
    if (guides.isEmpty) {
      return [
        const SliverToBoxAdapter(
          child: EmptyState(message: '暂无行为指南', icon: Icons.psychology),
        ),
      ];
    }

    return [
      SliverPadding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        sliver: SliverList.builder(
          itemCount: guides.length,
          itemBuilder: (_, i) => Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: BehaviorGuideCard(guide: guides[i]),
          ),
        ),
      ),
    ];
  }
}

class SocialActivitySlivers {
  static List<Widget> build(List<SocialActivity> activities) {
    if (activities.isEmpty) {
      return [
        const SliverToBoxAdapter(
          child: EmptyState(message: '暂无社交活动', icon: Icons.groups),
        ),
      ];
    }

    return [
      SliverPadding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        sliver: SliverList.builder(
          itemCount: activities.length,
          itemBuilder: (_, i) => Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: SocialActivityCard(activity: activities[i]),
          ),
        ),
      ),
    ];
  }
}
