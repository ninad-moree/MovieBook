import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart' as path_provider;

import 'data/tables/movie_table.dart';
// ignore: library_prefixes
import 'di/get_it.dart' as getIt;
import 'presentation/movie_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  unawaited(
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]),
  );
  final appDocumentDir = await path_provider.getApplicationDocumentsDirectory();

  Hive.init(appDocumentDir.path);
  Hive.registerAdapter(
    MovieTableAdapter(),
  );

  unawaited(getIt.init());

  runApp(const MovieApp());
}
/*
[ERROR:flutter/runtime/dart_vm_initializer.cc(41)] Unhandled Exception: Exception: Bad Request
E/flutter (  995): #0      ApiClient.deleteWithBody (package:moviebook/data/core/api_client.dart:63:7)
E/flutter (  995): <asynchronous suspension>
E/flutter (  995): #1      AuthenticationRemoteDataSourceImpl.deleteSession (package:moviebook/data/data_sources/authentication_remote_data_source.dart:66:22)
E/flutter (  995): <asynchronous suspension>
E/flutter (  995): #2      Future.wait.<anonymous closure> (dart:async/future.dart:525:21)
E/flutter (  995): <asynchronous suspension>
E/flutter (  995): #3      AuthenticaationRepositoryImpl.logoutUser (package:moviebook/data/repositories/authentication_repository_impl.dart:64:5)
E/flutter (  995): <asynchronous suspension>
E/flutter (  995): #4      LoginBloc._mapLoginEvent (package:moviebook/presentation/blocs/login/login_bloc.dart:51:7)
E/flutter (  995): <asynchronous suspension>
E/flutter (  995): #5      Bloc.on.<anonymous closure>.handleEvent (package:bloc/src/bloc.dart:229:13)
E/flutter (  995): <asynchronous suspension>
 */