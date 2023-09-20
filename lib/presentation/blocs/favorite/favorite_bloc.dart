// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:moviebook/domain/entities/movie_entity.dart';
import 'package:moviebook/domain/entities/movie_params.dart';
import 'package:moviebook/domain/usecases/chek_if_movie_is_favorite.dart';
import 'package:moviebook/domain/usecases/get_favorite_movie.dart';
import 'package:moviebook/domain/usecases/save_movie.dart';

import '../../../domain/usecases/delete_favorite_movie.dart';

part 'favorite_event.dart';
part 'favorite_state.dart';

class FavoriteBloc extends Bloc<FavoriteEvent, FavoriteState> {
  final SaveMovie saveMovie;
  final GetFavoriteMovie getFavoriteMovie;
  final DeleteFavoriteMovie deleteFavoriteMovie;
  final CheckIfMovieIsFavorite checkIfMovieIsFavorite;

  FavoriteBloc({
    required this.checkIfMovieIsFavorite,
    required this.deleteFavoriteMovie,
    required this.getFavoriteMovie,
    required this.saveMovie,
  }) : super(FavoriteInitial()) {
    on<FavoriteEvent>(_mapFavoriteEvent);
  }

  void _mapFavoriteEvent(
      FavoriteEvent event, Emitter<FavoriteState> emit) async {
    if (event is ToggleFavoriteMovieEvent) {
      if (event.isFavorite) {
        await deleteFavoriteMovie(MovieParams(event.movieEntity.id));
      } else {
        await saveMovie(event.movieEntity);
      }
      final response =
          await checkIfMovieIsFavorite(MovieParams(event.movieEntity.id));
      emit(
        response.fold(
          (l) => FavoriteMoviesError(),
          (r) => IsFavoriteMovie(r),
        ),
      );
    } else if (event is LoadFavoriteMovieEvent) {
      // emit _fetchLoadFavoriteMovies();
    }
  }

  // Future<FavoriteState> _fetchLoadFavoriteMovies() async {
  //   final Either<AppError, List<MovieEntity>> response = await getFavoriteMovie(NoParams());

  //   return response.fold(
  //       (l) => FavoriteMoviesError(),
  //       (r) => FavoriteMoviesLoaded(r),
  //     );
  // }
}
