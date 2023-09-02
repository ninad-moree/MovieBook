import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import '../di/get_it.dart';
import 'blocs/language_bloc/language_bloc_bloc.dart';

import '../common/constants/languages.dart';
import 'app_localizations.dart';
import 'journeys/home_screen.dart';
import 'themes/app_color.dart';
import 'themes/text_theme.dart';

class MovieApp extends StatefulWidget {
  const MovieApp({super.key});

  @override
  State<MovieApp> createState() => _MovieAppState();
}

class _MovieAppState extends State<MovieApp> {
  late LanguageBlocBloc _languageBlocBloc;

  @override
  void initState() {
    super.initState();
    _languageBlocBloc = getItInstance<LanguageBlocBloc>();
  }

  @override
  void dispose() {
    super.dispose();
    _languageBlocBloc.close();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<LanguageBlocBloc>.value(
      value: _languageBlocBloc,
      child: BlocBuilder<LanguageBlocBloc, LanguageBlocState>(
        builder: (context, state) {
          if (state is LanguageLoaded) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'Movie App',
              theme: ThemeData(
                unselectedWidgetColor: AppColor.royalBlue,
                colorScheme: ColorScheme.fromSwatch(
                  accentColor: AppColor.royalBlue,
                ),
                primaryColor: AppColor.vulcan,
                scaffoldBackgroundColor: AppColor.vulcan,
                visualDensity: VisualDensity.adaptivePlatformDensity,
                textTheme: ThemeText.getTextTheme(),
                appBarTheme: const AppBarTheme(elevation: 0),
              ),
              supportedLocales:
                  Languages.languages.map((e) => Locale(e.code)).toList(),
              locale: state.locale, //--------->
              localizationsDelegates: const [
                AppLocalizations.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate
              ],
              home: const HomeScreen(),
            );
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}
