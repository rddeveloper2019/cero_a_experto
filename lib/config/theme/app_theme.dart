import 'package:flutter/material.dart';

final List<Color> colors = [
  Colors.deepOrange.shade900,
  Colors.deepPurpleAccent.shade700,
  Colors.yellowAccent.shade700,
  Colors.blueGrey.shade900,
];

class AppTheme {
  final int selectedColor;

  AppTheme({required this.selectedColor})
    : assert(
        selectedColor >= 0 && selectedColor < colors.length,
        "selectedColor must be between or equal 0 and less then ${colors.length}",
      );

  ThemeData theme() {
    return ThemeData(useMaterial3: true, colorScheme: ColorScheme.fromSeed(seedColor: colors[selectedColor]));
  }
}
