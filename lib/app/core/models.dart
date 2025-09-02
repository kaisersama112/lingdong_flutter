import 'package:flutter/material.dart';

// 宠物数据模型
class Pet {
  final String id;
  final String name;
  final String type;
  final String breed;
  final String avatar;
  final String identityCode;
  final Color color;
  final DateTime birthDate;
  final double weight;
  final String gender;

  const Pet({
    required this.id,
    required this.name,
    required this.type,
    required this.breed,
    required this.avatar,
    required this.identityCode,
    required this.color,
    required this.birthDate,
    required this.weight,
    required this.gender,
  });
}

// 健康记录类型
enum HealthRecordType {
  vaccination, // 疫苗
  deworming, // 驱虫
  vetVisit, // 就诊体检
  weight, // 体重
  grooming, // 美容
}

// 健康记录数据模型
class HealthRecord {
  final String id;
  final String petId;
  final DateTime date;
  final HealthRecordType type;
  final String title;
  final String? notes;
  final double? weight;
  final String? clinic;

  const HealthRecord({
    required this.id,
    required this.petId,
    required this.date,
    required this.type,
    required this.title,
    this.notes,
    this.weight,
    this.clinic,
  });
}

// 用户档案数据模型
class UserProfile {
  final String name;
  final String phone;
  final String email;
  final String avatar;
  final DateTime joinDate;
  final String address;
  final String bio;
  final String level;
  final int points;

  const UserProfile({
    required this.name,
    required this.phone,
    required this.email,
    required this.avatar,
    required this.joinDate,
    required this.address,
    required this.bio,
    required this.level,
    required this.points,
  });
}

// 健康记录工具类
class HealthRecordUtils {
  static String getTypeLabel(HealthRecordType type) {
    switch (type) {
      case HealthRecordType.weight:
        return '体重';
      case HealthRecordType.grooming:
        return '美容';
      case HealthRecordType.vaccination:
        return '疫苗';
      case HealthRecordType.deworming:
        return '驱虫';
      case HealthRecordType.vetVisit:
        return '体检';
    }
  }

  static IconData getTypeIcon(HealthRecordType type) {
    switch (type) {
      case HealthRecordType.vaccination:
        return Icons.vaccines_outlined;
      case HealthRecordType.deworming:
        return Icons.pest_control_outlined;
      case HealthRecordType.vetVisit:
        return Icons.medical_services_outlined;
      case HealthRecordType.weight:
        return Icons.monitor_weight_outlined;
      case HealthRecordType.grooming:
        return Icons.content_cut_outlined;
    }
  }

  static Color getTypeColor(HealthRecordType type) {
    switch (type) {
      case HealthRecordType.vaccination:
        return const Color(0xFF6366F1); // 现代紫色
      case HealthRecordType.deworming:
        return const Color(0xFF10B981); // 翠绿色
      case HealthRecordType.vetVisit:
        return const Color(0xFF3B82F6); // 现代蓝色
      case HealthRecordType.weight:
        return const Color(0xFFF59E0B); // 琥珀色
      case HealthRecordType.grooming:
        return const Color(0xFF8B5CF6); // 紫罗兰色
    }
  }

  /// 获取类型的渐变颜色列表
  static List<Color> getTypeGradientColors(HealthRecordType type) {
    switch (type) {
      case HealthRecordType.vaccination:
        return [const Color(0xFF6366F1), const Color(0xFF8B5CF6)];
      case HealthRecordType.deworming:
        return [const Color(0xFF10B981), const Color(0xFF059669)];
      case HealthRecordType.vetVisit:
        return [const Color(0xFF3B82F6), const Color(0xFF1D4ED8)];
      case HealthRecordType.weight:
        return [const Color(0xFFF59E0B), const Color(0xFFD97706)];
      case HealthRecordType.grooming:
        return [const Color(0xFF8B5CF6), const Color(0xFF7C3AED)];
    }
  }

  /// 获取类型的浅色背景
  static Color getTypeLightColor(HealthRecordType type) {
    switch (type) {
      case HealthRecordType.vaccination:
        return const Color(0xFFEEF2FF);
      case HealthRecordType.deworming:
        return const Color(0xFFECFDF5);
      case HealthRecordType.vetVisit:
        return const Color(0xFFEFF6FF);
      case HealthRecordType.weight:
        return const Color(0xFFFFFBEB);
      case HealthRecordType.grooming:
        return const Color(0xFFF5F3FF);
    }
  }
}
