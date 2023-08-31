import 'package:dartz/dartz.dart';
import 'package:moviebook/domain/entities/app_error.dart';
import 'package:moviebook/domain/entities/movie_entity.dart';
import 'package:moviebook/domain/repositories/movie_repository.dart';

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
