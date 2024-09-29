import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        bool isTablet = constraints.maxWidth > 800;

        return Scaffold(
          appBar: AppBar(
            title: const Text('Profile Page'),
            backgroundColor: const Color(0xFFCDC2A5),
            elevation: 4.0,
            toolbarHeight: 40.0,
          ),
          body: Center(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 40.0),
                    width: isTablet ? 400 : 240,
                    height: isTablet ? 400 : 240,
                    child: ClipRRect(
                      borderRadius:
                          BorderRadius.circular(isTablet ? 60.0 : 40.0),
                      child: Image.asset('assets/images/profile_dhirsya.png',
                          fit: BoxFit.cover),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    'Dhirsya Ramadhan Pattah',
                    style: TextStyle(
                      fontSize: isTablet ? 32 : 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'ramadhandhirsya@gmail.com',
                    style: TextStyle(
                      fontSize: isTablet ? 20 : 16,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
