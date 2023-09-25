import 'package:get_it/get_it.dart';
import 'package:http/http.dart';

import '../data/core/api_client.dart';
import '../data/data_sources/authentication_local_data_source.dart';
import '../data/data_sources/authentication_remote_data_source.dart';
import '../data/data_sources/language_local_data_source.dart';
import '../data/data_sources/movie_local_data_source.dart';
import '../data/data_sources/movie_remote_data_source.dart';
import '../data/repositories/app_repository_impl.dart';
import '../data/repositories/authentication_repository_impl.dart';
import '../data/repositories/movie_repository_impl.dart';
import '../domain/repositories/app_repository.dart';
import '../domain/repositories/authentication_repository.dart';
import '../domain/repositories/movie_repository.dart';
import '../domain/usecases/chek_if_movie_is_favorite.dart';
import '../domain/usecases/delete_favorite_movie.dart';
import '../domain/usecases/get_cast_crew.dart';
import '../domain/usecases/get_commingsoon.dart';
import '../domain/usecases/get_favorite_movie.dart';
import '../domain/usecases/get_movie_detail.dart';
import '../domain/usecases/get_playing_now.dart';
import '../domain/usecases/get_popular.dart';
import '../domain/usecases/get_preferred_language.dart';
import '../domain/usecases/get_trending.dart';
import '../domain/usecases/get_videos.dart';
import '../domain/usecases/login_user.dart';
import '../domain/usecases/logout_user.dart';
import '../domain/usecases/save_movie.dart';
import '../domain/usecases/search_movies.dart';
import '../domain/usecases/update_language.dart';
import '../presentation/blocs/cast/cast_bloc.dart';
import '../presentation/blocs/favorite/favorite_bloc.dart';
import '../presentation/blocs/language/language_bloc_bloc.dart';
import '../presentation/blocs/loading/loading_bloc.dart';
import '../presentation/blocs/login/login_bloc.dart';
import '../presentation/blocs/movie_backdrop/movie_backdrop_bloc.dart';
import '../presentation/blocs/movie_carousel/movie_carousel_bloc.dart';
import '../presentation/blocs/movie_detail/moviedetail_bloc.dart';
import '../presentation/blocs/movie_tabbed/movie_tabbed_bloc.dart';
import '../presentation/blocs/search_movie/search_movie_bloc.dart';
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

  getItInstance.registerLazySingleton<LangaugeLocalDataSource>(
    () => LanguageDataSourceImpl(),
  );

  getItInstance.registerLazySingleton<AuthenticationRemoteDataSource>(
    () => AuthenticationRemoteDataSourceImpl(
      getItInstance(),
    ),
  );

  getItInstance.registerLazySingleton<AuthenticationLocalDataSource>(
    () => AuthenticationLocalDataSourceImpl(),
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

  getItInstance.registerLazySingleton<UpdateLanguage>(
    () => UpdateLanguage(
      getItInstance(),
    ),
  );

  getItInstance.registerLazySingleton<GetPreferredLanguage>(
    () => GetPreferredLanguage(
      getItInstance(),
    ),
  );

  getItInstance.registerLazySingleton<LoginUser>(
    () => LoginUser(
      getItInstance(),
    ),
  );

  getItInstance.registerLazySingleton<LogoutUser>(
    () => LogoutUser(
      getItInstance(),
    ),
  );

  getItInstance.registerLazySingleton<MovieRepository>(
    () => MovieRepositoryImpl(
      getItInstance(),
      getItInstance(),
    ),
  );

  getItInstance.registerLazySingleton<AppRepository>(
    () => AppMovieRepositoryImpl(
      getItInstance(),
    ),
  );

  getItInstance.registerLazySingleton<AuthenticationRepository>(
    () => AuthenticaationRepositoryImpl(
      getItInstance(),
      getItInstance(),
    ),
  );

  getItInstance.registerFactory(
    () => MovieCarouselBloc(
      loadingBloc: getItInstance(),
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
      loadingBloc: getItInstance(),
      getMovieDetail: getItInstance(),
      castBloc: getItInstance(),
      videosBloc: getItInstance(),
      favoriteBloc: getItInstance(),
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
      loadingBloc: getItInstance(),
      searchMovies: getItInstance(),
    ),
  );

  getItInstance.registerSingleton<LanguageBlocBloc>(
    LanguageBlocBloc(
      getPreferredLanguage: getItInstance(),
      updateLanguage: getItInstance(),
    ),
  );

  getItInstance.registerFactory(
    () => FavoriteBloc(
      checkIfMovieIsFavorite: getItInstance(),
      deleteFavoriteMovie: getItInstance(),
      getFavoriteMovie: getItInstance(),
      saveMovie: getItInstance(),
    ),
  );

  getItInstance.registerFactory(
    () => LoginBloc(
      loginUser: getItInstance(),
      logoutUser: getItInstance(),
      loadingBloc: getItInstance(),
    ),
  );

  getItInstance.registerSingleton<LoadingBloc>(
    LoadingBloc(),
  );
}
