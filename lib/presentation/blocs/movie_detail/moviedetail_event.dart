part of 'moviedetail_bloc.dart';

abstract class MoviedetailEvent extends Equatable {
  const MoviedetailEvent();

  @override
  List<Object> get props => [];
}

class MoviedetailLoadEvent extends MoviedetailEvent {
  final int movieId;

  const MoviedetailLoadEvent(this.movieId);

  @override
  List<Object> get props => [movieId];
}
