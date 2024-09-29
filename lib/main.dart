import 'package:flutter/material.dart';
import 'package:the_zodiacs/screen/navigation/main_nav_menu.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'The Zodiacs',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF295F98)),
        useMaterial3: true,
        primaryColor: const Color(0xFF295F98),
        scaffoldBackgroundColor: const Color(0xFFEAE4DD),
      ),
      home: const MainNavigationPage(),
    );
  }
}
