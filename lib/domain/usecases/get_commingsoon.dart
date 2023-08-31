import 'package:dartz/dartz.dart';
import '../entities/app_error.dart';
import '../entities/movie_entity.dart';
import '../repositories/movie_repository.dart';

import '../entities/no_params.dart';
import 'usecase.dart';

class GetCommingSoon extends Usecase<List<MovieEntity>, NoParams> {
  final MovieRepository repository;

  GetCommingSoon(this.repository);

  @override
  Future<Either<AppError, List<MovieEntity>>> call(NoParams params) async {
    return await repository.getCommingsoon();
  }
}
