import 'package:flutter/material.dart';
import 'package:movie_app/domain/entities/Movie.dart';
import 'package:movie_app/presentation/widgets/movie_card.dart';

class MoviesList extends StatelessWidget {
  final List<Movie> movies;

  const MoviesList({Key? key, required this.movies}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(movies.length, (index) {
          final movie = movies[index];
          return MovieCard(movie);
        }),
      ),
    );
  }
}
