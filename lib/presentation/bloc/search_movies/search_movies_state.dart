import 'package:movie_app/domain/entities/Movie.dart';

abstract class SearchMoviesState {}

class SearchMoviesInitial extends SearchMoviesState {}
class SearchMoviesLoading extends SearchMoviesState {}
class SearchMoviesLoaded extends SearchMoviesState {
  final List<Movie> movies;

  SearchMoviesLoaded(this.movies);
}

class SearchMoviesError extends SearchMoviesState {
  final String message;

  SearchMoviesError(this.message);
}