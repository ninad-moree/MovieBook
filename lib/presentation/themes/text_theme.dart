import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_color.dart';

class ThemeText {
  const ThemeText._();

  static TextTheme get _poppinsTextTheme => GoogleFonts.poppinsTextTheme();

  static TextStyle get _whiteHeadLine6 =>
      _poppinsTextTheme.titleLarge!.copyWith(
        fontSize: 15,
        color: Colors.white,
      );

  static TextStyle get _whiteHeadLine5 =>
      _poppinsTextTheme.headlineSmall!.copyWith(
        fontSize: 30,
        color: Colors.white,
      );

  static TextStyle get whiteSubtitle1 =>
      _poppinsTextTheme.titleMedium!.copyWith(
        fontSize: 17,
        color: Colors.white,
      );

  static TextStyle get _whiteButton => _poppinsTextTheme.labelLarge!.copyWith(
        fontSize: 15,
        color: Colors.white,
      );

  static TextStyle get whiteBodyText => _poppinsTextTheme.bodyMedium!.copyWith(
        fontSize: 14,
        color: Colors.white,
        wordSpacing: 0.25,
        letterSpacing: 0.25,
        height: 1.5,
      );

  static getTextTheme() => TextTheme(
        headlineSmall: _whiteHeadLine5,
        titleLarge: _whiteHeadLine6,
        titleMedium: whiteSubtitle1,
        bodyMedium: whiteBodyText,
        labelLarge: _whiteButton,
      );
}

extension ThemeTextExtension on TextTheme {
  TextStyle get royalBlueSubtitle1 => titleMedium!.copyWith(
        color: AppColor.royalBlue,
        fontWeight: FontWeight.w600,
      );

  TextStyle get greySubtitle1 => titleMedium!.copyWith(
        color: Colors.grey,
      );

  TextStyle get violetHeadline6 => titleMedium!.copyWith(
        color: AppColor.violet,
        fontWeight: FontWeight.w600,
      );

  TextStyle get vulcanBodyText2 => bodyMedium!.copyWith(
        color: AppColor.vulcan,
        fontWeight: FontWeight.w600,
      );

  TextStyle get greyCaption => bodySmall!.copyWith(
        color: Colors.grey,
      );

  TextStyle get orangeSubtitle1 => titleMedium!.copyWith(
        color: Colors.orange,
      );
}
