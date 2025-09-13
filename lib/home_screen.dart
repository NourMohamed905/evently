import 'package:evently/app_theme.dart';
import 'package:evently/event/create_event.dart';
import 'package:evently/tabs/home_tab/home_tab.dart';
import 'package:evently/tabs/love_tab/love_tab.dart';
import 'package:evently/tabs/map_tab/map_tab.dart';
import 'package:evently/nav_bar_icon.dart';
import 'package:evently/tabs/profile_tab/profile_tab.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = '/home';

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;
  List<Widget> tabs = [HomeTab(), mapTab(), LoveTab(), profileTab()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: tabs[currentIndex],
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        notchMargin: 8,
        clipBehavior: Clip.antiAlias,
        padding: EdgeInsets.zero,
        color: AppTheme.primaryColor,
        child: BottomNavigationBar(
          elevation: 0,
          currentIndex: currentIndex,
          onTap: (index) {
            if (currentIndex == index) return;
            currentIndex = index;
            setState(() {});
          },
          items: [
            BottomNavigationBarItem(
              icon: NavBarIcons(iconName: 'home'),
              activeIcon: NavBarIcons(iconName: 'home_active'),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: NavBarIcons(iconName: 'map'),
              activeIcon: NavBarIcons(iconName: 'map_active'),
              label: 'Map',
            ),
            BottomNavigationBarItem(
              icon: NavBarIcons(iconName: 'love'),
              activeIcon: NavBarIcons(iconName: 'love_active'),
              label: 'Love',
            ),
            BottomNavigationBarItem(
              icon: NavBarIcons(iconName: 'profile'),
              activeIcon: NavBarIcons(iconName: 'profile_active'),
              label: 'Profile',
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pushNamed(CreateEvent.routeName);
        },
        child: Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
