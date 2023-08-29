import 'package:moviebook/data/models/movie_model.dart';

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

  // MoviesResultModel.fromJson(Map<String, dynamic> json) {
  //   if (json['results'] != null) {
  //     movies = List<MovieModel>();
  //     json['results'].forEach((v) {
  //       movies.add(MovieModel.fromJson(v));
  //     });
  //   }
  // }

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = <String, dynamic>{};
  //   data['results'] = movies.map((v) => v.toJson()).toList();
  //   return data;
  // }
}
