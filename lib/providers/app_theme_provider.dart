import 'package:cero_a_experto/providers/theme_color_provider.dart';
import 'package:cero_a_experto/providers/theme_mode_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final appThemeProvider = Provider<ThemeData>((ref) {
  final themeMode = ref.watch(themeModeProvider);
  final selectedColor = ref.watch(themeColorProvider);
  final isDark = themeMode == ThemeMode.dark;

  return ThemeData(
    useMaterial3: true,

    colorSchemeSeed: selectedColor, // <-- ОДИН seed для обеих тем
    brightness: isDark ? Brightness.dark : Brightness.light,
    iconTheme: IconThemeData(color: selectedColor), // <-- А тут переключаем яркость

    appBarTheme: AppBarTheme(
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: isDark ? Brightness.light : Brightness.dark,
        statusBarBrightness: isDark ? Brightness.dark : Brightness.light,
      ),
    ),
  );
});
