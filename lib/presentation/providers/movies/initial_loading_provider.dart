import 'package:cero_a_experto/presentation/providers/movies/movies_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final initialLoadingProvider = Provider((Ref ref) {
  final nowPlayingMoviesEmpty = ref.watch(nowPlayingMoviesProvider).isEmpty;
  final popularMoviesEmpty = ref.watch(popularMoviesProvider).isEmpty;
  final upcomingMoviesEmpty = ref.watch(upcomingMoviesProvider).isEmpty;
  final topRatedMoviesEmpty = ref.watch(topRatedMoviesProvider).isEmpty;

  return nowPlayingMoviesEmpty || popularMoviesEmpty || upcomingMoviesEmpty || topRatedMoviesEmpty;
});
