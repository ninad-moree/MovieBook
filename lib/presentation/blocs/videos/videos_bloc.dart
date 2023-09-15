// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:moviebook/domain/entities/app_error.dart';
import 'package:moviebook/domain/entities/movie_params.dart';
import 'package:moviebook/domain/entities/video_entity.dart';
import 'package:moviebook/domain/usecases/get_videos.dart';

part 'videos_event.dart';
part 'videos_state.dart';

class VideosBloc extends Bloc<VideosEvent, VideosState> {
  final GetVideos getVideos;

  VideosBloc({required this.getVideos}) : super(VideosInitial()) {
    on<LoadVideosEvent>(_mapLoadVideosEvent);
  }

  void _mapLoadVideosEvent(
      LoadVideosEvent event, Emitter<VideosState> emit) async {
    final Either<AppError, List<VideoEntity>> eitherResponse = await getVideos(
      MovieParams(event.movieId),
    );

    emit(
      eitherResponse.fold(
        (l) => NoVideos(),
        (r) => VideosLoaded(r),
      ),
    );
  }
}
