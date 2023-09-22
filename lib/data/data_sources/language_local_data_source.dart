import 'dart:async';

import 'package:hive/hive.dart';

abstract class LangaugeLocalDataSource {
  Future<void> updateLanguage(String languagecode);
  Future<String?> getPreferredLanguage();
}

class LanguageDataSourceImpl extends LangaugeLocalDataSource {
  @override
  Future<String?> getPreferredLanguage() async {
    final languageBox = await Hive.openBox('languageBox');
    return languageBox.get('preferred_language');
  }

  @override
  Future<void> updateLanguage(String languagecode) async {
    final languageBox = await Hive.openBox('languageBox');
    await (languageBox.put('preferred_language', languagecode));
  }
}
