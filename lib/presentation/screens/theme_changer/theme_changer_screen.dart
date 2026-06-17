import 'package:cero_a_experto/config/theme/color_list.dart';
import 'package:cero_a_experto/presentation/widgets/theme_toggle.dart';
import 'package:cero_a_experto/providers/theme_color_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';

class ThemeChangerScreen extends ConsumerWidget {
  static const name = 'theme-changer';
  const ThemeChangerScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeColor = ref.watch(themeColorProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text('Theme Changer'),
        actions: [
          ThemeToggle(),
        ],
      ),
      body: RadioGroup(
        onChanged: (value) {
          if (value != null) {
            ref.read(themeColorProvider.notifier).setThemeColor(value);
          }
        },
        groupValue: themeColor,
        child: ListView.builder(
          itemCount: colorList.length,
          itemBuilder: (BuildContext context, int index) {
            final Color color = colorList[index];

            return _ColorButton(color: color);
          },
        ),
      ),
    );
  }
}

class _ColorButton extends StatelessWidget {
  const _ColorButton({
    super.key,
    required this.color,
  });
  final Color color;

  @override
  Widget build(BuildContext context) {
    return RadioListTile<Color>(
      value: color,
      title: Container(
        height: 50,
        decoration: BoxDecoration(color: color, borderRadius: BorderRadius.circular(12)),
        child: Center(
          child: Container(
            padding: EdgeInsets.all(5),
            color: Theme.of(context).scaffoldBackgroundColor,
            child: Text(
              color.toARGB32().toString(),
              // style: TextStyle(color: Colors.black),
            ),
          ),
        ),
      ),

      activeColor: color,
    );
  }
}
