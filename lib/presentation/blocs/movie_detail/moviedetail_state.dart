part of 'moviedetail_bloc.dart';

sealed class MoviedetailState extends Equatable {
  const MoviedetailState();

  @override
  List<Object> get props => [];
}

final class MoviedetailInitial extends MoviedetailState {}

class MovieDetailLoading extends MoviedetailState {}

class MovieDetailError extends MoviedetailState {}

class MovieDetailLoaded extends MoviedetailState {
  final MovieDetailEntity movieDetailEntity;

  const MovieDetailLoaded(this.movieDetailEntity);

  @override
  List<Object> get props => [movieDetailEntity];
}
