import 'package:cero_a_experto/config/menu/menu-items.dart';
import 'package:cero_a_experto/presentation/widgets/side_menu.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatelessWidget {
  static const String name = 'home_screen';

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Widgets App'),
      ),
      body: _HomeView(),
      drawer: SideMenu(),
    );
  }
}

class _HomeView extends StatelessWidget {
  const _HomeView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: appMenuItems.length,
      itemBuilder: (BuildContext context, int index) {
        final MenuItem(
          icon: icon,
          title: title,
          subTitle: subTitle,
          link: link,
        ) = appMenuItems[index];

        final ColorScheme(primary: primaryColor) = Theme.of(context).colorScheme;

        return ListTile(
          leading: Icon(
            icon,
            color: primaryColor,
          ),
          title: Text(title),
          subtitle: Text(subTitle),
          trailing: Icon(
            Icons.chevron_right_rounded,
            color: primaryColor,
          ),
          onTap: () {
            context.push(link);
          },
        );
      },
    );
  }
}
