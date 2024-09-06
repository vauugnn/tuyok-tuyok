import 'package:flutter/material.dart';
import 'package:tuyok_mobile/widgets/footer.dart';
import 'package:tuyok_mobile/map_page.dart'; // Import your MapPage
import 'package:tuyok_mobile/feed_page.dart'; // Import your FeedPage

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      body: const Center(
        child: Text(
          'Profile Content Goes Here',
          style: TextStyle(fontSize: 18),
        ),
      ),
      bottomNavigationBar: Footer(
        currentIndex: 2, // Profile tab is active
        onTap: (index) {
          switch (index) {
            case 0: // Map
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MapPage()),
              );
              break;
            case 1: // Feed
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => FeedPage()),
              );
              break;
            case 2: // Profile (no action needed, already on this page)
              break;
          }
        },
      ),
    );
  }
}
