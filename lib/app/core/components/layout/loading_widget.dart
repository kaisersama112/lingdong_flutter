import 'package:flutter/material.dart';
import '../../../theme/app_theme.dart';

class LoadingWidget extends StatelessWidget {
  final String message;
  final double size;
  final Color? color;

  const LoadingWidget({
    super.key,
    this.message = '加载中...',
    this.size = 40,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: size,
            height: size,
            child: CircularProgressIndicator(
              strokeWidth: 3,
              valueColor: AlwaysStoppedAnimation<Color>(
                color ?? AppTheme.primaryColor,
              ),
            ),
          ),
          const SizedBox(height: AppTheme.spacingM),
          Text(
            message,
            style: TextStyle(
              fontSize: AppTheme.fontSizeM,
              color: AppTheme.textSecondaryColor,
            ),
          ),
        ],
      ),
    );
  }
}
