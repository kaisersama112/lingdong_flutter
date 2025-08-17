import 'package:flutter/material.dart';

class AppTheme {
  // 主色调 - 温暖的金色系
  static const Color primaryColor = Color(0xFFFFB74D); // 温暖的金色 - 狗狗的阳光色
  static const Color primaryLightColor = Color(0xFFFFF8E1); // 浅金色
  static const Color primaryDarkColor = Color(0xFFFF8F00); // 深金色

  // 辅助色 - 温暖的奶油色系
  static const Color secondaryColor = Color(0xFFFFCC80); // 温暖的奶油色
  static const Color secondaryLightColor = Color(0xFFFFF3E0); // 浅奶油色
  static const Color secondaryDarkColor = Color(0xFFFFB74D); // 深奶油色

  // 强调色 - 温暖的珊瑚色系
  static const Color accentColor = Color(0xFFFF8A65); // 温暖的珊瑚色
  static const Color accentLightColor = Color(0xFFFFE0B2); // 浅珊瑚色
  static const Color accentDarkColor = Color(0xFFFF5722); // 深珊瑚色

  // 成功色 - 温和的绿色
  static const Color successColor = Color(0xFF7FB069); // 温和的绿色
  static const Color successLightColor = Color(0xFFE8F4E3); // 浅绿色

  // 警告色 - 温和的橙色
  static const Color warningColor = Color(0xFFE6A23C); // 温和的橙色
  static const Color warningLightColor = Color(0xFFFDF6EC); // 浅橙色

  // 错误色 - 温和的红色
  static const Color errorColor = Color(0xFFE85D75); // 温和的红色
  static const Color errorLightColor = Color(0xFFFEF0F0); // 浅红色

  // 中性色 - 现代化的灰色系
  static const Color backgroundColor = Color(0xFFF8F9FA); // 温暖的浅灰
  static const Color surfaceColor = Color(0xFFFFFFFF); // 纯白
  static const Color textPrimaryColor = Color(0xFF2D3748); // 深灰蓝色
  static const Color textSecondaryColor = Color(0xFF718096); // 中灰色
  static const Color textLightColor = Color(0xFFA0AEC0); // 浅灰色
  static const Color dividerColor = Color(0xFFE2E8F0); // 浅蓝灰色

  // 深色模式颜色
  static const Color darkBackgroundColor = Color(0xFF1A202C); // 深色背景
  static const Color darkSurfaceColor = Color(0xFF2D3748); // 深色表面
  static const Color darkTextPrimaryColor = Color(0xFFF7FAFC); // 深色模式主文本
  static const Color darkTextSecondaryColor = Color(0xFFCBD5E0); // 深色模式次要文本
  static const Color darkTextLightColor = Color(0xFFA0AEC0); // 深色模式浅色文本
  static const Color darkDividerColor = Color(0xFF4A5568); // 深色模式分割线

  // 狗狗品种主题色 - 温暖友好的毛色
  static const List<Color> petColors = [
    Color(0xFFFFB74D), // 温暖金色 - 金毛
    Color(0xFFFFCC80), // 温暖奶油色 - 拉布拉多
    Color(0xFFFFF3E0), // 温暖米色 - 萨摩耶
    Color(0xFFFF8A65), // 温暖珊瑚色 - 德国牧羊犬
    Color(0xFFFFE0B2), // 温暖粉色 - 比熊
    Color(0xFFFFAB91), // 温暖橙色 - 哈士奇
    Color(0xFFFFCC02), // 温暖黄色 - 边境牧羊犬
    Color(0xFFFFB3BA), // 温暖粉色 - 泰迪
  ];

  // 渐变色彩 - 温暖狗狗社区风格
  static const LinearGradient primaryGradient = LinearGradient(
    colors: [Color(0xFFFFB74D), Color(0xFFFF8F00)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const LinearGradient secondaryGradient = LinearGradient(
    colors: [Color(0xFFFFCC80), Color(0xFFFFB74D)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const LinearGradient accentGradient = LinearGradient(
    colors: [Color(0xFFFF8A65), Color(0xFFFF5722)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const LinearGradient warmGradient = LinearGradient(
    colors: [Color(0xFFE6A23C), Color(0xFFD69E2E)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  // 新增现代化渐变
  static const LinearGradient softGradient = LinearGradient(
    colors: [Color(0xFFE8F4F8), Color(0xFFF5F0E8)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const LinearGradient natureGradient = LinearGradient(
    colors: [Color(0xFFFFB74D), Color(0xFFFFCC80)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const LinearGradient dogGradient = LinearGradient(
    colors: [Color(0xFFFFB74D), Color(0xFFFF8A65)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const LinearGradient sunsetGradient = LinearGradient(
    colors: [Color(0xFFFFCC80), Color(0xFFFFAB91)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  // 深色模式渐变
  static const LinearGradient darkPrimaryGradient = LinearGradient(
    colors: [Color(0xFF2E5A6B), Color(0xFF1A3A47)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const LinearGradient darkSecondaryGradient = LinearGradient(
    colors: [Color(0xFFB8945F), Color(0xFF8B6F47)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const LinearGradient darkAccentGradient = LinearGradient(
    colors: [Color(0xFF6B5B9A), Color(0xFF4A3D6B)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  // 阴影 - 更现代化
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

  static List<BoxShadow> get modernShadow => [
    BoxShadow(
      color: primaryColor.withValues(alpha: 0.1),
      blurRadius: 16,
      offset: const Offset(0, 6),
      spreadRadius: 0,
    ),
  ];

  // 深色模式阴影
  static List<BoxShadow> get darkCardShadow => [
    BoxShadow(
      color: Colors.black.withValues(alpha: 0.3),
      blurRadius: 12,
      offset: const Offset(0, 4),
      spreadRadius: 0,
    ),
  ];

  static List<BoxShadow> get darkElevatedShadow => [
    BoxShadow(
      color: Colors.black.withValues(alpha: 0.5),
      blurRadius: 20,
      offset: const Offset(0, 8),
      spreadRadius: 0,
    ),
  ];

  // 获取当前主题的颜色
  static Color getBackgroundColor(BuildContext context) {
    final brightness = Theme.of(context).brightness;
    return brightness == Brightness.dark
        ? darkBackgroundColor
        : backgroundColor;
  }

  static Color getSurfaceColor(BuildContext context) {
    final brightness = Theme.of(context).brightness;
    return brightness == Brightness.dark ? darkSurfaceColor : surfaceColor;
  }

  static Color getTextPrimaryColor(BuildContext context) {
    final brightness = Theme.of(context).brightness;
    return brightness == Brightness.dark
        ? darkTextPrimaryColor
        : textPrimaryColor;
  }

  static Color getTextSecondaryColor(BuildContext context) {
    final brightness = Theme.of(context).brightness;
    return brightness == Brightness.dark
        ? darkTextSecondaryColor
        : textSecondaryColor;
  }

  static Color getDividerColor(BuildContext context) {
    final brightness = Theme.of(context).brightness;
    return brightness == Brightness.dark ? darkDividerColor : dividerColor;
  }

  // 获取当前主题的渐变
  static LinearGradient getPrimaryGradient(BuildContext context) {
    final brightness = Theme.of(context).brightness;
    return brightness == Brightness.dark
        ? darkPrimaryGradient
        : primaryGradient;
  }

  static LinearGradient getSecondaryGradient(BuildContext context) {
    final brightness = Theme.of(context).brightness;
    return brightness == Brightness.dark
        ? darkSecondaryGradient
        : secondaryGradient;
  }

  static LinearGradient getAccentGradient(BuildContext context) {
    final brightness = Theme.of(context).brightness;
    return brightness == Brightness.dark ? darkAccentGradient : accentGradient;
  }

  // 获取当前主题的阴影
  static List<BoxShadow> getCardShadow(BuildContext context) {
    final brightness = Theme.of(context).brightness;
    return brightness == Brightness.dark ? darkCardShadow : cardShadow;
  }

  static List<BoxShadow> getElevatedShadow(BuildContext context) {
    final brightness = Theme.of(context).brightness;
    return brightness == Brightness.dark ? darkElevatedShadow : elevatedShadow;
  }

  // 圆角 - 更现代化
  static const double borderRadiusSmall = 8.0; // 减小小圆角
  static const double borderRadiusMedium = 12.0; // 减小中圆角
  static const double borderRadiusLarge = 16.0; // 减小大圆角
  static const double borderRadiusXLarge = 24.0; // 减小超大圆角

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

  // 卡片样式 - 更现代化
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

  static BoxDecoration get accentCardDecoration => BoxDecoration(
    gradient: accentGradient,
    borderRadius: BorderRadius.circular(borderRadiusLarge),
    boxShadow: modernShadow,
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

  static BoxDecoration get accentButtonDecoration => BoxDecoration(
    gradient: accentGradient,
    borderRadius: BorderRadius.circular(borderRadiusMedium),
    boxShadow: [
      BoxShadow(
        color: accentColor.withValues(alpha: 0.3),
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

  // 特殊效果 - 更现代化的玻璃拟态
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

  static BoxDecoration get modernGlassmorphismDecoration => BoxDecoration(
    color: Colors.white.withValues(alpha: 0.9),
    borderRadius: BorderRadius.circular(borderRadiusLarge),
    border: Border.all(color: Colors.white.withValues(alpha: 0.4)),
    boxShadow: [
      BoxShadow(
        color: primaryColor.withValues(alpha: 0.1),
        blurRadius: 20,
        offset: const Offset(0, 10),
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

  static ButtonStyle get accentButtonStyle => ElevatedButton.styleFrom(
    backgroundColor: accentColor,
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

  // 完整主题配置
  static ThemeData get lightTheme => ThemeData(
    colorScheme: ColorScheme.fromSeed(
      seedColor: primaryColor,
      brightness: Brightness.light,
    ),
    useMaterial3: true,
    fontFamily: 'PingFang SC',

    // AppBar 主题
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.transparent,
      elevation: 0,
      centerTitle: true,
      titleTextStyle: TextStyle(
        color: textPrimaryColor,
        fontSize: 18,
        fontWeight: FontWeight.bold,
      ),
      iconTheme: IconThemeData(color: textPrimaryColor),
    ),

    // 卡片主题
    cardTheme: CardThemeData(
      color: surfaceColor,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(borderRadiusLarge),
      ),
    ),

    // 按钮主题
    elevatedButtonTheme: ElevatedButtonThemeData(style: primaryButtonStyle),

    // 输入框主题
    inputDecorationTheme: InputDecorationTheme(
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
    ),

    // 底部导航栏主题
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: surfaceColor,
      selectedItemColor: primaryColor,
      unselectedItemColor: textSecondaryColor,
      type: BottomNavigationBarType.fixed,
      elevation: 8,
    ),

    // 浮动操作按钮主题
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: primaryColor,
      foregroundColor: Colors.white,
      elevation: 8,
    ),

    // 进度指示器主题
    progressIndicatorTheme: const ProgressIndicatorThemeData(
      color: primaryColor,
    ),

    // 开关主题
    switchTheme: SwitchThemeData(
      thumbColor: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.selected)) {
          return primaryColor;
        }
        return textLightColor;
      }),
      trackColor: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.selected)) {
          return primaryColor.withValues(alpha: 0.3);
        }
        return textLightColor.withValues(alpha: 0.3);
      }),
    ),

    // 复选框主题
    checkboxTheme: CheckboxThemeData(
      fillColor: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.selected)) {
          return primaryColor;
        }
        return Colors.transparent;
      }),
      checkColor: WidgetStateProperty.all(Colors.white),
      side: const BorderSide(color: dividerColor),
    ),
  );
}
