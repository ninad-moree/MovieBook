import 'package:flutter/material.dart';

import '../common/constants/route_constants.dart';
import 'journeys/favorite/favorite_screen.dart';
import 'journeys/home_screen.dart';
import 'journeys/login/login_screen.dart';
import 'journeys/movie_detail/movie_detail_arguments.dart';
import 'journeys/movie_detail/movie_detail_screen.dart';
// import 'journeys/loading/loading_screen.dart';

class Routes {
  static Map<String, WidgetBuilder> getRoutes(RouteSettings settings) => {
        RouteList.initial: (context) => const LoginScreen(),
        RouteList.home: (context) => const HomeScreen(),
        RouteList.movieDetail: (context) {
          final movieDetailArguents =
              settings.arguments as MovieDetailArguments;
          return MovieDetailScreen(
            movieDetailArguments: movieDetailArguents,
          );
        },
        RouteList.favorite: (context) => const FavoriteScreen(),
      };
}
