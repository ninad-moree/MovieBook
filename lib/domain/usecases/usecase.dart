import 'package:dartz/dartz.dart';
import 'package:moviebook/domain/entities/app_error.dart';

abstract class Usecase<Type, Params> {
  Future<Either<AppError, Type>> call(Params params);
}
