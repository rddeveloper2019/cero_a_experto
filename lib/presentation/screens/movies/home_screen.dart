import 'package:cero_a_experto/presentation/providers/movies/movies_provider.dart';
import 'package:cero_a_experto/presentation/providers/providers.dart';
import 'package:cero_a_experto/presentation/widgets/shared/extensions.dart';
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

    Future.delayed(Duration.zero, () async {
      await ref.read(nowPlayingMoviesProvider.notifier).loadNextPage();
      await ref.read(popularMoviesProvider.notifier).loadNextPage();
      await ref.read(upcomingMoviesProvider.notifier).loadNextPage();
      await ref.read(topRatedMoviesProvider.notifier).loadNextPage();
    });
  }

  @override
  Widget build(BuildContext context) {
    final initialLoading = ref.watch(initialLoadingProvider);

    final slideShowMovies = ref.watch(moviesSlideShowProvider);
    final nowPlayingMoviesMovies = ref.watch(nowPlayingMoviesProvider);
    final popularMovies = ref.watch(popularMoviesProvider);
    final upcomingMovies = ref.watch(upcomingMoviesProvider);
    final topRatedMovies = ref.watch(topRatedMoviesProvider);

    return CustomScrollView(
      slivers: [
        const SliverAppBar(
          floating: true,
          flexibleSpace: FlexibleSpaceBar(
            title: CustomAppBar(),
          ),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) {
              return Column(
                children: [
                  if (slideShowMovies.isNotEmpty)
                    MoviesSlideShow(
                      movies: slideShowMovies,
                    ),
                  MovieHorizontalListView(
                    movies: nowPlayingMoviesMovies,
                    title: 'Now Playing',
                    subtitle: 'Luna 20',
                    loadNextPage: ref.read(nowPlayingMoviesProvider.notifier).loadNextPage,
                  ),
                  MovieHorizontalListView(
                    movies: upcomingMovies,
                    title: 'Upcoming',
                    loadNextPage: ref.read(upcomingMoviesProvider.notifier).loadNextPage,
                  ),
                  MovieHorizontalListView(
                    movies: popularMovies,
                    title: 'Popular',
                    loadNextPage: ref.read(popularMoviesProvider.notifier).loadNextPage,
                  ),
                  MovieHorizontalListView(
                    movies: topRatedMovies,
                    title: 'Top Rated',
                    loadNextPage: ref.read(topRatedMoviesProvider.notifier).loadNextPage,
                  ),
                ],
              );
            },
            childCount: 1,
          ),
        ),
      ],
    ).loading(initialLoading);
  }
}
