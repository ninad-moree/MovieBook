// ignore_for_file: overridden_fields, annotate_overrides

import 'package:moviebook/domain/entities/movie_entity.dart';

class MovieModel extends MovieEntity {
  final int id;
  final bool video;
  final int voteCount;
  final double voteAverage;
  final String title;
  final String releaseDate;
  final String originalLanguage;
  final String originalTitle;
  final List<int> genreIds;
  final String backdropPath;
  final bool adult;
  final String overview;
  final String posterPath;
  final double popularity;
  // final String mediaType;

  const MovieModel({
    required this.id,
    required this.video,
    required this.voteCount,
    required this.voteAverage,
    required this.title,
    required this.releaseDate,
    required this.originalLanguage,
    required this.originalTitle,
    required this.genreIds,
    required this.backdropPath,
    required this.adult,
    required this.overview,
    required this.posterPath,
    required this.popularity,
    // required this.mediaType,
  }) : super(
          id: id,
          title: title,
          backdropPath: backdropPath,
          posterPath: posterPath,
          releaseDate: releaseDate,
          voteAverage: voteAverage,
          overview: overview,
        );

  factory MovieModel.fromJson(Map<String, dynamic> json) {
    return MovieModel(
      popularity: json['popularity']?.toDouble() ?? 0.0,
      voteCount: json['vote_count'] ?? 0,
      video: json['video'] ?? false,
      posterPath: json['poster_path'] ?? "",
      id: json['id'] ?? 0,
      adult: json['adult'] ?? false,
      backdropPath: json['backdrop_path'] ?? "",
      originalLanguage: json['original_language'] ?? "",
      originalTitle: json['original_title'] ?? "",
      genreIds: (json['genre_ids'] as List<dynamic>?)?.cast<int>() ?? [],
      title: json['title'] ?? "",
      voteAverage: json['vote_average']?.toDouble() ?? 0.0,
      overview: json['overview'] ?? "",
      releaseDate: json['release_date'] ?? "",
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['video'] = video;
    data['vote_count'] = voteCount;
    data['vote_average'] = voteAverage;
    data['title'] = title;
    data['release_date'] = releaseDate;
    data['original_language'] = originalLanguage;
    data['original_title'] = originalTitle;
    data['genre_ids'] = genreIds;
    data['backdrop_path'] = backdropPath;
    data['adult'] = adult;
    data['overview'] = overview;
    data['poster_path'] = posterPath;
    data['popularity'] = popularity;
    // data['media_type'] = mediaType;
    return data;
  }
}
