part of 'favorite_bloc.dart';

sealed class FavoriteEvent extends Equatable {
  const FavoriteEvent();

  @override
  List<Object> get props => [];
}

class LoadFavoriteMovieEvent extends FavoriteEvent {
  @override
  List<Object> get props => [];
}

class DeleteFavoriteMovieEvent extends FavoriteEvent {
  final int movieId;

  const DeleteFavoriteMovieEvent(this.movieId);

  @override
  List<Object> get props => [movieId];
}

class ToggleFavoriteMovieEvent extends FavoriteEvent {
  final MovieEntity movieEntity;
  final bool isFavorite;

  const ToggleFavoriteMovieEvent(this.isFavorite, this.movieEntity);

  @override
  List<Object> get props => [movieEntity, isFavorite];
}

class CheckIfMovieFavorite extends FavoriteEvent {
  final int movieId;

  const CheckIfMovieFavorite(this.movieId);

  @override
  List<Object> get props => [movieId];
}
