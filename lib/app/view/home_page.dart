import 'package:flutter/material.dart';
import 'package:movie_app/app/controller/getMoviesController.dart';

import '../model/movie_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  GetMoviesController getMoviesController = GetMoviesController();
  late Future<List<MovieModel>> movies;

  @override
  void initState() {
    movies = getMoviesController.fetchMovies();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('The House of Horror'),
      ),
      body: Center(
        child: FutureBuilder(
          future: movies,
          builder: (context, AsyncSnapshot<List<MovieModel>> snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: 5,
                itemBuilder: (context, index) {
                  MovieModel movie = snapshot.data![index];
                  return ListTile(
                    title: Text(movie.title),
                    subtitle: Text(movie.posterPath),
                  );
                },
              );
            }
            return const CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}
