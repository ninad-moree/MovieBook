// ignore: depend_on_referenced_packages

// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:moviebook/domain/entities/app_error.dart';
import 'package:moviebook/domain/entities/movie_detail_entity.dart';
import 'package:moviebook/domain/entities/movie_params.dart';
import 'package:moviebook/domain/usecases/get_movie_detail.dart';
import 'package:moviebook/presentation/blocs/cast/cast_bloc.dart';
import 'package:moviebook/presentation/blocs/favorite/favorite_bloc.dart';
import 'package:moviebook/presentation/blocs/loading/loading_bloc.dart';
import 'package:moviebook/presentation/blocs/videos/videos_bloc.dart';

part 'moviedetail_event.dart';
part 'moviedetail_state.dart';

class MoviedetailBloc extends Bloc<MoviedetailEvent, MoviedetailState> {
  final GetMovieDetail getMovieDetail;
  final CastBloc castBloc;
  final VideosBloc videosBloc;
  final FavoriteBloc favoriteBloc;
  final LoadingBloc loadingBloc;

  MoviedetailBloc({
    required this.getMovieDetail,
    required this.castBloc,
    required this.videosBloc,
    required this.favoriteBloc,
    required this.loadingBloc,
  }) : super(MoviedetailInitial()) {
    on<MoviedetailLoadEvent>(_mapMovieDetailLoadEvent);
  }

  void _mapMovieDetailLoadEvent(
      MoviedetailLoadEvent event, Emitter<MoviedetailState> emit) async {
    loadingBloc.add(StartLoading());
    final Either<AppError, MovieDetailEntity> eitherResponse =
        await getMovieDetail(
      MovieParams(event.movieId),
    );

    emit(
      eitherResponse.fold(
        (l) => MovieDetailError(),
        (r) => MovieDetailLoaded(r),
      ),
    );

    favoriteBloc.add(
      CheckIfMovieFavoriteEvent(event.movieId),
    );

    castBloc.add(
      LoadCastEvent(movieId: event.movieId),
    );

    videosBloc.add(
      LoadVideosEvent(movieId: event.movieId),
    );
    loadingBloc.add(
      FinishedLoading(),
    );
  }
}
