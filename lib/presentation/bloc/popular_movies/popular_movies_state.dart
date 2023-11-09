import 'package:movie_app/domain/entities/Movie.dart';

abstract class PopularMoviesState {}

class PopularMoviesInitial extends PopularMoviesState {}
class PopularMoviesLoading extends PopularMoviesState {}
class PopularMoviesLoaded extends PopularMoviesState {
  final List<Movie> movies;

  PopularMoviesLoaded(this.movies);
}

class PopularMoviesError extends PopularMoviesState {
  final String message;

  PopularMoviesError(this.message);
}