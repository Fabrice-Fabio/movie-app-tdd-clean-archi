import 'package:movie_app/domain/entities/Movie.dart';

abstract class TrendingMoviesState {}

class TrendingMoviesInitial extends TrendingMoviesState {}
class TrendingMoviesLoading extends TrendingMoviesState {}
class TrendingMoviesLoaded extends TrendingMoviesState {
  final List<Movie> movies;

  TrendingMoviesLoaded(this.movies);
}

class TrendingMoviesError extends TrendingMoviesState {
  final String message;

  TrendingMoviesError(this.message);
}