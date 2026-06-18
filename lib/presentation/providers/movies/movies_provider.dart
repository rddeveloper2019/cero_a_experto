import 'package:cero_a_experto/presentation/providers/movies/movies_repository_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:cero_a_experto/domain/entities/movie.dart';

final nowPlayingMoviesProvider = NotifierProvider<MoviesNotifier, List<Movie>>(() => MoviesNotifier());

class MoviesNotifier extends Notifier<List<Movie>> {
  int currentPage = 0;

  @override
  build() {
    return [];
  }

  Future<void> loadNextPage() async {
    currentPage++;
    final fetchMoreMovies = ref.read(moviesRepositoryProvider).getNowPlaying;

    final List<Movie> movies = await fetchMoreMovies(page: currentPage);
    state = [...state, ...movies];
  }
}
