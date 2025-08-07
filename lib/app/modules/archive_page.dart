import 'package:flutter/material.dart';

class ArchivePage extends StatelessWidget {
  const ArchivePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.archive, size: 60, color: Colors.blue),
            SizedBox(height: 20),
            Text('档案页面', style: TextStyle(fontSize: 24)),
          ],
        ),
      ),
    );
  }
}