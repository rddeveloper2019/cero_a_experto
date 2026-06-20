import 'package:cero_a_experto/presentation/providers/movies/movies_repository_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cero_a_experto/domain/entities/movie.dart';

abstract class BaseMoviesNotifier extends Notifier<List<Movie>> {
  int currentPage = 0;
  bool isLoading = false;

  @override
  List<Movie> build() => [];

  Future<List<Movie>> fetchMovies(int page);

  Future<void> loadNextPage() async {
    if (isLoading) return;
    currentPage++;
    isLoading = true;

    final List<Movie> movies = await fetchMovies(currentPage);
    state = [...state, ...movies];

    isLoading = false;
  }
}

class NowPlayingMoviesNotifier extends BaseMoviesNotifier {
  @override
  Future<List<Movie>> fetchMovies(int page) {
    return ref.read(moviesRepositoryProvider).getNowPlaying(page: page);
  }
}

class PopularMoviesNotifier extends BaseMoviesNotifier {
  @override
  Future<List<Movie>> fetchMovies(int page) {
    return ref.read(moviesRepositoryProvider).getPopular(page: page);
  }
}

class UpcomingMoviesNotifier extends BaseMoviesNotifier {
  @override
  Future<List<Movie>> fetchMovies(int page) {
    return ref.read(moviesRepositoryProvider).getUpcoming(page: page);
  }
}

class TopRatedMoviesNotifier extends BaseMoviesNotifier {
  @override
  Future<List<Movie>> fetchMovies(int page) {
    return ref.read(moviesRepositoryProvider).getTopRated(page: page);
  }
}

final nowPlayingMoviesProvider = NotifierProvider<NowPlayingMoviesNotifier, List<Movie>>(
  NowPlayingMoviesNotifier.new,
);

final popularMoviesProvider = NotifierProvider<PopularMoviesNotifier, List<Movie>>(
  PopularMoviesNotifier.new,
);
final upcomingMoviesProvider = NotifierProvider<UpcomingMoviesNotifier, List<Movie>>(
  UpcomingMoviesNotifier.new,
);
final topRatedMoviesProvider = NotifierProvider<TopRatedMoviesNotifier, List<Movie>>(
  TopRatedMoviesNotifier.new,
);
