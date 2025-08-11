import 'package:flutter/material.dart';

enum GuideCategory {
  overview,
  feeding,
  grooming,
  training,
  health,
  living,
  exercise,
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
