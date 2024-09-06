import 'package:flutter/material.dart';

class Footer extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTap;

  const Footer({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: onTap,
      selectedItemColor: Colors.orange,
      unselectedItemColor: Colors.grey,
      showSelectedLabels: true,
      showUnselectedLabels: true,
      type: BottomNavigationBarType.fixed,
      items: [
        BottomNavigationBarItem(icon: Icon(Icons.location_on), label: 'Map'),
        BottomNavigationBarItem(icon: Icon(Icons.message), label: 'Feed'),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
      ],
    );
  }
}
