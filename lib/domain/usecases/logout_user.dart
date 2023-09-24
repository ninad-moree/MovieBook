import 'package:dartz/dartz.dart';

import '../entities/app_error.dart';
import '../entities/no_params.dart';
import '../repositories/authentication_repository.dart';
import 'usecase.dart';

class LogoutUser extends Usecase<void, NoParams> {
  final AuthenticationRepository _authenticaationRepository;

  LogoutUser(this._authenticaationRepository);

  @override
  Future<Either<AppError, void>> call(NoParams params) async =>
      _authenticaationRepository.logoutUser();
}
