import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart';
import 'package:moviebook/data/core/api_constants.dart';

import 'package:moviebook/data/models/movie_model.dart';
import 'package:moviebook/data/models/movies_result_model.dart';

abstract class MovieRemoteDataResource {
  Future<List<MovieModel>> getTrending();
}

class MovieRemoteDataResourceImpl extends MovieRemoteDataResource {
  final Client _client;

  MovieRemoteDataResourceImpl(this._client);

  @override
  Future<List<MovieModel>> getTrending() async {
    final response = await _client.get(
      Uri.parse(
          '${ApiConstants.BASE_URL}trending/movie/day?api_key=${ApiConstants.API_KEY}'),
      headers: {
        'Content-Type': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      final responseBody = json.decode(response.body);
      final movies = MoviesResultModel.fromJson(responseBody).movies;
      log(movies.toString());
      return movies;
    } else {
      throw Exception(response.reasonPhrase);
    }
  }
}
