import 'package:flutter/material.dart';

class MessagePage extends StatelessWidget {
  const MessagePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.message, size: 60, color: Colors.red),
            SizedBox(height: 20),
            Text('消息页面', style: TextStyle(fontSize: 24)),
          ],
        ),
      ),
    );
  }
}