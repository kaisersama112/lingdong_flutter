import 'package:flutter/material.dart';
import '../../../theme/app_theme.dart';

class CategorySelector extends StatelessWidget {
  final List<String> categories;
  final String selectedCategory;
  final ValueChanged<String> onCategoryChanged;
  final Color? activeColor;
  final double height;

  const CategorySelector({
    super.key,
    required this.categories,
    required this.selectedCategory,
    required this.onCategoryChanged,
    this.activeColor,
    this.height = 50,
  });

  @override
  Widget build(BuildContext context) {
    final activeBgColor = activeColor ?? AppTheme.primaryColor;
    
    return Container(
      height: height,
      margin: const EdgeInsets.symmetric(horizontal: AppTheme.spacingM),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (context, index) {
          final category = categories[index];
          final isSelected = category == selectedCategory;
          
          return Container(
            margin: const EdgeInsets.only(right: AppTheme.spacingS),
            child: GestureDetector(
              onTap: () => onCategoryChanged(category),
              child: AnimatedContainer(
                duration: AppTheme.shortAnimation,
                padding: const EdgeInsets.symmetric(
                  horizontal: AppTheme.spacingM,
                  vertical: AppTheme.spacingS,
                ),
                decoration: BoxDecoration(
                  gradient: isSelected 
                      ? LinearGradient(
                          colors: [activeBgColor, activeBgColor.withValues(alpha: 0.8)],
                        )
                      : null,
                  color: isSelected ? null : Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  border: isSelected ? null : Border.all(color: AppTheme.dividerColor),
                  boxShadow: isSelected ? [
                    BoxShadow(
                      color: activeBgColor.withValues(alpha: 0.3),
                      blurRadius: 8,
                      offset: const Offset(0, 2),
                    ),
                  ] : null,
                ),
                child: Center(
                  child: Text(
                    category,
                    style: TextStyle(
                      color: isSelected ? Colors.white : AppTheme.textSecondaryColor,
                      fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500,
                      fontSize: AppTheme.fontSizeS,
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
