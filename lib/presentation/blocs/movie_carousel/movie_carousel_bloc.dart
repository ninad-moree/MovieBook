// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:moviebook/domain/entities/app_error.dart';
import 'package:moviebook/domain/entities/movie_entity.dart';
import 'package:moviebook/domain/entities/no_params.dart';
import 'package:moviebook/domain/usecases/get_trending.dart';
import 'package:moviebook/presentation/blocs/loading/loading_bloc.dart';
import 'package:moviebook/presentation/blocs/movie_backdrop/movie_backdrop_bloc.dart';

part 'movie_carousel_event.dart';
part 'movie_carousel_state.dart';

class MovieCarouselBloc extends Bloc<MovieCarouselEvent, MovieCarouselState> {
  final GetTrending getTrending;
  final MovieBackdropBloc movieBackdropBloc;
  final LoadingBloc loadingBloc;

  MovieCarouselBloc({
    required this.getTrending,
    required this.movieBackdropBloc,
    required this.loadingBloc,
  }) : super(MovieCarouselInitial()) {
    on<CarouselLoadEvent>(_mapCarouselLoadEventToState);
  }

  void _mapCarouselLoadEventToState(
      CarouselLoadEvent event, Emitter<MovieCarouselState> emit) async {
    loadingBloc.add(StartLoading());
    final moviesEither = await getTrending(NoParams());

    emit(
      moviesEither.fold(
        (l) => MovieCarouselError(l.appErrorType),
        (movies) {
          movieBackdropBloc
              .add(MovieBackDropChangedEvent(movies[event.defaultIndex]));
          return MovieCarouselLoaded(
            movies: movies,
            defaultIndex: event.defaultIndex,
          );
        },
      ),
    );
    loadingBloc.add(FinishedLoading());
  }
}
