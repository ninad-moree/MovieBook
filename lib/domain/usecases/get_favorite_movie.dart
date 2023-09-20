import 'package:dartz/dartz.dart';
import 'package:moviebook/domain/entities/app_error.dart';
import 'package:moviebook/domain/entities/no_params.dart';
import 'package:moviebook/domain/repositories/movie_repository.dart';
import 'package:moviebook/domain/usecases/usecase.dart';

import '../entities/movie_entity.dart';

class GetFavoriteMovie extends Usecase<List<MovieEntity>, NoParams> {
  final MovieRepository movieRepository;

  GetFavoriteMovie(this.movieRepository);
  @override
  Future<Either<AppError, List<MovieEntity>>> call(NoParams params) async {
    return await movieRepository.getFavoriteMovies();
  }
}
