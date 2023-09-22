import 'package:dartz/dartz.dart';
// ignore: implementation_imports
import 'package:moviebook/data/data_sources/language_local_data_source.dart';
import 'package:moviebook/domain/entities/app_error.dart';
import 'package:moviebook/domain/repositories/app_repository.dart';

class AppMovieRepositoryImpl extends AppRepository {
  final LangaugeLocalDataSource langaugeLocalDataSource;

  AppMovieRepositoryImpl(this.langaugeLocalDataSource);

  @override
  Future<Either<AppError, String>> getPreferredLanguage() async {
    try {
      final response = await langaugeLocalDataSource.getPreferredLanguage();
      if (response != null) {
        return Right(response);
      } else {
        return const Left(AppError(AppErrorType.database));
      }
    } on Exception {
      return const Left(AppError(AppErrorType.database));
    }
  }

  @override
  Future<Either<AppError, void>> updateLanguage(String language) async {
    try {
      await langaugeLocalDataSource.updateLanguage(language);
      return const Right(null); // Return null as void
    } on Exception {
      return const Left(AppError(AppErrorType.database));
    }
  }
}
