// lib/navigation/navbar.dart
import 'package:flutter/material.dart';

class NavBar extends StatelessWidget {
  final int currentIndex;
  final void Function(int) onTap;

  const NavBar({super.key, required this.currentIndex, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: onTap,
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
        BottomNavigationBarItem(
          icon: Icon(Icons.sports_cricket),
          label: 'Drafts',
        ),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Players'),
      ],
    );
  }
}
