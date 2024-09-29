import 'package:flutter/material.dart';
import 'package:the_zodiacs/screen/page/home_page.dart';
import 'package:the_zodiacs/screen/page/profile_page.dart';

class BottomNavigationPage extends StatelessWidget {
  final int currentIndex;
  final Function(int) onDestinationSelected;

  const BottomNavigationPage({
    super.key,
    required this.currentIndex,
    required this.onDestinationSelected,
  });

  final List<Widget> pages = const [HomePage(), ProfilePage()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: FractionallySizedBox(
        widthFactor: 0.4,
        child: Container(
          margin: const EdgeInsets.symmetric(vertical: 20.0),
          padding: const EdgeInsets.all(4.0),
          decoration: BoxDecoration(
            color: const Color(0xFFEAE4DD),
            borderRadius: BorderRadius.circular(30.0),
            border: Border.all(
              color: Colors.blueGrey.withOpacity(0.30),
              width: 2.0,
            ),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(50.0),
            child: NavigationBar(
              height: 60.0,
              animationDuration: const Duration(milliseconds: 800),
              selectedIndex: currentIndex,
              onDestinationSelected: onDestinationSelected,
              backgroundColor: const Color(0xFFEAE4DD),
              indicatorColor: const Color(0xFFCDC2A5),
              labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
              indicatorShape: const CircleBorderWithIconSize(iconSize: 60.0),
              destinations: const [
                NavigationDestination(
                  icon: Icon(Icons.home, size: 36.0),
                  label: 'Beranda',
                ),
                NavigationDestination(
                  icon: Icon(Icons.account_circle_rounded, size: 36.0),
                  label: 'Profil',
                ),
              ],
            ),
          ),
        ),
      ),
      body: pages[currentIndex],
    );
  }
}

class CircleBorderWithIconSize extends ShapeBorder {
  final double iconSize;

  const CircleBorderWithIconSize({required this.iconSize});

  @override
  EdgeInsetsGeometry get dimensions => EdgeInsets.all(iconSize / 2);

  @override
  ShapeBorder scale(double t) =>
      CircleBorderWithIconSize(iconSize: iconSize * t);

  @override
  Path getInnerPath(Rect rect, {TextDirection? textDirection}) {
    return Path()
      ..addOval(Rect.fromCircle(center: rect.center, radius: iconSize / 2));
  }

  @override
  Path getOuterPath(Rect rect, {TextDirection? textDirection}) {
    return getInnerPath(rect);
  }

  @override
  void paint(Canvas canvas, Rect rect, {TextDirection? textDirection}) {
    final paint = Paint()
      ..color = Colors.transparent
      ..style = PaintingStyle.fill;
    canvas.drawPath(getOuterPath(rect), paint);
  }
}
