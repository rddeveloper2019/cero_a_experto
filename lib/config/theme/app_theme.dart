import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppTheme {
  ThemeData getTheme() {
    const darkColor = Color(0xFF121212);

    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: darkColor,
        statusBarIconBrightness: Brightness.light,
        systemNavigationBarColor: darkColor,
        systemNavigationBarIconBrightness: Brightness.light,
      ),
    );

    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      scaffoldBackgroundColor: darkColor,

      appBarTheme: const AppBarTheme(
        backgroundColor: darkColor,
        elevation: 0,
        scrolledUnderElevation: 0,
        surfaceTintColor: Colors.transparent,
        foregroundColor: Colors.white,
      ),

      colorScheme: ColorScheme.fromSeed(
        seedColor: Colors.blue,
        brightness: Brightness.dark,
        surface: darkColor,
        primary: darkColor,
      ),
    );
  }
}
