import 'package:cero_a_experto/providers/theme_color_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cero_a_experto/config/menu/menu-items.dart';
import 'package:cero_a_experto/presentation/widgets/side_menu.dart';
import 'package:cero_a_experto/presentation/widgets/theme_toggle.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatelessWidget {
  static const String name = 'home_screen';

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        title: Text('Widgets App'),
        actions: [ThemeToggle()],
      ),
      body: _HomeView(),
      drawer: Builder(
        builder: (context) {
          final closeDrawer = scaffoldKey.currentState?.closeDrawer;
          return SideMenu(closeDrawer: closeDrawer);
        },
      ),
    );
  }
}

class _HomeView extends ConsumerWidget {
  const _HomeView({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListView.builder(
      itemCount: appMenuItems.length,
      itemBuilder: (BuildContext context, int index) {
        final MenuItem(
          icon: icon,
          title: title,
          subTitle: subTitle,
          link: link,
        ) = appMenuItems[index];

        return ListTile(
          leading: Icon(
            icon,
            color: ref.watch(themeColorProvider),
          ),
          title: Text(title),
          subtitle: Text(subTitle),
          trailing: Icon(
            Icons.chevron_right_rounded,
            color: ref.watch(themeColorProvider),
          ),
          onTap: () {
            context.push(link);
          },
        );
      },
    );
  }
}
