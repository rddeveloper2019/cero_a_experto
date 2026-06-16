import 'package:flutter/material.dart' show BuildContext;
import 'package:go_router/go_router.dart';
import 'package:cero_a_experto/presentation/screens/screens.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: '/',
  routes: <RouteBase>[
    GoRoute(
      name: HomeScreen.name,
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return const HomeScreen();
      },
    ),
    GoRoute(
      name: ButtonsScreen.name,
      path: '/buttons',
      builder: (BuildContext context, GoRouterState state) {
        return const ButtonsScreen();
      },
    ),
    GoRoute(
      name: CardsScreen.name,
      path: '/cards',
      builder: (BuildContext context, GoRouterState state) {
        return const CardsScreen();
      },
    ),
    GoRoute(
      name: ProgressScreen.name,
      path: '/progress',
      builder: (BuildContext context, GoRouterState state) {
        return const ProgressScreen();
      },
    ),
    GoRoute(
      name: SnackbarScreen.name,
      path: '/snackbars',
      builder: (BuildContext context, GoRouterState state) {
        return const SnackbarScreen();
      },
    ),
  ],
);
