import 'package:flutter/material.dart';

enum GuideCategory {
  overview,
  feeding,
  grooming,
  training,
  health,
  living,
  exercise,
  behavior, // 新增：行为训练
  social,   // 新增：社交互动
}

// 新增：训练课程类型
enum TrainingCourseType {
  basic,      // 基础训练
  advanced,   // 进阶训练
  behavior,   // 行为纠正
  social,     // 社交训练
  special     // 特殊技能
}

// 新增：年龄阶段
enum DogAgeStage {
  puppy,      // 幼犬 (0-1岁)
  adolescent, // 青少年 (1-2岁)
  adult,      // 成犬 (2-7岁)
  senior      // 老年犬 (7岁以上)
}

// 新增：训练课程模型
class TrainingCourse {
  final String id;
  final String title;
  final String description;
  final TrainingCourseType type;
  final DogAgeStage targetAge;
  final int duration; // 课程时长（分钟）
  final String instructor; // 训犬师
  final String videoUrl; // 视频链接
  final List<String> tags; // 标签
  final double rating; // 评分
  final int studentCount; // 学习人数

  const TrainingCourse({
    required this.id,
    required this.title,
    required this.description,
    required this.type,
    required this.targetAge,
    required this.duration,
    required this.instructor,
    required this.videoUrl,
    required this.tags,
    required this.rating,
    required this.studentCount,
  });
}

// 新增：行为指南模型
class BehaviorGuide {
  final String id;
  final String title;
  final String content;
  final DogAgeStage targetAge;
  final List<String> tags;
  final String author;
  final DateTime createdAt;

  const BehaviorGuide({
    required this.id,
    required this.title,
    required this.content,
    required this.targetAge,
    required this.tags,
    required this.author,
    required this.createdAt,
  });
}

// 新增：社交互动活动模型
class SocialActivity {
  final String id;
  final String title;
  final String description;
  final DogAgeStage targetAge;
  final int difficulty; // 难度等级 1-5
  final int duration; // 活动时长（分钟）
  final List<String> benefits; // 益处
  final List<String> requirements; // 要求

  const SocialActivity({
    required this.id,
    required this.title,
    required this.description,
    required this.targetAge,
    required this.difficulty,
    required this.duration,
    required this.benefits,
    required this.requirements,
  });
}

class GuideItem {
  final String title;
  final String content;

  const GuideItem({required this.title, required this.content});
}

class DogBreed {
  final String id;
  final String name;
  final List<String> aliases;
  final String emoji; // 简单用 emoji 做占位
  final String size; // 小型/中型/大型
  final String group; // 工作犬/玩具犬/牧羊犬…
  final String origin;
  final String lifespan; // 预期寿命描述
  final List<String> temperament; // 性格标签
  final String description;

  // 指南分类 -> 列表
  final Map<GuideCategory, List<GuideItem>> guides;

  // 新增：训练课程列表
  final List<TrainingCourse> trainingCourses;
  
  // 新增：行为指南列表
  final List<BehaviorGuide> behaviorGuides;
  
  // 新增：社交活动列表
  final List<SocialActivity> socialActivities;

  // 能力/习性评级（1-5）
  final int shedding; // 掉毛
  final int grooming; // 美容护理难度
  final int energy; // 精力
  final int trainability; // 训练难度（数值越高越易训练）
  final int barkLevel; // 叫声

  const DogBreed({
    required this.id,
    required this.name,
    required this.aliases,
    required this.emoji,
    required this.size,
    required this.group,
    required this.origin,
    required this.lifespan,
    required this.temperament,
    required this.description,
    required this.guides,
    required this.trainingCourses,
    required this.behaviorGuides,
    required this.socialActivities,
    required this.shedding,
    required this.grooming,
    required this.energy,
    required this.trainability,
    required this.barkLevel,
  });
}

class BreedTagStyle {
  static Color colorForSize(String size) {
    switch (size) {
      case '小型':
        return const Color(0xFF81C784);
      case '中型':
        return const Color(0xFF4FC3F7);
      case '大型':
        return const Color(0xFFFFB74D);
      default:
        return const Color(0xFF9E9E9E);
    }
  }
}

// 新增：工具函数
class TrainingUtils {
  static String courseTypeLabel(TrainingCourseType type) {
    switch (type) {
      case TrainingCourseType.basic:
        return '基础训练';
      case TrainingCourseType.advanced:
        return '进阶训练';
      case TrainingCourseType.behavior:
        return '行为纠正';
      case TrainingCourseType.social:
        return '社交训练';
      case TrainingCourseType.special:
        return '特殊技能';
    }
  }

  static String ageStageLabel(DogAgeStage stage) {
    switch (stage) {
      case DogAgeStage.puppy:
        return '幼犬';
      case DogAgeStage.adolescent:
        return '青少年';
      case DogAgeStage.adult:
        return '成犬';
      case DogAgeStage.senior:
        return '老年犬';
    }
  }

  static Color courseTypeColor(TrainingCourseType type) {
    switch (type) {
      case TrainingCourseType.basic:
        return const Color(0xFF4CAF50);
      case TrainingCourseType.advanced:
        return const Color(0xFF2196F3);
      case TrainingCourseType.behavior:
        return const Color(0xFFFF9800);
      case TrainingCourseType.social:
        return const Color(0xFF9C27B0);
      case TrainingCourseType.special:
        return const Color(0xFFF44336);
    }
  }
}
