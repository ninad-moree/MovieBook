import 'package:dartz/dartz.dart';
import 'package:moviebook/domain/entities/movie_search_params.dart';

import '../entities/app_error.dart';
import '../entities/movie_entity.dart';
import '../repositories/movie_repository.dart';
import 'usecase.dart';

class SearchMovies extends Usecase<List<MovieEntity>, MovieSearchParams> {
  final MovieRepository repository;

  SearchMovies(this.repository);

  @override
  Future<Either<AppError, List<MovieEntity>>> call(
      MovieSearchParams params) async {
    return await repository.getSearchedMovies(params.searchTerm);
  }
}
