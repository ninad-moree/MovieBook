part of 'login_bloc.dart';

sealed class LoginEvent extends Equatable {
  const LoginEvent();

  @override
  List<Object> get props => [];
}

class LoginInitiateEvent extends LoginEvent {
  final String username, password;

  const LoginInitiateEvent(this.password, this.username);

  @override
  List<Object> get props => [password, username];
}

class LogoutEvent extends LoginEvent {}

class LoginGuestEvent extends LoginEvent {}
