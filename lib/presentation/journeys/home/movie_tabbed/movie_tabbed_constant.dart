import '../../../../common/constants/translation_constants.dart';
import 'tab.dart';

class MovieTabbedConstants {
  static List<Tabs> movieTabs = [
    const Tabs(index: 0, title: TranslationConstants.popular),
    const Tabs(index: 1, title: TranslationConstants.now),
    const Tabs(index: 2, title: TranslationConstants.soon),
  ];
}
