import 'package:dartz/dartz.dart';
import 'package:moviebook/domain/entities/app_error.dart';
import 'package:moviebook/domain/usecases/usecase.dart';

import '../entities/login_request_params.dart';
import '../repositories/authentication_repository.dart';

class LoginUser extends Usecase<bool, LoginRequestParams> {
  final AuthenticationRepository _authenticaationRepository;

  LoginUser(this._authenticaationRepository);

  @override
  Future<Either<AppError, bool>> call(LoginRequestParams params) async =>
      _authenticaationRepository.loginUser(params.toJson());
}
