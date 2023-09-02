import 'package:get_it/get_it.dart';
import 'package:http/http.dart';

import '../data/core/api_client.dart';
import '../data/data_sources/movie_remote_data_source.dart';
import '../data/repositories/movie_repository_impl.dart';
import '../domain/repositories/movie_repository.dart';
import '../domain/usecases/get_commingsoon.dart';
import '../domain/usecases/get_playing_now.dart';
import '../domain/usecases/get_popular.dart';
import '../domain/usecases/get_trending.dart';
import '../presentation/blocs/language_bloc/language_bloc_bloc.dart';
import '../presentation/blocs/movie_backdrop/movie_backdrop_bloc.dart';
import '../presentation/blocs/movie_carousel/movie_carousel_bloc.dart';
import '../presentation/blocs/movie_tabbed/movie_tabbed_bloc.dart';

final getItInstance = GetIt.I;

Future init() async {
  getItInstance.registerLazySingleton<Client>(() => Client());

  getItInstance
      .registerLazySingleton<ApiClient>(() => ApiClient(getItInstance()));

  getItInstance.registerLazySingleton<MovieRemoteDataResource>(
      () => MovieRemoteDataResourceImpl(getItInstance()));

  getItInstance
      .registerLazySingleton<GetTrending>(() => GetTrending(getItInstance()));
  getItInstance
      .registerLazySingleton<GetPopular>(() => GetPopular(getItInstance()));
  getItInstance.registerLazySingleton<GetPlayingNow>(
      () => GetPlayingNow(getItInstance()));
  getItInstance.registerLazySingleton<GetCommingSoon>(
      () => GetCommingSoon(getItInstance()));

  getItInstance.registerLazySingleton<MovieRepository>(
      () => MovieRepositoryImpl(getItInstance()));

  getItInstance.registerFactory(
    () => MovieCarouselBloc(
      getTrending: getItInstance(),
      movieBackdropBloc: getItInstance(),
    ),
  );

  getItInstance.registerFactory(() => MovieBackdropBloc());

  getItInstance.registerFactory(
    () => MovieTabbedBloc(
        getPopular: GetPopular(getItInstance()),
        getPlayingNow: GetPlayingNow(getItInstance()),
        getComingSoon: GetCommingSoon(getItInstance())),
  );

  getItInstance.registerSingleton<LanguageBlocBloc>(LanguageBlocBloc());
}
