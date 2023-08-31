part of 'movie_backdrop_bloc.dart';

sealed class MovieBackdropEvent extends Equatable {
  const MovieBackdropEvent();

  @override
  List<Object> get props => [];
}

class MovieBackDropChangedEvent extends MovieBackdropEvent {
  final MovieEntity movie;

  const MovieBackDropChangedEvent(this.movie);

  @override
  List<Object> get props => [movie];
}
