import 'dart:io';

import 'package:dartz/dartz.dart';

import '../../domain/entities/app_error.dart';
import '../../domain/repositories/authentication_repository.dart';
import '../core/unauthorised_exception.dart';
import '../data_sources/authentication_local_data_source.dart';
import '../data_sources/authentication_remote_data_source.dart';
import '../models/request_token_model.dart';

class AuthenticaationRepositoryImpl extends AuthenticationRepository {
  final AuthenticationRemoteDataSource _authenticationRemoteDataSource;
  final AuthenticationLocalDataSource _authenticationLocalDataSource;

  AuthenticaationRepositoryImpl(
    this._authenticationRemoteDataSource,
    this._authenticationLocalDataSource,
  );

  Future<Either<AppError, RequestTokenModel>> _getRequestToken() async {
    try {
      final response = await _authenticationRemoteDataSource.getRequestToken();
      return Right(response);
    } on SocketException {
      return const Left(AppError(AppErrorType.network));
    } on Exception {
      return const Left(AppError(AppErrorType.api));
    }
  }

  @override
  Future<Either<AppError, bool>> loginUser(Map<String, dynamic> params) async {
    final requestTokenEitherResponse = await _getRequestToken();
    final token1 = requestTokenEitherResponse.fold(
      (l) => null,
      (r) => r.requestToken,
    );

    try {
      params.putIfAbsent('request_token', () => token1);
      final validateWithLoginToken =
          await _authenticationRemoteDataSource.validateWithLogin(params);
      final sessionId = await _authenticationRemoteDataSource
          .creatSession(validateWithLoginToken.toJson());
      // ignore: unnecessary_null_comparison
      if (sessionId != null) {
        await _authenticationLocalDataSource.saveSessionId(sessionId);
        return const Right(true);
      }
      return const Left(AppError(AppErrorType.sessionDenied));
    } on SocketException {
      return const Left(AppError(AppErrorType.network));
    } on UnauthorizedException {
      return const Left(AppError(AppErrorType.unauthorised));
    } on Exception {
      return const Left(AppError(AppErrorType.api));
    }
  }

  @override
  Future<Either<AppError, void>> logoutUser() async {
    final sessionId = await _authenticationLocalDataSource.getSessionId();
    await Future.wait([
      _authenticationRemoteDataSource.deleteSession(sessionId!),
      _authenticationLocalDataSource.deleteSessionId(),
    ]);
    // print(await _authenticationLocalDataSource.getSessionId());
    // ignore: void_checks
    return const Right(Unit);
  }
}
