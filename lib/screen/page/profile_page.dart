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
            // Memastikan seluruh konten berada di tengah
            child: SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: constraints.maxHeight,
                ),
                child: IntrinsicHeight(
                  // Membuat Column menyesuaikan dengan tinggi konten
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment
                        .center, // Pusatkan isi Column secara vertikal
                    children: [
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 40.0),
                        width: isTablet ? 250 : 240,
                        height: isTablet ? 250 : 240,
                        child: ClipRRect(
                          borderRadius:
                              BorderRadius.circular(isTablet ? 60.0 : 40.0),
                          child: Image.asset(
                              'assets/images/profile_dhirsya.png',
                              fit: BoxFit.cover),
                        ),
                      ),
                      const SizedBox(height: 20),
                      Text(
                        'Dhirsya Ramadhan Pattah',
                        style: TextStyle(
                          fontSize: isTablet ? 30 : 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        'ramadhandhirsya@gmail.com',
                        style: TextStyle(
                          fontSize: isTablet ? 24 : 16,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
