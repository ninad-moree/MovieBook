import 'movie_model.dart';

class MoviesResultModel {
  late List<MovieModel> movies;

  MoviesResultModel({required this.movies});

  factory MoviesResultModel.fromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return MoviesResultModel(movies: []);
    }

    final List<dynamic>? results = json['results'] as List<dynamic>?;

    if (results == null) {
      return MoviesResultModel(movies: []);
    }

    final List<MovieModel> movieList = results
        .map((v) => MovieModel.fromJson(v as Map<String, dynamic>))
        .toList();

    return MoviesResultModel(movies: movieList);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['results'] = movies.map((v) => v.toJson()).toList();
    return data;
  }
}
