import 'package:hive/hive.dart';

import '../tables/movie_table.dart';

abstract class MovieLocalDataSource {
  Future<void> saveMovie(MovieTable movieTable);
  Future<List<MovieTable>> getFavoriteMovies();
  Future<void> deleteFavoriteMovie(int movieId);
  Future<bool> checkIfMovieisFavorite(int movieId);
}

class MovieLocalDataSourceImpl extends MovieLocalDataSource {
  @override
  Future<bool> checkIfMovieisFavorite(int movieId) async {
    final movieBox = await Hive.openBox('movieBox');
    return movieBox.containsKey(movieId);
  }

  @override
  Future<void> deleteFavoriteMovie(int movieId) async {
    final movieBox = await Hive.openBox('movieBox');
    await movieBox.delete(movieId);
  }

  @override
  Future<List<MovieTable>> getFavoriteMovies() async {
    final movieBox = await Hive.openBox('movieBox');
    final movieIds = movieBox.keys;
    List<MovieTable> movies = [];
    for (var movieId in movieIds) {
      movies.add(movieBox.get(movieId));
    }
    return movies;
  }

  @override
  Future<void> saveMovie(MovieTable movieTable) async {
    final movieBox = await Hive.openBox('movieBox');
    await movieBox.put(movieTable.id, movieTable);
  }
}
