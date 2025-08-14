import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

// 统一的组件库
class PetAppComponents {
  // 卡片组件
  static Widget buildCard({
    required Widget child,
    EdgeInsetsGeometry? padding,
    EdgeInsetsGeometry? margin,
    Color? backgroundColor,
    double? borderRadius,
    VoidCallback? onTap,
  }) {
    return Container(
      margin: margin ?? const EdgeInsets.all(AppTheme.spacingM),
      decoration: BoxDecoration(
        color: backgroundColor ?? AppTheme.surfaceColor,
        borderRadius: BorderRadius.circular(borderRadius ?? AppTheme.borderRadiusMedium),
        boxShadow: AppTheme.cardShadow,
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(borderRadius ?? AppTheme.borderRadiusMedium),
          child: Padding(
            padding: padding ?? const EdgeInsets.all(AppTheme.spacingL),
            child: child,
          ),
        ),
      ),
    );
  }

  // 信息行组件
  static Widget buildInfoRow({
    required String label,
    required String value,
    IconData? icon,
    bool showDivider = true,
  }) {
    return Column(
      children: [
        Row(
          children: [
            if (icon != null) ...[
              Icon(
                icon,
                size: 20,
                color: AppTheme.textSecondaryColor,
              ),
              const SizedBox(width: AppTheme.spacingS),
            ],
            Expanded(
              child: Text(
                label,
                style: TextStyle(
                  color: AppTheme.textSecondaryColor,
                  fontSize: AppTheme.fontSizeS,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Text(
              value,
              style: TextStyle(
                color: AppTheme.textPrimaryColor,
                fontSize: AppTheme.fontSizeM,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
        if (showDivider) ...[
          const SizedBox(height: AppTheme.spacingS),
          Divider(
            color: AppTheme.dividerColor,
            height: 1,
          ),
        ],
      ],
    );
  }

  // 标签组件
  static Widget buildTag({
    required String text,
    Color? backgroundColor,
    Color? textColor,
    VoidCallback? onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: AppTheme.spacingM,
          vertical: AppTheme.spacingS,
        ),
        decoration: BoxDecoration(
          color: backgroundColor ?? AppTheme.primaryLightColor,
          borderRadius: BorderRadius.circular(AppTheme.borderRadiusSmall),
        ),
                  child: Text(
            text,
            style: TextStyle(
              color: textColor ?? AppTheme.primaryColor,
              fontSize: AppTheme.fontSizeS,
              fontWeight: FontWeight.w600,
            ),
          ),
      ),
    );
  }

  // 空状态组件
  static Widget buildEmptyState({
    required String message,
    IconData? icon,
    Widget? actionButton,
  }) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (icon != null) ...[
            Icon(
              icon,
              size: 64,
              color: AppTheme.textLightColor,
            ),
            const SizedBox(height: AppTheme.spacingL),
          ],
          Text(
            message,
            style: TextStyle(
              color: AppTheme.textSecondaryColor,
              fontSize: AppTheme.fontSizeM,
              fontWeight: FontWeight.w500,
            ),
            textAlign: TextAlign.center,
          ),
          if (actionButton != null) ...[
            const SizedBox(height: AppTheme.spacingL),
            actionButton,
          ],
        ],
      ),
    );
  }

  // 加载组件
  static Widget buildLoading({
    String? message,
    Color? color,
  }) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(
              color ?? AppTheme.primaryColor,
            ),
            strokeWidth: 3,
          ),
          if (message != null) ...[
            const SizedBox(height: AppTheme.spacingM),
            Text(
              message,
              style: TextStyle(
                color: AppTheme.textSecondaryColor,
                fontSize: AppTheme.fontSizeM,
              ),
            ),
          ],
        ],
      ),
    );
  }
}
