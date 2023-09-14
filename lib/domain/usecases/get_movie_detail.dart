import 'package:dartz/dartz.dart';
import 'package:moviebook/domain/entities/movie_detail_entity.dart';
import 'package:moviebook/domain/entities/movie_params.dart';

import '../entities/app_error.dart';
import '../repositories/movie_repository.dart';
import 'usecase.dart';

class GetMovieDetail extends Usecase<MovieDetailEntity, MovieParams> {
  final MovieRepository repository;

  GetMovieDetail(this.repository);

  @override
  Future<Either<AppError, MovieDetailEntity>> call(MovieParams params) async {
    return await repository.getMovieDetail(params.id);
  }
}
