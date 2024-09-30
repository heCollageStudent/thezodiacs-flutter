import 'package:flutter/material.dart';
import 'package:the_zodiacs/screen/navigation/bottom_nav_menu.dart';
import 'package:the_zodiacs/screen/page/home_page.dart';
import 'package:the_zodiacs/screen/page/profile_page.dart';

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
        double navRailWidth =
            constraints.maxWidth > 800 ? 80 : constraints.maxWidth * 0.15;
        double iconSize = constraints.maxWidth > 800 ? 26 : 18;
        double fontSize = constraints.maxWidth > 800 ? 14 : 12;

        // Mode tablet
        if (constraints.maxWidth > 800) {
          return Scaffold(
            body: SafeArea(
              child: Row(
                children: [
                  NavigationRail(
                    minWidth: navRailWidth,
                    selectedIndex: myCurrentIndex,
                    indicatorColor: const Color(0xFFCDC2A5),
                    onDestinationSelected: (index) {
                      setState(() {
                        myCurrentIndex = index;
                      });
                    },
                    labelType: NavigationRailLabelType.all,
                    leading: Icon(
                      Icons.menu_rounded,
                      size: iconSize,
                    ),
                    destinations: [
                      NavigationRailDestination(
                        icon: Icon(
                          Icons.home,
                          size: iconSize,
                        ),
                        selectedIcon: Icon(
                          Icons.home,
                          size: iconSize,
                        ),
                        label: Text(
                          'Beranda',
                          style: TextStyle(fontSize: fontSize),
                        ),
                      ),
                      NavigationRailDestination(
                        icon: Icon(
                          Icons.account_circle,
                          size: iconSize,
                        ),
                        selectedIcon: Icon(
                          Icons.account_circle,
                          size: iconSize,
                        ),
                        label: Text(
                          'Profil',
                          style: TextStyle(fontSize: fontSize),
                        ),
                      ),
                    ],
                  ),
                  const VerticalDivider(thickness: 1, width: 1),
                  Expanded(
                    child: SafeArea(
                      child: pages[myCurrentIndex],
                    ),
                  ),
                ],
              ),
            ),
          );
        }
        // Mode mobile
        else {
          return BottomNavigationPage(
              currentIndex: myCurrentIndex,
              onDestinationSelected: (index) {
                setState(() {
                  myCurrentIndex = index;
                });
              });
        }
      },
    );
  }
}
