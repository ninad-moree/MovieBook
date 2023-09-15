import 'package:dartz/dartz.dart';
import 'package:moviebook/domain/entities/video_entity.dart';

import '../entities/app_error.dart';
import '../entities/movie_params.dart';
import '../repositories/movie_repository.dart';
import 'usecase.dart';

class GetVideos extends Usecase<List<VideoEntity>, MovieParams> {
  final MovieRepository repository;

  GetVideos(this.repository);

  @override
  Future<Either<AppError, List<VideoEntity>>> call(MovieParams params) async {
    return await repository.getVideos(params.id);
  }
}
