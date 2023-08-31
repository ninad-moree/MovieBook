import 'package:flutter/material.dart';

class ScreenUtil {
  static final ScreenUtil _instance = ScreenUtil._();
  static const int defaultWidth = 414;
  static const int defaultHeight = 896;

  /// Size of the phone in UI Design , px
  num uiWidthPx;
  num uiHeightPx;

  /// allowFontScaling Specifies whether fonts should scale to respect Text Size accessibility settings. The default is false.
  bool allowFontScaling;

  double _screenWidth;
  double _screenHeight;
  double _pixelRatio;
  double _statusBarHeight;
  double _bottomBarHeight;
  double _textScaleFactor;

  ScreenUtil._()
      : uiWidthPx = defaultWidth,
        uiHeightPx = defaultHeight,
        allowFontScaling = false,
        _screenWidth = 0, // Initialize remaining non-nullable fields
        _screenHeight = 0,
        _pixelRatio = 0,
        _statusBarHeight = 0,
        _bottomBarHeight = 0,
        _textScaleFactor = 0;

  factory ScreenUtil() {
    return _instance;
  }

  void init(
      {num width = defaultWidth,
      num height = defaultHeight,
      bool allowFontScaling = false,
      required BuildContext context}) {
    uiWidthPx = width;
    uiHeightPx = height;
    this.allowFontScaling = allowFontScaling;

    final mediaQuery = MediaQuery.of(context);
    _pixelRatio = mediaQuery.devicePixelRatio;
    _screenWidth = mediaQuery.size.width;
    _screenHeight = mediaQuery.size.height;
    _statusBarHeight = mediaQuery.padding.top;
    _bottomBarHeight = mediaQuery.padding.bottom;
    _textScaleFactor = mediaQuery.textScaleFactor;
  }

  /// The number of font pixels for each logical pixel.
  double get textScaleFactor => _textScaleFactor;

  /// The size of the media in logical pixels (e.g, the size of the screen).
  double get pixelRatio => _pixelRatio;

  /// The horizontal extent of this size.
  double get screenWidth => _screenWidth / _pixelRatio;

  ///The vertical extent of this size. dp
  double get screenHeight => _screenHeight / _pixelRatio;

  /// The vertical extent of this size. px
  double get screenWidthPx => _screenWidth;

  /// The vertical extent of this size. px
  double get screenHeightPx => _screenHeight;

  /// The offset from the top
  double get statusBarHeight => _statusBarHeight / _pixelRatio;

  /// The offset from the top
  double get statusBarHeightPx => _statusBarHeight;

  /// The offset from the bottom.
  double get bottomBarHeight => _bottomBarHeight;

  /// The ratio of the actual dp to the design draft px
  double get scaleWidth => screenWidth / uiWidthPx;

  double get scaleHeight =>
      (_screenHeight - _statusBarHeight - _bottomBarHeight) / uiHeightPx;

  double get scaleText => scaleWidth;

  /// Width function
  /// Adapted to the device width of the UI Design.
  /// Height can also be adapted according to this to ensure no deformation ,
  /// if you want a square
  num setWidth(num width) => width * scaleWidth;

  /// Height function
  /// Highly adaptable to the device according to UI Design
  /// It is recommended to use this method to achieve a high degree of adaptation
  /// when it is found that one screen in the UI design
  /// does not match the current style effect, or if there is a difference in shape.
  num setHeight(num height) => height * scaleHeight;

  ///FontSize function
  ///@param [fontSize] UI in px.
  ///Font size adaptation method
  ///@param [fontSize] The size of the font on the UI design, in px.
  ///@param [allowFontScaling]
  num setSp(num fontSize, {required bool allowFontScalingSelf}) =>
      // ignore: unnecessary_null_comparison
      allowFontScalingSelf == null
          ? (allowFontScaling
              ? (fontSize * scaleText)
              : ((fontSize * scaleText) / _textScaleFactor))
          : (allowFontScalingSelf
              ? (fontSize * scaleText)
              : ((fontSize * scaleText) / _textScaleFactor));
}
