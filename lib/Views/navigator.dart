// ignore_for_file: prefer_const_constructors

import 'package:ener_personalcare/util/emoticon_face.dart';
import 'package:ener_personalcare/util/main_activity.dart';
import 'package:flutter/material.dart';
import 'package:ener_personalcare/Controllers/user.dart';
import 'health-insert.dart';
import 'setting.dart';
import 'home.dart';

class NavigationActivity extends StatefulWidget {
  const NavigationActivity({super.key});

  @override
  State<NavigationActivity> createState() => _NavigationActivityState();
}

class _NavigationActivityState extends State<NavigationActivity> {
  // @override
  // Future logout() async {
  //   await User.setsignin(false);
  //   Navigator.pushNamed(context, 'login');
  // }

  int _selectedIndex = 0;
  PageController _pageController = PageController();

  List<Widget> _page = [
    HomeScreen(),
    healthInsert(),
    SettingBtn(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    _pageController.jumpToPage(_selectedIndex);
    // _pageController.animateToPage(_selectedIndex,
    //     curve: Curves.decelerate, duration: Duration(milliseconds: 250));
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      // body: _page[_selectedIndex],
      body: PageView(
        controller: _pageController,
        children: _page,
        physics: NeverScrollableScrollPhysics(),
        // physics: NeverScrollableScrollPhysics(),AlwaysScrollableScrollPhysics,BouncingScrollPhysics,ClampingScrollPhysics,FixedExtentScrollPhysics
      ),
      backgroundColor: Colors.blue[800],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue[400],
        onTap: _onItemTapped,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.heart_broken), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: ''),
          // BottomNavigationBarItem(
          //     icon: Icon(Icons.exit_to_app_rounded), label: 'Logout'),
        ],
      ),
    );
  }
}
