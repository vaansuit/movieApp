import 'package:dio/dio.dart';
import 'package:movie_app/app/model/movie_model.dart';

class GetMoviesController {
  final Dio dio;
  GetMoviesController(this.dio);

  Future<List<MovieModel>> getAllMovies() async {
    List<MovieModel> movies = [];
    String baseUrl =
        'https://api.themoviedb.org/3/discover/movie?api_key=7e165a7d15e9f92360b305bc79dfb897&language=pt-BR&sort_by=popularity.desc&include_adult=false&include_video=false&page=1&with_genres=27&with_watch_monetization_types=flatrate';

    final response = await dio.get(baseUrl);
    movies = List.from(
      response.data.map((movie) {
        return MovieModel.fromJson(movie);
      }),
    );
    return movies;
  }
}
