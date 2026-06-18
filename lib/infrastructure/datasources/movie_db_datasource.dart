import 'package:cero_a_experto/config/constants/base_url.dart';
import 'package:cero_a_experto/config/constants/environment.dart';
import 'package:cero_a_experto/domain/datasources/movies_datasource.dart';
import 'package:cero_a_experto/domain/entities/movie.dart';
import 'package:cero_a_experto/infrastructure/mappers/movie_mapper.dart';
import 'package:cero_a_experto/infrastructure/models/moviedb/movie_db_response.dart';
import 'package:dio/dio.dart';

class MovieDbDatasource extends MoviesDatasource {
  @override
  Future<List<Movie>> getNowPlaying({int page = 1, String language = 'en-US'}) async {
    final dio = Dio(
      BaseOptions(
        baseUrl: baseUrl,
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer ${Environment.apiReadAccessToken}',
        },
      ),
    );

    final response = await dio.get(
      '/movie/now_playing',
      queryParameters: {'page': page, 'language': language},
    );

    final List<Movie> movies = [
      ...MovieDbResponse.fromJson(response.data).results.map(
        (m) => MovieMapper.movieDBToEntity(m),
      ),
    ];

    return movies;
  }
}
