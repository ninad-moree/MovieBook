// import 'dart:developer';

import 'package:moviebook/data/models/castcrew_data_model.dart';
import 'package:moviebook/data/models/movie_detail_model.dart';
import 'package:moviebook/data/models/video_model.dart';
import 'package:moviebook/data/models/video_result_model.dart';

import '../core/api_client.dart';
import '../models/movie_model.dart';
import '../models/movies_result_model.dart';

abstract class MovieRemoteDataResource {
  Future<List<MovieModel>> getTrending();
  Future<List<MovieModel>> getPopular();
  Future<List<MovieModel>> getPlayingNow();
  Future<List<MovieModel>> getCommingSoon();
  Future<List<MovieModel>> getSearchedMovies(String searchTerm);
  Future<MovieDetailModel> getMovieDetail(int id);
  Future<List<CastModel>> getCastCrew(int id);
  Future<List<VideoModel>> getVideos(int id);
}

class MovieRemoteDataResourceImpl extends MovieRemoteDataResource {
  final ApiClient _client;

  MovieRemoteDataResourceImpl(this._client);

  @override
  Future<List<MovieModel>> getTrending() async {
    final response = await _client.get('trending/movie/day');
    final movies = MoviesResultModel.fromJson(response).movies;
    // log(movies.toString());
    return movies;
  }

  @override
  Future<List<MovieModel>> getPopular() async {
    final response = await _client.get('movie/popular');
    final movies = MoviesResultModel.fromJson(response).movies;
    // log(movies.toString());
    return movies;
  }

  @override
  Future<List<MovieModel>> getCommingSoon() async {
    final response = await _client.get('movie/upcoming');
    final movies = MoviesResultModel.fromJson(response).movies;
    // log(movies.toString());
    return movies;
  }

  @override
  Future<List<MovieModel>> getPlayingNow() async {
    final response = await _client.get('movie/now_playing');
    final movies = MoviesResultModel.fromJson(response).movies;
    // log(movies.toString());
    return movies;
  }

  @override
  Future<MovieDetailModel> getMovieDetail(int id) async {
    final response = await _client.get('movie/$id');
    final movies = MovieDetailModel.fromJson(response);
    // log(movies.toString());
    return movies;
  }

  @override
  Future<List<CastModel>> getCastCrew(int id) async {
    final response = await _client.get('movie/$id/credits');
    final cast = CastCrewResultModel.fromJson(response).cast;
    return cast;
  }

  @override
  Future<List<VideoModel>> getVideos(int id) async {
    final response = await _client.get('movie/$id/videos');
    final video = VideoResultModel.fromJson(response).videos;
    return video;
  }

  @override
  Future<List<MovieModel>> getSearchedMovies(String searchTerm) async {
    final response = await _client.get(
      'search/movie',
      params: {
        'query': searchTerm,
      },
    );
    final movies = MoviesResultModel.fromJson(response).movies;
    return movies;
  }
}
