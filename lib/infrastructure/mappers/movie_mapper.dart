import 'package:cero_a_experto/config/constants/base_url.dart';
import 'package:cero_a_experto/domain/entities/movie.dart';
import 'package:cero_a_experto/infrastructure/models/moviedb/movie_details.dart';
import 'package:cero_a_experto/infrastructure/models/moviedb/movie_moviedb.dart';

class MovieMapper {
  static Movie movieDBToEntity(MovieMovieDB moviedb) => Movie(
    adult: moviedb.adult,
    backdropPath: (moviedb.backdropPath != '') ? '$baseImageUrl${moviedb.backdropPath}' : imageNotFoundUrl,
    genreIds: moviedb.genreIds.map((e) => e.toString()).toList(),
    id: moviedb.id,
    originalLanguage: moviedb.originalLanguage,
    originalTitle: moviedb.originalTitle,
    overview: moviedb.overview,
    popularity: moviedb.popularity,
    posterPath: (moviedb.posterPath != '') ? '$baseImageUrl${moviedb.posterPath}' : 'no-poster',
    releaseDate: moviedb.releaseDate,
    title: moviedb.title,
    video: moviedb.video,
    voteAverage: moviedb.voteAverage,
    voteCount: moviedb.voteCount,
  );
  static Movie movieMovieDetailsToEntity(MovieDetails movieDetails) => Movie(
    adult: movieDetails.adult,
    backdropPath: (movieDetails.backdropPath != '') ? '$baseImageUrl${movieDetails.backdropPath}' : imageNotFoundUrl,
    genreIds: movieDetails.genres.map((g) => g.id.toString()).toList(),
    id: movieDetails.id,
    originalLanguage: movieDetails.originalLanguage,
    originalTitle: movieDetails.originalTitle,
    overview: movieDetails.overview,
    popularity: movieDetails.popularity,
    posterPath: (movieDetails.posterPath != '') ? '$baseImageUrl${movieDetails.posterPath}' : 'no-poster',
    releaseDate: movieDetails.releaseDate,
    title: movieDetails.title,
    video: movieDetails.video,
    voteAverage: movieDetails.voteAverage,
    voteCount: movieDetails.voteCount,
  );
}
