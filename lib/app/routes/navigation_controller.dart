import 'package:flutter/material.dart';
import '../../app/modules/home_page.dart';
import '../../app/modules/social_page.dart';
import '../../app/modules/publish_page.dart';
import '../../app/modules/message_page.dart';
import '../../app/modules/archive_profile_page.dart';

class NavigationController extends StatefulWidget {
  const NavigationController({super.key});

  @override
  State<NavigationController> createState() => _NavigationControllerState();
}

class _NavigationControllerState extends State<NavigationController> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    const HomePage(),
    const SocialPage(),
    const PublishPage(),
    const MessagePage(),
    const ArchiveProfilePage(),
  ];

  final List<BottomNavigationBarItem> _items = [
    BottomNavigationBarItem(
      icon: Icon(Icons.archive),
      label: '首页',
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
      label: '个人、档案',
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