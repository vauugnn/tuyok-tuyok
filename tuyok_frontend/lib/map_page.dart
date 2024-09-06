import 'package:flutter/material.dart';
import 'package:tuyok_mobile/widgets/footer.dart';
import 'package:tuyok_mobile/feed_page.dart';
import 'package:tuyok_mobile/profile_page.dart';

class MapPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Search Route'),
          actions: [
            IconButton(
              icon: const Icon(Icons.search),
              onPressed: () {
                print('Search button is pressed');
              },
            ),
          ],
        ),
        body: Stack(
          children: [
            Container(
              color: Colors.grey[200],
              child: const Center(
                child: Text(
                  "Map will be displayed here",
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ),
          ],
        ),
        bottomNavigationBar: Footer(
            currentIndex: 0,
            onTap: (index) {
              switch (index) {
                case 0: // Map (no action needed, already on this page)
                  break;
                case 1: // Feed
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => FeedPage()),
                  );
                  break;
                case 2: // Profile
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ProfilePage()),
                  );
                  break;
              }
            }));
  }
}
