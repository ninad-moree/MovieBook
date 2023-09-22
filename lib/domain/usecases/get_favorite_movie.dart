import 'package:dartz/dartz.dart';

import '../entities/app_error.dart';
import '../entities/movie_entity.dart';
import '../entities/no_params.dart';
import '../repositories/movie_repository.dart';
import 'usecase.dart';

class GetFavoriteMovie extends Usecase<List<MovieEntity>, NoParams> {
  final MovieRepository movieRepository;

  GetFavoriteMovie(this.movieRepository);
  @override
  Future<Either<AppError, List<MovieEntity>>> call(NoParams params) async {
    return await movieRepository.getFavoriteMovies();
  }
}
