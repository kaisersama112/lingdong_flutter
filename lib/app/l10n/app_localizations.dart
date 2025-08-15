import 'package:flutter/material.dart';

class AppLocalizations {
  final Locale locale;

  AppLocalizations(this.locale);

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

  static const _localizedValues = {
    'zh': {
      // 通用
      'app_name': '灵宠',
      'app_subtitle': '让爱宠生活更美好',
      'loading': '加载中...',
      'error': '错误',
      'success': '成功',
      'cancel': '取消',
      'confirm': '确认',
      'save': '保存',
      'delete': '删除',
      'edit': '编辑',
      'add': '添加',
      'search': '搜索',
      'back': '返回',
      'next': '下一步',
      'previous': '上一步',
      
      // 底部导航
      'home': '首页',
      'explore': '探索',
      'publish': '发布',
      'message': '消息',
      'profile': '我的',
      
      // 首页
      'recommend': '推荐',
      'follow': '关注',
      'wiki': '百科',
      
      // 探索页面
      'explore_nearby': '探索周边',
      'explore_subtitle': '发现宠物友好的好去处',
      'search_places': '搜索周边场所...',
      'all_categories': '全部',
      'pet_friendly': '宠物友好',
      'dog_park': '遛狗公园',
      'pet_hospital': '宠物医院',
      'pet_shop': '宠物商店',
      'pet_grooming': '宠物美容',
      'pet_restaurant': '宠物餐厅',
      'pet_hotel': '宠物酒店',
      'open': '营业中',
      'closed': '已关闭',
      'distance': '距离',
      'rating': '评分',
      'features': '特色服务',
      'description': '详细介绍',
      'navigate': '导航',
      'call': '电话',
      'loading_places': '正在加载周边场所...',
      'no_places': '暂无周边场所信息',
      'no_search_results': '没有找到相关场所',
      'reload': '重新加载',
      
      // 发布页面
      'publish_moment': '发布精彩瞬间',
      'publish_text': '分享你的精彩瞬间...',
      'add_media': '添加媒体',
      'photo_library': '相册',
      'video_library': '视频',
      'camera': '拍照',
      'selected_files': '已选择 {count} 个文件',
      'content': '内容',
      'ai_effects': 'AI特效',
      'preview': '预览',
      'publishing': '发布中...',
      
      // 消息页面
      'message_center': '消息中心',
      'all_messages': '全部',
      'system': '系统',
      'order': '订单',
      'customer_service': '客服',
      'search_messages': '搜索消息...',
      
      // 档案页面
      'pet_archive': '宠物档案',
      'pet_info': '宠物信息',
      'health_management': '健康管理',
      'quick_actions': '快捷操作',
      'edit_pet': '编辑宠物',
      'share_profile': '分享档案',
      'print_profile': '打印档案',
      'view_details': '查看详情',
      
      // 宠物详情
      'basic_info': '基本信息',
      'health_records': '健康记录',
      'growth_track': '成长轨迹',
      'photo_album': '相册',
      'add_milestone': '添加里程碑',
      'add_photo': '添加照片',
      'more_options': '更多选项',
      'delete_pet': '删除宠物',
      'delete_confirmation': '确定要删除这个宠物档案吗？此操作不可撤销。',
      
      // 健康记录
      'vaccination': '疫苗接种',
      'deworming': '驱虫记录',
      'physical_exam': '体检记录',
      'medical_treatment': '就医记录',
      'add_record': '添加记录',
      'record_date': '记录日期',
      'record_type': '记录类型',
      'record_details': '记录详情',
      'view_all_records': '查看所有记录',
      
      // 工具页面
      'tools': '实用工具',
      'feeding_calculator': '喂食计算器',
      'lost_pet': '寻宠启事',
      'reminders': '提醒事项',
      'ai_assistant': 'AI助手',
      
      // 个人资料
      'my_profile': '个人资料',
      'settings': '设置',
      'theme_settings': '主题设置',
      'language_settings': '语言设置',
      'notification_settings': '通知设置',
      'privacy_settings': '隐私设置',
      'about_app': '关于应用',
      'feedback': '意见反馈',
      'logout': '退出登录',
      
      // 主题设置
      'light_mode': '浅色模式',
      'dark_mode': '深色模式',
      'system_mode': '跟随系统',
      'auto_switch': '自动切换',
      
      // 语言设置
      'chinese': '中文',
      'english': 'English',
      'current_language': '语言',
      
      // 认证页面
      'login': '登录',
      'register': '注册',
      'forgot_password': '忘记密码',
      'guest_upgrade': '游客升级',
      'username': '用户名',
      'password': '密码',
      'confirm_password': '确认密码',
      'email': '邮箱',
      'phone': '手机号',
      'verification_code': '验证码',
      'get_code': '获取验证码',
      'login_success': '登录成功',
      'register_success': '注册成功',
      'password_reset_sent': '密码重置邮件已发送',
      
      // 错误信息
      'network_error': '网络错误，请检查网络连接',
      'server_error': '服务器错误，请稍后重试',
      'unknown_error': '未知错误',
      'invalid_input': '输入无效',
      'field_required': '此字段为必填项',
      'password_too_short': '密码长度不能少于6位',
      'passwords_not_match': '两次输入的密码不一致',
      'invalid_email': '邮箱格式不正确',
      'invalid_phone': '手机号格式不正确',
      
      // 功能开发中
      'feature_developing': '功能开发中...',
      'coming_soon': '即将推出',
      'under_development': '正在开发中',
    },
    'en': {
      // General
      'app_name': 'PetPal',
      'app_subtitle': 'Make pet life better',
      'loading': 'Loading...',
      'error': 'Error',
      'success': 'Success',
      'cancel': 'Cancel',
      'confirm': 'Confirm',
      'save': 'Save',
      'delete': 'Delete',
      'edit': 'Edit',
      'add': 'Add',
      'search': 'Search',
      'back': 'Back',
      'next': 'Next',
      'previous': 'Previous',
      
      // Bottom Navigation
      'home': 'Home',
      'explore': 'Explore',
      'publish': 'Publish',
      'message': 'Message',
      'profile': 'Profile',
      
      // Home Page
      'recommend': 'Recommend',
      'follow': 'Follow',
      'wiki': 'Wiki',
      
      // Explore Page
      'explore_nearby': 'Explore Nearby',
      'explore_subtitle': 'Discover pet-friendly places',
      'search_places': 'Search nearby places...',
      'all_categories': 'All',
      'pet_friendly': 'Pet Friendly',
      'dog_park': 'Dog Park',
      'pet_hospital': 'Pet Hospital',
      'pet_shop': 'Pet Shop',
      'pet_grooming': 'Pet Grooming',
      'pet_restaurant': 'Pet Restaurant',
      'pet_hotel': 'Pet Hotel',
      'open': 'Open',
      'closed': 'Closed',
      'distance': 'Distance',
      'rating': 'Rating',
      'features': 'Features',
      'description': 'Description',
      'navigate': 'Navigate',
      'call': 'Call',
      'loading_places': 'Loading nearby places...',
      'no_places': 'No nearby places available',
      'no_search_results': 'No places found',
      'reload': 'Reload',
      
      // Publish Page
      'publish_moment': 'Publish Moment',
      'publish_text': 'Share your wonderful moment...',
      'add_media': 'Add Media',
      'photo_library': 'Photo Library',
      'video_library': 'Video Library',
      'camera': 'Camera',
      'selected_files': 'Selected {count} files',
      'content': 'Content',
      'ai_effects': 'AI Effects',
      'preview': 'Preview',
      'publishing': 'Publishing...',
      
      // Message Page
      'message_center': 'Message Center',
      'all_messages': 'All',
      'system': 'System',
      'order': 'Order',
      'customer_service': 'Customer Service',
      'search_messages': 'Search messages...',
      
      // Archive Page
      'pet_archive': 'Pet Archive',
      'pet_info': 'Pet Information',
      'health_management': 'Health Management',
      'quick_actions': 'Quick Actions',
      'edit_pet': 'Edit Pet',
      'share_profile': 'Share Profile',
      'print_profile': 'Print Profile',
      'view_details': 'View Details',
      
      // Pet Detail
      'basic_info': 'Basic Information',
      'health_records': 'Health Records',
      'growth_track': 'Growth Track',
      'photo_album': 'Photo Album',
      'add_milestone': 'Add Milestone',
      'add_photo': 'Add Photo',
      'more_options': 'More Options',
      'delete_pet': 'Delete Pet',
      'delete_confirmation': 'Are you sure you want to delete this pet profile? This action cannot be undone.',
      
      // Health Records
      'vaccination': 'Vaccination',
      'deworming': 'Deworming',
      'physical_exam': 'Physical Exam',
      'medical_treatment': 'Medical Treatment',
      'add_record': 'Add Record',
      'record_date': 'Record Date',
      'record_type': 'Record Type',
      'record_details': 'Record Details',
      'view_all_records': 'View All Records',
      
      // Tools Page
      'tools': 'Tools',
      'feeding_calculator': 'Feeding Calculator',
      'lost_pet': 'Lost Pet',
      'reminders': 'Reminders',
      'ai_assistant': 'AI Assistant',
      
      // Profile
      'my_profile': 'My Profile',
      'settings': 'Settings',
      'theme_settings': 'Theme Settings',
      'language_settings': 'Language Settings',
      'notification_settings': 'Notification Settings',
      'privacy_settings': 'Privacy Settings',
      'about_app': 'About App',
      'feedback': 'Feedback',
      'logout': 'Logout',
      
      // Theme Settings
      'light_mode': 'Light Mode',
      'dark_mode': 'Dark Mode',
      'system_mode': 'System Mode',
      'auto_switch': 'Auto Switch',
      
      // Language Settings
      'chinese': '中文',
      'english': 'English',
      'current_language': 'Language',
      
      // Auth Pages
      'login': 'Login',
      'register': 'Register',
      'forgot_password': 'Forgot Password',
      'guest_upgrade': 'Guest Upgrade',
      'username': 'Username',
      'password': 'Password',
      'confirm_password': 'Confirm Password',
      'email': 'Email',
      'phone': 'Phone',
      'verification_code': 'Verification Code',
      'get_code': 'Get Code',
      'login_success': 'Login successful',
      'register_success': 'Registration successful',
      'password_reset_sent': 'Password reset email sent',
      
      // Error Messages
      'network_error': 'Network error, please check your connection',
      'server_error': 'Server error, please try again later',
      'unknown_error': 'Unknown error',
      'invalid_input': 'Invalid input',
      'field_required': 'This field is required',
      'password_too_short': 'Password must be at least 6 characters',
      'passwords_not_match': 'Passwords do not match',
      'invalid_email': 'Invalid email format',
      'invalid_phone': 'Invalid phone format',
      
      // Features in Development
      'feature_developing': 'Feature in development...',
      'coming_soon': 'Coming soon',
      'under_development': 'Under development',
    },
  };

  String get(String key, [Map<String, dynamic>? args]) {
    String value = _localizedValues[locale.languageCode]?[key] ?? key;
    
    if (args != null) {
      args.forEach((k, v) {
        value = value.replaceAll('{$k}', v.toString());
      });
    }
    
    return value;
  }

  // 便捷方法
  String get appName => get('app_name');
  String get appSubtitle => get('app_subtitle');
  String get loading => get('loading');
  String get error => get('error');
  String get success => get('success');
  String get cancel => get('cancel');
  String get confirm => get('confirm');
  String get save => get('save');
  String get delete => get('delete');
  String get edit => get('edit');
  String get add => get('add');
  String get search => get('search');
  String get back => get('back');
  String get next => get('next');
  String get previous => get('previous');
}
