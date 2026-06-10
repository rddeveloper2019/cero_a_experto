import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ButtonsScreen extends StatelessWidget {
  static const String name = 'buttons_screen';

  const ButtonsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Buttons Screen'),
      ),
      body: _ButtonsView(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.pop();
        },
        child: Icon(Icons.chevron_left_outlined),
      ),
    );
  }
}

class _ButtonsView extends StatelessWidget {
  const _ButtonsView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: EdgeInsetsGeometry.all(10),
        child: Wrap(
          spacing: 10,
          crossAxisAlignment: WrapCrossAlignment.center,
          alignment: WrapAlignment.center,
          children: [
            ElevatedButton(onPressed: () {}, child: Text('ElevatedButton')),
            ElevatedButton(onPressed: null, child: Text('ElevatedButton Disabled')),
            ElevatedButton.icon(
              onPressed: () {},
              label: Text('ElevatedButton.icon'),
              icon: Icon(Icons.alarm_add_rounded),
            ),
            FilledButton(onPressed: () {}, child: Text('FilledButton')),
            FilledButton(onPressed: null, child: Text('FilledButton Disabled')),
            FilledButton.icon(onPressed: () {}, label: Text('FilledButton.icon'), icon: Icon(Icons.alarm_add_rounded)),
            OutlinedButton(onPressed: () {}, child: Text('OutlinedButton')),
            OutlinedButton(onPressed: null, child: Text('OutlinedButton Disabled')),
            OutlinedButton.icon(
              onPressed: () {},
              label: Text('OutlinedButton.icon'),
              icon: Icon(Icons.alarm_add_rounded),
            ),
            TextButton(onPressed: () {}, child: Text('TextButton')),
            TextButton(onPressed: null, child: Text('TextButton Disabled')),
            TextButton.icon(onPressed: () {}, label: Text('TextButton.icon'), icon: Icon(Icons.alarm_add_rounded)),
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.alarm_add_rounded),
              style: ButtonStyle(
                backgroundColor: WidgetStateProperty.all(colors.primary),
                iconColor: WidgetStateProperty.all(colors.inversePrimary),
              ),
            ),
            CustomButton(),
          ],
        ),
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return ClipRRect(
      borderRadius: BorderRadiusGeometry.circular(12),
      child: Material(
        color: colors.primary,
        child: InkWell(
          onTap: () {},
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
            child: Text('Custom Button', style: TextStyle(color: colors.inversePrimary)),
          ),
        ),
      ),
    );
  }
}
