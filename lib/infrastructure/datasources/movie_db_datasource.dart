import 'package:cero_a_experto/config/constants/base_url.dart';
import 'package:cero_a_experto/config/constants/environment.dart';
import 'package:cero_a_experto/domain/datasources/movies_datasource.dart';
import 'package:cero_a_experto/domain/entities/movie.dart';
import 'package:cero_a_experto/infrastructure/mappers/movie_mapper.dart';
import 'package:cero_a_experto/infrastructure/models/moviedb/movie_db_response.dart';
import 'package:dio/dio.dart';

class MovieDbDatasource extends MoviesDatasource {
  final dio = Dio(
    BaseOptions(
      baseUrl: baseUrl,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${Environment.apiReadAccessToken}',
      },
    ),
  );

  List<Movie> _jsonToMovies(dynamic json) {
    final List<Movie> movies = [
      ...MovieDbResponse.fromJson(json).results.map(
        (m) => MovieMapper.movieDBToEntity(m),
      ),
    ];

    return movies;
  }

  @override
  Future<List<Movie>> getNowPlaying({int page = 1, String language = 'en-US'}) async {
    final response = await dio.get(
      '/movie/now_playing',
      queryParameters: {'page': page, 'language': language},
    );

    return _jsonToMovies(response.data);
  }

  @override
  Future<List<Movie>> getPopular({int page = 1, String language = 'en-US'}) async {
    final response = await dio.get(
      '/movie/popular',
      queryParameters: {'page': page, 'language': language},
    );

    return _jsonToMovies(response.data);
  }

  @override
  Future<List<Movie>> getUpcoming({int page = 1, String language = 'en-US'}) async {
    final response = await dio.get(
      '/movie/upcoming',
      queryParameters: {'page': page, 'language': language},
    );

    return _jsonToMovies(response.data);
  }

  @override
  Future<List<Movie>> getTopRated({int page = 1, String language = 'en-US'}) async {
    final response = await dio.get(
      '/movie/top_rated',
      queryParameters: {'page': page, 'language': language},
    );

    return _jsonToMovies(response.data);
  }
}
