import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import '../common/constants/languages.dart';
import '../common/constants/route_constants.dart';
import '../di/get_it.dart';
import 'app_localizations.dart';
import 'blocs/language/language_bloc_bloc.dart';
import 'blocs/loading/loading_bloc.dart';
import 'blocs/login/login_bloc.dart';
import 'fade_page_route_builder.dart';
import 'journeys/loading/loading_screen.dart';
import 'routes.dart';
import 'themes/app_color.dart';
import 'themes/text_theme.dart';
import 'wiredash_app.dart';

class MovieApp extends StatefulWidget {
  const MovieApp({super.key});

  @override
  State<MovieApp> createState() => _MovieAppState();
}

class _MovieAppState extends State<MovieApp> {
  final _navigatorKey = GlobalKey<NavigatorState>();
  late LanguageBlocBloc _languageBlocBloc;
  late LoginBloc _loginBloc;
  late LoadingBloc _loadingBloc;

  @override
  void initState() {
    super.initState();
    _languageBlocBloc = getItInstance<LanguageBlocBloc>();
    _languageBlocBloc.add(LoadPreferredLanguageEvent());
    _loginBloc = getItInstance<LoginBloc>();
    _loadingBloc = getItInstance<LoadingBloc>();
  }

  @override
  void dispose() {
    _languageBlocBloc.close();
    _loginBloc.close();
    _loadingBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<LanguageBlocBloc>.value(value: _languageBlocBloc),
        BlocProvider<LoginBloc>.value(value: _loginBloc),
        BlocProvider<LoadingBloc>.value(value: _loadingBloc),
      ],
      child: BlocBuilder<LanguageBlocBloc, LanguageBlocState>(
        builder: (context, state) {
          if (state is LanguageLoaded) {
            return WiredashApp(
              navigatorKey: _navigatorKey,
              languageCode: state.locale.languageCode,
              child: MaterialApp(
                navigatorKey: _navigatorKey,
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
                builder: (context, child) {
                  return LoadingScreen(
                    screen: child!,
                  );
                  // return child!;
                },
                initialRoute: RouteList.initial,
                onGenerateRoute: (RouteSettings setting) {
                  final routes = Routes.getRoutes(setting);
                  final WidgetBuilder? builder = routes[setting.name];
                  if (builder != null) {
                    return FadePageRouteBuilder(
                      builder: builder,
                      settings: setting,
                    );
                  }
                  return null;
                },
              ),
            );
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}
