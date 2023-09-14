// import 'dart:developer';

import 'package:moviebook/data/models/movie_detail_model.dart';

import '../core/api_client.dart';

import '../models/movie_model.dart';
import '../models/movies_result_model.dart';

abstract class MovieRemoteDataResource {
  Future<List<MovieModel>> getTrending();
  Future<List<MovieModel>> getPopular();
  Future<List<MovieModel>> getPlayingNow();
  Future<List<MovieModel>> getCommingSoon();
  Future<MovieDetailModel> getMovieDetail(int id);
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
}
