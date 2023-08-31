import 'package:dartz/dartz.dart';
import 'package:moviebook/domain/entities/app_error.dart';
import 'package:moviebook/domain/entities/movie_entity.dart';
import 'package:moviebook/domain/entities/no_params.dart';
import 'package:moviebook/domain/repositories/movie_repository.dart';
import 'package:moviebook/domain/usecases/usecase.dart';

class GetTrending extends Usecase<List<MovieEntity>, NoParams> {
  final MovieRepository repository;

  GetTrending(this.repository);

  @override
  Future<Either<AppError, List<MovieEntity>>> call(NoParams params) async {
    return await repository.getTrending();
  }
}
