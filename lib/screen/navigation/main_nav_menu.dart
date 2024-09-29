import 'package:flutter/material.dart';
import 'package:the_zodiacs/screen/page/home_page.dart';
import 'package:the_zodiacs/screen/page/profile_page.dart';

import 'bottom_nav_menu.dart';

class MainNavigationPage extends StatefulWidget {
  const MainNavigationPage({super.key});

  @override
  State<MainNavigationPage> createState() => _MainNavigationPageState();
}

class _MainNavigationPageState extends State<MainNavigationPage> {
  int myCurrentIndex = 0;
  final List<Widget> pages = const [HomePage(), ProfilePage()];

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth > 800) {
          return Scaffold(
            body: Row(
              children: [
                NavigationRail(
                  selectedIndex: myCurrentIndex,
                  onDestinationSelected: (index) {
                    setState(() {
                      myCurrentIndex = index;
                    });
                  },
                  labelType: NavigationRailLabelType.all,
                  leading: const Icon(Icons.menu_rounded),
                  destinations: const [
                    NavigationRailDestination(
                      icon: Icon(Icons.home),
                      selectedIcon: Icon(Icons.home_filled),
                      label: Text('Beranda'),
                    ),
                    NavigationRailDestination(
                      icon: Icon(Icons.account_circle),
                      selectedIcon: Icon(Icons.account_circle_rounded),
                      label: Text('Profil'),
                    ),
                  ],
                ),
                const VerticalDivider(thickness: 1, width: 1),
                Expanded(child: pages[myCurrentIndex]),
              ],
            ),
          );
        } else {
          return BottomNavigationPage(
            currentIndex: myCurrentIndex,
            onDestinationSelected: (index) {
              setState(() {
                myCurrentIndex = index;
              });
            },
          );
        }
      },
    );
  }
}
