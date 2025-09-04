import 'package:flutter/material.dart';

import '../modules/home_page/content_detail_page.dart';
import '../modules/wiki/breed_models.dart';
import '../modules/wiki/breed_detail_page.dart';
import '../modules/wiki/training_course_detail_page.dart';
import '../modules/wiki/behavior_guide_detail_page.dart';
import '../modules/wiki/social_activity_detail_page.dart';
import '../modules/tools/lost_pet_page.dart';
import '../modules/social_page.dart';
import '../modules/user_profile_page.dart';

class AppRouter {
  static const String contentDetailRoute = '/content_detail';
  static const String breedDetailRoute = '/breed_detail';
  static const String trainingCourseDetailRoute = '/training_course_detail';
  static const String behaviorGuideDetailRoute = '/behavior_guide_detail';
  static const String socialActivityDetailRoute = '/social_activity_detail';
  static const String lostPetRoute = '/lost_pet';
  static const String socialRoute = '/social';
  static const String userProfileRoute = '/user_profile';

  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case contentDetailRoute:
        final args = settings.arguments;
        if (args is ContentDetailArgs) {
          return MaterialPageRoute(
            settings: settings,
            builder: (_) => ContentDetailPage(
              postId: args.postId,
              title: args.title,
              content: args.content,
              author: args.author,
              images: args.images,
              videoThumb: args.videoThumb,
            ),
          );
        }
        return _errorRoute('内容详情参数错误');

      case breedDetailRoute:
        final args = settings.arguments;
        if (args is DogBreed) {
          return MaterialPageRoute(
            settings: settings,
            builder: (_) => BreedDetailPage(breed: args),
          );
        }
        return _errorRoute('犬种详情参数错误');

      case trainingCourseDetailRoute:
        final args = settings.arguments;
        if (args is TrainingCourse) {
          return MaterialPageRoute(
            settings: settings,
            builder: (_) => TrainingCourseDetailPage(course: args),
          );
        }
        return _errorRoute('训练课程参数错误');

      case behaviorGuideDetailRoute:
        final args = settings.arguments;
        if (args is BehaviorGuide) {
          return MaterialPageRoute(
            settings: settings,
            builder: (_) => BehaviorGuideDetailPage(guide: args),
          );
        }
        return _errorRoute('行为指南参数错误');

      case socialActivityDetailRoute:
        final args = settings.arguments;
        if (args is SocialActivity) {
          return MaterialPageRoute(
            settings: settings,
            builder: (_) => SocialActivityDetailPage(activity: args),
          );
        }
        return _errorRoute('社交活动参数错误');

      case lostPetRoute:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const LostPetPage(),
        );

      case socialRoute:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const SocialPage(),
        );

      case userProfileRoute:
        final args = settings.arguments;
        if (args is UserProfileArgs) {
          return MaterialPageRoute(
            settings: settings,
            builder: (_) => UserProfilePage(args: args),
          );
        }
        return _errorRoute('用户信息参数错误');

      default:
        return null;
    }
  }

  static Route<dynamic> _errorRoute(String message) {
    return MaterialPageRoute(
      builder: (_) => Scaffold(
        appBar: AppBar(title: const Text('路由错误')),
        body: Center(child: Text(message)),
      ),
    );
  }
}

class ContentDetailArgs {
  final String postId;
  final String title;
  final String content;
  final String author;
  final List<String> images;
  final String? videoThumb;

  const ContentDetailArgs({
    required this.postId,
    required this.title,
    required this.content,
    required this.author,
    required this.images,
    this.videoThumb,
  });
}
