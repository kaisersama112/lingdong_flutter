import 'package:flutter/material.dart';

class PetNavigationBar extends StatefulWidget {
  final int currentIndex;
  final Function(int) onTap;
  final List<PetNavigationItem> items;

  const PetNavigationBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
    required this.items,
  });

  @override
  State<PetNavigationBar> createState() => _PetNavigationBarState();
}

class _PetNavigationBarState extends State<PetNavigationBar>
    with TickerProviderStateMixin {
  AnimationController? _pawController;
  AnimationController? _bounceController;
  Animation<double>? _pawAnimation;
  Animation<double>? _bounceAnimation;
  Animation<double>? _rotationAnimation;

  @override
  void initState() {
    super.initState();
    _initializeAnimations();
  }

  void _initializeAnimations() {
    _pawController = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );
    _bounceController = AnimationController(
      duration: const Duration(milliseconds: 400),
      vsync: this,
    );

    _pawAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _pawController!, curve: Curves.easeInOut),
    );
    _bounceAnimation = Tween<double>(begin: 1.0, end: 1.3).animate(
      CurvedAnimation(parent: _bounceController!, curve: Curves.elasticOut),
    );
    _rotationAnimation = Tween<double>(begin: 0.0, end: 0.1).animate(
      CurvedAnimation(parent: _bounceController!, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _pawController?.dispose();
    _bounceController?.dispose();
    super.dispose();
  }

  void _onItemTapped(int index) {
    if (index == widget.currentIndex) return;

    _pawController?.forward().then((_) {
      _pawController?.reverse();
    });

    _bounceController?.forward().then((_) {
      _bounceController?.reverse();
    });

    widget.onTap(index);
  }

  @override
  Widget build(BuildContext context) {
    // 确保动画已初始化
    if (_pawAnimation == null ||
        _bounceAnimation == null ||
        _rotationAnimation == null) {
      return Container(
        height: 100,
        color: Colors.white,
        child: const Center(child: CircularProgressIndicator()),
      );
    }

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(32),
          topRight: Radius.circular(32),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.06),
            blurRadius: 20,
            offset: const Offset(0, -4),
            spreadRadius: 0,
          ),
        ],
      ),
      child: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // 爪印装饰线
            Container(
              height: 20,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(7, (index) {
                  return AnimatedBuilder(
                    animation: _pawAnimation!,
                    builder: (context, child) {
                      final delay = index * 0.1;
                      final opacity = _pawAnimation!.value > delay
                          ? (_pawAnimation!.value - delay) * 2
                          : 0.0;

                      return Opacity(
                        opacity: opacity.clamp(0.0, 1.0),
                        child: Container(
                          margin: const EdgeInsets.symmetric(horizontal: 4),
                          child: Icon(
                            Icons.pets,
                            size: 16,
                            color: Colors.grey[300],
                          ),
                        ),
                      );
                    },
                  );
                }),
              ),
            ),
            // 导航项
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: widget.items.asMap().entries.map((entry) {
                  final index = entry.key;
                  final item = entry.value;
                  final isSelected = index == widget.currentIndex;

                  return _buildNavigationItem(index, item, isSelected);
                }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNavigationItem(
    int index,
    PetNavigationItem item,
    bool isSelected,
  ) {
    // 确保动画已初始化
    if (_pawAnimation == null ||
        _bounceAnimation == null ||
        _rotationAnimation == null) {
      return Container();
    }

    return GestureDetector(
      onTap: () => _onItemTapped(index),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        decoration: BoxDecoration(
          gradient: isSelected
              ? LinearGradient(
                  colors: [
                    item.color.withValues(alpha: 0.1),
                    item.color.withValues(alpha: 0.05),
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                )
              : null,
          color: isSelected ? null : Colors.transparent,
          borderRadius: BorderRadius.circular(28),
          border: isSelected
              ? Border.all(color: item.color.withValues(alpha: 0.3), width: 1.5)
              : null,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // 图标和爪印
            Stack(
              alignment: Alignment.center,
              children: [
                // 爪印背景
                if (isSelected) ...[
                  AnimatedBuilder(
                    animation: _pawAnimation!,
                    builder: (context, child) {
                      return Transform.scale(
                        scale: 0.8 + _pawAnimation!.value * 0.2,
                        child: Icon(
                          Icons.pets,
                          size: 40,
                          color: item.color.withValues(alpha: 0.1),
                        ),
                      );
                    },
                  ),
                ],
                // 主图标
                AnimatedBuilder(
                  animation: _bounceAnimation!,
                  builder: (context, child) {
                    return Transform.scale(
                      scale: isSelected ? _bounceAnimation!.value : 1.0,
                      child: Transform.rotate(
                        angle: isSelected ? _rotationAnimation!.value : 0.0,
                        child: Icon(
                          item.icon,
                          color: isSelected ? item.color : Colors.grey[400],
                          size: 28,
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
            const SizedBox(height: 8),
            // 标签文字
            Text(
              item.label,
              style: TextStyle(
                color: isSelected ? item.color : Colors.grey[400],
                fontSize: 12,
                fontWeight: isSelected ? FontWeight.w700 : FontWeight.w500,
                letterSpacing: 0.8,
              ),
            ),
            // 爪印数量指示器
            if (isSelected) ...[
              const SizedBox(height: 6),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: List.generate(item.pawCount, (pawIndex) {
                  return Container(
                    margin: const EdgeInsets.symmetric(horizontal: 1),
                    child: Icon(Icons.pets, size: 8, color: item.color),
                  );
                }),
              ),
            ],
          ],
        ),
      ),
    );
  }
}

class PetNavigationItem {
  final IconData icon;
  final String label;
  final Color color;
  final int pawCount;

  const PetNavigationItem({
    required IconData icon,
    required String label,
    required Color color,
    required this.pawCount,
  }) : icon = icon,
       label = label,
       color = color;
}
