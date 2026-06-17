import 'package:cero_a_experto/config/theme/color_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ThemeColorNotifier extends Notifier<Color> {
  @override
  Color build() {
    ref.onDispose(() {
      print('ThemeNotifier [onDispose]');
    });
    return colorList[0];
  }

  void setThemeColor(Color color) => state = color;
}

final themeColorProvider = NotifierProvider<ThemeColorNotifier, Color>(() => ThemeColorNotifier());
