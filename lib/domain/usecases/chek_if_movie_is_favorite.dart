import 'package:dartz/dartz.dart';
import 'package:moviebook/domain/entities/app_error.dart';
import 'package:moviebook/domain/entities/movie_params.dart';
import 'package:moviebook/domain/repositories/movie_repository.dart';
import 'package:moviebook/domain/usecases/usecase.dart';

class CheckIfMovieIsFavorite extends Usecase<bool, MovieParams> {
  final MovieRepository movieRepository;

  CheckIfMovieIsFavorite(this.movieRepository);
  @override
  Future<Either<AppError, bool>> call(MovieParams params) async {
    return await movieRepository.checkIfMovieisFavorite(params.id);
  }
}
