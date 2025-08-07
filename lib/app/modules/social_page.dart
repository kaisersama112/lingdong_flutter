import 'package:flutter/material.dart';

class SocialPage extends StatelessWidget {
  const SocialPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.people, size: 60, color: Colors.green),
            SizedBox(height: 20),
            Text('社交页面', style: TextStyle(fontSize: 24)),
          ],
        ),
      ),
    );
  }
}