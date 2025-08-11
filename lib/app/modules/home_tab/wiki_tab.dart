import 'package:flutter/material.dart';

class WikiTab extends StatelessWidget {
  const WikiTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: 6,
      itemBuilder: (context, index) {
        return _buildWikiCard(
          title: '百科知识  ${index + 1}',
          description: '这是一个有趣的百科知识，帮助你了解更多信息...',
          category: '知识分类',
          views: (index + 1) * 100,
        );
      },
    );
  }

  Widget _buildWikiCard({
    required String title,
    required String description,
    required String category,
    required int views,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    color: Colors.green[100],
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    category,
                    style: TextStyle(
                      color: Colors.green[700],
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                const Spacer(),
                Icon(Icons.visibility, size: 16, color: Colors.grey[500]),
                const SizedBox(width: 4),
                Text(
                  '$views',
                  style: TextStyle(
                    color: Colors.grey[500],
                    fontSize: 12,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Text(
              title,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              description,
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey[700],
                height: 1.4,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                Icon(Icons.info_outline, size: 16, color: Colors.blue[500]),
                const SizedBox(width: 4),
                Text(
                  '点击了解更多',
                  style: TextStyle(
                    color: Colors.blue[500],
                    fontSize: 12,
                  ),
                ),
                const Spacer(),
                Icon(Icons.arrow_forward_ios, size: 14, color: Colors.grey[400]),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
