import 'package:flutter/material.dart' show IconData, Icons;

class MenuItem {
  final String title;
  final String subTitle;
  final String link;
  final IconData icon;

  const MenuItem({
    required this.title,
    required this.subTitle,
    required this.link,
    required this.icon,
  });
}

const appMenuItems = <MenuItem>[
  MenuItem(
    title: 'Buttons',
    subTitle: 'Various buttons in Flutter',
    link: '/buttons',
    icon: Icons.smart_button_outlined,
  ),

  MenuItem(
    title: 'Cards',
    subTitle: 'A styled container',
    link: '/cards',
    icon: Icons.credit_card,
  ),
  MenuItem(
    title: 'ProgressIndicator',
    subTitle: 'General and controlled',
    link: '/progress',
    icon: Icons.refresh_rounded,
  ),
  MenuItem(
    title: 'Snackbars',
    subTitle: 'Snack Bar',
    link: '/snackbars',
    icon: Icons.info_outline,
  ),
  MenuItem(
    title: 'Animated Container',
    subTitle: 'Animated statefull widget',
    link: '/animated',
    icon: Icons.check_box_outline_blank_outlined,
  ),
  MenuItem(
    title: 'UI Controls',
    subTitle: 'Checkbox Radio + Tiles',
    link: '/ui-controls',
    icon: Icons.check_box_outlined,
  ),
  MenuItem(
    title: 'App Tutorial',
    subTitle: 'PageView',
    link: '/app-tutorial',
    icon: Icons.app_blocking,
  ),
  MenuItem(
    title: 'Infinite Scroll PULL',
    subTitle: 'Infinite Scroll + Pull to refresh',
    link: '/infinite',
    icon: Icons.list_alt_rounded,
  ),
  MenuItem(
    title: 'Riverpod Counter',
    subTitle: 'Riverpod Simple Counter App',
    link: '/counter',
    icon: Icons.numbers_outlined,
  ),
  MenuItem(
    title: 'Theme Changer',
    subTitle: 'Riverpod Theme Changer Screen',
    link: '/theme-changer',
    icon: Icons.color_lens_outlined,
  ),
];
