import 'package:cero_a_experto/providers/theme_mode_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ThemeToggle extends ConsumerWidget {
  const ThemeToggle({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(themeModeProvider);
    final iconData = themeMode == ThemeMode.light ? Icons.dark_mode_outlined : Icons.light_mode_outlined;
    return IconButton(
      onPressed: ref.read(themeModeProvider.notifier).toggleThemeMode,
      icon: Icon(iconData),
    );
  }
}
