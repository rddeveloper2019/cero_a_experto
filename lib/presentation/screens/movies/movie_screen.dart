import 'package:cero_a_experto/domain/entities/movie.dart';
import 'package:cero_a_experto/presentation/providers/movies/movie_info_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';

class MovieScreen extends ConsumerStatefulWidget {
  static const name = 'movie-screen';
  final String movieId;

  const MovieScreen({
    super.key,
    required this.movieId,
  });

  @override
  ConsumerState<MovieScreen> createState() => _MovieScreenState();
}

class _MovieScreenState extends ConsumerState<MovieScreen> {
  @override
  void initState() {
    super.initState();
    loadMovie();
  }

  Future<void> loadMovie() async {
    ref.read(movieInfoProvider.notifier).loadMovie(widget.movieId);
  }

  @override
  Widget build(
    BuildContext context,
  ) {
    final movies = ref.watch(movieInfoProvider);
    final Movie? movie = movies[widget.movieId];
    final isLoading = ref.watch(movieInfoProvider).isEmpty || movie == null;

    return Scaffold(
      appBar: AppBar(title: Text("MovieID: ${widget.movieId}")),
      body: isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : Image.network(movie.backdropPath),
    );
  }
}
