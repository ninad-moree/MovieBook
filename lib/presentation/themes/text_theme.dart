import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ThemeText {
  const ThemeText._();

  static TextTheme get _poppinsTextTheme => GoogleFonts.poppinsTextTheme();
  static TextStyle get _whiteHeadLine6 =>
      _poppinsTextTheme.titleLarge!.copyWith(
        fontSize: 15,
        color: Colors.white,
      );

  static TextStyle get whiteSubtitle1 =>
      _poppinsTextTheme.titleMedium!.copyWith(
        fontSize: 13,
        color: Colors.white,
      );

  static TextStyle get whiteBodyText => _poppinsTextTheme.bodyMedium!.copyWith(
        fontSize: 12,
        color: Colors.white,
        wordSpacing: 0.25,
        letterSpacing: 0.25,
        height: 1.5,
      );

  static getTextTheme() => TextTheme(
        titleLarge: _whiteHeadLine6,
        titleMedium: whiteSubtitle1,
        bodyMedium: whiteBodyText,
      );
}
