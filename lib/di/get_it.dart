import 'package:get_it/get_it.dart';
import 'package:http/http.dart';
import 'package:moviebook/data/core/api_client.dart';
import 'package:moviebook/data/data_sources/movie_remote_data_source.dart';
import 'package:moviebook/data/repositories/movie_repository_impl.dart';
import 'package:moviebook/domain/repositories/movie_repository.dart';
import 'package:moviebook/domain/usecases/get_commingsoon.dart';
import 'package:moviebook/domain/usecases/get_playing_now.dart';
import 'package:moviebook/domain/usecases/get_popular.dart';
import 'package:moviebook/domain/usecases/get_trending.dart';

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
}
