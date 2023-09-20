import 'package:dartz/dartz.dart';
import 'package:moviebook/domain/entities/app_error.dart';
import 'package:moviebook/domain/entities/movie_params.dart';
import 'package:moviebook/domain/repositories/movie_repository.dart';
import 'package:moviebook/domain/usecases/usecase.dart';

class DeleteFavoriteMovie extends Usecase<void, MovieParams> {
  final MovieRepository movieRepository;

  DeleteFavoriteMovie(this.movieRepository);
  @override
  Future<Either<AppError, void>> call(MovieParams params) async {
    return await movieRepository.deleteFavoriteMovie(params.id);
  }
}
