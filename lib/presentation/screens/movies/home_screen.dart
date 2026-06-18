import 'package:cero_a_experto/presentation/providers/movies/movies_provider.dart';
import 'package:cero_a_experto/presentation/providers/providers.dart';
import 'package:cero_a_experto/presentation/widgets/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  static const name = 'home-screen';
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: _HomeView(),
      bottomNavigationBar: CustomBottomNavigation(),
    );
  }
}

class _HomeView extends ConsumerStatefulWidget {
  const _HomeView();

  @override
  ConsumerState<_HomeView> createState() => __HomeViewState();
}

class __HomeViewState extends ConsumerState<_HomeView> {
  @override
  void initState() {
    super.initState();

    Future.delayed(Duration.zero, fetchMovies);
  }

  Future<void> fetchMovies() async {
    await ref.read(nowPlayingMoviesProvider.notifier).loadNextPage();
  }

  @override
  Widget build(BuildContext context) {
    final moviesSlideShowMovies = ref.watch(moviesSlideShowProvider);
    return Column(
      children: [
        const CustomAppBar(),
        if (moviesSlideShowMovies.isNotEmpty)
          MoviesSlideShow(
            movies: moviesSlideShowMovies,
          ),
      ],
    );
  }
}
