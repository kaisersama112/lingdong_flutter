import 'package:flutter/material.dart';

class AppTheme {
  // 主色调
  static const Color primaryColor = Color(0xFF2196F3);
  static const Color primaryLightColor = Color(0xFFBBDEFB);
  static const Color primaryDarkColor = Color(0xFF1976D2);
  
  // 辅助色
  static const Color secondaryColor = Color(0xFFFF9800);
  static const Color secondaryLightColor = Color(0xFFFFE0B2);
  static const Color secondaryDarkColor = Color(0xFFF57C00);
  
  // 成功色
  static const Color successColor = Color(0xFF4CAF50);
  static const Color successLightColor = Color(0xFFC8E6C9);
  
  // 警告色
  static const Color warningColor = Color(0xFFFFC107);
  static const Color warningLightColor = Color(0xFFFFF3E0);
  
  // 错误色
  static const Color errorColor = Color(0xFFF44336);
  static const Color errorLightColor = Color(0xFFFFCDD2);
  
  // 中性色
  static const Color backgroundColor = Color(0xFFF8F9FA);
  static const Color surfaceColor = Color(0xFFFFFFFF);
  static const Color textPrimaryColor = Color(0xFF212121);
  static const Color textSecondaryColor = Color(0xFF757575);
  static const Color textLightColor = Color(0xFFBDBDBD);
  static const Color dividerColor = Color(0xFFE0E0E0);
  
  // 宠物主题色
  static const List<Color> petColors = [
    Color(0xFFFF9800), // 橙色 - 猫咪
    Color(0xFFFFC107), // 琥珀色 - 狗狗
    Color(0xFF9C27B0), // 紫色 - 兔子
    Color(0xFF4CAF50), // 绿色 - 鸟类
    Color(0xFF2196F3), // 蓝色 - 鱼类
    Color(0xFF795548), // 棕色 - 仓鼠
  ];

  // 阴影
  static List<BoxShadow> get cardShadow => [
    BoxShadow(
      color: Colors.black.withValues(alpha: 0.08),
      blurRadius: 12,
      offset: const Offset(0, 4),
    ),
  ];

  static List<BoxShadow> get elevatedShadow => [
    BoxShadow(
      color: Colors.black.withValues(alpha: 0.12),
      blurRadius: 16,
      offset: const Offset(0, 6),
    ),
  ];

  static List<BoxShadow> get subtleShadow => [
    BoxShadow(
      color: Colors.black.withValues(alpha: 0.04),
      blurRadius: 8,
      offset: const Offset(0, 2),
    ),
  ];

  // 圆角
  static const double borderRadiusSmall = 8.0;
  static const double borderRadiusMedium = 12.0;
  static const double borderRadiusLarge = 16.0;
  static const double borderRadiusXLarge = 24.0;

  // 间距
  static const double spacingXS = 4.0;
  static const double spacingS = 8.0;
  static const double spacingM = 16.0;
  static const double spacingL = 24.0;
  static const double spacingXL = 32.0;

  // 字体大小
  static const double fontSizeXS = 10.0;
  static const double fontSizeS = 12.0;
  static const double fontSizeM = 14.0;
  static const double fontSizeL = 16.0;
  static const double fontSizeXL = 18.0;
  static const double fontSizeXXL = 24.0;
  static const double fontSizeXXXL = 32.0;

  // 卡片样式
  static BoxDecoration get cardDecoration => BoxDecoration(
    color: surfaceColor,
    borderRadius: BorderRadius.circular(borderRadiusLarge),
    boxShadow: cardShadow,
  );

  static BoxDecoration get elevatedCardDecoration => BoxDecoration(
    color: surfaceColor,
    borderRadius: BorderRadius.circular(borderRadiusLarge),
    boxShadow: elevatedShadow,
  );

  // 输入框样式
  static InputDecoration get searchInputDecoration => InputDecoration(
    hintText: '搜索...',
    hintStyle: TextStyle(color: textLightColor, fontSize: fontSizeM),
    prefixIcon: Icon(Icons.search, color: textSecondaryColor),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(borderRadiusXLarge),
      borderSide: BorderSide.none,
    ),
    filled: true,
    fillColor: surfaceColor,
    contentPadding: const EdgeInsets.symmetric(
      horizontal: spacingL,
      vertical: spacingM,
    ),
  );

  // 按钮样式
  static ButtonStyle get primaryButtonStyle => ElevatedButton.styleFrom(
    backgroundColor: primaryColor,
    foregroundColor: Colors.white,
    elevation: 0,
    padding: const EdgeInsets.symmetric(
      horizontal: spacingL,
      vertical: spacingM,
    ),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(borderRadiusMedium),
    ),
  );

  static ButtonStyle get secondaryButtonStyle => OutlinedButton.styleFrom(
    foregroundColor: primaryColor,
    side: const BorderSide(color: primaryColor),
    padding: const EdgeInsets.symmetric(
      horizontal: spacingL,
      vertical: spacingM,
    ),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(borderRadiusMedium),
    ),
  );

  // 标签页样式
  static TabBarTheme get tabBarTheme => TabBarTheme(
    labelColor: primaryColor,
    unselectedLabelColor: textSecondaryColor,
    labelStyle: const TextStyle(
      fontWeight: FontWeight.w600,
      fontSize: fontSizeL,
    ),
    unselectedLabelStyle: const TextStyle(
      fontWeight: FontWeight.normal,
      fontSize: fontSizeL,
    ),
    indicator: BoxDecoration(
      borderRadius: BorderRadius.circular(borderRadiusMedium),
      color: primaryLightColor,
    ),
  );

  // 文本样式
  static TextStyle get headingStyle => const TextStyle(
    fontSize: fontSizeXXL,
    fontWeight: FontWeight.w700,
    color: textPrimaryColor,
  );

  static TextStyle get subheadingStyle => const TextStyle(
    fontSize: fontSizeXL,
    fontWeight: FontWeight.w600,
    color: textPrimaryColor,
  );

  static TextStyle get bodyStyle => const TextStyle(
    fontSize: fontSizeM,
    fontWeight: FontWeight.normal,
    color: textPrimaryColor,
  );

  static TextStyle get captionStyle => const TextStyle(
    fontSize: fontSizeS,
    fontWeight: FontWeight.normal,
    color: textSecondaryColor,
  );

  // 渐变
  static LinearGradient get primaryGradient => const LinearGradient(
    colors: [primaryColor, primaryDarkColor],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static LinearGradient get secondaryGradient => const LinearGradient(
    colors: [secondaryColor, secondaryDarkColor],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
}
