part of 'loading_bloc.dart';

sealed class LoadingEvent extends Equatable {
  const LoadingEvent();

  @override
  List<Object> get props => [];
}

class StartLoading extends LoadingEvent {}

class FinishedLoading extends LoadingEvent {}
