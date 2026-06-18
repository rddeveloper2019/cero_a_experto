import 'package:cero_a_experto/domain/repositories/movies_repository.dart';
import 'package:cero_a_experto/infrastructure/datasources/movie_db_datasource.dart';
import 'package:cero_a_experto/infrastructure/datasources/movie_db_offline_datasource.dart';
import 'package:cero_a_experto/infrastructure/repositories/movie_repository_impl.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final moviesRepositoryProvider = Provider.autoDispose<MoviesRepository>(
  (ref) {
    // final online = MovieDbDatasource();
    final offline = MovieDbOfflineDatasource();
    return MovieRepositoryImpl(offline);
  },
);
