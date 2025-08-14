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
  vaccination,    // 疫苗
  deworming,     // 驱虫
  vetVisit,      // 就诊体检
  weight,        // 体重
  medication,    // 用药
  grooming,      // 美容
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

  const UserProfile({
    required this.name,
    required this.phone,
    required this.email,
    required this.avatar,
    required this.joinDate,
    required this.address,
    required this.bio,
  });
}

// 健康记录工具类
class HealthRecordUtils {
  static String getTypeLabel(HealthRecordType type) {
    switch (type) {
      case HealthRecordType.vaccination:
        return '疫苗';
      case HealthRecordType.deworming:
        return '驱虫';
      case HealthRecordType.vetVisit:
        return '就诊体检';
      case HealthRecordType.weight:
        return '体重';
      case HealthRecordType.medication:
        return '用药';
      case HealthRecordType.grooming:
        return '美容';
    }
  }

  static IconData getTypeIcon(HealthRecordType type) {
    switch (type) {
      case HealthRecordType.vaccination:
        return Icons.vaccines;
      case HealthRecordType.deworming:
        return Icons.bug_report;
      case HealthRecordType.vetVisit:
        return Icons.local_hospital;
      case HealthRecordType.weight:
        return Icons.monitor_weight;
      case HealthRecordType.medication:
        return Icons.medication_liquid;
      case HealthRecordType.grooming:
        return Icons.content_cut;
    }
  }

  static Color getTypeColor(HealthRecordType type) {
    switch (type) {
      case HealthRecordType.vaccination:
        return Colors.deepPurple;
      case HealthRecordType.deworming:
        return Colors.teal;
      case HealthRecordType.vetVisit:
        return Colors.indigo;
      case HealthRecordType.weight:
        return Colors.orange;
      case HealthRecordType.medication:
        return Colors.pink;
      case HealthRecordType.grooming:
        return Colors.green;
    }
  }
}
