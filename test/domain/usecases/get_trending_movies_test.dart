import 'package:dartz/dartz.dart';
import 'package:mockito/mockito.dart';
import 'package:movie_app/domain/entities/Movie.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:movie_app/domain/usecases/get_trending_movies.dart';

import 'get_popular_movies_test.mocks.dart';

void main(){
  late GetTrendingMovies usecase;
  late MockMovieRepository mockMovieRepository;

  setUp(() {
    mockMovieRepository = MockMovieRepository();
    usecase = GetTrendingMovies(mockMovieRepository);
  });

  final tMoviesList = [
    Movie(id: 1, title: "Test Movie 1", overview: "Desc 1", posterPath: "/image1"),
    Movie(id: 2, title: "Test Movie 2", overview: "Desc 2", posterPath: "/image2"),
  ];

  test('should get trending movies from the repository', () async {
    // arrange
    when(mockMovieRepository.getTrendingMovies())
        .thenAnswer((_) async => Right(tMoviesList));
    // act
    final result = await usecase();
    // assert
    expect(result, equals(Right(tMoviesList)));
    verify(mockMovieRepository.getTrendingMovies());
    verifyNoMoreInteractions(mockMovieRepository);
  });
}