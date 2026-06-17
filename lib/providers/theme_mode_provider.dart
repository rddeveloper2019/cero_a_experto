import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ThemeNotifier extends Notifier<ThemeMode> {
  @override
  ThemeMode build() {
    ref.onDispose(() {
      print('ThemeNotifier [onDispose]');
    });
    return ThemeMode.light;
  }

  void toggleThemeMode() => state = state == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
}

final themeModeProvider = NotifierProvider<ThemeNotifier, ThemeMode>(() => ThemeNotifier());
