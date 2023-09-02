import 'package:flutter/material.dart';
import 'package:moviebook/common/constants/languages.dart';

import 'journeys/home_screen.dart';
import 'themes/app_color.dart';
import 'themes/text_theme.dart';

class MovieApp extends StatelessWidget {
  const MovieApp({super.key});

  @override
  Widget build(BuildContext context) {
    // ScreenUtil().init(context: context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Movie App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(
          accentColor: AppColor.royalBlue,
        ),
        primaryColor: AppColor.vulcan,
        scaffoldBackgroundColor: AppColor.vulcan,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        textTheme: ThemeText.getTextTheme(),
        appBarTheme: const AppBarTheme(elevation: 0),
      ),
      supportedLocales: Languages.languages.map((e) => Locale(e.code)).toList(),
      locale: Locale(Languages.languages[0].code),
      home: const HomeScreen(),
    );
  }
}
