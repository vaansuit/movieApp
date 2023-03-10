import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:movie_app/app/model/movie_model.dart';

class GetMoviesController {
  Future<List<MovieModel>> fetchMovies() async {
    final dio = Dio();
    final response = await dio
        .get('https://api.themoviedb.org/3/discover/movie', queryParameters: {
      'api_key': '7e165a7d15e9f92360b305bc79dfb897',
      'language': 'pt-BR',
      'sort_by': 'popularity.desc',
      'include_adult': false,
      'include_video': false,
      'page': 1,
      'with_genres': 27,
      'with_watch_monetization_types': 'flatrate'
    });
    final List<dynamic> jsonList = response.data['results'];

    return jsonList
        .map((jsonItem) => MovieModel.fromJson(json.encode(jsonItem)))
        .toList();
  }
}
