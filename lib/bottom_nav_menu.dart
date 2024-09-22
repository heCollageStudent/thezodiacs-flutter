import 'package:flutter/material.dart';
import 'package:the_zodiacs/screen/home_page.dart';
import 'package:the_zodiacs/screen/profile_page.dart';

class BottomNavigationPage extends StatefulWidget {
  const BottomNavigationPage({super.key});

  @override
  State<BottomNavigationPage> createState() => _BottomNavigationPageState();
}

class _BottomNavigationPageState extends State<BottomNavigationPage> {
  int myCurrentIndex = 0;
  NavigationDestinationLabelBehavior labelBehavior =
      NavigationDestinationLabelBehavior.alwaysHide;
  List pages = const [HomePage(), ProfilePage()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        margin: const EdgeInsets.symmetric(horizontal: 110.5, vertical: 40.0),
        decoration: const BoxDecoration(boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 30,
            offset: Offset(
              0,
              20,
            ),
          )
        ]),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(80.0),
          child: NavigationBar(
            animationDuration: const Duration(milliseconds: 1000),
            selectedIndex: myCurrentIndex,
            onDestinationSelected: (index) {
              setState(() {
                myCurrentIndex = index;
              });
            },
            backgroundColor: Colors.white,
            overlayColor:
                const WidgetStatePropertyAll<Color>(Colors.transparent),
            indicatorColor: Colors.cyan,
            labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
            indicatorShape: const CustomCircleIndicator(radius: 48.0),
            destinations: const [
              NavigationDestination(
                icon: Icon(
                  Icons.home,
                  size: 50.0,
                ),
                label: 'Beranda',
              ),
              NavigationDestination(
                icon: Icon(
                  Icons.account_circle_rounded,
                  size: 50.0,
                ),
                label: 'Profil',
              )
            ],
          ),
        ),
      ),
      body: pages[myCurrentIndex],
    );
  }
}

class CustomCircleIndicator extends ShapeBorder {
  final double radius;

  const CustomCircleIndicator({this.radius = 24.0});

  @override
  EdgeInsetsGeometry get dimensions => EdgeInsets.all(radius);

  @override
  ShapeBorder scale(double t) => CustomCircleIndicator(radius: radius * t);

  @override
  Path getInnerPath(Rect rect, {TextDirection? textDirection}) {
    return Path()
      ..addOval(Rect.fromCircle(center: rect.center, radius: radius));
  }

  @override
  Path getOuterPath(Rect rect, {TextDirection? textDirection}) {
    return getInnerPath(rect);
  }

  @override
  void paint(Canvas canvas, Rect rect, {TextDirection? textDirection}) {
    final paint = Paint()
      ..color = Colors.cyan
      ..style = PaintingStyle.fill;

    canvas.drawPath(getOuterPath(rect), paint);
  }
}
