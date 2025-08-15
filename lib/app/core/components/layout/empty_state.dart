import 'package:flutter/material.dart';
import '../../../theme/app_theme.dart';

class EmptyState extends StatelessWidget {
  final String message;
  final IconData icon;
  final Widget? actionButton;
  final double iconSize;

  const EmptyState({
    super.key,
    required this.message,
    required this.icon,
    this.actionButton,
    this.iconSize = 64,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(AppTheme.spacingL),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: iconSize,
              color: AppTheme.textSecondaryColor.withValues(alpha: 0.5),
            ),
            const SizedBox(height: AppTheme.spacingL),
            Text(
              message,
              style: TextStyle(
                fontSize: AppTheme.fontSizeL,
                color: AppTheme.textSecondaryColor,
                fontWeight: FontWeight.w500,
              ),
              textAlign: TextAlign.center,
            ),
            if (actionButton != null) ...[
              const SizedBox(height: AppTheme.spacingL),
              actionButton!,
            ],
          ],
        ),
      ),
    );
  }
}
