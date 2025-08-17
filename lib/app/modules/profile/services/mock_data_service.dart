import '../../../core/models.dart';
import '../../../theme/app_theme.dart';

class MockDataService {
  /// 获取模拟用户数据
  static UserProfile getUserProfile() {
    return UserProfile(
      name: '张三',
      phone: '138****8888',
      email: 'zhangsan@example.com',
      avatar: '👤',
      joinDate: DateTime(2020, 6, 1),
      address: '北京市朝阳区',
      bio: '热爱宠物，家有两只猫咪和一只狗狗',
      level: 'Lv.8',
      points: 1280,
    );
  }

  /// 获取模拟宠物数据
  static List<Pet> getPets() {
    return [
      Pet(
        id: '1',
        name: '小白',
        type: '猫咪',
        breed: '英短',
        avatar: '🐱',
        identityCode: 'LD-PET-7Q2M8A',
        color: AppTheme.primaryColor,
        birthDate: DateTime(2022, 3, 15),
        weight: 4.2,
        gender: '公',
      ),
      Pet(
        id: '2',
        name: '旺财',
        type: '狗狗',
        breed: '金毛',
        avatar: '🐕',
        identityCode: 'LD-PET-9K5D1C',
        color: AppTheme.secondaryColor,
        birthDate: DateTime(2021, 8, 20),
        weight: 25.5,
        gender: '公',
      ),
      Pet(
        id: '3',
        name: '咪咪',
        type: '猫咪',
        breed: '美短',
        avatar: '🐈',
        identityCode: 'LD-PET-4R6B0T',
        color: AppTheme.warningColor,
        birthDate: DateTime(2023, 1, 10),
        weight: 3.8,
        gender: '母',
      ),
    ];
  }

  /// 获取统计数据的默认值
  static Map<String, String> getDefaultStats() {
    return {'following': '128', 'followers': '256', 'likes': '1.2k'};
  }
}
