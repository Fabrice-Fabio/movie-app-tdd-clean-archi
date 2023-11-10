import 'package:flutter/material.dart';
import 'package:movie_app/presentation/bloc/popular_movies/popular_movies_bloc.dart';
import 'package:movie_app/presentation/bloc/popular_movies/popular_movies_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/presentation/bloc/trending_movies/trending_movies_bloc.dart';
import 'package:movie_app/presentation/bloc/trending_movies/trending_movies_state.dart';
import 'package:movie_app/presentation/pages/movies_list.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  final bckImage = 'https://w0.peakpx.com/wallpaper/732/875/HD-wallpaper-anonymous-black-cool-dark-guy-foux-hacker-scary-tech.jpg';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        elevation: 0,toolbarHeight: 100,
        backgroundColor: Colors.black,
        title: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Hi Fabrice 👋',
              textAlign: TextAlign.start,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            Text(
              'TDD - Movie App',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ],
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(20),
            child: Icon(Icons.search),
          ),
        ],
      ),
      body: Container(
        color: Colors.black,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Default Image
              Container(
                height: 290,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(bckImage),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Stack(
                  children: <Widget>[
                    Positioned(
                      bottom: 0,
                      left: 0,
                      right: 0,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          ElevatedButton(
                            onPressed: () {
                            },
                            child: Text('▶️ Learn Flutter with Flutter Guys'),
                            style: ElevatedButton.styleFrom(
                              primary: Colors.red,
                              onPrimary: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20), // Border radius
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 30,),

              // Trending Movies
              Text('Trending Movies',
                style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
              ),
              BlocBuilder<TrendingMoviesBloc, TrendingMoviesState>(
                builder: (context, state){
                  if(state is TrendingMoviesLoading){
                    return CircularProgressIndicator();
                  } else if(state is TrendingMoviesLoaded){
                    return MoviesList(movies: state.movies);
                  } else if (state is TrendingMoviesError){
                    return Text(state.message);
                  }
                  return Container();
                },
              ),

              SizedBox(height: 20,),
              // Popular Movies
              Text('Popular Movies',
                style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
              ),
              BlocBuilder<PopularMoviesBloc, PopularMoviesState>(
                builder: (context, state){
                  if(state is PopularMoviesLoading){
                    return CircularProgressIndicator();
                  } else if(state is PopularMoviesLoaded){
                    return MoviesList(movies: state.movies);
                  } else if (state is PopularMoviesError){
                    return Text(state.message);
                  }
                  return Container();
                },
              ),

            ],
          ),
        ),
      ),
    );
  }
}
