import 'package:flutter/material.dart';

class WikiSearchFilters extends StatelessWidget {
  final String selectedSize;
  final String searchQuery;
  final List<String> sizes;
  final ValueChanged<String> onSizeChanged;
  final ValueChanged<String> onSearchChanged;

  const WikiSearchFilters({
    super.key,
    required this.selectedSize,
    required this.searchQuery,
    required this.sizes,
    required this.onSizeChanged,
    required this.onSearchChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // 搜索框
        Container(
          decoration: BoxDecoration(
            color: Color(0xFFF9FAFB),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Color(0xFFE5E7EB), width: 1),
          ),
          child: TextField(
            decoration: InputDecoration(
              hintText: '搜索犬种名称或别名...',
              hintStyle: TextStyle(color: Color(0xFF9CA3AF), fontSize: 14),
              prefixIcon: Icon(
                Icons.search,
                color: Color(0xFF9CA3AF),
                size: 20,
              ),
              border: InputBorder.none,
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 12,
              ),
            ),
            style: const TextStyle(fontSize: 14, color: Color(0xFF1F2937)),
            onChanged: onSearchChanged,
          ),
        ),

        const SizedBox(height: 16),

        // 分类标签
        SizedBox(
          height: 32,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: sizes.length,
            itemBuilder: (_, i) {
              final s = sizes[i];
              final selected = s == selectedSize;

              return Container(
                margin: EdgeInsets.only(right: i == sizes.length - 1 ? 0 : 8),
                child: GestureDetector(
                  onTap: () => onSizeChanged(s),
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 200),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 6,
                    ),
                    decoration: BoxDecoration(
                      color: selected ? Color(0xFF8B5CF6) : Colors.white,
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(
                        color: selected ? Color(0xFF8B5CF6) : Color(0xFFE5E7EB),
                        width: 1,
                      ),
                      boxShadow: selected
                          ? [
                              BoxShadow(
                                color: Color(0xFF8B5CF6).withValues(alpha: 0.2),
                                blurRadius: 4,
                                offset: const Offset(0, 2),
                              ),
                            ]
                          : null,
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        if (s != '全部')
                          Padding(
                            padding: const EdgeInsets.only(right: 6),
                            child: Icon(
                              Icons.pets,
                              size: 14,
                              color: selected
                                  ? Colors.white
                                  : Color(0xFF6B7280),
                            ),
                          ),
                        Text(
                          s,
                          style: TextStyle(
                            color: selected ? Colors.white : Color(0xFF6B7280),
                            fontWeight: selected
                                ? FontWeight.w600
                                : FontWeight.w500,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
