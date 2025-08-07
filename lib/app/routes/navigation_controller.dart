import 'package:flutter/material.dart';
import '../../app/modules/archive_page.dart';
import '../../app/modules/social_page.dart';
import '../../app/modules/publish_page.dart';
import '../../app/modules/message_page.dart';
import '../../app/modules/profile_page.dart';

class NavigationController extends StatefulWidget {
  const NavigationController({super.key});

  @override
  State<NavigationController> createState() => _NavigationControllerState();
}

class _NavigationControllerState extends State<NavigationController> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    const ArchivePage(),
    const SocialPage(),
    const PublishPage(),
    const MessagePage(),
    const ProfilePage(),
  ];

  final List<BottomNavigationBarItem> _items = [
    BottomNavigationBarItem(
      icon: Icon(Icons.archive),
      label: '档案',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.people),
      label: '社交',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.add_circle),
      label: '发布',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.message),
      label: '消息',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.person),
      label: '个人',
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: _items,
        currentIndex: _currentIndex,
        onTap: _onItemTapped,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,
      ),
    );
  }
}