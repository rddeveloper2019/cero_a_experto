import 'package:cero_a_experto/config/router/app_router.dart';
import 'package:cero_a_experto/providers/app_theme_provider.dart';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(
    ProviderScope(child: const MyApp()),
  );
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp.router(
      title: 'Flutter Widgets',
      debugShowCheckedModeBanner: false,

      theme: ref.watch(appThemeProvider),
      routerConfig: appRouter,
    );
  }
}
