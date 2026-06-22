import 'package:cero_a_experto/domain/entities/movie.dart';
import 'package:cero_a_experto/presentation/providers/movies/movies_repository_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final movieInfoProvider = NotifierProvider<MovieNotifier, Map<String, Movie>>(
  MovieNotifier.new,
);

class MovieNotifier extends Notifier<Map<String, Movie>> {
  bool isLoading = false;
  @override
  Map<String, Movie> build() {
    return {};
  }

  Future<void> loadMovie(String movieId) async {
    if (isLoading || state[movieId] != null) return;
    isLoading = true;
    final movie = await ref.read(moviesRepositoryProvider).getMovieById(id: movieId);
    state = {...state, movieId: movie};
    isLoading = false;
  }
}
