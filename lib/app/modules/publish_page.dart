import 'package:flutter/material.dart';

class PublishPage extends StatelessWidget {
  const PublishPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.add_circle, size: 60, color: Colors.orange),
            SizedBox(height: 20),
            Text('发布页面', style: TextStyle(fontSize: 24)),
          ],
        ),
      ),
    );
  }
}