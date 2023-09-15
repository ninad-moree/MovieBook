part of 'videos_bloc.dart';

sealed class VideosEvent extends Equatable {
  const VideosEvent();

  @override
  List<Object> get props => [];
}

class LoadVideosEvent extends VideosEvent {
  final int movieId;

  const LoadVideosEvent({required this.movieId});

  @override
  List<Object> get props => [movieId];
}
