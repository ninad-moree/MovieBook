// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:moviebook/domain/entities/movie_entity.dart';
import 'package:moviebook/domain/entities/no_params.dart';
import 'package:moviebook/domain/usecases/get_trending.dart';

part 'movie_carousel_event.dart';
part 'movie_carousel_state.dart';

class MovieCarouselBloc extends Bloc<MovieCarouselEvent, MovieCarouselState> {
  final GetTrending getTrending;

  MovieCarouselBloc({
    required this.getTrending,
  }) : super(MovieCarouselInitial()) {
    on<CarouselLoadEvent>(_mapCarouselLoadEventToState);
  }

  void _mapCarouselLoadEventToState(
      CarouselLoadEvent event, Emitter<MovieCarouselState> emit) async {
    final moviesEither = await getTrending(NoParams());

    emit(moviesEither.fold(
      (l) => MovieCarouselError(),
      (movies) => MovieCarouselLoaded(
        movies: movies,
        defaultIndex: event.defaultIndex,
      ),
    ));
  }
}
