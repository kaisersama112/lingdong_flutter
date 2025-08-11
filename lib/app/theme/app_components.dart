import 'package:flutter/material.dart';
import 'app_theme.dart';

class AppComponents {
  // 通用卡片组件
  static Widget card({
    required Widget child,
    EdgeInsetsGeometry? margin,
    EdgeInsetsGeometry? padding,
    BoxDecoration? decoration,
    double? borderRadius,
    List<BoxShadow>? shadows,
  }) {
    return Container(
      margin: margin ?? const EdgeInsets.all(AppTheme.spacingM),
      padding: padding ?? const EdgeInsets.all(AppTheme.spacingM),
      decoration: decoration ?? AppTheme.cardDecoration.copyWith(
        borderRadius: BorderRadius.circular(borderRadius ?? AppTheme.borderRadiusLarge),
        boxShadow: shadows ?? AppTheme.cardShadow,
      ),
      child: child,
    );
  }

  // 标题组件
  static Widget heading({
    required String text,
    double? fontSize,
    Color? color,
    FontWeight? fontWeight,
    TextAlign? textAlign,
  }) {
    return Text(
      text,
      style: AppTheme.headingStyle.copyWith(
        fontSize: fontSize ?? AppTheme.fontSizeXXL,
        color: color ?? AppTheme.textPrimaryColor,
        fontWeight: fontWeight ?? FontWeight.w700,
      ),
      textAlign: textAlign,
    );
  }

  // 副标题组件
  static Widget subheading({
    required String text,
    double? fontSize,
    Color? color,
    FontWeight? fontWeight,
    TextAlign? textAlign,
  }) {
    return Text(
      text,
      style: AppTheme.subheadingStyle.copyWith(
        fontSize: fontSize ?? AppTheme.fontSizeXL,
        color: color ?? AppTheme.textPrimaryColor,
        fontWeight: fontWeight ?? FontWeight.w600,
      ),
      textAlign: textAlign,
    );
  }

  // 正文组件
  static Widget bodyText({
    required String text,
    double? fontSize,
    Color? color,
    FontWeight? fontWeight,
    TextAlign? textAlign,
    int? maxLines,
    TextOverflow? overflow,
  }) {
    return Text(
      text,
      style: AppTheme.bodyStyle.copyWith(
        fontSize: fontSize ?? AppTheme.fontSizeM,
        color: color ?? AppTheme.textPrimaryColor,
        fontWeight: fontWeight ?? FontWeight.normal,
      ),
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: overflow,
    );
  }

  // 说明文字组件
  static Widget caption({
    required String text,
    double? fontSize,
    Color? color,
    FontWeight? fontWeight,
    TextAlign? textAlign,
  }) {
    return Text(
      text,
      style: AppTheme.captionStyle.copyWith(
        fontSize: fontSize ?? AppTheme.fontSizeS,
        color: color ?? AppTheme.textSecondaryColor,
        fontWeight: fontWeight ?? FontWeight.normal,
      ),
      textAlign: textAlign,
    );
  }

  // 标签组件
  static Widget tag({
    required String text,
    Color? backgroundColor,
    Color? textColor,
    double? borderRadius,
    EdgeInsetsGeometry? padding,
    VoidCallback? onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: padding ?? const EdgeInsets.symmetric(
          horizontal: AppTheme.spacingM,
          vertical: AppTheme.spacingS,
        ),
        decoration: BoxDecoration(
          color: backgroundColor ?? AppTheme.primaryLightColor,
          borderRadius: BorderRadius.circular(borderRadius ?? AppTheme.borderRadiusMedium),
        ),
        child: Text(
          text,
          style: TextStyle(
            color: textColor ?? AppTheme.primaryColor,
            fontSize: AppTheme.fontSizeS,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }

  // 状态标签组件
  static Widget statusTag({
    required String text,
    required bool isActive,
    Color? activeColor,
    Color? inactiveColor,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AppTheme.spacingS,
        vertical: AppTheme.spacingXS,
      ),
      decoration: BoxDecoration(
        color: isActive 
            ? (activeColor ?? AppTheme.successLightColor)
            : (inactiveColor ?? AppTheme.textLightColor),
        borderRadius: BorderRadius.circular(AppTheme.borderRadiusSmall),
      ),
      child: Text(
        text,
        style: TextStyle(
          fontSize: AppTheme.fontSizeXS,
          color: isActive 
              ? (activeColor ?? AppTheme.successColor)
              : (inactiveColor ?? AppTheme.textSecondaryColor),
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }

  // 图标按钮组件
  static Widget iconButton({
    required IconData icon,
    required VoidCallback onPressed,
    double? size,
    Color? color,
    Color? backgroundColor,
    double? borderRadius,
    EdgeInsetsGeometry? padding,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: backgroundColor ?? AppTheme.surfaceColor,
        borderRadius: BorderRadius.circular(borderRadius ?? AppTheme.borderRadiusMedium),
        boxShadow: AppTheme.subtleShadow,
      ),
      child: IconButton(
        icon: Icon(icon, size: size ?? 24),
        color: color ?? AppTheme.textSecondaryColor,
        onPressed: onPressed,
        padding: padding ?? const EdgeInsets.all(AppTheme.spacingS),
      ),
    );
  }

  // 分割线组件
  static Widget divider({
    double? height,
    double? thickness,
    Color? color,
    EdgeInsetsGeometry? margin,
  }) {
    return Container(
      height: height ?? 1,
      margin: margin ?? const EdgeInsets.symmetric(vertical: AppTheme.spacingM),
      color: color ?? AppTheme.dividerColor,
    );
  }

  // 空状态组件
  static Widget emptyState({
    required IconData icon,
    required String title,
    String? subtitle,
    double? iconSize,
    Color? iconColor,
    VoidCallback? onAction,
    String? actionText,
  }) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            size: iconSize ?? 80,
            color: iconColor ?? AppTheme.textLightColor,
          ),
          const SizedBox(height: AppTheme.spacingM),
          Text(
            title,
            style: AppTheme.subheadingStyle.copyWith(
              color: AppTheme.textSecondaryColor,
            ),
          ),
          if (subtitle != null) ...[
            const SizedBox(height: AppTheme.spacingS),
            Text(
              subtitle,
              style: AppTheme.captionStyle,
              textAlign: TextAlign.center,
            ),
          ],
          if (onAction != null && actionText != null) ...[
            const SizedBox(height: AppTheme.spacingL),
            ElevatedButton(
              onPressed: onAction,
              style: AppTheme.primaryButtonStyle,
              child: Text(actionText),
            ),
          ],
        ],
      ),
    );
  }

  // 加载状态组件
  static Widget loadingState({
    String? message,
    Color? color,
  }) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircularProgressIndicator(
            color: color ?? AppTheme.primaryColor,
          ),
          if (message != null) ...[
            const SizedBox(height: AppTheme.spacingM),
            Text(
              message,
              style: AppTheme.captionStyle,
            ),
          ],
        ],
      ),
    );
  }

  // 错误状态组件
  static Widget errorState({
    required String message,
    String? actionText,
    VoidCallback? onAction,
  }) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.error_outline,
            size: 80,
            color: AppTheme.errorColor,
          ),
          const SizedBox(height: AppTheme.spacingM),
          Text(
            '出错了',
            style: AppTheme.subheadingStyle.copyWith(
              color: AppTheme.errorColor,
            ),
          ),
          const SizedBox(height: AppTheme.spacingS),
          Text(
            message,
            style: AppTheme.captionStyle,
            textAlign: TextAlign.center,
          ),
          if (onAction != null && actionText != null) ...[
            const SizedBox(height: AppTheme.spacingL),
            ElevatedButton(
              onPressed: onAction,
              style: AppTheme.primaryButtonStyle,
              child: Text(actionText),
            ),
          ],
        ],
      ),
    );
  }

  // 渐变背景组件
  static Widget gradientBackground({
    required Widget child,
    List<Color>? colors,
    AlignmentGeometry? begin,
    AlignmentGeometry? end,
  }) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: colors ?? [AppTheme.primaryColor, AppTheme.primaryDarkColor],
          begin: begin ?? Alignment.topLeft,
          end: end ?? Alignment.bottomRight,
        ),
      ),
      child: child,
    );
  }

  // 圆角图片组件
  static Widget roundedImage({
    required String imageUrl,
    double? width,
    double? height,
    double? borderRadius,
    BoxFit? fit,
    Widget? placeholder,
    Widget? errorWidget,
  }) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadius ?? AppTheme.borderRadiusMedium),
        image: DecorationImage(
          image: NetworkImage(imageUrl),
          fit: fit ?? BoxFit.cover,
        ),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(borderRadius ?? AppTheme.borderRadiusMedium),
        child: placeholder ?? Container(
          color: AppTheme.backgroundColor,
          child: Icon(
            Icons.image,
            color: AppTheme.textLightColor,
          ),
        ),
      ),
    );
  }

  // 信息行组件
  static Widget infoRow({
    required String label,
    required String value,
    double? labelWidth,
    TextStyle? labelStyle,
    TextStyle? valueStyle,
    Widget? trailing,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: AppTheme.spacingS),
      child: Row(
        children: [
          SizedBox(
            width: labelWidth ?? 80,
            child: Text(
              label,
              style: labelStyle ?? AppTheme.captionStyle.copyWith(
                color: AppTheme.textSecondaryColor,
              ),
            ),
          ),
          Expanded(
            child: Text(
              value,
              style: valueStyle ?? AppTheme.bodyStyle,
            ),
          ),
          if (trailing != null) trailing,
        ],
      ),
    );
  }
}
