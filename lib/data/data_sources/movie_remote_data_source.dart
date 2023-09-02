// import 'dart:developer';

import '../core/api_client.dart';

import '../models/movie_model.dart';
import '../models/movies_result_model.dart';

abstract class MovieRemoteDataResource {
  Future<List<MovieModel>> getTrending();
  Future<List<MovieModel>> getPopular();
  Future<List<MovieModel>> getPlayingNow();
  Future<List<MovieModel>> getCommingSoon();
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
}
