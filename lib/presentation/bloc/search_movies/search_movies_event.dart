abstract class SearchMoviesEvent {}

class FetchSearchMovies extends SearchMoviesEvent {
  final String query;

  FetchSearchMovies(this.query);
}