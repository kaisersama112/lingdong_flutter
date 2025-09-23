/// 用户基础信息模型
class User {
  final String userId;
  final String phone;
  final String? email;
  final String username;
  final String? avatar;
  final DateTime registerTime;
  final DateTime lastLoginTime;
  final UserStatus status;
  final UserRole role;
  final List<String> petIds;
  final PrivacySettings privacySettings;
  final UserPreferences preferences;
  final int followingCount;
  final int followersCount;
  final bool? isFollowing; // 仅“查看他人”时有意义，当前用户可为null

  const User({
    required this.userId,
    required this.phone,
    this.email,
    required this.username,
    this.avatar,
    required this.registerTime,
    required this.lastLoginTime,
    this.status = UserStatus.active,
    this.role = UserRole.user,
    this.petIds = const [],
    this.privacySettings = const PrivacySettings(),
    this.preferences = const UserPreferences(),
    this.followingCount = 0,
    this.followersCount = 0,
    this.isFollowing,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      userId: json['userId'] as String,
      phone: json['phone'] as String,
      email: json['email'] as String?,
      username: json['username'] as String,
      avatar: json['avatar'] as String?,
      registerTime: DateTime.parse(json['registerTime'] as String),
      lastLoginTime: DateTime.parse(json['lastLoginTime'] as String),
      status: UserStatus.values.firstWhere(
        (e) => e.name == json['status'],
        orElse: () => UserStatus.active,
      ),
      role: UserRole.values.firstWhere(
        (e) => e.name == json['role'],
        orElse: () => UserRole.user,
      ),
      petIds: List<String>.from(json['petIds'] ?? []),
      privacySettings: PrivacySettings.fromJson(json['privacySettings'] ?? {}),
      preferences: UserPreferences.fromJson(json['preferences'] ?? {}),
      followingCount:
          json['followingCount'] as int? ??
          json['following_count'] as int? ??
          0,
      followersCount:
          json['followersCount'] as int? ??
          json['followers_count'] as int? ??
          0,
      isFollowing:
          json['isFollowing'] as bool? ?? json['is_following'] as bool?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'userId': userId,
      'phone': phone,
      'email': email,
      'username': username,
      'avatar': avatar,
      'registerTime': registerTime.toIso8601String(),
      'lastLoginTime': lastLoginTime.toIso8601String(),
      'status': status.name,
      'role': role.name,
      'petIds': petIds,
      'privacySettings': privacySettings.toJson(),
      'preferences': preferences.toJson(),
      'followingCount': followingCount,
      'followersCount': followersCount,
      if (isFollowing != null) 'isFollowing': isFollowing,
    };
  }

  User copyWith({
    String? userId,
    String? phone,
    String? email,
    String? username,
    String? avatar,
    DateTime? registerTime,
    DateTime? lastLoginTime,
    UserStatus? status,
    UserRole? role,
    List<String>? petIds,
    PrivacySettings? privacySettings,
    UserPreferences? preferences,
    int? followingCount,
    int? followersCount,
    bool? isFollowing,
  }) {
    return User(
      userId: userId ?? this.userId,
      phone: phone ?? this.phone,
      email: email ?? this.email,
      username: username ?? this.username,
      avatar: avatar ?? this.avatar,
      registerTime: registerTime ?? this.registerTime,
      lastLoginTime: lastLoginTime ?? this.lastLoginTime,
      status: status ?? this.status,
      role: role ?? this.role,
      petIds: petIds ?? this.petIds,
      privacySettings: privacySettings ?? this.privacySettings,
      preferences: preferences ?? this.preferences,
      followingCount: followingCount ?? this.followingCount,
      followersCount: followersCount ?? this.followersCount,
      isFollowing: isFollowing ?? this.isFollowing,
    );
  }
}

/// 用户状态枚举
enum UserStatus {
  active, // 正常
  inactive, // 未激活
  banned, // 封禁
  deleted, // 已删除
}

/// 用户角色枚举
enum UserRole {
  user, // 普通用户
  vip, // VIP用户
  moderator, // 版主
  admin, // 管理员
}

/// 隐私设置模型
class PrivacySettings {
  final bool profileVisible; // 个人资料可见性
  final bool petInfoVisible; // 宠物信息可见性
  final bool locationVisible; // 位置信息可见性
  final bool allowFollow; // 允许关注
  final bool allowMessage; // 允许私信
  final bool allowComment; // 允许评论
  final bool showOnlineStatus; // 显示在线状态

  const PrivacySettings({
    this.profileVisible = true,
    this.petInfoVisible = true,
    this.locationVisible = false,
    this.allowFollow = true,
    this.allowMessage = true,
    this.allowComment = true,
    this.showOnlineStatus = true,
  });

  factory PrivacySettings.fromJson(Map<String, dynamic> json) {
    return PrivacySettings(
      profileVisible: json['profileVisible'] ?? true,
      petInfoVisible: json['petInfoVisible'] ?? true,
      locationVisible: json['locationVisible'] ?? false,
      allowFollow: json['allowFollow'] ?? true,
      allowMessage: json['allowMessage'] ?? true,
      allowComment: json['allowComment'] ?? true,
      showOnlineStatus: json['showOnlineStatus'] ?? true,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'profileVisible': profileVisible,
      'petInfoVisible': petInfoVisible,
      'locationVisible': locationVisible,
      'allowFollow': allowFollow,
      'allowMessage': allowMessage,
      'allowComment': allowComment,
      'showOnlineStatus': showOnlineStatus,
    };
  }

  PrivacySettings copyWith({
    bool? profileVisible,
    bool? petInfoVisible,
    bool? locationVisible,
    bool? allowFollow,
    bool? allowMessage,
    bool? allowComment,
    bool? showOnlineStatus,
  }) {
    return PrivacySettings(
      profileVisible: profileVisible ?? this.profileVisible,
      petInfoVisible: petInfoVisible ?? this.petInfoVisible,
      locationVisible: locationVisible ?? this.locationVisible,
      allowFollow: allowFollow ?? this.allowFollow,
      allowMessage: allowMessage ?? this.allowMessage,
      allowComment: allowComment ?? this.allowComment,
      showOnlineStatus: showOnlineStatus ?? this.showOnlineStatus,
    );
  }
}

/// 用户偏好设置模型
class UserPreferences {
  final String language; // 语言设置
  final String theme; // 主题设置
  final bool pushNotification; // 推送通知
  final bool emailNotification; // 邮件通知
  final bool smsNotification; // 短信通知
  final List<String> interests; // 兴趣标签
  final String timezone; // 时区设置

  const UserPreferences({
    this.language = 'zh_CN',
    this.theme = 'light',
    this.pushNotification = true,
    this.emailNotification = false,
    this.smsNotification = false,
    this.interests = const [],
    this.timezone = 'Asia/Shanghai',
  });

  factory UserPreferences.fromJson(Map<String, dynamic> json) {
    return UserPreferences(
      language: json['language'] ?? 'zh_CN',
      theme: json['theme'] ?? 'light',
      pushNotification: json['pushNotification'] ?? true,
      emailNotification: json['emailNotification'] ?? false,
      smsNotification: json['smsNotification'] ?? false,
      interests: List<String>.from(json['interests'] ?? []),
      timezone: json['timezone'] ?? 'Asia/Shanghai',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'language': language,
      'theme': theme,
      'pushNotification': pushNotification,
      'emailNotification': emailNotification,
      'smsNotification': smsNotification,
      'interests': interests,
      'timezone': timezone,
    };
  }

  UserPreferences copyWith({
    String? language,
    String? theme,
    bool? pushNotification,
    bool? emailNotification,
    bool? smsNotification,
    List<String>? interests,
    String? timezone,
  }) {
    return UserPreferences(
      language: language ?? this.language,
      theme: theme ?? this.theme,
      pushNotification: pushNotification ?? this.pushNotification,
      emailNotification: emailNotification ?? this.emailNotification,
      smsNotification: smsNotification ?? this.smsNotification,
      interests: interests ?? this.interests,
      timezone: timezone ?? this.timezone,
    );
  }
}

/// 宠物信息模型
class Pet {
  final String petId;
  final String userId;
  final String name;
  final String type;
  final String breed;
  final DateTime birthDate;
  final String gender;
  final double weight;
  final String? color;
  final List<String> photos;
  final String? description;
  final HealthRecord? healthRecord;
  final List<Event> events;
  final DateTime createTime;
  final DateTime updateTime;

  const Pet({
    required this.petId,
    required this.userId,
    required this.name,
    required this.type,
    required this.breed,
    required this.birthDate,
    required this.gender,
    required this.weight,
    this.color,
    this.photos = const [],
    this.description,
    this.healthRecord,
    this.events = const [],
    required this.createTime,
    required this.updateTime,
  });

  factory Pet.fromJson(Map<String, dynamic> json) {
    return Pet(
      petId: json['petId'] as String,
      userId: json['userId'] as String,
      name: json['name'] as String,
      type: json['type'] as String,
      breed: json['breed'] as String,
      birthDate: DateTime.parse(json['birthDate'] as String),
      gender: json['gender'] as String,
      weight: (json['weight'] as num).toDouble(),
      color: json['color'] as String?,
      photos: List<String>.from(json['photos'] ?? []),
      description: json['description'] as String?,
      healthRecord: HealthRecord.fromJson(json['healthRecord'] ?? {}),
      events:
          (json['events'] as List<dynamic>?)
              ?.map((e) => Event.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      createTime: DateTime.parse(json['createTime'] as String),
      updateTime: DateTime.parse(json['updateTime'] as String),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'petId': petId,
      'userId': userId,
      'name': name,
      'type': type,
      'breed': breed,
      'birthDate': birthDate.toIso8601String(),
      'gender': gender,
      'weight': weight,
      'color': color,
      'photos': photos,
      'description': description,
      'healthRecord': healthRecord?.toJson(),
      'events': events.map((e) => e.toJson()).toList(),
      'createTime': createTime.toIso8601String(),
      'updateTime': updateTime.toIso8601String(),
    };
  }

  Pet copyWith({
    String? petId,
    String? userId,
    String? name,
    String? type,
    String? breed,
    DateTime? birthDate,
    String? gender,
    double? weight,
    String? color,
    List<String>? photos,
    String? description,
    HealthRecord? healthRecord,
    List<Event>? events,
    DateTime? createTime,
    DateTime? updateTime,
  }) {
    return Pet(
      petId: petId ?? this.petId,
      userId: userId ?? this.userId,
      name: name ?? this.name,
      type: type ?? this.type,
      breed: breed ?? this.breed,
      birthDate: birthDate ?? this.birthDate,
      gender: gender ?? this.gender,
      weight: weight ?? this.weight,
      color: color ?? this.color,
      photos: photos ?? this.photos,
      description: description ?? this.description,
      healthRecord: healthRecord ?? this.healthRecord,
      events: events ?? this.events,
      createTime: createTime ?? this.createTime,
      updateTime: updateTime ?? this.updateTime,
    );
  }
}

/// 健康记录模型
class HealthRecord {
  final String recordId;
  final String petId;
  final DateTime date;
  final double weight;
  final String? symptoms;
  final String? diagnosis;
  final String? treatment;
  final String? notes;
  final List<String> attachments;

  const HealthRecord({
    required this.recordId,
    required this.petId,
    required this.date,
    required this.weight,
    this.symptoms,
    this.diagnosis,
    this.treatment,
    this.notes,
    this.attachments = const [],
  });

  factory HealthRecord.fromJson(Map<String, dynamic> json) {
    return HealthRecord(
      recordId: json['recordId'] as String,
      petId: json['petId'] as String,
      date: DateTime.parse(json['date'] as String),
      weight: (json['weight'] as num).toDouble(),
      symptoms: json['symptoms'] as String?,
      diagnosis: json['diagnosis'] as String?,
      treatment: json['treatment'] as String?,
      notes: json['notes'] as String?,
      attachments: List<String>.from(json['attachments'] ?? []),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'recordId': recordId,
      'petId': petId,
      'date': date.toIso8601String(),
      'weight': weight,
      'symptoms': symptoms,
      'diagnosis': diagnosis,
      'treatment': treatment,
      'notes': notes,
      'attachments': attachments,
    };
  }
}

/// 事件模型
class Event {
  final String eventId;
  final String petId;
  final String title;
  final String description;
  final DateTime date;
  final EventType type;
  final String? location;
  final List<String> photos;

  const Event({
    required this.eventId,
    required this.petId,
    required this.title,
    required this.description,
    required this.date,
    required this.type,
    this.location,
    this.photos = const [],
  });

  factory Event.fromJson(Map<String, dynamic> json) {
    return Event(
      eventId: json['eventId'] as String,
      petId: json['petId'] as String,
      title: json['title'] as String,
      description: json['description'] as String,
      date: DateTime.parse(json['date'] as String),
      type: EventType.values.firstWhere(
        (e) => e.name == json['type'],
        orElse: () => EventType.other,
      ),
      location: json['location'] as String?,
      photos: List<String>.from(json['photos'] ?? []),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'eventId': eventId,
      'petId': petId,
      'title': title,
      'description': description,
      'date': date.toIso8601String(),
      'type': type.name,
      'location': location,
      'photos': photos,
    };
  }
}

/// 事件类型枚举
enum EventType {
  vaccination, // 疫苗接种
  grooming, // 美容
  training, // 训练
  medical, // 医疗
  birthday, // 生日
  adoption, // 领养
  other, // 其他
}
