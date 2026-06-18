import 'package:flutter/material.dart';

class CustomBottomNavigation extends StatelessWidget {
  const CustomBottomNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      elevation: 0,
      items: [
        const BottomNavigationBarItem(icon: Icon(Icons.home_max), label: 'Home'),
        const BottomNavigationBarItem(icon: Icon(Icons.label_outline), label: 'Categories'),
        const BottomNavigationBarItem(icon: Icon(Icons.favorite_border), label: 'Favorites'),
      ],
    );
  }
}
