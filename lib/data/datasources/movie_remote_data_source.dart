import 'package:movie_app/core/errors/server_failure.dart';
import 'package:movie_app/data/models/movie_model.dart';
import 'package:dartz/dartz.dart';

abstract class MovieRemoteDataSource {

  Future<List<MovieModel>> getTrendingMovies();

  Future<List<MovieModel>> searchMovies(String query);

  Future<List<MovieModel>> getPopularMovies();
}