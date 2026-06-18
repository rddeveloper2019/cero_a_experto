import 'dart:math';

import 'package:cero_a_experto/presentation/providers/movies/movies_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:cero_a_experto/domain/entities/movie.dart';

final moviesSlideShowProvider = Provider<List<Movie>>((ref) {
  final nowPlayingMovies = ref.watch(nowPlayingMoviesProvider);
  if (nowPlayingMovies.isEmpty) {
    return [];
  }
  return nowPlayingMovies.sublist(0, min(nowPlayingMovies.length, 6));
});
