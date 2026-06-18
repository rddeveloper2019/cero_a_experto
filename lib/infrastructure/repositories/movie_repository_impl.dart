import 'package:cero_a_experto/domain/datasources/movies_datasource.dart';
import 'package:cero_a_experto/domain/entities/movie.dart';
import 'package:cero_a_experto/domain/repositories/movies_repository.dart';

class MovieRepositoryImpl extends MoviesRepository {
  final MoviesDatasource datasource;
  MovieRepositoryImpl(this.datasource);

  @override
  Future<List<Movie>> getNowPlaying({
    int page = 1,
    String language = 'en-US',
  }) {
    return datasource.getNowPlaying(page: page, language: language);
  }
}
