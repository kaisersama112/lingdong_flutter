import 'package:flutter/material.dart';

class AppTheme {
  // 主色调 - 温暖的珊瑚粉
  static const Color primaryColor = Color(0xFFFF6B6B); // 温暖的珊瑚粉
  static const Color primaryLightColor = Color(0xFFFFE8E8); // 浅珊瑚粉
  static const Color primaryDarkColor = Color(0xFFE55A5A); // 深珊瑚粉
  
  // 辅助色 - 柔和的薄荷绿
  static const Color secondaryColor = Color(0xFF4ECDC4); // 薄荷绿
  static const Color secondaryLightColor = Color(0xFFE0F7FA); // 浅薄荷绿
  static const Color secondaryDarkColor = Color(0xFF26A69A); // 深薄荷绿
  
  // 成功色 - 温暖的绿色
  static const Color successColor = Color(0xFF66BB6A); // 柔和的绿色
  static const Color successLightColor = Color(0xFFE8F5E8); // 浅绿色
  
  // 警告色 - 温暖的橙色
  static const Color warningColor = Color(0xFFFFB74D); // 温暖的橙色
  static const Color warningLightColor = Color(0xFFFFF8E1); // 浅橙色
  
  // 错误色 - 柔和的红色
  static const Color errorColor = Color(0xFFEF5350); // 柔和的红色
  static const Color errorLightColor = Color(0xFFFFEBEE); // 浅红色
  
  // 中性色 - 温暖的灰色系
  static const Color backgroundColor = Color(0xFFFAFAFA); // 温暖的浅灰
  static const Color surfaceColor = Color(0xFFFFFFFF); // 纯白
  static const Color textPrimaryColor = Color(0xFF2C3E50); // 深蓝灰色
  static const Color textSecondaryColor = Color(0xFF7F8C8D); // 中灰色
  static const Color textLightColor = Color(0xFFBDC3C7); // 浅灰色
  static const Color dividerColor = Color(0xFFECF0F1); // 浅蓝灰色
  
  // 宠物主题色 - 温暖的色彩
  static const List<Color> petColors = [
    Color(0xFFFF6B6B), // 珊瑚粉 - 猫咪
    Color(0xFF4ECDC4), // 薄荷绿 - 狗狗
    Color(0xFFFFB74D), // 橙色 - 兔子
    Color(0xFF9C27B0), // 紫色 - 鸟类
    Color(0xFF2196F3), // 蓝色 - 鱼类
    Color(0xFF8D6E63), // 棕色 - 仓鼠
    Color(0xFF4CAF50), // 绿色 - 其他宠物
    Color(0xFFFF9800), // 琥珀色 - 爬虫类
  ];

  // 渐变色彩 - 更温暖的组合
  static const LinearGradient primaryGradient = LinearGradient(
    colors: [Color(0xFFFF6B6B), Color(0xFFFF8A80)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const LinearGradient secondaryGradient = LinearGradient(
    colors: [Color(0xFF4ECDC4), Color(0xFF26D0CE)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const LinearGradient warmGradient = LinearGradient(
    colors: [Color(0xFFFFB74D), Color(0xFFFFCC02)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  // 新增温暖渐变
  static const LinearGradient softGradient = LinearGradient(
    colors: [Color(0xFFFFE8E8), Color(0xFFFFF3E0)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const LinearGradient sunsetGradient = LinearGradient(
    colors: [Color(0xFFFF6B6B), Color(0xFFFFB74D)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  // 阴影 - 更柔和
  static List<BoxShadow> get cardShadow => [
    BoxShadow(
      color: Colors.black.withValues(alpha: 0.04),
      blurRadius: 12,
      offset: const Offset(0, 4),
      spreadRadius: 0,
    ),
  ];

  static List<BoxShadow> get elevatedShadow => [
    BoxShadow(
      color: Colors.black.withValues(alpha: 0.08),
      blurRadius: 20,
      offset: const Offset(0, 8),
      spreadRadius: 0,
    ),
  ];

  static List<BoxShadow> get subtleShadow => [
    BoxShadow(
      color: Colors.black.withValues(alpha: 0.02),
      blurRadius: 8,
      offset: const Offset(0, 2),
      spreadRadius: 0,
    ),
  ];

  // 圆角 - 更圆润
  static const double borderRadiusSmall = 12.0;
  static const double borderRadiusMedium = 16.0;
  static const double borderRadiusLarge = 20.0;
  static const double borderRadiusXLarge = 28.0;

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

  // 卡片样式 - 更温暖
  static BoxDecoration get cardDecoration => BoxDecoration(
    color: surfaceColor,
    borderRadius: BorderRadius.circular(borderRadiusLarge),
    boxShadow: cardShadow,
    border: Border.all(color: Colors.white, width: 1),
  );

  static BoxDecoration get elevatedCardDecoration => BoxDecoration(
    color: surfaceColor,
    borderRadius: BorderRadius.circular(borderRadiusLarge),
    boxShadow: elevatedShadow,
    border: Border.all(color: Colors.white, width: 1),
  );

  static BoxDecoration get gradientCardDecoration => BoxDecoration(
    gradient: primaryGradient,
    borderRadius: BorderRadius.circular(borderRadiusLarge),
    boxShadow: cardShadow,
  );

  // 按钮样式
  static BoxDecoration get primaryButtonDecoration => BoxDecoration(
    gradient: primaryGradient,
    borderRadius: BorderRadius.circular(borderRadiusMedium),
    boxShadow: [
      BoxShadow(
        color: primaryColor.withValues(alpha: 0.3),
        blurRadius: 12,
        offset: const Offset(0, 6),
      ),
    ],
  );

  static BoxDecoration get secondaryButtonDecoration => BoxDecoration(
    gradient: secondaryGradient,
    borderRadius: BorderRadius.circular(borderRadiusMedium),
    boxShadow: [
      BoxShadow(
        color: secondaryColor.withValues(alpha: 0.3),
        blurRadius: 12,
        offset: const Offset(0, 6),
      ),
    ],
  );

  // 文字样式
  static const TextStyle headingStyle = TextStyle(
    fontSize: fontSizeXXL,
    fontWeight: FontWeight.bold,
    color: textPrimaryColor,
    letterSpacing: -0.5,
  );

  static const TextStyle subheadingStyle = TextStyle(
    fontSize: fontSizeXL,
    fontWeight: FontWeight.w600,
    color: textPrimaryColor,
    letterSpacing: -0.3,
  );

  static const TextStyle bodyStyle = TextStyle(
    fontSize: fontSizeL,
    fontWeight: FontWeight.normal,
    color: textPrimaryColor,
    height: 1.5,
  );

  static const TextStyle captionStyle = TextStyle(
    fontSize: fontSizeM,
    fontWeight: FontWeight.normal,
    color: textSecondaryColor,
    height: 1.4,
  );

  static const TextStyle buttonStyle = TextStyle(
    fontSize: fontSizeL,
    fontWeight: FontWeight.w600,
    color: Colors.white,
    letterSpacing: 0.5,
  );

  // 动画持续时间
  static const Duration shortAnimation = Duration(milliseconds: 200);
  static const Duration mediumAnimation = Duration(milliseconds: 300);
  static const Duration longAnimation = Duration(milliseconds: 500);

  // 特殊效果 - 更温暖的玻璃拟态
  static BoxDecoration get glassmorphismDecoration => BoxDecoration(
    color: Colors.white.withValues(alpha: 0.95),
    borderRadius: BorderRadius.circular(borderRadiusLarge),
    border: Border.all(color: Colors.white.withValues(alpha: 0.3)),
    boxShadow: [
      BoxShadow(
        color: Colors.black.withValues(alpha: 0.08),
        blurRadius: 16,
        offset: const Offset(0, 8),
      ),
    ],
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

  // 搜索输入框装饰
  static InputDecoration get searchInputDecoration => InputDecoration(
    filled: true,
    fillColor: surfaceColor,
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(borderRadiusMedium),
      borderSide: BorderSide.none,
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(borderRadiusMedium),
      borderSide: BorderSide(color: dividerColor),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(borderRadiusMedium),
      borderSide: const BorderSide(color: primaryColor, width: 2),
    ),
    contentPadding: const EdgeInsets.symmetric(
      horizontal: spacingM,
      vertical: spacingM,
    ),
    prefixIcon: const Icon(Icons.search, color: textSecondaryColor),
  );
}
