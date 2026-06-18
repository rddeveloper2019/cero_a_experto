import 'package:cero_a_experto/domain/entities/movie.dart';

abstract class MoviesDatasource {
  Future<List<Movie>> getNowPlaying({
    int page = 1,
    String language = 'en-US',

    // String sort_by = 'created_at.asc',
  });
}
