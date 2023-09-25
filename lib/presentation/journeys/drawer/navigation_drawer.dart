import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wiredash/wiredash.dart';

import '../../../common/constants/languages.dart';
import '../../../common/constants/route_constants.dart';
import '../../../common/constants/translation_constants.dart';
import '../../../common/extensions/string_extension.dart';
import '../../blocs/language/language_bloc_bloc.dart';
import '../../blocs/login/login_bloc.dart';
import '../../widgets/app_dialog.dart';
import '../../widgets/logo.dart';
import 'navigation_expanded_list_tile.dart';
import 'navigation_list_item.dart';

class NavigationDrawerHome extends StatelessWidget {
  const NavigationDrawerHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            blurRadius: 4,
            color: Theme.of(context).primaryColor.withOpacity(0.6),
          ),
        ],
      ),
      width: 300,
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.only(
                top: 8,
                bottom: 18,
                left: 8,
                right: 8,
              ),
              child: Logo(
                height: 70,
              ),
            ),
            NavigationListItem(
              title: TranslationConstants.favoriteMovies.t(context),
              onPressed: () {
                Navigator.of(context).pushNamed(RouteList.favorite);
              },
            ),
            NavigationExpandedListItem(
              title: TranslationConstants.language.t(context),
              children: Languages.languages.map((e) => e.value).toList(),
              onPressed: (index) {
                BlocProvider.of<LanguageBlocBloc>(context).add(
                  ToggleLanguage(
                    Languages.languages[index],
                  ),
                );
              },
            ),
            NavigationListItem(
              title: TranslationConstants.feedback.t(context),
              onPressed: () {
                Navigator.of(context).pop();
                Wiredash.of(context).show();
              },
            ),
            NavigationListItem(
              title: TranslationConstants.about.t(context),
              onPressed: () {
                Navigator.of(context).pop();
                _showDialog(context);
              },
            ),
            BlocListener<LoginBloc, LoginState>(
              listenWhen: (previous, current) => current is LogoutSuccess,
              listener: (context, state) {
                Navigator.of(context).pushNamedAndRemoveUntil(
                  RouteList.initial,
                  (route) => false,
                );
              },
              child: NavigationListItem(
                title: TranslationConstants.logout.t(context),
                onPressed: () {
                  BlocProvider.of<LoginBloc>(context).add(LogoutEvent());
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showDialog(BuildContext context) {
    // final stableContext = context;
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AppDialog(
          title: TranslationConstants.about,
          description: TranslationConstants.aboutDescription,
          buttonText: TranslationConstants.okay,
          image: Image.asset(
            'assets/png/tmdb_logo.png',
            height: 50,
          ),
        );
      },
    );
    // .then(
    //   (_) {
    //     Navigator.of(stableContext).pop();
    //   },
    // );
  }
}
