import 'package:dartz/dartz.dart';
import 'package:moviebook/data/data_sources/movie_remote_data_source.dart';
import 'package:moviebook/data/models/movie_model.dart';
import 'package:moviebook/domain/entities/app_error.dart';
import 'package:moviebook/domain/entities/movie_entity.dart';
import 'package:moviebook/domain/repositories/movie_repository.dart';

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
