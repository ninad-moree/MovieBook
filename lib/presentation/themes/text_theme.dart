import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:moviebook/common/constants/size_constants.dart';
import 'package:moviebook/common/extensions/size_extension.dart';

class ThemeText {
  const ThemeText._();

  static TextTheme get _poppinsTextTheme => GoogleFonts.poppinsTextTheme();
  static TextStyle get _whiteHeadLine6 =>
      _poppinsTextTheme.titleLarge!.copyWith(
        fontSize: Sizes.dimen_20.sp.toDouble(),
        color: Colors.white,
      );

  static getTextTheme() => TextTheme(
        titleLarge: _whiteHeadLine6,
      );
}
