import 'package:dartz/dartz.dart';
import 'package:moviebook/domain/entities/app_error.dart';
import 'package:moviebook/domain/repositories/movie_repository.dart';
import 'package:moviebook/domain/usecases/usecase.dart';

import '../entities/movie_entity.dart';

class SaveMovie extends Usecase<void, MovieEntity> {
  final MovieRepository movieRepository;

  SaveMovie(this.movieRepository);
  @override
  Future<Either<AppError, void>> call(MovieEntity params) async {
    return await movieRepository.saveMovie(params);
  }
}
