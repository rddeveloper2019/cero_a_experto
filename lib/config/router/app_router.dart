import 'package:flutter/material.dart' show BuildContext;
import 'package:go_router/go_router.dart';
import 'package:cero_a_experto/presentation/screens/screens.dart';

final appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      name: HomeScreen.name,
      builder: (BuildContext context, GoRouterState state) => const HomeScreen(),
      routes: [
        GoRoute(
          path: 'movie/:id',
          name: MovieScreen.name,
          builder: (BuildContext context, GoRouterState state) {
            final movieId = state.pathParameters['id'] ?? 'no-id';

            return MovieScreen(
              movieId: movieId,
            );
          },
        ),
      ],
    ),
  ],
);
