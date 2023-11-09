import 'package:flutter/material.dart';
import 'package:movie_app/injection_container.dart';
import 'package:movie_app/presentation/bloc/popular_movies/popular_movies_bloc.dart';
import 'package:movie_app/presentation/bloc/popular_movies/popular_movies_event.dart';
import 'package:movie_app/presentation/pages/popular_movies_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      home: BlocProvider(
        create: (context) => getIt<PopularMoviesBloc>()..add(FetchPopularMovies()),
        child: PopularMoviesScreen()
      ),
    );
  }
}

