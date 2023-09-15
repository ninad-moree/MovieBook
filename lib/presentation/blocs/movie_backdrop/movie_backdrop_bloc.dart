// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:moviebook/domain/entities/movie_entity.dart';

part 'movie_backdrop_event.dart';
part 'movie_backdrop_state.dart';

class MovieBackdropBloc extends Bloc<MovieBackdropEvent, MovieBackdropState> {
  MovieBackdropBloc() : super(MovieBackdropInitial()) {
    on<MovieBackDropChangedEvent>(_mapMovieBackDropChangedEventToState);
  }

  void _mapMovieBackDropChangedEventToState(
      MovieBackDropChangedEvent event, Emitter<MovieBackdropState> emit) {
    emit(MovieBackDropChanged(event.movie));
  }
}
