import 'package:flutter/material.dart';
import 'app_theme.dart';

/// 美化的页面头部组件
class BeautifulPageHeader extends StatelessWidget {
  final String title;
  final String? subtitle;
  final IconData? icon;
  final List<Widget>? actions;
  final VoidCallback? onBackPressed;
  final bool showBackButton;
  final Color? backgroundColor;
  final double? height;

  const BeautifulPageHeader({
    super.key,
    required this.title,
    this.subtitle,
    this.icon,
    this.actions,
    this.onBackPressed,
    this.showBackButton = false,
    this.backgroundColor,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height ?? 120, // 增加默认高度
      decoration: BoxDecoration(
        color: backgroundColor ?? AppTheme.primaryColor,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.1),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(AppTheme.spacingL),
          child: Row(
            children: [
              // 返回按钮
              if (showBackButton)
                Container(
                  margin: const EdgeInsets.only(right: AppTheme.spacingM),
                  decoration: BoxDecoration(
                    color: Colors.white.withValues(alpha: 0.2),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: IconButton(
                    icon: const Icon(Icons.arrow_back_ios, color: Colors.white, size: 20),
                    onPressed: onBackPressed ?? () => Navigator.of(context).pop(),
                  ),
                ),
              
              // 图标
              if (icon != null)
                Container(
                  margin: const EdgeInsets.only(right: AppTheme.spacingM),
                  padding: const EdgeInsets.all(AppTheme.spacingS),
                  decoration: BoxDecoration(
                    color: Colors.white.withValues(alpha: 0.2),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Icon(
                    icon,
                    color: Colors.white,
                    size: 24,
                  ),
                ),
              
              // 标题和副标题
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 22, // 稍微减小字体大小
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    if (subtitle != null) ...[
                      const SizedBox(height: 6), // 减少间距
                      Text(
                        subtitle!,
                        style: TextStyle(
                          color: Colors.white.withValues(alpha: 0.9),
                          fontSize: 13, // 稍微减小字体大小
                        ),
                      ),
                    ],
                  ],
                ),
              ),
              
              // 操作按钮
              if (actions != null) ...[
                ...actions!,
              ],
            ],
          ),
        ),
      ),
    );
  }
}

/// 美化的搜索栏组件
class BeautifulSearchBar extends StatelessWidget {
  final String hintText;
  final TextEditingController? controller;
  final VoidCallback? onTap;
  final ValueChanged<String>? onChanged;
  final VoidCallback? onClear;
  final bool enabled;
  final Widget? leading;
  final List<Widget>? actions;

  const BeautifulSearchBar({
    super.key,
    this.hintText = '搜索...',
    this.controller,
    this.onTap,
    this.onChanged,
    this.onClear,
    this.enabled = true,
    this.leading,
    this.actions,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(AppTheme.spacingM),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: TextField(
        controller: controller,
        enabled: enabled,
        onTap: onTap,
        onChanged: onChanged,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: TextStyle(
            color: Colors.grey[500],
            fontSize: 16,
          ),
          prefixIcon: leading ?? Icon(
            Icons.search,
            color: Colors.grey[600],
            size: 20,
          ),
          suffixIcon: actions != null ? Row(
            mainAxisSize: MainAxisSize.min,
            children: actions!,
          ) : null,
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(
            horizontal: AppTheme.spacingM,
            vertical: AppTheme.spacingM,
          ),
        ),
        style: const TextStyle(
          color: Colors.black87,
          fontSize: 16,
        ),
      ),
    );
  }
}

/// 美化的分类标签组件
class BeautifulCategoryTabs extends StatelessWidget {
  final List<String> categories;
  final int selectedIndex;
  final ValueChanged<int> onCategoryChanged;
  final Color? activeColor;
  final Color? inactiveColor;

  const BeautifulCategoryTabs({
    super.key,
    required this.categories,
    required this.selectedIndex,
    required this.onCategoryChanged,
    this.activeColor,
    this.inactiveColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      margin: const EdgeInsets.symmetric(horizontal: AppTheme.spacingM),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (context, index) {
          final isSelected = index == selectedIndex;
          return GestureDetector(
            onTap: () => onCategoryChanged(index),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              margin: const EdgeInsets.only(right: AppTheme.spacingS),
              padding: const EdgeInsets.symmetric(
                horizontal: AppTheme.spacingM,
                vertical: AppTheme.spacingS,
              ),
              decoration: BoxDecoration(
                color: isSelected 
                    ? (activeColor ?? AppTheme.primaryColor)
                    : Colors.grey[100],
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color: isSelected 
                      ? (activeColor ?? AppTheme.primaryColor)
                      : Colors.grey[300]!,
                  width: 1,
                ),
              ),
              child: Center(
                child: Text(
                  categories[index],
                  style: TextStyle(
                    color: isSelected ? Colors.white : Colors.grey[700],
                    fontSize: 14,
                    fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500,
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

/// 美化的标签页组件
class BeautifulTabBar extends StatelessWidget {
  final TabController controller;
  final List<BeautifulTab> tabs;
  final Color? indicatorColor;
  final Color? labelColor;
  final Color? unselectedLabelColor;

  const BeautifulTabBar({
    super.key,
    required this.controller,
    required this.tabs,
    this.indicatorColor,
    this.labelColor,
    this.unselectedLabelColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      margin: const EdgeInsets.all(AppTheme.spacingM),
      child: TabBar(
        controller: controller,
        indicator: BoxDecoration(
          color: indicatorColor ?? AppTheme.primaryColor,
          borderRadius: BorderRadius.circular(12),
        ),
        labelColor: labelColor ?? Colors.white,
        unselectedLabelColor: unselectedLabelColor ?? Colors.grey[600],
        labelStyle: const TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 14,
        ),
        unselectedLabelStyle: const TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 14,
        ),
        tabs: tabs.map((tab) => Tab(
          icon: Icon(tab.icon, size: 20),
          text: tab.label,
        )).toList(),
      ),
    );
  }
}

/// 标签页数据模型
class BeautifulTab {
  final String label;
  final IconData icon;
  final Widget content;

  const BeautifulTab({
    required this.label,
    required this.icon,
    required this.content,
  });
}

/// 美化的浮动操作按钮
class BeautifulFloatingActionButton extends StatelessWidget {
  final VoidCallback onPressed;
  final IconData icon;
  final String? tooltip;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final double? elevation;

  const BeautifulFloatingActionButton({
    super.key,
    required this.onPressed,
    required this.icon,
    this.tooltip,
    this.backgroundColor,
    this.foregroundColor,
    this.elevation,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: backgroundColor ?? AppTheme.primaryColor,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: (backgroundColor ?? AppTheme.primaryColor).withValues(alpha: 0.3),
            blurRadius: 12,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: FloatingActionButton(
        onPressed: onPressed,
        tooltip: tooltip,
        backgroundColor: Colors.transparent,
        foregroundColor: foregroundColor ?? Colors.white,
        elevation: 0,
        child: Icon(icon, size: 24),
      ),
    );
  }
}
