import 'package:dartz/dartz.dart';

import '../entities/app_error.dart';
import '../entities/cast_entity.dart';
import '../entities/movie_params.dart';
import '../repositories/movie_repository.dart';
import 'usecase.dart';

class GetCastCrew extends Usecase<List<CastEntity>, MovieParams> {
  final MovieRepository repository;

  GetCastCrew(this.repository);

  @override
  Future<Either<AppError, List<CastEntity>>> call(MovieParams params) async {
    return await repository.getCastCrew(params.id);
  }
}
