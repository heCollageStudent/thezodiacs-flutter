import 'package:flutter/material.dart';

class NavigationRailMenu extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onDestinationSelected;

  const NavigationRailMenu({
    super.key,
    required this.selectedIndex,
    required this.onDestinationSelected,
  });

  @override
  Widget build(BuildContext context) {
    return NavigationRail(
      selectedIndex: selectedIndex,
      onDestinationSelected: onDestinationSelected,
      destinations: const [
        NavigationRailDestination(
          icon: Icon(Icons.home),
          selectedIcon: Icon(Icons.home_outlined),
          label: Text('Home'),
        ),
        NavigationRailDestination(
          icon: Icon(Icons.person),
          selectedIcon: Icon(Icons.person_outline),
          label: Text('Profile'),
        ),
      ],
    );
  }
}
