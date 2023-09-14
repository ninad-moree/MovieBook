// ignore: depend_on_referenced_packages

// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:moviebook/domain/entities/app_error.dart';
import 'package:moviebook/domain/entities/movie_detail_entity.dart';
import 'package:moviebook/domain/entities/movie_params.dart';
import 'package:moviebook/domain/usecases/get_movie_detail.dart';

part 'moviedetail_event.dart';
part 'moviedetail_state.dart';

class MoviedetailBloc extends Bloc<MoviedetailEvent, MoviedetailState> {
  final GetMovieDetail getMovieDetail;

  MoviedetailBloc({
    required this.getMovieDetail,
  }) : super(MoviedetailInitial()) {
    on<MoviedetailLoadEvent>(_mapMovieDetailLoadEvent);
  }

  void _mapMovieDetailLoadEvent(
      MoviedetailLoadEvent event, Emitter<MoviedetailState> emit) async {
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
  }
}
