import 'package:cero_a_experto/domain/entities/movie.dart';

abstract class MoviesRepository {
  Future<List<Movie>> getNowPlaying({
    int page = 1,
    String language = 'en-US',
  });
  Future<List<Movie>> getPopular({
    int page = 1,
    String language = 'en-US',
  });
  Future<List<Movie>> getUpcoming({
    int page = 1,
    String language = 'en-US',
  });
  Future<List<Movie>> getTopRated({
    int page = 1,
    String language = 'en-US',
  });
  Future<Movie> getMovieById({
    required String id,
    String language = 'en-US',
  });
}
