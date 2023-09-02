import 'package:dartz/dartz.dart';

import '../entities/app_error.dart';

abstract class Usecase<Type, Params> {
  Future<Either<AppError, Type>> call(Params params);
}
