import 'package:flutter/material.dart';

class SideMenu extends StatefulWidget {
  const SideMenu({super.key});

  @override
  State<SideMenu> createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {
  int navDrawerIndex = 0;
  @override
  Widget build(BuildContext context) {
    return NavigationDrawer(
      selectedIndex: navDrawerIndex,
      header: SafeArea(child: Text('NavigationDrawer header')),
      footer: SafeArea(child: Text('NavigationDrawer footer')),
      onDestinationSelected: (value) {
        setState(() {
          navDrawerIndex = value;
        });
      },
      children: [
        NavigationDrawerDestination(icon: Icon(Icons.home_outlined), label: Text('Home screen')),
        NavigationDrawerDestination(
          icon: Icon(Icons.add_shopping_cart_rounded),
          label: Text('Otra Pantalla'),
        ),
      ],
      // appMenuItems.map((item) {
      //   return Text('ok');
      // }),
    );
  }
}
