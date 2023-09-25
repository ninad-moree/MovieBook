// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:moviebook/domain/entities/app_error.dart';
import 'package:moviebook/domain/entities/no_params.dart';

import '../../../domain/entities/movie_entity.dart';
import '../../../domain/usecases/get_commingsoon.dart';
import '../../../domain/usecases/get_playing_now.dart';
import '../../../domain/usecases/get_popular.dart';

part 'movie_tabbed_event.dart';
part 'movie_tabbed_state.dart';

class MovieTabbedBloc extends Bloc<MovieTabbedEvent, MovieTabbedState> {
  final GetPopular getPopular;
  final GetPlayingNow getPlayingNow;
  final GetCommingSoon getComingSoon;

  MovieTabbedBloc({
    required this.getPopular,
    required this.getPlayingNow,
    required this.getComingSoon,
  }) : super(const MovieTabbedInitial(currentTabIndex: 0)) {
    on<MovieTabChangedEVent>(_mapMovieTabChangedEvent);
  }

  void _mapMovieTabChangedEvent(
      MovieTabChangedEVent event, Emitter<MovieTabbedState> emit) async {
    emit(
      MovieTabLoading(
        currentTabIndex: event.currentTabIndex,
      ),
    );
    Either<AppError, List<MovieEntity>> moviesEither = const Right([]);
    switch (event.currentTabIndex) {
      case 0:
        moviesEither = await getPopular(NoParams());
        break;
      case 1:
        moviesEither = await getPlayingNow(NoParams());
        break;
      case 2:
        moviesEither = await getComingSoon(NoParams());
        break;
    }
    emit(
      moviesEither.fold(
        (appError) => MovieTabLoadError(
          currentTabIndex: event.currentTabIndex,
          errorType: AppErrorType.api,
        ),
        (movies) {
          return MovieTabChanged(
            currentTabIndex: event.currentTabIndex,
            movies: movies,
          );
        },
      ),
    );
  }
}
