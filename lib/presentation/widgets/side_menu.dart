import 'package:cero_a_experto/providers/theme_color_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cero_a_experto/config/menu/menu-items.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SideMenu extends ConsumerStatefulWidget {
  final void Function()? closeDrawer;
  const SideMenu({super.key, required this.closeDrawer});

  @override
  ConsumerState<SideMenu> createState() => _SideMenuState();
}

class _SideMenuState extends ConsumerState<SideMenu> {
  int navDrawerIndex = 0;
  @override
  Widget build(BuildContext context) {
    final viewPadding = MediaQuery.of(context).viewPadding;

    return NavigationDrawer(
      selectedIndex: navDrawerIndex,
      header: Padding(padding: viewPadding, child: Text('Widgets App Menu')),
      footer: Padding(
        padding: viewPadding,
        child: IconButton(
          onPressed: () {},
          icon: Icon(Icons.logout_outlined),
        ),
      ),

      onDestinationSelected: (value) {
        setState(() {
          navDrawerIndex = value;
        });

        context.push(appMenuItems[value].link);

        if (widget.closeDrawer != null) {
          widget.closeDrawer!();
        }
      },

      children: [
        ...appMenuItems
            .sublist(0, 3)
            .map(
              (item) => NavigationDrawerDestination(
                icon: Icon(
                  item.icon,
                  color: ref.watch(themeColorProvider),
                ),
                label: Text(item.title),
              ),
            ),

        Padding(padding: EdgeInsetsGeometry.fromLTRB(28, 16, 28, 10), child: Divider()),
        Padding(padding: EdgeInsetsGeometry.fromLTRB(28, 16, 28, 10), child: Text('More options')),

        ...appMenuItems
            .sublist(3)
            .map(
              (item) => NavigationDrawerDestination(
                icon: Icon(
                  item.icon,
                  color: ref.watch(themeColorProvider),
                ),
                label: Text(item.title),
              ),
            ),
      ],
      // appMenuItems.map((item) {
      //   return Text('ok');
      // }),
    );
  }
}
