import 'package:flutter/material.dart';
import 'package:wiredash/wiredash.dart';

import 'themes/app_color.dart';

class WiredashApp extends StatelessWidget {
  // ignore: prefer_typing_uninitialized_variables
  final navigatorKey;
  final Widget child;
  final String languageCode;

  const WiredashApp({
    super.key,
    required this.navigatorKey,
    required this.child,
    required this.languageCode,
  });

  @override
  Widget build(BuildContext context) {
    return Wiredash(
      projectId: 'movie-app-5u76kmk',
      secret: 'pPw34gHeoBdQ9Jh3fiZjXRJ5MV5YimR-',
      // ignore: deprecated_member_use
      navigatorKey: navigatorKey,
      theme: WiredashThemeData(
        brightness: Brightness.dark,
        primaryColor: AppColor.royalBlue,
        secondaryColor: AppColor.violet,
        secondaryBackgroundColor: AppColor.vulcan,
      ),
      options: WiredashOptionsData(
        locale: Locale.fromSubtags(
          languageCode: languageCode,
        ),
      ),
      child: child,
    );
  }
}
