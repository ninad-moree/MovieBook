part of 'loading_bloc.dart';

sealed class LoadingState extends Equatable {
  const LoadingState();

  @override
  List<Object> get props => [];
}

final class LoadingInitial extends LoadingState {}

class LoadingStarted extends LoadingState {}

class LoadingFinished extends LoadingState {}
