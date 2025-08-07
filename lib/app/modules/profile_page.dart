import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.person, size: 60, color: Colors.purple),
            SizedBox(height: 20),
            Text('个人页面', style: TextStyle(fontSize: 24)),
          ],
        ),
      ),
    );
  }
}