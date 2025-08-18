import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';

class AuthComponents {
  // 现代化渐变按钮
  static Widget gradientButton({
    required String text,
    required VoidCallback onPressed,
    required List<Color> colors,
    double height = 56,
    double fontSize = 18,
    bool isLoading = false,
    Widget? icon,
  }) {
    return Container(
      height: height,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: colors,
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(AppTheme.borderRadiusMedium),
        boxShadow: [
          BoxShadow(
            color: colors.first.withValues(alpha: 0.4),
            blurRadius: 15,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: ElevatedButton(
        onPressed: isLoading ? null : onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          foregroundColor: Colors.white,
          elevation: 0,
          shadowColor: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppTheme.borderRadiusMedium),
          ),
        ),
        child: isLoading
            ? const SizedBox(
                width: 24,
                height: 24,
                child: CircularProgressIndicator(
                  strokeWidth: 2.5,
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                ),
              )
            : Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (icon != null) ...[
                    icon,
                    const SizedBox(width: AppTheme.spacingS),
                  ],
                  Text(
                    text,
                    style: TextStyle(
                      fontSize: fontSize,
                      fontWeight: FontWeight.w700,
                      letterSpacing: 1,
                    ),
                  ),
                ],
              ),
      ),
    );
  }

  // 现代化输入框
  static Widget modernInputField({
    required TextEditingController controller,
    required String hintText,
    required IconData prefixIcon,
    bool obscureText = false,
    TextInputType? keyboardType,
    String? Function(String?)? validator,
    Widget? suffixIcon,
    bool enabled = true,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.14),
        borderRadius: BorderRadius.circular(AppTheme.borderRadiusMedium),
        border: Border.all(
          color: Colors.white.withValues(alpha: 0.3),
          width: 1.2,
        ),
      ),
      child: TextFormField(
        controller: controller,
        obscureText: obscureText,
        keyboardType: keyboardType,
        enabled: enabled,
        style: const TextStyle(color: Colors.white, fontSize: 16),
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: TextStyle(
            color: Colors.white.withValues(alpha: 0.6),
            fontSize: 16,
          ),
          prefixIcon: Icon(
            prefixIcon,
            color: Colors.white.withValues(alpha: 0.95),
            size: 20,
          ),
          suffixIcon: suffixIcon,
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(
            horizontal: AppTheme.spacingM,
            vertical: AppTheme.spacingM,
          ),
        ),
        validator: validator,
      ),
    );
  }

  // 现代化卡片容器
  static Widget modernCard({
    required Widget child,
    EdgeInsetsGeometry? padding,
    double borderRadius = 16.0,
    Color? backgroundColor,
    List<BoxShadow>? boxShadow,
  }) {
    return Container(
      padding: padding ?? const EdgeInsets.all(AppTheme.spacingXL),
      decoration: BoxDecoration(
        color: backgroundColor ?? Colors.white.withValues(alpha: 0.12),
        borderRadius: BorderRadius.circular(borderRadius),
        border: Border.all(
          color: Colors.white.withValues(alpha: 0.28),
          width: 1.2,
        ),
        boxShadow:
            boxShadow ??
            [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.16),
                blurRadius: 24,
                offset: const Offset(0, 10),
              ),
            ],
      ),
      child: child,
    );
  }

  // 现代化Logo容器
  static Widget modernLogo({
    required IconData icon,
    double size = 100,
    double iconSize = 50,
    Color? backgroundColor,
    Color? borderColor,
    List<BoxShadow>? boxShadow,
  }) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: backgroundColor ?? Colors.white.withValues(alpha: 0.22),
        borderRadius: BorderRadius.circular(AppTheme.borderRadiusXLarge),
        border: Border.all(
          color: borderColor ?? Colors.white.withValues(alpha: 0.35),
          width: 2,
        ),
        boxShadow:
            boxShadow ??
            [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.18),
                blurRadius: 22,
                offset: const Offset(0, 10),
              ),
            ],
      ),
      child: Icon(icon, size: iconSize, color: Colors.white),
    );
  }

  // 现代化标题文本
  static Widget modernTitle({
    required String text,
    double fontSize = 32,
    FontWeight fontWeight = FontWeight.bold,
    Color? color,
    double? letterSpacing,
  }) {
    return Text(
      text,
      style: TextStyle(
        fontSize: fontSize,
        fontWeight: fontWeight,
        color: color ?? Colors.white,
        letterSpacing: letterSpacing ?? 1.2,
      ),
    );
  }

  // 现代化副标题文本
  static Widget modernSubtitle({
    required String text,
    double fontSize = 16,
    Color? color,
    double? letterSpacing,
  }) {
    return Text(
      text,
      style: TextStyle(
        fontSize: fontSize,
        color: color ?? Colors.white70,
        letterSpacing: letterSpacing ?? 0.5,
      ),
    );
  }

  // 现代化分割线
  static Widget modernDivider({
    required String text,
    Color? textColor,
    Color? lineColor,
  }) {
    return Row(
      children: [
        Expanded(
          child: Divider(
            color: lineColor ?? Colors.white.withValues(alpha: 0.45),
            thickness: 1,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppTheme.spacingM),
          child: Text(
            text,
            style: TextStyle(
              color: textColor ?? Colors.white.withValues(alpha: 0.92),
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        Expanded(
          child: Divider(
            color: lineColor ?? Colors.white.withValues(alpha: 0.45),
            thickness: 1,
          ),
        ),
      ],
    );
  }

  // 现代化社交登录按钮
  static Widget socialLoginButton({
    required IconData icon,
    required String label,
    required Color color,
    required VoidCallback onTap,
    double size = 50,
    double iconSize = 24,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            width: size,
            height: size,
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(AppTheme.borderRadiusMedium),
              boxShadow: [
                BoxShadow(
                  color: color.withValues(alpha: 0.3),
                  blurRadius: 8,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Icon(icon, color: Colors.white, size: iconSize),
          ),
          const SizedBox(height: AppTheme.spacingS),
          Text(
            label,
            style: TextStyle(
              color: Colors.white.withValues(alpha: 0.8),
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }

  // 现代化复选框
  static Widget modernCheckbox({
    required bool value,
    required ValueChanged<bool?> onChanged,
    Color? activeColor,
    Color? checkColor,
    Color? sideColor,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(AppTheme.borderRadiusSmall),
      ),
      child: Checkbox(
        value: value,
        onChanged: onChanged,
        activeColor: activeColor ?? AppTheme.primaryColor,
        checkColor: checkColor ?? Colors.white,
        side: BorderSide(
          color: sideColor ?? Colors.white.withValues(alpha: 0.3),
          width: 1,
        ),
      ),
    );
  }

  // 现代化文本按钮
  static Widget modernTextButton({
    required String text,
    required VoidCallback onPressed,
    Color? textColor,
    Color? backgroundColor,
    EdgeInsetsGeometry? padding,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: backgroundColor ?? Colors.white.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(AppTheme.borderRadiusSmall),
      ),
      child: TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
          backgroundColor: Colors.transparent,
          padding:
              padding ??
              const EdgeInsets.symmetric(
                horizontal: AppTheme.spacingM,
                vertical: AppTheme.spacingS,
              ),
        ),
        child: Text(
          text,
          style: TextStyle(
            color: textColor ?? AppTheme.primaryColor,
            fontWeight: FontWeight.w600,
            fontSize: 14,
          ),
        ),
      ),
    );
  }
}
