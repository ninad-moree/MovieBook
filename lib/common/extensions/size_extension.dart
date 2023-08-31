import '../screenutil/screen_util.dart';

extension SizeExtension on num {
  num get h => ScreenUtil().setHeight(this);

  num get w => ScreenUtil().setWidth(this);

  num get sp => ScreenUtil().setSp(this, allowFontScalingSelf: false);
}
