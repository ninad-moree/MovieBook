import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart' as path_provider;

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

  unawaited(getIt.init());

  runApp(const MovieApp());
}
