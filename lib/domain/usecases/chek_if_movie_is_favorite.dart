import 'package:dartz/dartz.dart';

import '../entities/app_error.dart';
import '../entities/movie_params.dart';
import '../repositories/movie_repository.dart';
import 'usecase.dart';

class CheckIfMovieIsFavorite extends Usecase<bool, MovieParams> {
  final MovieRepository movieRepository;

  CheckIfMovieIsFavorite(this.movieRepository);
  @override
  Future<Either<AppError, bool>> call(MovieParams params) async {
    return await movieRepository.checkIfMovieisFavorite(params.id);
  }
}
