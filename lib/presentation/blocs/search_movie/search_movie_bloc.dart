// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:moviebook/domain/entities/app_error.dart';
import 'package:moviebook/domain/entities/movie_entity.dart';
import 'package:moviebook/domain/entities/movie_search_params.dart';
import 'package:moviebook/domain/usecases/get_search_movies.dart';

part 'search_movie_event.dart';
part 'search_movie_state.dart';

class SearchMovieBloc extends Bloc<SearchMovieEvent, SearchMovieState> {
  final SearchMovies searchMovies;

  SearchMovieBloc({
    required this.searchMovies,
  }) : super(SearchMovieInitial()) {
    on<SearchTermChangedEvent>(_mapSearchTermChangedEvent);
  }

  void _mapSearchTermChangedEvent(
      SearchTermChangedEvent event, Emitter<SearchMovieState> emit) async {
    if (event.searchTerm.length > 2) {
      emit(
        SearchMovieLoading(),
      );
      final Either<AppError, List<MovieEntity>> eitherResponse =
          await searchMovies(MovieSearchParams(searchTerm: event.searchTerm));
      emit(
        eitherResponse.fold(
          (l) => SearchMovieError(l.appErrorType),
          (r) => SearchMovieLoaded(r),
        ),
      );
    }
  }
}
