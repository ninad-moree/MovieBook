import 'movie_model.dart';

class MoviesResultModel {
  late List<MovieModel> movies;

  MoviesResultModel({required this.movies});

  factory MoviesResultModel.fromJson(Map<String, dynamic> json) {
    return MoviesResultModel(
      movies: (json['results'] as List<dynamic>)
          .map((v) => MovieModel.fromJson(v))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['results'] = movies.map((v) => v.toJson()).toList();
    return data;
  }
}
