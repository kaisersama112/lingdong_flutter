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
    PublishPage(),
    const MessagePage(),
    const ArchiveProfilePage(),
  ];

  final List<BottomNavigationBarItem> _items = const [
    BottomNavigationBarItem(
      icon: Icon(Icons.home_outlined),
      activeIcon: Icon(Icons.home),
      label: '首页',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.people_alt_outlined),
      activeIcon: Icon(Icons.people),
      label: '社交',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.pets),
      activeIcon: Icon(Icons.pets),
      label: '发布',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.chat_bubble_outline),
      activeIcon: Icon(Icons.chat_bubble),
      label: '消息',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.person_outline),
      activeIcon: Icon(Icons.person),
      label: '档案',
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  bool _handlePopIntent() {
    if (_currentIndex != 0) {
      setState(() => _currentIndex = 0);
      return false;
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: _currentIndex == 0,
      onPopInvokedWithResult: (didPop, result) {
        if (didPop) return;
        _handlePopIntent();
      },
      child: Scaffold(
        body: _pages[_currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          items: _items,
          currentIndex: _currentIndex,
          onTap: _onItemTapped,
          selectedItemColor: Colors.blue,
          unselectedItemColor: Colors.grey,
          type: BottomNavigationBarType.fixed,
          showSelectedLabels: true,
          showUnselectedLabels: true,
        ),
      ),
    );
  }
}
