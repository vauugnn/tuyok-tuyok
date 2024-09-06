import 'package:flutter/material.dart';
import 'package:tuyok_mobile/widgets/footer.dart';
import 'package:tuyok_mobile/map_page.dart'; // Import your MapPage
import 'package:tuyok_mobile/profile_page.dart'; // Import your ProfilePage

class FeedPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Feed'),
      ),
      body: const Center(
        child: Text(
          'Feed Content Goes Here',
          style: TextStyle(fontSize: 18),
        ),
      ),
      bottomNavigationBar: Footer(
        currentIndex: 1, // Feed tab is active
        onTap: (index) {
          switch (index) {
            case 0: // Map
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MapPage()),
              );
              break;
            case 1: // Feed (no action needed, already on this page)
              break;
            case 2: // Profile
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ProfilePage()),
              );
              break;
          }
        },
      ),
    );
  }
}
