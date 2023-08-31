import 'package:dartz/dartz.dart';
import '../data_sources/movie_remote_data_source.dart';
import '../models/movie_model.dart';
import '../../domain/entities/app_error.dart';
import '../../domain/entities/movie_entity.dart';
import '../../domain/repositories/movie_repository.dart';

class MovieRepositoryImpl extends MovieRepository {
  final MovieRemoteDataResource remoteDataResource;

  MovieRepositoryImpl(this.remoteDataResource);

  @override
  Future<Either<AppError, List<MovieModel>>> getTrending() async {
    try {
      final movies = await remoteDataResource.getTrending();
      return Right(movies);
    } on Exception {
      return const Left(AppError('Something went wrong'));
    }
  }

  @override
  Future<Either<AppError, List<MovieEntity>>> getCommingsoon() async {
    try {
      final movies = await remoteDataResource.getCommingSoon();
      return Right(movies);
    } on Exception {
      return const Left(AppError('Something went wrong'));
    }
  }

  @override
  Future<Either<AppError, List<MovieEntity>>> getPlayingNow() async {
    try {
      final movies = await remoteDataResource.getPlayingNow();
      return Right(movies);
    } on Exception {
      return const Left(AppError('Something went wrong'));
    }
  }

  @override
  Future<Either<AppError, List<MovieEntity>>> getPopular() async {
    try {
      final movies = await remoteDataResource.getPopular();
      return Right(movies);
    } on Exception {
      return const Left(AppError('Something went wrong'));
    }
  }
}
