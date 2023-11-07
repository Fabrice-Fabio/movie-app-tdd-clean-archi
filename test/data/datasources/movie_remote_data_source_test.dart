import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:movie_app/core/errors/server_exception.dart';
import 'package:movie_app/data/datasources/movie_remote_data_source.dart';
import 'package:movie_app/data/datasources/remote/movie_remote_data_source_impl.dart';

import 'movie_remote_data_source_test.mocks.dart';


@GenerateMocks([http.Client])

void main(){
  late MovieRemoteDataSource dataSource;
  late MockClient mockHttpClient;

  setUp(() {
    mockHttpClient = MockClient();
    dataSource = MovieRemoteDataSourceImpl(client: mockHttpClient);
  });

  const tQuery = 'Avengers';

  const tUrl = 'https://api.themoviedb.org/3/trending/movie/day?api_key=feefd9dfdbae7ed0a59490812ba90ad8';
  const pUrl = 'https://api.themoviedb.org/3/movie/popular?api_key=feefd9dfdbae7ed0a59490812ba90ad8';
  const sUrl = 'https://api.themoviedb.org/3/search/movie?query=$tQuery&api_key=feefd9dfdbae7ed0a59490812ba90ad8';

  const String sampleApiResponse = '''
{
  "page": 1,
  "results": [
    {
      "adult": false,
      "backdrop_path": "/path.jpg",
      "id": 1,
      "title": "Sample Movie",
      "original_language": "en",
      "original_title": "Sample Movie",
      "overview": "Overview here",
      "poster_path": "/path2.jpg",
      "media_type": "movie",
      "genre_ids": [1, 2, 3],
      "popularity": 100.0,
      "release_date": "2020-01-01",
      "video": false,
      "vote_average": 7.5,
      "vote_count": 100
    }
  ],
  "total_pages": 1,
  "total_results": 1
}
''';



  test('should perfom a GET request on a url to get trending movies', () async {
    // arrange
    when(mockHttpClient.get(Uri.parse(tUrl))).
    thenAnswer((_) async => http.Response(sampleApiResponse, 200));

    // act
    await dataSource.getTrendingMovies();

    // assert
    verify(mockHttpClient.get(Uri.parse(tUrl)));
  });

  test('should perfom a GET request on a url to get popular movies', () async {
    // arrange
    when(mockHttpClient.get(Uri.parse(pUrl))).
    thenAnswer((_) async => http.Response(sampleApiResponse, 200));

    // act
    await dataSource.getPopularMovies();

    // assert
    verify(mockHttpClient.get(Uri.parse(pUrl)));
  });

  test('should perfom a GET request on a url to get search movies', () async {
    // arrange
    when(mockHttpClient.get(Uri.parse(sUrl))).
    thenAnswer((_) async => http.Response(sampleApiResponse, 200));

    // act
    await dataSource.searchMovies(tQuery);

    // assert
    verify(mockHttpClient.get(Uri.parse(sUrl)));
  });

  test('should throw a ServerException when the response code is 404', () async {
    // arrange
    when(mockHttpClient.get(any)).
    thenAnswer((_) async => http.Response('Something went wrong', 404));

    // act
    final call = dataSource.getTrendingMovies;

    // assert
    expect(() => call(), throwsA(isA<ServerException>()));
  });


}