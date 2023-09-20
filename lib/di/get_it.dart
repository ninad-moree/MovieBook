import 'package:get_it/get_it.dart';
import 'package:http/http.dart';
import 'package:moviebook/data/data_sources/movie_local_data_source.dart';
import 'package:moviebook/domain/usecases/chek_if_movie_is_favorite.dart';
import 'package:moviebook/domain/usecases/delete_favorite_movie.dart';
import 'package:moviebook/domain/usecases/get_favorite_movie.dart';
import 'package:moviebook/domain/usecases/save_movie.dart';
import 'package:moviebook/domain/usecases/search_movies.dart';
import 'package:moviebook/presentation/blocs/search_movie/search_movie_bloc.dart';

import '../data/core/api_client.dart';
import '../data/data_sources/movie_remote_data_source.dart';
import '../data/repositories/movie_repository_impl.dart';
import '../domain/repositories/movie_repository.dart';
import '../domain/usecases/get_cast_crew.dart';
import '../domain/usecases/get_commingsoon.dart';
import '../domain/usecases/get_movie_detail.dart';
import '../domain/usecases/get_playing_now.dart';
import '../domain/usecases/get_popular.dart';
import '../domain/usecases/get_trending.dart';
import '../domain/usecases/get_videos.dart';
import '../presentation/blocs/cast/cast_bloc.dart';
import '../presentation/blocs/language/language_bloc_bloc.dart';
import '../presentation/blocs/movie_backdrop/movie_backdrop_bloc.dart';
import '../presentation/blocs/movie_carousel/movie_carousel_bloc.dart';
import '../presentation/blocs/movie_detail/moviedetail_bloc.dart';
import '../presentation/blocs/movie_tabbed/movie_tabbed_bloc.dart';
import '../presentation/blocs/videos/videos_bloc.dart';

final getItInstance = GetIt.I;

Future init() async {
  getItInstance.registerLazySingleton<Client>(
    () => Client(),
  );

  getItInstance.registerLazySingleton<ApiClient>(
    () => ApiClient(
      getItInstance(),
    ),
  );

  getItInstance.registerLazySingleton<MovieRemoteDataResource>(
    () => MovieRemoteDataResourceImpl(
      getItInstance(),
    ),
  );

  getItInstance.registerLazySingleton<MovieLocalDataSource>(
    () => MovieLocalDataSourceImpl(),
  );

  getItInstance.registerLazySingleton<GetTrending>(
    () => GetTrending(
      getItInstance(),
    ),
  );

  getItInstance.registerLazySingleton<GetPopular>(
    () => GetPopular(
      getItInstance(),
    ),
  );

  getItInstance.registerLazySingleton<GetPlayingNow>(
    () => GetPlayingNow(
      getItInstance(),
    ),
  );

  getItInstance.registerLazySingleton<GetCommingSoon>(
    () => GetCommingSoon(
      getItInstance(),
    ),
  );

  getItInstance.registerLazySingleton<GetMovieDetail>(
    () => GetMovieDetail(
      getItInstance(),
    ),
  );

  getItInstance.registerLazySingleton<GetCastCrew>(
    () => GetCastCrew(
      getItInstance(),
    ),
  );

  getItInstance.registerLazySingleton<SearchMovies>(
    () => SearchMovies(
      getItInstance(),
    ),
  );

  getItInstance.registerLazySingleton<GetVideos>(
    () => GetVideos(
      getItInstance(),
    ),
  );

  getItInstance.registerLazySingleton<SaveMovie>(
    () => SaveMovie(
      getItInstance(),
    ),
  );

  getItInstance.registerLazySingleton<GetFavoriteMovie>(
    () => GetFavoriteMovie(
      getItInstance(),
    ),
  );

  getItInstance.registerLazySingleton<DeleteFavoriteMovie>(
    () => DeleteFavoriteMovie(
      getItInstance(),
    ),
  );

  getItInstance.registerLazySingleton<CheckIfMovieIsFavorite>(
    () => CheckIfMovieIsFavorite(
      getItInstance(),
    ),
  );

  getItInstance.registerLazySingleton<MovieRepository>(
    () => MovieRepositoryImpl(
      getItInstance(),
      getItInstance(),
    ),
  );

  getItInstance.registerFactory(
    () => MovieCarouselBloc(
      getTrending: getItInstance(),
      movieBackdropBloc: getItInstance(),
    ),
  );

  getItInstance.registerFactory(
    () => MovieBackdropBloc(),
  );

  getItInstance.registerFactory(
    () => MovieTabbedBloc(
      getPopular: getItInstance(),
      getPlayingNow: getItInstance(),
      getComingSoon: getItInstance(),
    ),
  );

  getItInstance.registerFactory(
    () => MoviedetailBloc(
      getMovieDetail: getItInstance(),
      castBloc: getItInstance(),
      videosBloc: getItInstance(),
    ),
  );

  getItInstance.registerFactory(
    () => CastBloc(
      getCastCrew: getItInstance(),
    ),
  );

  getItInstance.registerFactory(
    () => VideosBloc(
      getVideos: getItInstance(),
    ),
  );

  getItInstance.registerFactory(
    () => SearchMovieBloc(
      searchMovies: getItInstance(),
    ),
  );

  getItInstance.registerSingleton<LanguageBlocBloc>(
    LanguageBlocBloc(),
  );
}
