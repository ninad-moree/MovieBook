// ignore: depend_on_referenced_packages

// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:moviebook/domain/entities/app_error.dart';
import 'package:moviebook/domain/entities/login_request_params.dart';
import 'package:moviebook/domain/entities/no_params.dart';
import 'package:moviebook/domain/usecases/login_user.dart';
import 'package:moviebook/presentation/blocs/loading/loading_bloc.dart';

import '../../../domain/usecases/logout_user.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginUser loginUser;
  final LogoutUser logoutUser;
  final LoadingBloc loadingBloc;

  LoginBloc({
    required this.loginUser,
    required this.logoutUser,
    required this.loadingBloc,
  }) : super(LoginInitial()) {
    on<LoginEvent>(_mapLoginEvent);
  }

  void _mapLoginEvent(LoginEvent event, Emitter<LoginState> emit) async {
    if (event is LoginInitiateEvent) {
      loadingBloc.add(StartLoading());
      final Either<AppError, bool> eitherResponse = await loginUser(
        LoginRequestParams(
          userName: event.username,
          password: event.password,
        ),
      );

      emit(
        eitherResponse.fold(
          (l) {
            var message = getErrorMessage(l.appErrorType);
            // print(message);
            return LoginError(message);
          },
          (r) => LoginSuccess(),
        ),
      );
      loadingBloc.add(FinishedLoading());
    } else if (event is LogoutEvent) {
      await logoutUser(NoParams());
      emit(LogoutSuccess());
    } else if (event is LoginGuestEvent) {
      emit(LoginSuccess());
    }
  }

  String getErrorMessage(AppErrorType appErrorType) {
    switch (appErrorType) {
      case AppErrorType.network:
        return 'No Network Connection';
      case AppErrorType.api:
        return '';
      case AppErrorType.database:
        return 'Something went wrong. Try again';
      case AppErrorType.sessionDenied:
        return 'Session Denied';
      default:
        return 'Username or Password is invalid';
    }
  }
}
